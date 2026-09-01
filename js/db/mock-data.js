/* ==========================================================================
   TEAJOY STORE - MOCK DATABASE & SEED DATA
   ========================================================================== */

const INITIAL_CATEGORIES = [
  { id: "tra-sua", name: "Trà Sữa Đặc Biệt", icon: "🧋", count: 8 },
  { id: "tra-trai-cay", name: "Trà Trái Cây Tươi", icon: "🍹", count: 6 },
  { id: "da-xay", name: "Đá Xay & Macchiato", icon: "🍧", count: 4 },
  { id: "ca-phe", name: "Cà Phê & Cacao", icon: "☕", count: 3 },
  { id: "combo", name: "Combo Tiết Kiệm", icon: "✨", count: 3 }
];

const INITIAL_TOPPINGS = [
  { id: "top-1", name: "Trân Châu Hoàng Kim", price: 6000, inStock: true },
  { id: "top-2", name: "Trân Châu Đen Dẻo", price: 5000, inStock: true },
  { id: "top-3", name: "Thạch Phô Mai Tươi", price: 10000, inStock: true },
  { id: "top-4", name: "Pudding Trứng Mịn", price: 8000, inStock: true },
  { id: "top-5", name: "Kem Cheese Macchiato", price: 12000, inStock: true },
  { id: "top-6", name: "Thạch Củ Năng Giòn", price: 7000, inStock: true },
  { id: "top-7", name: "Thạch Dừa Giòn", price: 5000, inStock: true },
  { id: "top-8", name: "Đào Miếng Ngâm", price: 8000, inStock: true }
];

const INITIAL_SIZES = [
  { id: "M", name: "Size M (500ml)", extraPrice: 0 },
  { id: "L", name: "Size L (700ml)", extraPrice: 6000 },
  { id: "XL", name: "Size XL Khổng Lồ (1000ml)", extraPrice: 12000 }
];

const INITIAL_PRODUCTS = [
  {
    id: "TS-01",
    name: "Trà Sữa Trân Châu Hoàng Kim",
    category: "tra-sua",
    price: 35000,
    oldPrice: 42000,
    rating: 4.9,
    sold: 1420,
    image: "https://images.unsplash.com/photo-1558857563-b37fcdd72460?auto=format&fit=crop&w=600&q=80",
    description: "Vị trà đen đậm đà quyện cùng sữa tươi béo ngậy và trân châu hoàng kim nấu đường nâu thơm phức dẻo bùi.",
    isBestseller: true,
    isNew: false,
    inStock: true,
    stockQty: 85
  },
  {
    id: "TS-02",
    name: "Trà Sữa Oolong Nướng Kem Cheese",
    category: "tra-sua",
    price: 45000,
    oldPrice: 50000,
    rating: 5.0,
    sold: 980,
    image: "https://images.unsplash.com/photo-1576092768241-dec231879fc3?auto=format&fit=crop&w=600&q=80",
    description: "Trà Oolong nướng than đượm hương khói hòa quyện lớp kem mặn phô mai New Zealand béo bùi khó cưỡng.",
    isBestseller: true,
    isNew: true,
    inStock: true,
    stockQty: 64
  },
  {
    id: "TS-03",
    name: "Trà Sữa Matcha Kyoto Phô Mai",
    category: "tra-sua",
    price: 42000,
    oldPrice: 48000,
    rating: 4.8,
    sold: 760,
    image: "https://images.unsplash.com/photo-1536256263959-770b48d82b0a?auto=format&fit=crop&w=600&q=80",
    description: "Bột trà xanh Matcha nguyên chất nhập khẩu Nhật Bản kết hợp cùng sữa tươi thanh trùng và viên thạch phô mai béo ngậy.",
    isBestseller: false,
    isNew: true,
    inStock: true,
    stockQty: 45
  },
  {
    id: "TS-04",
    name: "Trà Sữa Khoai Môn Dẻo Taro",
    category: "tra-sua",
    price: 39000,
    oldPrice: 45000,
    rating: 4.7,
    sold: 630,
    image: "https://images.unsplash.com/photo-1541658016709-82535e94bc69?auto=format&fit=crop&w=600&q=80",
    description: "Khoai môn nghiền tươi kết hợp trà sữa truyền thống thơm ngát vị củ tự nhiên, sánh dẻo ngon ngọt.",
    isBestseller: false,
    isNew: false,
    inStock: true,
    stockQty: 50
  },
  {
    id: "TC-01",
    name: "Trà Đào Cam Sả Tươi Mát",
    category: "tra-trai-cay",
    price: 38000,
    oldPrice: 45000,
    rating: 4.9,
    sold: 1150,
    image: "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?auto=format&fit=crop&w=600&q=80",
    description: "Nước cốt đào thơm thanh phối hợp cùng vị chua ngọt từ cam vàng tươi và hương sả nồng nàn giải nhiệt tức thì.",
    isBestseller: true,
    isNew: false,
    inStock: true,
    stockQty: 90
  },
  {
    id: "TC-02",
    name: "Trà Dâu Tây Tằm Thạch Củ Năng",
    category: "tra-trai-cay",
    price: 42000,
    oldPrice: 49000,
    rating: 4.8,
    sold: 840,
    image: "https://images.unsplash.com/photo-1556881286-fc6915169721?auto=format&fit=crop&w=600&q=80",
    description: "Dâu tây Đà Lạt ngâm đường phèn cùng dâu tằm rừng chua ngọt đã khát, đi kèm thạch củ năng giòn sần sật.",
    isBestseller: false,
    isNew: true,
    inStock: true,
    stockQty: 40
  },
  {
    id: "TC-03",
    name: "Trà Hoa Đậu Biếc Chanh Vàng",
    category: "tra-trai-cay",
    price: 35000,
    oldPrice: 40000,
    rating: 4.6,
    sold: 520,
    image: "https://images.unsplash.com/photo-1544787219-7f47ccb76574?auto=format&fit=crop&w=600&q=80",
    description: "Hiệu ứng phân tầng tím xanh ảo diệu từ hoa đậu biếc và chanh tươi thanh mát xua tan mệt mỏi.",
    isBestseller: false,
    isNew: false,
    inStock: true,
    stockQty: 60
  },
  {
    id: "DX-01",
    name: "Đá Xay Cà Phê Caramel Macchiato",
    category: "da-xay",
    price: 49000,
    oldPrice: 55000,
    rating: 4.9,
    sold: 690,
    image: "https://images.unsplash.com/photo-1572490122747-3968b75cc699?auto=format&fit=crop&w=600&q=80",
    description: "Espresso đá xay sánh mịn, xốt sốt caramel nhập khẩu và chóp kem tươi bông xốp ngọt ngào.",
    isBestseller: false,
    isNew: true,
    inStock: true,
    stockQty: 35
  },
  {
    id: "CP-01",
    name: "Cà Phê Muối Kem Béo Huế",
    category: "ca-phe",
    price: 32000,
    oldPrice: 38000,
    rating: 4.9,
    sold: 1300,
    image: "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=600&q=80",
    description: "Cà phê phin truyền thống hòa quyện cùng lớp kem muối béo mặn mòi đặc sản xứ Huế trứ danh.",
    isBestseller: true,
    isNew: false,
    inStock: true,
    stockQty: 100
  },
  {
    id: "CB-01",
    name: "Combo Hẹn Hò (2 Ly + 4 Topping)",
    category: "combo",
    price: 79000,
    oldPrice: 98000,
    rating: 5.0,
    sold: 450,
    image: "https://images.unsplash.com/photo-1558857563-b37fcdd72460?auto=format&fit=crop&w=600&q=80",
    description: "Gồm 01 Trà sữa Trân Châu Hoàng Kim + 01 Trà Đào Cam Sả + Full topping trân châu & thạch phô mai cho 2 người.",
    isBestseller: true,
    isNew: false,
    inStock: true,
    stockQty: 25
  }
];

const INITIAL_VOUCHERS = [
  { code: "BANMOI10", discountPercent: 10, maxDiscount: 20000, minOrder: 50000, desc: "Giảm 10% cho bạn mới", expiry: "2026-12-31" },
  { code: "FREESHIP", discountAmount: 15000, minOrder: 80000, desc: "Miễn phí vận chuyển 15k", expiry: "2026-12-31" },
  { code: "TRAXANH20", discountAmount: 20000, minOrder: 100000, desc: "Giảm ngay 20.000đ cho đơn từ 100k", expiry: "2026-12-31" },
  { code: "LUCKYSPIN", discountPercent: 15, maxDiscount: 30000, minOrder: 60000, desc: "Quà tặng vòng quay may mắn", expiry: "2026-12-31" }
];

const INITIAL_USERS = [
  {
    id: "USR-001",
    username: "admin",
    password: "123",
    fullName: "Nguyễn Văn Quản Lý",
    role: "admin", // admin, staff, customer
    email: "admin@teajoy.vn",
    phone: "0901234567",
    status: "active",
    createdAt: "2026-01-01"
  },
  {
    id: "USR-002",
    username: "nhanvien",
    password: "123",
    fullName: "Trần Thị Thu Ngân",
    role: "staff",
    email: "thungan@teajoy.vn",
    phone: "0912345678",
    status: "active",
    createdAt: "2026-02-15"
  },
  {
    id: "USR-003",
    username: "khachhang",
    password: "123",
    fullName: "Lê Hoàng Phúc",
    role: "customer",
    email: "phucle@gmail.com",
    phone: "0987654321",
    points: 320,
    tier: "VIP Vàng",
    address: "123 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP.HCM",
    status: "active",
    createdAt: "2026-03-10"
  }
];

const INITIAL_ORDERS = [
  {
    id: "TS-8942",
    customerName: "Lê Hoàng Phúc",
    customerPhone: "0987654321",
    customerAddress: "123 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP.HCM",
    note: "Giao trước 12h trưa, ít đá",
    items: [
      {
        productId: "TS-01",
        name: "Trà Sữa Trân Châu Hoàng Kim",
        size: "L",
        sugar: "50%",
        ice: "30%",
        toppings: ["Trân Châu Hoàng Kim", "Thạch Phô Mai Tươi"],
        quantity: 2,
        price: 57000,
        subtotal: 114000
      },
      {
        productId: "TC-01",
        name: "Trà Đào Cam Sả Tươi Mát",
        size: "M",
        sugar: "70%",
        ice: "70%",
        toppings: ["Đào Miếng Ngâm"],
        quantity: 1,
        price: 46000,
        subtotal: 46000
      }
    ],
    itemsTotal: 160000,
    shippingFee: 15000,
    discount: 16000,
    voucherCode: "BANMOI10",
    totalAmount: 159000,
    paymentMethod: "vietqr",
    paymentStatus: "paid", // paid, pending
    orderStatus: "preparing", // pending, confirmed, preparing, shipping, completed, cancelled
    createdAt: "2026-09-01 10:15:30"
  },
  {
    id: "TS-8941",
    customerName: "Nguyễn Thị Mai",
    customerPhone: "0933112233",
    customerAddress: "45 Lê Duẩn, Quận 1, TP.HCM",
    note: "Cho thêm ống hút lớn",
    items: [
      {
        productId: "TS-02",
        name: "Trà Sữa Oolong Nướng Kem Cheese",
        size: "M",
        sugar: "50%",
        ice: "50%",
        toppings: ["Pudding Trứng Mịn"],
        quantity: 1,
        price: 53000,
        subtotal: 53000
      }
    ],
    itemsTotal: 53000,
    shippingFee: 15000,
    discount: 0,
    voucherCode: "",
    totalAmount: 68000,
    paymentMethod: "cod",
    paymentStatus: "pending",
    orderStatus: "shipping",
    createdAt: "2026-09-01 09:40:12"
  },
  {
    id: "TS-8940",
    customerName: "Đỗ Minh Khang",
    customerPhone: "0944556677",
    customerAddress: "88 Nam Kỳ Khởi Nghĩa, Quận 3, TP.HCM",
    note: "",
    items: [
      {
        productId: "CP-01",
        name: "Cà Phê Muối Kem Béo Huế",
        size: "M",
        sugar: "100%",
        ice: "100%",
        toppings: [],
        quantity: 3,
        price: 32000,
        subtotal: 96000
      }
    ],
    itemsTotal: 96000,
    shippingFee: 15000,
    discount: 15000,
    voucherCode: "FREESHIP",
    totalAmount: 96000,
    paymentMethod: "vietqr",
    paymentStatus: "paid",
    orderStatus: "completed",
    createdAt: "2026-09-01 08:30:00"
  }
];

const INITIAL_SUPPLIERS = [
  { id: "SUP-01", name: "Công ty Trà Cao Cương Lâm Đồng", contact: "Anh Cương", phone: "0908889900", materials: "Lá trà Ô long, Trà đen Assam, Lục trà nhài", status: "active" },
  { id: "SUP-02", name: "Sữa Tươi Thanh Trùng DalatMilk", contact: "Chị Hạnh", phone: "0903332211", materials: "Sữa tươi, Kem béo thực vật, Bơ phô mai", status: "active" },
  { id: "SUP-03", name: "Nhà cung cấp Topping & Bao bì Tân Phú", contact: "Anh Thắng", phone: "0977112233", materials: "Trân châu hoàng kim, Cốc giấy, Ống hút sinh học", status: "active" }
];

const INITIAL_BANNERS = [
  { id: "BN-01", title: "Mua 2 Tặng 1 Topping Đỉnh Chóp", image: "https://images.unsplash.com/photo-1558857563-b37fcdd72460?auto=format&fit=crop&w=1200&q=80", link: "menu.html", active: true },
  { id: "BN-02", title: "Ra Mắt Bộ Ba Trà Trái Cây Mùa Hè", image: "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?auto=format&fit=crop&w=1200&q=80", link: "menu.html", active: true }
];
