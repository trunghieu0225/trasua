const { execSync, exec } = require('child_process');
const fs = require('fs');
const path = require('path');

// Thời gian chờ sau khi bạn dừng chỉnh sửa code (5 giây)
const DEBOUNCE_MS = 5000;
let debounceTimer = null;
let isPushing = false;
let pendingFiles = new Set();

const IGNORED_PATTERNS = [
  /[\\\/]\.git([\\\/]|$)/i,
  /[\\\/]node_modules([\\\/]|$)/i,
  /[\\\/]\.vscode([\\\/]|$)/i,
  /[\\\/]\.idea([\\\/]|$)/i,
  /[\\\/]\.vs([\\\/]|$)/i,
  /\.log$/i,
  /~[$]/i,
  /\.tmp$/i,
  /auto-push-github\.js$/i
];

function isIgnored(filePath) {
  if (!filePath) return true;
  return IGNORED_PATTERNS.some(regex => regex.test(filePath));
}

function getTimestamp() {
  const now = new Date();
  return now.toLocaleTimeString('vi-VN', { hour12: false }) + ' ' + now.toLocaleDateString('vi-VN');
}

function syncToGitHub() {
  if (isPushing) {
    // Nếu đang trong tiến trình push, lên lịch lại
    debounceTimer = setTimeout(syncToGitHub, 3000);
    return;
  }

  isPushing = true;
  const changedList = Array.from(pendingFiles).slice(0, 3).map(f => path.basename(f)).join(', ');
  pendingFiles.clear();

  try {
    // 1. Kiểm tra xem có file nào thực sự thay đổi không
    const status = execSync('git status --porcelain', { encoding: 'utf-8', cwd: __dirname }).trim();
    if (!status) {
      isPushing = false;
      return;
    }

    console.log(`\n--------------------------------------------------`);
    console.log(`[${getTimestamp()}] 🚀 Phát hiện thay đổi: ${changedList || 'code mới'}`);
    console.log(`[${getTimestamp()}] ⏳ Đang tự động lưu & đẩy lên GitHub...`);

    // 2. Git add
    execSync('git add -A', { cwd: __dirname, stdio: 'ignore' });

    // 3. Git commit
    const commitMsg = `Auto sync: ${getTimestamp()} - Cập nhật ${changedList || 'dự án'}`;
    execSync(`git commit -m "${commitMsg.replace(/"/g, '\\"')}"`, { cwd: __dirname, stdio: 'ignore' });

    // 4. Git push
    execSync('git push origin main', { cwd: __dirname, stdio: 'inherit' });

    console.log(`[${getTimestamp()}] ✅ ĐÃ TỰ ĐỘNG CẬP NHẬT LÊN GITHUB THÀNH CÔNG!`);
    console.log(`[${getTimestamp()}] 💤 Đang tiếp tục theo dõi các thay đổi tiếp theo...`);
    console.log(`--------------------------------------------------\n`);
  } catch (error) {
    console.error(`[${getTimestamp()}] ❌ Lỗi khi tự động push:`, error.message);
  } finally {
    isPushing = false;
  }
}

function onFileChange(eventType, filename) {
  if (!filename || isIgnored(filename)) return;

  pendingFiles.add(filename);

  if (debounceTimer) {
    clearTimeout(debounceTimer);
  }

  console.log(`[${getTimestamp()}] 📝 Đang sửa: ${filename} (sẽ tự động push sau 5s...)`);
  debounceTimer = setTimeout(syncToGitHub, DEBOUNCE_MS);
}

console.log(`==================================================`);
console.log(`   TỰ ĐỘNG CẬP NHẬT CODE LÊN GITHUB (AUTO-SYNC)   `);
console.log(`   Dự án: Trà Sữa ĐÔ ĐÔ -> https://github.com/trunghieu0225/trasua`);
console.log(`==================================================`);
console.log(`👀 Đang giám sát tất cả file trong dự án...`);
console.log(`💡 Bất cứ khi nào bạn Ctrl+S (lưu file), hệ thống sẽ tự động push lên GitHub.`);
console.log(`(Nhấn Ctrl + C để dừng quá trình theo dõi)\n`);

try {
  fs.watch(__dirname, { recursive: true }, onFileChange);
} catch (e) {
  console.error("Lỗi khởi tạo watcher:", e);
}
