-- insert data
use btl;
INSERT INTO nhanvien (MaNV, TenNV, Gmail, SDT, Luong, GT)
VALUES
    ('S1', 'Tran Thi Bo', 'thibi@gmail.com', '01657654321', 1200),
    ('M3', 'Le Van Ci', 'lecvankk@gmail.com', '01669852143', 1500),
    ('E4', 'Pham Thi Do', 'phamdh@gmail.com', '01673698745', 1100),
    ('D5', 'Hoang Van Ep', 'hoanghe@gmail.com', '0987412361', 1300),
    ('F6', 'Ngo Thi iF', 'ngohf@gmail.com', '0166852147', 1400),
    ('F4', 'Dinh Van Go', 'dinhhg@gmail.com', '0113456987', 1250),
    ('G8', 'Truong Thi Hi', 'trhongh@gmail.com', '0987413612', 1050),
    ('G9', 'Phan Van Ig', 'phanvuu@gmail.com', '0160857412', 1150),
    ('P10', 'Le Thi Ku', 'lethikll@gmail.com', '0223695874', 1350);
INSERT INTO nhanvien (MaNV, TenNV, Gmail, SDT, Luong)
VALUES
    ('NV001', 'Nguyễn Văn A', 'nvana@gmail.com', '0987354321', 15000000),
    ('NV002', 'Trần Thị B', 'ttb@gmail.com', '0123451789', 12000000),
    ('NV003', 'Lê Văn C', 'lvc@gmail.com', '0912345628', 13000000),
    ('NV004', 'Phạm Thị D', 'ptd@gmail.com', '0865431198', 14000000),
    ('NV005', 'Hoàng Văn E', 'hve@gmail.com', '0976513210', 16000000);

UPDATE nhanvien
SET GT = 'Nam'
WHERE MaNV IN ('S1', 'M3', 'D5', 'F4', 'G9');

UPDATE nhanvien
SET GT = 'Nữ'
WHERE MaNV IN ('E4', 'F6', 'G8', 'P10');

UPDATE nhanvien
SET GT = 'Nam'
WHERE MaNV = '1';

UPDATE nhanvien
SET GT = 'Nữ'
WHERE MaNV = 'NV002';

UPDATE nhanvien
SET GT = 'Nam'
WHERE MaNV = 'NV003';

UPDATE nhanvien
SET GT = 'Nữ'
WHERE MaNV = 'NV004';

UPDATE nhanvien
SET GT = 'Nam'
WHERE MaNV = 'NV005';


INSERT INTO khachhang (MaKH, TenKH, SDT, GT)
VALUES 
('Y12', 'Nguyen Van A', '0123456781', 'Nam'),
('X34', 'Tran Thi B', '0987654320', 'Nu'),
('Z56', 'Le Quang C', '0365895421', 'Nam'),
('U78', 'Pham Thi D', '0912344678', 'Nu'),
('V90', 'Tran Van E', '0987651321', 'Nam'),
('T23', 'Le Thi F', '0365897411', 'Nu'),
('S45', 'Pham Van G', '0912342678', 'Nam'),
('R67', 'Tran Thi H', '0987652321', 'Nu'),
('P89', 'Le Quang I', '0365892421', 'Nam'),
('N01', 'Pham Van J', '0912341678', 'Nu');

INSERT INTO khachhang (MaKH, TenKH, SDT, GT)
VALUES
    ('KH006', 'Nguyễn Thị Anh', '0981651321', 'Nữ'),
    ('KH002', 'Trần Văn Bình', '0123356789', 'Nam'),
    ('KH003', 'Lê Thị Cẩm', '0912345278', 'Nữ'),
    ('KH004', 'Phạm Văn Đạt', '0865412198', 'Nam'),
    ('KH005', 'Hoàng Thị Hương', '0926543210', 'Nữ');



INSERT INTO danhmuc (MaDanhMuc, TenDanhMuc)
VALUES
    (1, 'Đau đầu'),
    (2, 'Cảm cúm'),
    (3, 'Tiêu chảy'),
    (4, 'Đau bụng'),
    (5, 'Viêm họng'),
    (6, 'Dị ứng'),
    (7, 'Trĩ'),
    (8, 'Sỏi thận'),
    (9, 'Dịch vụ khác'),
    (10, 'Sản phẩm chăm sóc sức khỏe');

INSERT INTO danhmuc (MaDanhMuc, TenDanhMuc)
VALUES
    ('DM001', 'Danh muc A'),
    ('DM002', 'Danh muc B'),
    ('DM003', 'Danh muc C'),
    ('DM004', 'Danh muc D'),
    ('DM005', 'Danh muc E');


    
INSERT INTO nhacungcap (MaNCC, TenNCC, DiaChi, SDT, Gmail)
VALUES
    (11, 'Nhà cung cấp X', 'Quảng Ninh', '0187654321', 'nc3x@gmail.com'),
    (22, 'Nhà cung cấp Y', 'Địa chỉ Y', '0369852127', 'nccy@gmail.com'),
    (3, 'Nhà cung cấp Z', 'Địa chỉ Z', '0123456789', 'nccz@gmail.com'),
    (4, 'Nhà cung cấp T', 'Địa chỉ T', '0987412369', 'ncct@gmail.com'),
    (5, 'Nhà cung cấp U', 'Địa chỉ U', '0123698745', 'ncctu@gmail.com'),
    (6, 'Nhà cung cấp V', 'Địa chỉ V', '0369852147', 'nccv@gmail.com'),
    (7, 'Nhà cung cấp W', 'Địa chỉ W', '0987413698', 'nccw@gmail.com'),
    (8, 'Nhà cung cấp S', 'Địa chỉ S', '0123456987', 'nccs@gmail.com'),
    (9, 'Nhà cung cấp R', 'Địa chỉ R', '0369857412', 'nccr@gmail.com'),
    (10, 'Nhà cung cấp P', 'Địa chỉ P', '0987413652', 'nccp@gmail.com');
INSERT INTO nhacungcap (MaNCC, TenNCC, DiaChi, SDT, Gmail)
VALUES
	('NCC016', 'hust', 'Quảng Ninh', '0127654321', 'nccAd1@gmail.com'),
    ('NCC006', 'toyota', 'Quảng Ninh', '0187654321', 'nccA1@gmail.com'),
    ('NCC007', 'laboghini', 'Quảng Ninh', '0223456789', 'nccdB@gmail.com'),
    ('NCC003', 'Nhà cung cấp C', 'Địa chỉ C', '0912345678', 'nccC@gmail.com'),
    ('NCC004', 'Nhà cung cấp D', 'Địa chỉ D', '0865432198', 'nccD@gmail.com'),
    ('NCC005', 'Nhà cung cấp E', 'Địa chỉ E', '0976543210', 'nccE@gmail.com');


INSERT INTO thuoc (MaThuoc, TenThuoc, GiaBan, NgaySanXuat, NgayHetHan, DVT, SoLuongThuocCon, CongDung, MaDanhMuc, MaNCC)
VALUES
    ('TH0012', 'Paracetamol', 15000, '2023-06-15', '2024-06-15', 'Viên', 100, 'Giảm đau, hạ sốt', 'DM001', 'NCC006'),
    ('TH0023', 'Amoxicillin', 20000, '2023-07-20', '2024-07-20', 'Viên', 80, 'Kháng vi khuẩn', 'DM001', 'NCC006'),
    ('TH0034', 'Ibuprofen', 18000, '2023-05-10', '2024-05-10', 'Viên', 90, 'Giảm đau, kháng viêm', 'DM001', 'NCC016'),
    ('TH004', 'Omeprazole', 25000, '2023-08-25', '2024-08-25', 'Viên', 70, 'Giảm dịch vị', 'DM001', 'NCC004'),
    ('TH005', 'Loperamide', 22000, '2023-07-05', '2024-07-05', 'Viên', 60, 'Chống tiêu chảy', 'DM001', 'NCC005'),
    ('TH006', 'Vitamin C', 10000, '2023-04-12', '2024-04-12', 'Viên', 120, 'Tăng cường sức đề kháng', 'DM002', 'NCC001'),
    ('TH007', 'Vitamin D', 12000, '2023-06-30', '2024-06-30', 'Viên', 110, 'Hỗ trợ hấp thu Canxi', 'DM002', 'NCC002'),
    ('TH008', 'Fish Oil', 28000, '2023-05-18', '2024-05-18', 'Viên', 40, 'Bổ sung Omega-3', 'DM002', 'NCC003'),
    ('TH009', 'Calcium', 18000, '2023-08-10', '2024-08-10', 'Viên', 50, 'Bổ sung Canxi', 'DM002', 'NCC004'),
    ('TH010', 'Iron Supplement', 15000, '2023-07-02', '2024-07-02', 'Viên', 70, 'Bổ sung sắt', 'DM002', 'NCC005');

INSERT INTO thuoc (MaThuoc, TenThuoc, GiaBan, NgaySanXuat, NgayHetHan, DVT, SoLuongThuocCon, CongDung, MaDanhMuc, MaNCC)
VALUES
    ('TH011', 'Glucozo', 150000, '2023-01-15', '2024-06-15', 'Bột', 100, 'Giảm đau, hạ sốt', 'DM001', 'NCC001');

INSERT INTO hoadon (MaHD, MaNV, MaKH, NgayBan, TongGia)
VALUES
    ('HD006', 'NV001', 'KH001', '2023-07-10', 500000),
    ('HD002', 'NV002', 'KH002', '2023-07-11', 750000),
    ('HD003', 'NV003', 'KH003', '2023-07-12', 900000),
    ('HD004', 'NV001', 'KH004', '2023-07-13', 400000),
    ('HD005', 'NV002', 'KH005', '2023-07-14', 600000);

INSERT INTO chi_tiet_hoa_don (MaHD, MaThuoc, GiaBan, SoLuongBan)
VALUES
    ('HD001', 'TH0012', 15000, 20),
    ('HD001', 'TH0023', 30000, 15),
    ('HD002', 'TH0034', 28000, 30),
    ('HD002', 'TH004', 25000, 10),
    ('HD002', 'TH005', 22000, 25),
    ('HD003', 'TH006', 10000, 40),
    ('HD003', 'TH007', 12000, 35),
    ('HD003', 'TH008', 28000, 5),
    ('HD004', 'TH009', 18000, 15),
    ('HD004', 'TH010', 15000, 20),
    ('HD005', 'TH001', 15000, 10),
    ('HD005', 'TH002', 20000, 8),
    ('HD005', 'TH003', 18000, 12),
    ('HD005', 'TH004', 25000, 6),
    ('HD005', 'TH005', 22000, 14);

INSERT INTO chi_tiet_hoa_don (MaHD, MaThuoc, GiaBan, SoLuongBan)
VALUES
    ('HD005', 'TH001', 18000, 20);