-- 1. Tạo database QuanLySinhVien (nếu chưa có)
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'QuanLySinhVien')
BEGIN
    CREATE DATABASE QuanLySinhVien;
END
GO

-- 2. Chuyển sang sử dụng database QuanLySinhVien
USE QuanLySinhVien;
GO

-- 3. Tạo bảng SinhVien
CREATE TABLE SinhVien (
    MaSV INT IDENTITY(1,1) PRIMARY KEY,      -- Mã sinh viên tự động tăng
    HoTen NVARCHAR(100) NOT NULL,             -- Họ và tên
    NgaySinh DATE NULL,                       -- Ngày sinh
    GioiTinh NVARCHAR(10) CHECK (GioiTinh IN (N'Nam', N'Nữ', N'Khác')),
    Email VARCHAR(100) UNIQUE,                -- Email không trùng lặp
    SoDienThoai VARCHAR(15) NULL,            -- Số điện thoại
    DiemTB FLOAT CHECK (DiemTB BETWEEN 0 AND 10) -- Điểm trung bình từ 0 đến 10
);
GO

-- 4. Thêm 2 sinh viên mẫu
INSERT INTO SinhVien (HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, DiemTB)
VALUES 
(N'Nguyễn Văn A', '2003-05-15', N'Nam', 'nguyenvana@gmail.com', '0912345678', 8.5),
(N'Trần Thị B', '2004-08-20', N'Nữ', 'tranthib@gmail.com', '0987654321', 9.0);
GO

-- 5. Xem danh sách sinh viên vừa tạo
SELECT * FROM SinhVien;