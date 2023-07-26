-- create schema BTL;
-- use BTL; 

CREATE TABLE nhanvien (
    MaNV VARCHAR(50) PRIMARY KEY,
    TenNV VARCHAR(50) NOT NULL,
    Gmail VARCHAR(50) UNIQUE,
    SDT VARCHAR(15) UNIQUE,
    GT VARCHAR(5),
    Luong DECIMAL(10,2)
);
-- Tạo Trigger để đảm bảo ràng buộc MaNV → TenNV
DELIMITER //
CREATE TRIGGER tr_NhanVien_Update
BEFORE UPDATE ON nhanvien
FOR EACH ROW
BEGIN
    IF NEW.TenNV <> OLD.TenNV THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể thay đổi TenNV.';
    END IF;
END;
//
DELIMITER ;

CREATE TABLE khachhang (
    MaKH VARCHAR(50) PRIMARY KEY,
    TenKH VARCHAR(50) NOT NULL,
    SDT VARCHAR(15) UNIQUE,
    GT VARCHAR(5)
);
-- Tạo Trigger để đảm bảo ràng buộc MaKH → TenKH
DELIMITER //
CREATE TRIGGER tr_KhachHang_Update
BEFORE UPDATE ON khachhang
FOR EACH ROW
BEGIN
    IF NEW.TenKH <> OLD.TenKH THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể thay đổi TenKH.';
    END IF;
END;
//
DELIMITER ;

CREATE TABLE danhmuc (
  MaDanhMuc VARCHAR(50) PRIMARY KEY,
  TenDanhMuc TEXT NOT NULL
);
-- Tạo Trigger để đảm bảo ràng buộc MaDanhMuc → TenDanhMuc
DELIMITER //
CREATE TRIGGER tr_DanhMuc_Update
BEFORE UPDATE ON danhmuc
FOR EACH ROW
BEGIN
    IF NEW.TenDanhMuc <> OLD.TenDanhMuc THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể thay đổi TenDanhMuc.';
    END IF;
END;
//
DELIMITER ;

drop table thuoc;

CREATE TABLE thuoc (
    MaThuoc VARCHAR(50) PRIMARY KEY,
    TenThuoc VARCHAR(50) NOT NULL,
    GiaBan DECIMAL(10,2) NOT NULL,
    NgaySanXuat DATE NOT NULL,
    NgayHetHan DATE NOT NULL,
    SoLuongThuocCon INT NOT NULL,   
    CongDung TEXT,     
    DVT VARCHAR(10) NOT NULL,
    MaDanhMuc VARCHAR(50) NOT NULL,
    MaNCC VARCHAR(50) NOT NULL,
    FOREIGN KEY (MaDanhMuc) REFERENCES danhmuc(MaDanhMuc),
    FOREIGN KEY (MaNCC) REFERENCES nhacungcap(MaNCC)
);

DELIMITER //
CREATE TRIGGER tr_Thuoc_Update
BEFORE UPDATE ON thuoc
FOR EACH ROW
BEGIN
    IF NEW.TenThuoc <> OLD.TenThuoc OR NEW.MaDanhMuc <> OLD.MaDanhMuc OR NEW.MaNCC <> OLD.MaNCC THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể thay đổi thông tin MaThuoc.';
    END IF;
END;
//
DELIMITER ;

CREATE TABLE hoadon (
    MaHD VARCHAR(50) PRIMARY KEY,
    MaNV VARCHAR(50) NOT NULL,
    MaKH VARCHAR(50) NOT NULL,
    NgayBan DATE NOT NULL,    
    TongGia DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (MaNV) REFERENCES nhanvien(MaNV),
    FOREIGN KEY (MaKH) REFERENCES khachhang(MaKH)
);

-- Tạo Trigger để đảm bảo ràng buộc MaHD → {MaNV, MaKH, NgayBan, TongGia}
DELIMITER //
CREATE TRIGGER tr_HoaDon_Update
BEFORE UPDATE ON HoaDon
FOR EACH ROW
BEGIN
    IF NEW.MaNV <> OLD.MaNV OR NEW.MaKH <> OLD.MaKH OR NEW.NgayBan <> OLD.NgayBan OR NEW.TongGia <> OLD.TongGia THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể thay đổi thông tin MaHD.';
    END IF;
END;
//
DELIMITER ;


CREATE TABLE chi_tiet_hoa_don(
    MaHD VARCHAR(50) NOT NULL,
    MaThuoc VARCHAR(50) NOT NULL,
    GiaBan int NOT NULL,
    SoLuongBan INT NOT NULL,
    FOREIGN KEY (MaHD) REFERENCES hoadon(MaHD),
    FOREIGN KEY (MaThuoc) REFERENCES thuoc(MaThuoc),
    primary key (MaHD, MaThuoc)
);
-- Tạo Trigger để đảm bảo ràng buộc MaHD, MaThuoc → {SoLuongBan}
DELIMITER //
CREATE TRIGGER tr_chi_tiet_hoa_don_Update
BEFORE UPDATE ON chi_tiet_hoa_don
FOR EACH ROW
BEGIN
    IF NEW.SoLuongBan <> OLD.SoLuongBan THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể thay đổi SoLuongBan.';
    END IF;
END;
//
DELIMITER ;

CREATE TABLE nhacungcap (
    MaNCC VARCHAR(50) PRIMARY KEY,
    TenNCC VARCHAR(50) NOT NULL,
    DiaChi TEXT NOT NULL,
    SDT VARCHAR(15) UNIQUE,
    Gmail VARCHAR(50) UNIQUE
);
-- Tạo Trigger để đảm bảo ràng buộc MaNCC → TenNCC
DELIMITER //
CREATE TRIGGER tr_NhaCungCap_Update
BEFORE UPDATE ON NhaCungCap
FOR EACH ROW
BEGIN
    IF NEW.TenNCC <> OLD.TenNCC THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể thay đổi TenNCC.';
    END IF;
END;
//
DELIMITER ;




