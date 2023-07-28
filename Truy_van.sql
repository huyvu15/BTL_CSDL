use btl;
SELECT * FROM nhanvien
WHERE MaNV = 'NV001';

select * from khachhang;
select * from thuoc;
select * from chi_tiet_hoa_don;
select * from hoadon;
select * from nhacungcap;
select * from danhmuc;

-- 20 câu truy vấn
-- 0: 
SELECT t.TenThuoc, COUNT(cthd.MaHD) AS SoLuongHoaDon
FROM thuoc t
LEFT JOIN chi_tiet_hoa_don cthd ON t.MaThuoc = cthd.MaThuoc
GROUP BY t.TenThuoc;

-- 1: lấy ra doanh thu của từng nhân viên trong cửa hàng
select TenNV, sum(hoadon.TongGia) as doanhthu
from nhanvien join hoadon on nhanvien.MaNV = hoadon.MaNV
group by TenNV;


-- 2: Lấy ra tháng có doanh thu cao nhất 
SELECT MONTH(NgayBan) AS thang, SUM(TongGia) AS tong_doanh_thu
FROM hoadon
GROUP BY MONTH(NgayBan)
ORDER BY tong_doanh_thu DESC
LIMIT 1;

-- 3: lấy ra các loại thuốc hết hạn đã bán cho khách hàng
select distinct TenThuoc, NgayBan from hoadon, thuoc
where NgayBan < Curdate()
group by TenThuoc, NgayBan;

-- 4: Hiển thị danh sách nhân viên
select * from nhanvien;

-- 5: Thống kê doanh số của cửa hàng theo từng năm
SELECT YEAR(NgayBan) AS Nam, SUM(TongGia) AS DoanhSo
FROM hoadon
GROUP BY YEAR(NgayBan)
ORDER BY Nam;

-- 6: Liệt kê các khách hàng sử dụng số điện thoại của nhà mạng viettel (đuôi gồm: 098, 091) 
-- sử dụng toán tử regexp để tìm các đuôi tương ứng
SELECT TenKH, SDT
FROM khachhang
WHERE SDT REGEXP '^09[81]';

select * from khachhang;

-- 7: Trả về kết doanh thu tháng hiện tại, tháng trước đó và tháng tiếp theo mà mỗi khách hàng mang lại.
SELECT
    kh.MaKH,
    kh.TenKH,
    SUM(CASE WHEN MONTH(hd.NgayBan) = MONTH(CURDATE()) THEN hd.TongGia ELSE 0 END) AS DoanhThuThangHienTai,
    SUM(CASE WHEN MONTH(hd.NgayBan) = MONTH(CURDATE()) - 1 THEN hd.TongGia ELSE 0 END) AS DoanhThuThangTruoc,
    SUM(CASE WHEN MONTH(hd.NgayBan) = MONTH(CURDATE()) + 1 THEN hd.TongGia ELSE 0 END) AS DoanhThuThangTiepTheo
FROM
    khachhang kh
LEFT JOIN
    hoadon hd ON kh.MaKH = hd.MaKH
WHERE
    MONTH(hd.NgayBan) BETWEEN MONTH(CURDATE()) - 1 AND MONTH(CURDATE()) + 1
GROUP BY
    kh.MaKH,
    kh.TenKH;


-- 8: Tìm các loại thuốc bán chạy nhất trong Tháng 2:
select t.MaThuoc, TenThuoc
from hoadon as hd join chi_tiet_hoa_don as cthd on hd.MaHD = cthd.MaHD join thuoc as t on
cthd.MaThuoc = t.MaThuoc
where Month(NgayBan) = 2;

-- 9: Tìm tất cả hóa đơn và tổng số thuốc đã bán trong hóa đơn 
SELECT hd.MaHD, COUNT(cthd.MaThuoc) AS TongSoLuongThuocBan
FROM hoadon hd
LEFT JOIN chi_tiet_hoa_don cthd ON hd.MaHD = cthd.MaHD
GROUP BY hd.MaHD;

-- 10: Lấy thông tin tên nhà cung cấp và tổng số tiền thu được từ việc bán các thuốc còn lại của mỗi nhà cung cấp:
SELECT NCC.TenNCC, SUM(T.GiaBan * T.SoLuongThuocCon) AS TongTien
FROM thuoc T
INNER JOIN nhacungcap NCC ON T.MaNCC = NCC.MaNCC
GROUP BY NCC.TenNCC;

-- 11: Lấy ra loại thuốc đắt nhất trong cửa hàng
select TenThuoc, GiaBan
from thuoc
order by GiaBan DESC
limit 1;

-- 12: Lấy ra thông tin khách hàng có hóa đơn cao nhất trong năm 2023
select TenKH, SDT, GT, TongGia
from khachhang as kh join hoadon as hd on kh.MaKH = hd.MaKH
where year(NgayBan) = 2023
order by TongGia DESC
limit 1;

-- 13: Cho biết thông tin các loại thuốc chưa bán cho khách hàng nào 
SELECT *
FROM thuoc
WHERE MaThuoc NOT IN (
    SELECT MaThuoc
    FROM chi_tiet_hoa_don
);

-- 14: Lấy thông tin tất cả các thuốc được bán ra nhiều hơn 4 lần trong năm nay:
SELECT *
FROM thuoc
WHERE MaThuoc IN (
    SELECT MaThuoc
    FROM chi_tiet_hoa_don cthd join hoadon hd on cthd.MaHD = hd.MaHD
    WHERE YEAR(NgayBan) = YEAR(CURDATE())
    GROUP BY MaThuoc
    HAVING COUNT(*) >= 4
);
-- 15: Lấy ra những khách hàng mua các loại thuốc được nhập ở quảng ninh và thông tin nhà cung cấp tương ứng
SELECT kh.MaKH, kh.TenKH, kh.SDT, kh.GT, t.TenThuoc, t.GiaBan, ncc.TenNCC
FROM khachhang kh
JOIN hoadon hd ON kh.MaKH = hd.MaKH
JOIN chi_tiet_hoa_don cthd ON hd.MaHD = cthd.MaHD
JOIN thuoc t ON cthd.MaThuoc = t.MaThuoc
JOIN nhacungcap ncc ON t.MaNCC = ncc.MaNCC
WHERE ncc.DiaChi = 'Quảng Ninh';

-- 16: Tìm thông tin nhân viên có giao dịch với khách hàng 'Trần Văn Bình'
select nv.MaNV, nv.TenNV, nv.SDT, nv.GT
from nhanvien nv join hoadon hd on nv.MaNV = hd.MaNV join khachhang kh on kh.MaKH = hd.MaHD
where kh.TenKH = 'Nguyen Thi X';

-- 17: liệt kê các nhà cung cấp thuốc trong 'Danh mục A'
select * from danhmuc;
select ncc.MaNCC, TenNCC
from nhacungcap ncc join thuoc t on ncc.MaNCC = t.MaNCC join danhmuc dm on dm.MaDanhMuc = t.MaDanhMuc
where TenDanhMuc = 'Danh mục A';

-- 18: Đếm số lượng khách hàng theo từng giới tính
SELECT GT, COUNT(MaKH) AS SoLuongKhachHang
FROM khachhang
GROUP BY GT;

-- 19: Tính tổng số lượng thuốc trong từng danh mục và sắp xếp theo số lượng giảm dần
SELECT dm.TenDanhMuc, SUM(t.SoLuongThuocCon) AS TongSoLuong
FROM danhmuc dm
LEFT JOIN thuoc t ON dm.MaDanhMuc = t.MaDanhMuc
GROUP BY dm.TenDanhMuc
ORDER BY TongSoLuong DESC;
use btl;
-- 20: Lấy thông tin về các danh mục có số lượng thuốc nhiều nhất
SELECT dm.TenDanhMuc, COUNT(t.MaThuoc) AS SoLuongThuoc
FROM danhmuc dm
LEFT JOIN thuoc t ON dm.MaDanhMuc = t.MaDanhMuc
GROUP BY dm.TenDanhMuc
HAVING SoLuongThuoc = (SELECT MAX(SoLuong) FROM (SELECT COUNT(MaThuoc) AS SoLuong FROM thuoc GROUP BY MaDanhMuc) AS temp);
