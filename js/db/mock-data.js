/* ==========================================================================
   TEAJOY STORE - TRÀ SỮA ĐÔ ĐÔ MOCK DATABASE & SEED DATA
   ========================================================================== */

const INITIAL_CATEGORIES = [
  { id: "mochi", name: "Series Mochi Kéo Dài", icon: "🍡", count: 4 },
  { id: "tiramisu", name: "Series Tiramisu & Cookies", icon: "🍫", count: 3 },
  { id: "tra-sua", name: "Series Trà Sữa Đô Đô", icon: "🧋", count: 3 },
  { id: "tra-trai-cay", name: "Series Trà Hoa Quả", icon: "🍊", count: 3 }
];

const INITIAL_TOPPINGS = [
  { id: "top-1", name: "Mochi Kéo Dài (Signature Đô Đô)", price: 6000, inStock: true, image: "https://trasuadodo.vn/wp-content/uploads/2021/04/Mochi-keo-dai.jpg" },
  { id: "top-2", name: "Mochi Nếp Lạnh Dẻo", price: 6000, inStock: true, image: "https://trasuadodo.vn/wp-content/uploads/2025/10/mochi-nep-lanh-anh-app.png" },
  { id: "top-3", name: "Kem Tiramisu Phô Mai", price: 8000, inStock: true, image: "https://trasuadodo.vn/wp-content/uploads/2025/10/tiramisu-anh-web.png" },
  { id: "top-4", name: "Vụn Bánh Cookies", price: 5000, inStock: true, image: "https://trasuadodo.vn/wp-content/uploads/2022/09/Cookies-1-min.jpg" },
  { id: "top-5", name: "Trân Châu Đen Dẻo", price: 5000, inStock: true, image: "https://trasuadodo.vn/wp-content/uploads/2021/04/Tran-chau-den.jpg" },
  { id: "top-6", name: "Trân Châu Trắng", price: 5000, inStock: true, image: "https://trasuadodo.vn/wp-content/uploads/2021/04/Tran-chau-trang.jpg" },
  { id: "top-7", name: "Pudding Trứng Dẻo", price: 6000, inStock: true, image: "https://trasuadodo.vn/wp-content/uploads/2021/04/Pudding.jpg" },
  { id: "top-8", name: "Kem Sữa Macchiato", price: 8000, inStock: true, image: "https://trasuadodo.vn/wp-content/uploads/2021/04/Kem-sua.jpg" }
];

const INITIAL_SIZES = [
  { id: "M", name: "Size M (Chuẩn Đô Đô)", extraPrice: 0 },
  { id: "L", name: "Size L (700ml)", extraPrice: 6000 }
];

const INITIAL_PRODUCTS = [
  {
    id: "TS-01",
    name: "Hồng Trà Mochi Kéo Dài",
    category: "mochi",
    price: 25000,
    oldPrice: 30000,
    rating: 5.0,
    sold: 3420,
    image: "https://trasuadodo.vn/wp-content/uploads/2025/09/Hong-tra-mochi-keo-dai.jpg",
    description: "Món Signature trứ danh của Đô Đô với lớp topping Mochi dẻo quánh kéo dài độc quyền kết hợp nền hồng trà sữa thơm bùi chuẩn vị.",
    isBestseller: true,
    isNew: false,
    inStock: true,
    stockQty: 100
  },
  {
    id: "TS-02",
    name: "Matcha Mochi Kéo Dài",
    category: "mochi",
    price: 25000,
    oldPrice: 30000,
    rating: 4.9,
    sold: 2280,
    image: "https://trasuadodo.vn/wp-content/uploads/2021/04/Tra-sua-matcha-mochi-keo-dai.jpg",
    description: "Matcha thanh mát nguyên chất nhập khẩu quyện cùng sữa béo và lớp mochi dẻo mềm kéo sợi dai ngọt thơm lừng.",
    isBestseller: true,
    isNew: true,
    inStock: true,
    stockQty: 85
  },
  {
    id: "TS-03",
    name: "Sữa Tươi Đường Đen Mochi Kéo Dài",
    category: "mochi",
    price: 25000,
    oldPrice: 32000,
    rating: 4.9,
    sold: 2750,
    image: "https://trasuadodo.vn/wp-content/uploads/2021/03/Sua-tuoi-duong-den-mochi-keo-dai.jpg",
    description: "Sữa tươi thanh trùng béo ngậy sốt đường đen đậm vị cùng lớp mochi dẻo dai béo ngậy gây nghiện ngay ngụm đầu tiên.",
    isBestseller: true,
    isNew: false,
    inStock: true,
    stockQty: 90
  },
  {
    id: "TS-04",
    name: "Matcha Mochi Nếp Lạnh",
    category: "mochi",
    price: 25000,
    oldPrice: 30000,
    rating: 4.8,
    sold: 1650,
    image: "https://trasuadodo.vn/wp-content/uploads/2024/03/Matcha-mochi-nep-lanh.jpg",
    description: "Vị matcha thanh mát kết hợp cùng mochi nếp lạnh dẻo quánh nhai mát lạnh cực cuốn.",
    isBestseller: false,
    isNew: true,
    inStock: true,
    stockQty: 70
  },
  {
    id: "TS-05",
    name: "Socola Mochi Nếp Lạnh",
    category: "mochi",
    price: 25000,
    oldPrice: 30000,
    rating: 4.8,
    sold: 1420,
    image: "https://trasuadodo.vn/wp-content/uploads/2024/03/Socola-mochi-nep-lanh.jpg",
    description: "Vị cacao socola đậm đà hòa quyện cùng mochi nếp lạnh dẻo quánh mềm tan trong miệng.",
    isBestseller: false,
    isNew: false,
    inStock: true,
    stockQty: 65
  },
  {
    id: "TS-06",
    name: "Hồng Trà Tiramisu Ovaltine",
    category: "tiramisu",
    price: 25000,
    oldPrice: 32000,
    rating: 4.9,
    sold: 1980,
    image: "https://trasuadodo.vn/wp-content/uploads/2022/12/Hong-tra-tiramisu-ovaltine.jpg",
    description: "Hồng trà sữa thơm phức phủ lớp kem Tiramisu phô mai béo mặn chuẩn Ý và rắc bột Ovaltine giòn rụm trên bề mặt.",
    isBestseller: true,
    isNew: false,
    inStock: true,
    stockQty: 95
  },
  {
    id: "TS-07",
    name: "Matcha Tiramisu Ovaltine",
    category: "tiramisu",
    price: 25000,
    oldPrice: 32000,
    rating: 4.8,
    sold: 1420,
    image: "https://trasuadodo.vn/wp-content/uploads/2022/12/Matcha-tiramisu-ovaltine.jpg",
    description: "Vị chát dịu của matcha phối cùng kem Tiramisu béo mặn và vụn Ovaltine thơm lừng đánh thức vị giác.",
    isBestseller: false,
    isNew: true,
    inStock: true,
    stockQty: 60
  },
  {
    id: "TS-08",
    name: "Socola Tiramisu Ovaltine",
    category: "tiramisu",
    price: 25000,
    oldPrice: 30000,
    rating: 4.9,
    sold: 2150,
    image: "https://trasuadodo.vn/wp-content/uploads/2022/12/Socola-tiramisu-ovaltine.jpg",
    description: "Socola béo đậm kết hợp kem Tiramisu mặn ngọt và lớp bột Ovaltine giòn thơm nức mũi.",
    isBestseller: true,
    isNew: false,
    inStock: true,
    stockQty: 85
  },
  {
    id: "TS-09",
    name: "Hồng Trà Sữa Cookies",
    category: "tiramisu",
    price: 25000,
    oldPrice: 30000,
    rating: 4.8,
    sold: 1780,
    image: "https://trasuadodo.vn/wp-content/uploads/2022/09/Hong-tra-sua-cookies.jpg",
    description: "Hồng trà sữa đậm đà rắc vụn bánh cookies giòn rụm tạo cảm giác nhai vui miệng thích thú.",
    isBestseller: false,
    isNew: false,
    inStock: true,
    stockQty: 75
  },
  {
    id: "TS-10",
    name: "Trà Sữa Đô Đô Truyền Thống",
    category: "tra-sua",
    price: 21000,
    oldPrice: 25000,
    rating: 4.9,
    sold: 4120,
    image: "https://trasuadodo.vn/wp-content/uploads/2021/04/Hong-tra-sua.jpg",
    description: "Vị trà sữa nguyên bản Đô Đô thơm nồng đượm vị lá trà, béo ngậy vừa vặn với mức giá sinh viên chỉ 21K.",
    isBestseller: true,
    isNew: false,
    inStock: true,
    stockQty: 150
  },
  {
    id: "TS-11",
    name: "Olong Nhài Sữa Đô Đô",
    category: "tra-sua",
    price: 25000,
    oldPrice: 30000,
    rating: 4.9,
    sold: 2310,
    image: "https://trasuadodo.vn/wp-content/uploads/2023/05/O-long-nhai-sua.jpg",
    description: "Trà Olong thanh khiết quyện cùng hương hoa nhài thơm thoang thoảng và sữa béo thanh tao.",
    isBestseller: true,
    isNew: false,
    inStock: true,
    stockQty: 80
  },
  {
    id: "TS-12",
    name: "Trà Sữa Socola Đậm Đà",
    category: "tra-sua",
    price: 23000,
    oldPrice: 28000,
    rating: 4.7,
    sold: 1350,
    image: "https://trasuadodo.vn/wp-content/uploads/2021/04/Tra-sua-socola.jpg",
    description: "Cacao nguyên chất hòa cùng sữa thơm nồng đậm đà, vị ngọt đắng quyến rũ.",
    isBestseller: false,
    isNew: false,
    inStock: true,
    stockQty: 70
  },
  {
    id: "TC-01",
    name: "Trà Khế Thạch Đào",
    category: "tra-trai-cay",
    price: 23000,
    oldPrice: 28000,
    rating: 4.9,
    sold: 1560,
    image: "https://trasuadodo.vn/wp-content/uploads/2026/06/Tra-khe-thach-dao.png",
    description: "Vị chua thanh dịu ngọt từ trái khế mọng nước hòa quyện cùng thạch đào giòn sần sật đã khát ngày hè.",
    isBestseller: true,
    isNew: true,
    inStock: true,
    stockQty: 90
  },
  {
    id: "TC-02",
    name: "Trà Chanh Thơm Thạch Đào",
    category: "tra-trai-cay",
    price: 23000,
    oldPrice: 28000,
    rating: 4.8,
    sold: 1220,
    image: "https://trasuadodo.vn/wp-content/uploads/2026/06/Tra-chanh-thom-thach-dao.png",
    description: "Vị chanh vàng thơm mát kết hợp vị dứa nhiệt đới và thạch đào giòn thơm sảng khoái.",
    isBestseller: false,
    isNew: true,
    inStock: true,
    stockQty: 80
  },
  {
    id: "TC-03",
    name: "Trà Xoài Đào Thanh Mát",
    category: "tra-trai-cay",
    price: 23000,
    oldPrice: 28000,
    rating: 4.8,
    sold: 1340,
    image: "https://trasuadodo.vn/wp-content/uploads/2023/08/Tra-xoai-dao.jpg",
    description: "Hương vị trà xoài nhiệt đới kết hợp cốt đào thơm lừng mang đến cảm giác sảng khoái mát lạnh.",
    isBestseller: false,
    isNew: false,
    inStock: true,
    stockQty: 75
  },
  {
    id: "TC-04",
    name: "Trà Mơ Xanh Muối",
    category: "tra-trai-cay",
    price: 23000,
    oldPrice: 28000,
    rating: 4.7,
    sold: 980,
    image: "https://trasuadodo.vn/wp-content/uploads/2023/07/Tra-mo-xanh-muoi.jpg",
    description: "Trà mơ xanh chua ngọt đậm vị chấm phá chút vị mặn thanh độc đáo giải nhiệt tức thì.",
    isBestseller: false,
    isNew: false,
    inStock: true,
    stockQty: 60
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
    password: "1",
    fullName: "Đỗ Trung Hiếu (Quản Lý)",
    role: "admin", // admin, staff, customer
    email: "admin@dodo.vn",
    phone: "0901234567",
    status: "active",
    createdAt: "2026-01-01"
  },
  {
    id: "USR-002",
    username: "thungan",
    password: "1",
    fullName: "Nguyễn Văn Thu Ngân",
    role: "staff",
    email: "thungan@dodo.vn",
    phone: "0912345678",
    status: "active",
    createdAt: "2026-02-15"
  },
  {
    id: "USR-003",
    username: "phache",
    password: "1",
    fullName: "Trần Thị Pha Chế",
    role: "staff",
    email: "phache@dodo.vn",
    phone: "0933445566",
    status: "active",
    createdAt: "2026-03-01"
  }
];

// INITIAL_ORDERS initially empty - real customer orders placed online are saved here
const INITIAL_ORDERS = [];

const INITIAL_SUPPLIERS = [
  { id: "SUP-01", name: "Công ty Trà Cao Cương Lâm Đồng", contact: "Anh Cương", phone: "0908889900", materials: "Lá trà Ô long, Trà đen Assam, Lục trà nhài", status: "active" },
  { id: "SUP-02", name: "Sữa Tươi Thanh Trùng DalatMilk", contact: "Chị Hạnh", phone: "0903332211", materials: "Sữa tươi, Kem béo thực vật, Bơ phô mai", status: "active" },
  { id: "SUP-03", name: "Nhà cung cấp Topping & Bao bì Tân Phú", contact: "Anh Thắng", phone: "0977112233", materials: "Trân châu hoàng kim, Cốc giấy, Ống hút sinh học", status: "active" }
];

const INITIAL_BANNERS = [
  { id: "BN-01", title: "Mua 2 Tặng 1 Topping Đỉnh Chóp", image: "https://images.unsplash.com/photo-1558857563-b37fcdd72460?auto=format&fit=crop&w=1200&q=80", link: "menu.html", active: true },
  { id: "BN-02", title: "Ra Mắt Bộ Ba Trà Trái Cây Mùa Hè", image: "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?auto=format&fit=crop&w=1200&q=80", link: "menu.html", active: true }
];
