USE [master]
GO
/****** Object:  Database [QuanLyBenhVien]    Script Date: 05/06/2015 8:12:07 CH ******/
CREATE DATABASE [QuanLyBenhVien] ON  PRIMARY 
( NAME = N'QuanLyBenhVien', FILENAME = N'D:\THUC_TAP_CNTT\sql\sql\QuanLyBenhVien.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyBenhVien_log', FILENAME = N'D:\THUC_TAP_CNTT\sql\sql\QuanLyBenhVien_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyBenhVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyBenhVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBenhVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBenhVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyBenhVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyBenhVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyBenhVien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyBenhVien] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyBenhVien] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyBenhVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyBenhVien] SET DB_CHAINING OFF 
GO
USE [QuanLyBenhVien]
GO
/****** Object:  FullTextCatalog [TimKiemCB]    Script Date: 05/06/2015 8:12:07 CH ******/
CREATE FULLTEXT CATALOG [TimKiemCB]WITH ACCENT_SENSITIVITY = ON
AS DEFAULT

GO
/****** Object:  FullTextCatalog [TimKiemNV]    Script Date: 05/06/2015 8:12:07 CH ******/
CREATE FULLTEXT CATALOG [TimKiemNV]WITH ACCENT_SENSITIVITY = ON

GO
/****** Object:  FullTextCatalog [TimKimBN]    Script Date: 05/06/2015 8:12:07 CH ******/
CREATE FULLTEXT CATALOG [TimKimBN]WITH ACCENT_SENSITIVITY = ON

GO
/****** Object:  StoredProcedure [dbo].[sp_BenhNhan_insert]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_BenhNhan_insert]
@MaBN char(20),
@MaQuocGia char(10),
@MaDanToc char(10),
@MaTinhThanh char(10),
@MaQuanHuyen char(10),
@MaNgheNghiep char(10),
@TenBN nvarchar(30),
@NgaySinh date,
@NoiLamViec nvarchar(50),
@DienThoai char(15),
@Email char(25),
@CMND char(10),
@SoTheBHYT char(15),
@GiaTriTu char(10),
@DenNgay char(10),
@NoiDKBHYT nvarchar(50),
@Tuyen nvarchar(30),
@MaDoiTuongBH char(10),
@MaLoaiBH char(10),
@MaLoaiKham char(10),
@MaGioiTinh char(10),
@KetQua nvarchar(100) output
AS
Begin

declare @CountCMND int
SELECT @CountCMND=count(*) FROM BenhNhan WHERE CMND=@CMND
IF @CountCMND>0
SET @KetQua=N'Số chứng minh thư bị trùng'

declare @CountMaBN int
SELECT @CountMaBN=count(*) FROM BenhNhan WHERE MaBN=@MaBN
IF @CountMaBN>0
SET @KetQua=N'Mã bệnh nhân bị trùng'

declare @CountEmail int
SELECT @CountEmail=count(*) FROM BenhNhan WHERE Email=@Email
IF @CountEmail>0
SET @KetQua=N'Email đã được sử dụng' 

declare @CountSDT int
SELECT @CountSDT=count(*) FROM BenhNhan WHERE DienThoai=@DienThoai
IF @CountSDT>0
SET @KetQua=N'Số điện thoại đã được sử dụng'

IF @TenBN is null
SET @KetQua=N'Tên bệnh nhân không được để trống'
IF @MaBN is null
SET @KetQua=N'Mã bệnh nhân không được để trống'

IF @CountMaBN=0 and @CountCMND=0 and @CountEmail=0 and @CountSDT=0 and @TenBN is not null and @MaBN is not null
begin
insert into BenhNhan(MaBN,MaQuocGia,MaDanToc,MaTinhThanh,MaQuanHuyen,MaNgheNghiep,TenBN,NgaySinh,NoiLamViec,DienThoai,Email,CMND,SoTheBHYT,GiaTriTu,DenNgay,NoiDKBHYT,Tuyen,MaDoiTuongBH,MaLoaiBH,MaLoaiKham,MaGioiTinh) values 
(@MaBN,
@MaQuocGia ,
@MaDanToc,
@MaTinhThanh ,
@MaQuanHuyen ,
@MaNgheNghiep,
@TenBN ,
@NgaySinh ,
@NoiLamViec ,
@DienThoai ,
@Email ,
@CMND ,
@SoTheBHYT,
@GiaTriTu ,
@DenNgay ,
@NoiDKBHYT ,
@Tuyen ,
@MaDoiTuongBH ,
@MaLoaiBH ,
@MaLoaiKham ,
@MaGioiTinh )
IF @@ERROR=0
SET @KetQua=N'Tạo bệnh nhân mới thành công'
END


SELECT @KetQua AS ThongBao

END




GO
/****** Object:  StoredProcedure [dbo].[sp_BenhNhan_select_cmnd]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_BenhNhan_select_cmnd]
@CMND int
as

begin
	select BenhNhan.MaBN,TenBN, NgaySinh, TenNgheNghiep, TenDanToc, TenQuocGia
		, TenTinhThanh, TenQuanHuyen, NoiLamViec, CMND, TenLoaiKham
		, Email, LoaiGioiTinh, DienThoai
from BenhNhan, NgheNghiep, DanToc, QuocGia, TinhThanh, QuanHuyen, LoaiKCB, GioiTinh
where BenhNhan.MaNgheNghiep=NgheNghiep.MaNgheNghiep
and BenhNhan.MaQuocGia=QuocGia.MaQuocGia
and BenhNhan.MaDanToc=DanToc.MaDanToc
and BenhNhan.MaTinhThanh=TinhThanh.MaTinhThanh
and BenhNhan.MaQuanHuyen=QuanHuyen.MaQuanHuyen
and BenhNhan.MaLoaiKham=LoaiKCB.MaLoaiKham
and BenhNhan.MaGioiTinh=GioiTinh.MaGioiTinh
and CMND=@CMND

end

GO
/****** Object:  StoredProcedure [dbo].[sp_BenhNhan_select_dienthoai]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_BenhNhan_select_dienthoai]
@DienThoai char(15)
as

begin
	select BenhNhan.MaBN,TenBN, NgaySinh, TenNgheNghiep, TenDanToc, TenQuocGia
		, TenTinhThanh, TenQuanHuyen, NoiLamViec, CMND, TenLoaiKham
		, Email, LoaiGioiTinh, DienThoai
from BenhNhan, NgheNghiep, DanToc, QuocGia, TinhThanh, QuanHuyen, LoaiKCB, GioiTinh
where BenhNhan.MaNgheNghiep=NgheNghiep.MaNgheNghiep
and BenhNhan.MaQuocGia=QuocGia.MaQuocGia
and BenhNhan.MaDanToc=DanToc.MaDanToc
and BenhNhan.MaTinhThanh=TinhThanh.MaTinhThanh
and BenhNhan.MaQuanHuyen=QuanHuyen.MaQuanHuyen
and BenhNhan.MaLoaiKham=LoaiKCB.MaLoaiKham
and BenhNhan.MaGioiTinh=GioiTinh.MaGioiTinh
and DienThoai=@DienThoai

end

GO
/****** Object:  StoredProcedure [dbo].[sp_BenhNhan_select_hoten]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_BenhNhan_select_hoten]
@TenBN nvarchar(30)
as

begin
	select MaBN,TenBN, NgaySinh from BenhNhan 
where FreeText(TenBN,@TenBN)
end

GO
/****** Object:  StoredProcedure [dbo].[sp_BenhNhan_select_hoten1]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_BenhNhan_select_hoten1]
@TenBN nvarchar(30)
as

begin
	select BenhNhan.MaBN,TenBN, NgaySinh, TenNgheNghiep, TenDanToc, TenQuocGia
		, TenTinhThanh, TenQuanHuyen, NoiLamViec, CMND, TenLoaiKham
		, Email, LoaiGioiTinh, DienThoai
from BenhNhan, NgheNghiep, DanToc, QuocGia, TinhThanh, QuanHuyen, LoaiKCB, GioiTinh
where BenhNhan.MaNgheNghiep=NgheNghiep.MaNgheNghiep
and BenhNhan.MaQuocGia=QuocGia.MaQuocGia
and BenhNhan.MaDanToc=DanToc.MaDanToc
and BenhNhan.MaTinhThanh=TinhThanh.MaTinhThanh
and BenhNhan.MaQuanHuyen=QuanHuyen.MaQuanHuyen
and BenhNhan.MaLoaiKham=LoaiKCB.MaLoaiKham
and BenhNhan.MaGioiTinh=GioiTinh.MaGioiTinh
and FreeText(TenBN,@TenBN)
end



GO
/****** Object:  StoredProcedure [dbo].[sp_BenhNhan_update]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_BenhNhan_update]
@MaBN char(20),
@MaQuocGia char(10),
@MaDanToc char(10),
@MaTinhThanh char(10),
@MaQuanHuyen char(10),
@MaNgheNghiep char(10),
@TenBN nvarchar(30),
@NgaySinh date,
@NoiLamViec nvarchar(50),
@DienThoai char(15),
@Email char(25),
@CMND int,
@SoTheBHYT int,
@GiaTriTu date,
@DenNgay date,
@NoiDKBHYT nvarchar(50),
@Tuyen nvarchar(30),
@MaDoiTuongBH char(10),
@MaLoaiBH char(10),
@MaLoaiKham char(10),
@MaGioiTinh char(10),
@KetQua nvarchar(100) output
AS
BEGIN
declare @CountCMND int
SELECT @CountCMND=count(*) FROM BenhNhan WHERE CMND=@CMND and CMND not in(select CMND from BenhNhan where MaBN=@MaBN)
IF @CountCMND>0
SET @KetQua=N'Số chứng minh thư bị trùng'

declare @CountEmail int
SELECT @CountEmail=count(*) FROM BenhNhan WHERE Email=@Email and Email not in(select Email from BenhNhan where MaBN=@MaBN)
IF @CountEmail>0
SET @KetQua=N'Email đã được sử dụng' 

declare @CountSDT int
SELECT @CountSDT=count(*) FROM BenhNhan WHERE DienThoai=@DienThoai  and DienThoai not in(select DienThoai from BenhNhan where MaBN=@MaBN)
IF @CountSDT>0
SET @KetQua=N'Số điện thoại đã được sử dụng'

IF @TenBN is null
SET @KetQua=N'Tên bệnh nhân không được để trống'
IF @MaBN is null
SET @KetQua=N'Mã bệnh nhân không được để trống'

IF @CountCMND=0 and @CountEmail=0 and @CountSDT=0 and @TenBN is not null and @MaBN is not null
begin
Update BenhNhan Set MaQuocGia=@MaQuocGia ,MaDanToc=@MaDanToc,MaTinhThanh=@MaTinhThanh,MaQuanHuyen=@MaQuanHuyen,MaNgheNghiep=@MaNgheNghiep,TenBN=@TenBN,NgaySinh=@NgaySinh,NoiLamViec=@NoiLamViec,DienThoai=@DienThoai,Email=@Email,CMND=@CMND,SoTheBHYT=@SoTheBHYT,GiaTriTu=@GiaTriTu,DenNgay=@DenNgay,NoiDKBHYT=@NoiDKBHYT,Tuyen=@Tuyen,MaDoiTuongBH=@MaDoiTuongBH,MaLoaiBH=@MaLoaiBH,MaLoaiKham=@MaLoaiKham,MaGioiTinh=@MaGioiTinh where MaBN=@MaBN
IF @@ERROR=0
SET @KetQua=N'Lưu bệnh nhân thành công'
END
SELECT @KetQua AS ThongBao
End

GO
/****** Object:  StoredProcedure [dbo].[sp_CanBo_insert]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_CanBo_insert]
@MaCB char(20),
@MaKhoa char(10),
@MaHocVi char(10),
@MaHocHam char(10),
@TenCB nvarchar (30),
@DienThoai char (15),
@Email char (30),
@NgaySinh date,
@MaGioiTinh char(10),
@SoCMND int,
@TenTaiKhoan char(30),
@MatKhau char(30),
@MaQuyen char(10),
@KetQua nvarchar(100) output
AS
Begin

declare @CountTaiKhoan int
SELECT @CountTaiKhoan=count(*) FROM CanBo WHERE TenTaiKhoan=@TenTaiKhoan
IF @CountTaiKhoan>0
SET @KetQua=N'Tên tài khoản bị trùng'

declare @CountCMND int
SELECT @CountCMND=count(*) FROM CanBo WHERE SoCMND=@SoCMND
IF @CountCMND>0
SET @KetQua=N'Số chứng minh bị trùng'

declare @CountMaCB int
SELECT @CountMaCB=count(*) FROM CanBo WHERE MaCB=@MaCB
IF @CountMaCB>0
SET @KetQua=N'Mã cán bộ đã được sử dụng' 


declare @CountEmail int
SELECT @CountEmail=count(*) FROM CanBo WHERE Email=@Email
IF @CountEmail>0
SET @KetQua=N'Email đã được sử dụng' 

declare @CountSDT int
SELECT @CountSDT=count(*) FROM CanBo WHERE DienThoai=@DienThoai
IF @CountSDT>0
SET @KetQua=N'Số điện thoại đã được sử dụng'

IF @TenCB is null
SET @KetQua=N'Tên cán bộ không được để trống'
IF @DienThoai is null
SET @KetQua=N'Số điện thoại cán bộ không được để trống'
IF @SoCMND is null
SET @KetQua=N'Số chứng minh thư không được để trống'
IF @MaCB is null
SET @KetQua=N'Mã cán bộ không được để trống'

IF @CountMaCB=0 and @CountTaiKhoan=0 and @CountCMND=0 and @CountEmail=0 and @CountSDT=0 and @TenCB is not null and @DienThoai is not null
and @SoCMND is not null and @MaCB is not null
begin
insert into CanBo(MaCB,MaKhoa,MaHocVi,MaHocHam,TenCB,DienThoai,Email,NgaySinh,MaGioiTinh,SoCMND,TenTaiKhoan,MatKhau,MaQuyen) values 
(@MaCB,
@MaKhoa ,
@MaHocVi ,
@MaHocHam ,
@TenCB ,
@DienThoai ,
@Email ,
@NgaySinh ,
@MaGioiTinh ,
@SoCMND,
@TenTaiKhoan ,
@MatKhau ,
@MaQuyen  )
IF @@ERROR=0
SET @KetQua=N'Bạn đã đăng ký thành công ...'
END


SELECT @KetQua AS ThongBao

END




GO
/****** Object:  StoredProcedure [dbo].[sp_CanBo_select_cmnd]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_CanBo_select_cmnd]
@SoCMND int
as

begin
	select CanBo.MaCB, TenCB, NgaySinh, DienThoai, SoCMND, Email, CanBo.MaQuyen
	, LoaiGioiTinh, TenTaiKhoan, TenQuyen, MatKhau, TenHocHam, TenHocVi, TenKhoa
from CanBo, GioiTinh, Quyen, HocHam, HocVi, Khoa
where CanBo.MaQuyen=Quyen.MaQuyen
and CanBo.MaGioiTinh=GioiTinh.MaGioiTinh
and CanBo.MaHocHam=HocHam.MaHocHam
and CanBo.MaHocVi=HocVi.MaHocVi
and CanBo.MaKhoa=Khoa.MaKhoa
and SoCMND=@SoCMND
end

GO
/****** Object:  StoredProcedure [dbo].[sp_CanBo_select_dienthoai]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_CanBo_select_dienthoai]
@DienThoai char(15)
as

begin
	select CanBo.MaCB, TenCB, NgaySinh, DienThoai, SoCMND, Email, CanBo.MaQuyen
	, LoaiGioiTinh, TenTaiKhoan, TenQuyen, MatKhau, TenHocHam, TenHocVi, TenKhoa
from CanBo, GioiTinh, Quyen, HocHam, HocVi, Khoa
where CanBo.MaQuyen=Quyen.MaQuyen
and CanBo.MaGioiTinh=GioiTinh.MaGioiTinh
and CanBo.MaHocHam=HocHam.MaHocHam
and CanBo.MaHocVi=HocVi.MaHocVi
and CanBo.MaKhoa=Khoa.MaKhoa
and DienThoai=@DienThoai
end


GO
/****** Object:  StoredProcedure [dbo].[sp_CanBo_select_hoten]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_CanBo_select_hoten]
@TenCB nvarchar(30)
as

begin
	select CanBo.MaCB, TenCB, NgaySinh, DienThoai, SoCMND, Email, CanBo.MaQuyen
	, LoaiGioiTinh, TenTaiKhoan, TenQuyen, MatKhau, TenHocHam, TenHocVi, TenKhoa
from CanBo, GioiTinh, Quyen, HocHam, HocVi, Khoa
where CanBo.MaQuyen=Quyen.MaQuyen
and CanBo.MaGioiTinh=GioiTinh.MaGioiTinh
and CanBo.MaHocHam=HocHam.MaHocHam
and CanBo.MaHocVi=HocVi.MaHocVi
and CanBo.MaKhoa=Khoa.MaKhoa
and FreeText(TenCB,@TenCB)
end


GO
/****** Object:  StoredProcedure [dbo].[sp_CanBo_update]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_CanBo_update]
@MaCB char(20),
@MaKhoa char(10),
@MaHocVi char(10),
@MaHocHam char(10),
@TenCB nvarchar (30),
@DienThoai char (15),
@Email char (30),
@NgaySinh date,
@MaGioiTinh char(10),
@SoCMND int,
@TenTaiKhoan char(30),
@MatKhau char(30),
@MaQuyen char(10),
@KetQua nvarchar(100) output
as
begin
declare @CountTaiKhoan int
SELECT @CountTaiKhoan=count(*) FROM CanBo WHERE TenTaiKhoan=@TenTaiKhoan and TenTaiKhoan not in (select TenTaiKhoan from CanBo where MaCB=@MaCB)
IF @CountTaiKhoan>0
SET @KetQua=N'Tên tài khoản bị trùng'

declare @CountCMND int
SELECT @CountCMND=count(*) FROM CanBo WHERE SoCMND=@SoCMND and SoCMND not in (select SoCMND from CanBo where MaCB=@MaCB)
IF @CountCMND>0
SET @KetQua=N'Số chứng minh bị trùng'



declare @CountEmail int
SELECT @CountEmail=count(*) FROM CanBo WHERE Email=@Email and Email not in (select Email from CanBo where MaCB=@MaCB)
IF @CountEmail>0
SET @KetQua=N'Email đã được sử dụng' 

declare @CountSDT int
SELECT @CountSDT=count(*) FROM CanBo WHERE DienThoai=@DienThoai and DienThoai not in (select DienThoai from CanBo where MaCB=@MaCB)
IF @CountSDT>0
SET @KetQua=N'Số điện thoại đã được sử dụng'

IF @TenCB is null
SET @KetQua=N'Tên cán bộ không được để trống'
IF @DienThoai is null
SET @KetQua=N'Số điện thoại cán bộ không được để trống'
IF @SoCMND is null
SET @KetQua=N'Số chứng minh thư không được để trống'
IF @MaCB is null
SET @KetQua=N'Mã cán bộ không được để trống'

IF @CountTaiKhoan=0 and @CountCMND=0 and @CountEmail=0 and @CountSDT=0 and @TenCB is not null and @DienThoai is not null
and @SoCMND is not null and @MaCB is not null
begin	
update CanBo set MaKhoa= @MaKhoa,
MaHocVi= @MaHocVi,
MaHocHam=@MaHocHam,
TenCB= @TenCB,
DienThoai= @DienThoai,
Email= @Email,
NgaySinh=@NgaySinh,
MaGioiTinh= @MaGioiTinh,
SoCMND=@SoCMND ,
TenTaiKhoan= @TenTaiKhoan,
MatKhau= @MatKhau,
MaQuyen= @MaQuyen where MaCB=@MaCB
IF @@ERROR=0
SET @KetQua=N'Lưu cán bộ thành công'
end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietBenhNhan_insert]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ChiTietBenhNhan_insert]
@MaHSBN int,
@MaPhong char(10)
as
begin
declare @TenPhong nvarchar(30)
SELECT @TenPhong= (select TenPhong from Phong where MaPhong=@MaPhong)

insert into ChiTietBenhNhanKham(MaHSBN,MaPhong,ThoiGianKham,TenPhong) values(@MaHSBN,@MaPhong,GETDATE(),@TenPhong)
update Phong set ThoiGianKham=GETDATE() where MaPhong=@MaPhong
update Phong set SoLuongCho=SoLuongCho-1 where MaPhong=@MaPhong
update HoSoBenhNhan set TrangThai=2 where MaHSBN=@MaHSBN
end

GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietBenhNhan_insertXN]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ChiTietBenhNhan_insertXN]
@MaHSBN int,
@MaPhong char(10)
as
begin
declare @TenPhong nvarchar(30)
SELECT @TenPhong= (select TenPhong from Phong where MaPhong=@MaPhong)
insert into ChiTietBenhNhanKham(MaHSBN,MaPhong,ThoiGianKham,TenPhong) values(@MaHSBN,@MaPhong,GETDATE(),@TenPhong)
update Phong set ThoiGianKham=GETDATE() where MaPhong=@MaPhong
--update Phong set SoLuongCho=SoLuongCho-1 where MaPhong=@MaPhong
update HoSoBenhNhan set TrangThai=5 where MaHSBN=@MaHSBN
end

GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietDonThuoc_delete]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ChiTietDonThuoc_delete]
@MaHSBN int,
@MaThuoc char(10)
as
begin
delete ChiTietDonThuoc where MaThuoc=@MaThuoc and MaHSBN=@MaHSBN
end


GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietDonThuoc_insert]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ChiTietDonThuoc_insert]
@MaCB char(20),
@MaHSBN int,
@MaThuoc char(10),
@SoLuong nvarchar(20)
as
begin
declare @MaDonThuoc int
SELECT @MaDonThuoc=( select MaDonThuoc from DonThuoc where MaCB=@MaCB and MaHSBN=@MaHSBN)

declare @CachSuDung nvarchar(200)
Select @CachSuDung =(select CachSuDung from Thuoc where MaThuoc=@MaThuoc)

insert into ChiTietDonThuoc(MaDonThuoc,MaThuoc,SoLuong,CachSuDung,MaHSBN) values (@MaDonThuoc,@MaThuoc,@SoLuong,@CachSuDung,@MaHSBN)
 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietPhieuThu_delete]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ChiTietPhieuThu_delete]
@MaHSBN int

as
begin
delete ChiTietPhieuThu where MaHSBN=@MaHSBN 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietPhieuThu_insert]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ChiTietPhieuThu_insert]
@MaHSBN int,
@MaDichVu char(10)
AS
Begin
declare @MaPhieuThu int
SELECT @MaPhieuThu= (select MaPhieuThu from PhieuThu where MaHSBN=@MaHSBN)

declare @DonGia char(50)
select @DonGia = (select DonGia from DichVu where MaDichVu=@MaDichVu)

insert into ChiTietPhieuThu(MaPhieuThu,MaDichVu,DonGia,MaHSBN) values (@MaPhieuThu,@MaDichVu,@DonGia,@MaHSBN)
update HoSoBenhNhan set ThoiGianKham= GETDATE() where MaHSBN=@MaHSBN
end


GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietPhieuThu_select]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ChiTietPhieuThu_select]
@MaHSBN int
as
begin
select ChiTietPhieuThu.MaDichVu, TenDichVu, ChiTietPhieuThu.DonGia  from ChiTietPhieuThu,DichVu where MaHSBN=@MaHSBN and DichVu.MaDichVu=ChiTietPhieuThu.MaDichVu
end

GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietPhieuThu_update_URL]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ChiTietPhieuThu_update_URL]
@MaDichVu char(10),
@MaHSBN int,
@URL varchar(200)
as
begin
update ChiTietPhieuThu set URL=@URL where MaHSBN=@MaHSBN and MaDichVu=@MaDichVu
end


GO
/****** Object:  StoredProcedure [dbo].[sp_DichVu_selecthoadon]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DichVu_selecthoadon]
@MaHSBN int,
@MaNV char(20)
as

begin
	select TenBN, PhieuThu.MaPhieuThu, DichVu.TenDichVu, Convert(money, REPLACE(DichVu.DonGia, ',', '.')) as DonGia
		,Convert(money, REPLACE(PhieuThu.TongTien, ',', '.')) as TongTien, TenNV, LoaiGioiTinh, IDENTITY(INT,1,1) AS STT
		, BenhNhan.NgaySinh, QuanHuyen.TenQuanHuyen, TenTinhThanh, BenhNhan.DienThoai, Convert(money, REPLACE(PhieuThu.TamThu, ',', '.')) as TamThu
into #tabletemp
from BenhNhan, HoSoBenhNhan, PhieuThu, ChiTietPhieuThu, DichVu
		, QuanHuyen, TinhThanh, NhanVienHC, GioiTinh
where BenhNhan.MaBN=HoSoBenhNhan.MaBN and BenhNhan.MaTinhThanh=TinhThanh.MaTinhThanh
and BenhNhan.MaQuanHuyen=QuanHuyen.MaQuanHuyen and DichVu.MaDichVu=ChiTietPhieuThu.MaDichVu
and PhieuThu.MaPhieuThu=ChiTietPhieuThu.MaPhieuThu
and HoSoBenhNhan.MaHSBN=ChiTietPhieuThu.MaHSBN and PhieuThu.MaHSBN=HoSoBenhNhan.MaHSBN
and BenhNhan.MaGioiTinh=GioiTinh.MaGioiTinh and NhanVienHC.MaNV=PhieuThu.MaNV 
and HoSoBenhNhan.MaHSBN=@MaHSBN and PhieuThu.MaNV=@MaNV
select * from #tabletemp


end


GO
/****** Object:  StoredProcedure [dbo].[sp_DonThuoc_insert]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DonThuoc_insert]
@MaCB char(20),
@MaHSBN int
as
begin
insert into DonThuoc(MaCB,MaHSBN,NgayLapDonThuoc) values (@MaCB,@MaHSBN,GETDATE())
end

GO
/****** Object:  StoredProcedure [dbo].[sp_DonThuoc_insertKT]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DonThuoc_insertKT]
@MaHSBN int,
@KetQua nvarchar(100) output
AS
Begin

declare @CountDonThuoc int
SELECT @CountDonThuoc=count(*) FROM DonThuoc WHERE MaHSBN=@MaHSBN
IF @CountDonThuoc>0
SET @KetQua=N'error'

IF @CountDonThuoc=0
SET @KetQua=N'nothing'

IF @CountDonThuoc<0
SET @KetQua=N'nothing1'
SELECT @KetQua AS ThongBao

END


GO
/****** Object:  StoredProcedure [dbo].[sp_DonThuoc_kedon]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DonThuoc_kedon]
@MaHSBN int
as
begin
select  DonThuoc.MaDonThuoc, Thuoc.TenThuoc, ChiTietDonThuoc.SoLuong, ChiTietDonThuoc.CachSuDung, BenhNhan.NgaySinh
		, LoaiThuoc.TenLoaiThuoc, TenBN, TenCB,CONVERT(int,ROW_NUMBER() over (order by DonThuoc.MaDonThuoc)) as STT
		, DonThuoc.GhiChu as GhiChuBS, DonThuoc.CachSuDung as CachSuDungBS
from Thuoc, ChiTietDonThuoc, LoaiThuoc, BenhNhan, DonThuoc, HoSoBenhNhan, CanBo
where Thuoc.MaLoaiThuoc=LoaiThuoc.MaLoaiThuoc and Thuoc.MaThuoc=ChiTietDonThuoc.MaThuoc
and DonThuoc.MaDonThuoc=ChiTietDonThuoc.MaDonThuoc 
and DonThuoc.MaHSBN=HoSoBenhNhan.MaHSBN and ChiTietDonThuoc.MaHSBN=HoSoBenhNhan.MaHSBN
and BenhNhan.MaBN=HoSoBenhNhan.MaBN and DonThuoc.MaCB=CanBo.MaCB
and DonThuoc.MaHSBN=@MaHSBN
end

GO
/****** Object:  StoredProcedure [dbo].[sp_DonThuoc_update]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DonThuoc_update]
@CachSuDung nvarchar(200),
@GhiChu nvarchar (300),
@MaCB char(20),
@MaHSBN int
as
begin
declare @MaDonThuoc int
SELECT @MaDonThuoc=( select MaDonThuoc from DonThuoc where MaCB=@MaCB and MaHSBN=@MaHSBN)
update DonThuoc set GhiChu=@GhiChu,CachSuDung=@CachSuDung where MaDonThuoc=@MaDonThuoc
update HoSoBenhNhan set TrangThai=5 where MaHSBN=@MaHSBN
end


GO
/****** Object:  StoredProcedure [dbo].[sp_HoSoBenhNhan_select]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_HoSoBenhNhan_select]
@MaHSBN int
as
begin
select * from HoSoBenhNhan,BenhNhan where MaHSBN=@MaHSBN and HoSoBenhNhan.MaBN= BenhNhan.MaBN
end


GO
/****** Object:  StoredProcedure [dbo].[sp_HoSoBenhNhan_select_order]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_HoSoBenhNhan_select_order]
@MaBN char(20)
as
begin
select MaHSBN,TenBN,NgayKham from HoSoBenhNhan,BenhNhan where HoSoBenhNhan.MaBN=@MaBN
and HoSoBenhNhan.MaBN=BenhNhan.MaBN 
order by NgayKham desc
end

GO
/****** Object:  StoredProcedure [dbo].[sp_HoSoBenhNhan_update]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_HoSoBenhNhan_update]

@MaHSBN int,
@TieuHoa nvarchar(100),
@ThanTietNieu nvarchar(100),
@CoXuongKhop nvarchar(100),
@TamThan nvarchar(100),
@TuanHoan nvarchar(100),
@ThanKinh nvarchar(100),
@NgoaiKhoa nvarchar(100),
@HamTren nvarchar(100),
@HamDuoi nvarchar(100),
@BenhRangHamMat nvarchar(100),
@TaiTraiNoiThuong nvarchar(100),
@TaiPhaiNoiThuong nvarchar(100),
@TaiTraiNoiTham nvarchar(100),
@TaiPhaiNoiTham nvarchar(100),
@BenhTaiMuiHong nvarchar(100),
@MatTraiKhongKinh nvarchar(100),
@MatPhaiKhongKinh nvarchar(100),
@MatTraiCoKinh nvarchar(100),
@MatPhaiCoKinh nvarchar(100),
@BenhMat nvarchar(100),
@SanPhuKhoa nvarchar(100),
@GhiChu nvarchar(200),
@XetNghiemHuyetHoc nvarchar(100),
@XetNghiemNuocTieu nvarchar(100),
@XetNghiemSinhHoa nvarchar(100),
@XetNghiemTeBao nvarchar(100),
@NhipTim nvarchar(100),
@HuyetAp nvarchar(100),
@ChieuCao nvarchar(100),
@CanNang nvarchar(100),


@KetQua nvarchar(100) output
AS
BEGIN
Update HoSoBenhNhan Set TieuHoa=@TieuHoa,ThanTietNieu=@ThanTietNieu,CoXuongKhop=@CoXuongKhop,TamThan=@TamThan,TuanHoan=@TuanHoan,ThanKinh=@ThanKinh,NgoaiKhoa=@NgoaiKhoa,
HamTren=@HamTren,HamDuoi=@HamDuoi,BenhRangHamMat=@BenhRangHamMat,TaiTraiNoiThuong=@TaiTraiNoiThuong,TaiPhaiNoiThuong=@TaiPhaiNoiThuong,
TaiTraiNoiTham=@TaiTraiNoiTham,TaiPhaiNoiTham=@TaiPhaiNoiTham,BenhTaiMuiHong=@BenhTaiMuiHong,MatTraiKhongKinh=@MatTraiKhongKinh,MatPhaiKhongKinh=@MatPhaiKhongKinh,
MatTraiCoKinh=@MatTraiCoKinh,MatPhaiCoKinh=@MatPhaiCoKinh,BenhMat=@BenhMat,SanPhuKhoa=@SanPhuKhoa,GhiChu=@GhiChu,XetNghiemHuyetHoc=@XetNghiemHuyetHoc,XetNghiemNuocTieu=@XetNghiemNuocTieu,
XetNghiemSinhHoa=@XetNghiemSinhHoa,XetNghiemTeBao=@XetNghiemTeBao,NhipTim=@NhipTim,HuyetAp=@HuyetAp,ChieuCao=@ChieuCao,CanNang=@CanNang where MaHSBN=@MaHSBN
IF @@ERROR=0
SET @KetQua=N'Lưu bệnh nhân mới thành công'
End

GO
/****** Object:  StoredProcedure [dbo].[sp_HoSoBenhNhan_update_botrangthai]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_HoSoBenhNhan_update_botrangthai]
@MaHSBN int
as
begin
update HoSoBenhNhan set TrangThai=null where MaHSBN=@MaHSBN
end


GO
/****** Object:  StoredProcedure [dbo].[sp_HoSoBenhNhan_update_botrangthaiXN]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_HoSoBenhNhan_update_botrangthaiXN]
@MaHSBN int
as
begin
update HoSoBenhNhan set TrangThai=2 where MaHSBN=@MaHSBN
end

GO
/****** Object:  StoredProcedure [dbo].[sp_HoSoBenhNhan_update_trangthai]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_HoSoBenhNhan_update_trangthai]
@MaHSBN int
as
begin
update HoSoBenhNhan set TrangThai=1 where MaHSBN=@MaHSBN
end

GO
/****** Object:  StoredProcedure [dbo].[sp_HoSoBenhNhan_update_trangthaiXN]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_HoSoBenhNhan_update_trangthaiXN]
@MaHSBN int
as
begin
update HoSoBenhNhan set TrangThai=3 where MaHSBN=@MaHSBN
end

GO
/****** Object:  StoredProcedure [dbo].[sp_NhanVien_insert]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_NhanVien_insert]
@MaNV char(20),
@TenNV nvarchar(30),
@DienThoai char(15),
@Email char(30),
@NgaySinh date,
@MaGioiTinh char(10),
@SoCMND int,
@TenTaiKhoan char(30),
@MatKhau char(30),
@MaQuyen char(10),
@KetQua nvarchar(100) output
AS
Begin

declare @CountTaiKhoan int
SELECT @CountTaiKhoan=count(*) FROM NhanVienHC WHERE TenTaiKhoan=@TenTaiKhoan
IF @CountTaiKhoan>0
SET @KetQua=N'Tên tài khoản bị trùng'

declare @CountCMND int
SELECT @CountCMND=count(*) FROM NhanVienHC WHERE SoCMND=@SoCMND
IF @CountCMND>0
SET @KetQua=N'Số chứng minh thư bị trùng'

declare @CountMaNV int
SELECT @CountMaNV=count(*) FROM NhanVienHC WHERE MaNV=@MaNV
IF @CountMaNV>0
SET @KetQua=N'Mã nhân viên bị trùng'

declare @CountEmail int
SELECT @CountEmail=count(*) FROM NhanVienHC WHERE Email=@Email
IF @CountEmail>0
SET @KetQua=N'Email đã được sử dụng' 

declare @CountSDT int
SELECT @CountSDT=count(*) FROM NhanVienHC WHERE DienThoai=@DienThoai
IF @CountSDT>0
SET @KetQua=N'Số điện thoại đã được sử dụng'

IF @TenNV is null
SET @KetQua=N'Tên cán bộ không được để trống'
IF @DienThoai is null
SET @KetQua=N'Số điện thoại cán bộ không được để trống'
IF @SoCMND is null
SET @KetQua=N'Số chứng minh thư không được để trống'
IF @MaNV is null
SET @KetQua=N'Mã nhân viên không được để trống'

IF @CountTaiKhoan=0 and @CountCMND=0 and @CountEmail=0 and @CountSDT=0 and @TenNV is not null and @DienThoai is not null
and @SoCMND is not null and @MaNV is not null and @CountMaNV=0
begin
insert into NhanVienHC(MaNV,TenNV,DienThoai,Email,NgaySinh,MaGioiTinh,SoCMND,TenTaiKhoan,MatKhau,MaQuyen) values 
(@MaNV,
@TenNV ,
@DienThoai ,
@Email ,
@NgaySinh ,
@MaGioiTinh ,
@SoCMND ,
@TenTaiKhoan ,
@MatKhau ,
@MaQuyen  )
IF @@ERROR=0
SET @KetQua=N'Bạn đã đăng ký thành công ...'
END


SELECT @KetQua AS ThongBao

END




GO
/****** Object:  StoredProcedure [dbo].[sp_NhanVien_select_cmnd]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_NhanVien_select_cmnd]
@SoCMND int
as

begin
	select NhanVienHC.MaNV, TenNV, NgaySinh, DienThoai, SoCMND, Email, NhanVienHC.MaQuyen
	, LoaiGioiTinh, TenTaiKhoan, TenQuyen, MatKhau
from NhanVienHC, GioiTinh, Quyen
where NhanVienHC.MaQuyen=Quyen.MaQuyen
and NhanVienHC.MaGioiTinh=GioiTinh.MaGioiTinh
and SoCMND=@SoCMND
end


GO
/****** Object:  StoredProcedure [dbo].[sp_NhanVien_select_dienthoai]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_NhanVien_select_dienthoai]
@DienThoai char(15)
as

begin
	select NhanVienHC.MaNV, TenNV, NgaySinh, DienThoai, SoCMND, Email, NhanVienHC.MaQuyen
	, LoaiGioiTinh, TenTaiKhoan, TenQuyen, MatKhau
from NhanVienHC, GioiTinh, Quyen
where NhanVienHC.MaQuyen=Quyen.MaQuyen
and NhanVienHC.MaGioiTinh=GioiTinh.MaGioiTinh
and DienThoai=@DienThoai
end

GO
/****** Object:  StoredProcedure [dbo].[sp_NhanVien_select_hoten]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_NhanVien_select_hoten]
@TenNV nvarchar(30)
as

begin
	select NhanVienHC.MaNV, TenNV, NgaySinh, DienThoai, SoCMND, Email, NhanVienHC.MaQuyen
	, LoaiGioiTinh, TenTaiKhoan, TenQuyen, MatKhau
from NhanVienHC, GioiTinh, Quyen
where NhanVienHC.MaQuyen=Quyen.MaQuyen
and NhanVienHC.MaGioiTinh=GioiTinh.MaGioiTinh
and FreeText(TenNV,@TenNV)
end


GO
/****** Object:  StoredProcedure [dbo].[sp_NhanVien_update]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_NhanVien_update]
@MaNV char(20),
@TenNV nvarchar(30),
@DienThoai char(15),
@Email char(30),
@NgaySinh date,
@MaGioiTinh char(10),
@SoCMND int,
@TenTaiKhoan char(30),
@MatKhau char(30),
@MaQuyen char(10),
@KetQua nvarchar(100) output
AS
Begin

declare @CountTaiKhoan int
SELECT @CountTaiKhoan=count(*) FROM NhanVienHC WHERE TenTaiKhoan=@TenTaiKhoan and TenTaiKhoan not in (select TenTaiKhoan from NhanVienHC where MaNV=@MaNV)
IF @CountTaiKhoan>0
SET @KetQua=N'Tên tài khoản bị trùng'

declare @CountCMND int
SELECT @CountCMND=count(*) FROM NhanVienHC WHERE SoCMND=@SoCMND and SoCMND not in (select SoCMND from NhanVienHC where MaNV=@MaNV)
IF @CountCMND>0
SET @KetQua=N'Số chứng minh thư bị trùng'



declare @CountEmail int
SELECT @CountEmail=count(*) FROM NhanVienHC WHERE Email=@Email and Email not in (select Email from NhanVienHC where MaNV=@MaNV)
IF @CountEmail>0
SET @KetQua=N'Email đã được sử dụng' 

declare @CountSDT int
SELECT @CountSDT=count(*) FROM NhanVienHC WHERE DienThoai=@DienThoai and DienThoai not in (select DienThoai from NhanVienHC where MaNV=@MaNV)
IF @CountSDT>0
SET @KetQua=N'Số điện thoại đã được sử dụng'

IF @TenNV is null
SET @KetQua=N'Tên cán bộ không được để trống'
IF @DienThoai is null
SET @KetQua=N'Số điện thoại cán bộ không được để trống'
IF @SoCMND is null
SET @KetQua=N'Số chứng minh thư không được để trống'
IF @MaNV is null
SET @KetQua=N'Mã nhân viên không được để trống'

IF @CountTaiKhoan=0 and @CountCMND=0 and @CountEmail=0 and @CountSDT=0 and @TenNV is not null and @DienThoai is not null
and @SoCMND is not null and @MaNV is not null 
begin
update NhanVienHC set TenNV=@TenNV,DienThoai=@DienThoai,Email=@Email,NgaySinh=@NgaySinh,
MaGioiTinh=@MaGioiTinh,SoCMND=@SoCMND,TenTaiKhoan=@TenTaiKhoan,MatKhau=@MatKhau,MaQuyen=@MaQuyen 
where MaNV=@MaNV
IF @@ERROR=0
SET @KetQua=N'Lưu nhân viên thành công ...'
END




END

GO
/****** Object:  StoredProcedure [dbo].[sp_PhieuThu_insert]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PhieuThu_insert]
@MaBN char(20),
@MaLoaiPhieuThu char(10),
@GhiChu nvarchar(200),
@TongTien char(50),
@HopLe bit,
@MaNV char(20),
@TamThu char(50),
@KetQua nvarchar(100) output
AS
Begin

declare @CountHSBN int
SELECT @CountHSBN=count(*) FROM HoSoBenhNhan WHERE MaBN=@MaBN and MaPhong is null
IF @CountHSBN>0
SET @KetQua=N'Hồ sơ bệnh nhân vừa được tạo'

declare @CountPhieuThu int
SELECT @CountPhieuThu=count(*) FROM HoSoBenhNhan,PhieuThu WHERE HoSoBenhNhan.MaHSBN=PhieuThu.MaHSBN and HoSoBenhNhan.MaBN=@MaBN and HopLe ='False' and MaPhong is not null
IF @CountPhieuThu>0
SET @KetQua=N'Hồ sơ bệnh nhân đang ở trong phòng khám'


IF @CountHSBN=0 and @CountPhieuThu=0
begin
insert into PhieuThu(MaBN,MaLoaiPhieuThu,GhiChu,TongTien,ThoiGianLapPhieu,HopLe,MaNV,TamThu)
values
(
@MaBN,
@MaLoaiPhieuThu ,
@GhiChu ,
@TongTien,
GETDATE() ,
@HopLe,
@MaNV,
@TamThu
)
IF @@ERROR=0
SET @KetQua=N'Tạo hồ sơ bệnh nhân mới thành công'
end
END








GO
/****** Object:  StoredProcedure [dbo].[sp_PhieuThu_update_hople]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_PhieuThu_update_hople]
@MaHSBN int
as
begin
update PhieuThu set HopLe=1 where MaHSBN=@MaHSBN
end

GO
/****** Object:  StoredProcedure [dbo].[sp_PhieuThu_Update_TongTien]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PhieuThu_Update_TongTien]
@MaHSBN int,
@TongTien char(50)
as
begin
update PhieuThu set TongTien =convert(int,TongTien)+convert(int,@TongTien)where MaHSBN=@MaHSBN
end

GO
/****** Object:  StoredProcedure [dbo].[sp_Phong_select]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Phong_select]
as
begin
select distinct TenPhong from Phong
end

GO
/****** Object:  StoredProcedure [dbo].[sp_Phong_update_cho]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Phong_update_cho]
@TenPhong nvarchar(30),
@MaHSBN int,
@KetQua nvarchar(100) output
as
begin
declare @Countsoluong int
SELECT @Countsoluong=COUNT(MaPhong) from Phong 
where SoLuongCho=(select SoLuongCho from Phong 
                  where SoLuongCho= 
                 (select MIN(soluongcho) from Phong where TenPhong=@TenPhong)
                  and TenPhong=@TenPhong
                  group by SoLuongCho)
and TenPhong=@TenPhong

IF @Countsoluong=1
begin
SET @KetQua=N'Bệnh nhân được thêm vào phòng '+@TenPhong +N' Số: '+(select SoPhong from Phong where TenPhong=@TenPhong
and SoLuongCho = (select MIN(soluongcho) from Phong where TenPhong=@TenPhong))

update HoSoBenhNhan set MaPhong=(select MaPhong from Phong where TenPhong=@TenPhong
and SoLuongCho = (select MIN(soluongcho) from Phong where TenPhong=@TenPhong)) where MaHSBN=@MaHSBN
update HoSoBenhNhan set ThoiGianKham=GETDATE() where MaHSBN=@MaHSBN

update Phong set SoLuongCho=SoLuongCho+1 where TenPhong=@TenPhong
and SoLuongCho = (select MIN(soluongcho) from Phong where TenPhong=@TenPhong)
end



IF @Countsoluong>1
begin
SET @KetQua=N'Bệnh nhân được thêm vào phòng '+@TenPhong +N' Số: '+ (select SoPhong from Phong where TenPhong=@TenPhong
and SoLuongCho = (select MIN(soluongcho) from Phong where TenPhong=@TenPhong)
and ThoiGianKham=(select MIN(ThoiGianKham) from Phong where TenPhong=@TenPhong
                                                       and SoLuongCho=(select MIN(soluongcho) 
                                                           from Phong 
                                                            where TenPhong=@TenPhong)))
update HoSoBenhNhan set MaPhong=
(select MaPhong from Phong where TenPhong=@TenPhong
and SoLuongCho = (select MIN(soluongcho) from Phong where TenPhong=@TenPhong)
and ThoiGianKham=(select MIN(ThoiGianKham) from Phong where TenPhong=@TenPhong
                                                       and SoLuongCho=(select MIN(soluongcho) 
                                                           from Phong 
                                                            where TenPhong=@TenPhong)))
                                                            where MaHSBN=@MaHSBN                                                               
update Phong set SoLuongCho=SoLuongCho+1 where TenPhong=@TenPhong
and SoLuongCho = (select MIN(soluongcho) from Phong where TenPhong=@TenPhong)
and ThoiGianKham=(select MIN(ThoiGianKham) from Phong where TenPhong=@TenPhong
                                                       and SoLuongCho=(select MIN(soluongcho) 
                                                           from Phong 
                                                            where TenPhong=@TenPhong ))  
                                                                                                                    
update HoSoBenhNhan set ThoiGianKham=GETDATE() where MaHSBN=@MaHSBN
                                                                                                                                                                                  
end
SELECT @KetQua AS ThongBao
end

GO
/****** Object:  StoredProcedure [dbo].[sp_Phong_update_chuyenlaiphongkham]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Phong_update_chuyenlaiphongkham]
@MaHSBN int
as
begin
declare @DemURLnotNull int
select @DemURLnotNull=( select count(MaHSBN) from ChiTietPhieuThu where MaHSBN=@MaHSBN and URL is not null)

declare @DemDichVu int
select @DemDichVu =(select count(MaHSBN) from ChiTietPhieuThu where MaHSBN=@MaHSBN)

if @DemURLnotNull=@DemDichVu
begin
declare @MaPhong char(10)
SELECT @MaPhong=(select MaPhong from ChiTietBenhNhanKham where MaHSBN=@MaHSBN and TenPhong='Phòng khám' 
and ThoiGianKham=
              (select MAX(ThoiGianKham) from ChiTietBenhNhanKham where MaHSBN=@MaHSBN and TenPhong='Phòng khám') )
update HoSoBenhNhan set MaPhong=@MaPhong where MaHSBN=@MaHSBN

update Phong set SoLuongCho=SoLuongCho+1 where MaPhong=@MaPhong
update HoSoBenhNhan set TrangThai=4 where MaHSBN=@MaHSBN
update HoSoBenhNhan set ThoiGianKham= GETDATE() where MaHSBN=@MaHSBN
end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_Phong_update_giamsoluongcho]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Phong_update_giamsoluongcho]
@MaPhong char(10)
as
begin
update Phong set SoLuongCho=SoLuongCho-1 where MaPhong=@MaPhong
end


GO
/****** Object:  StoredProcedure [dbo].[sp_Phong_update_thoigian]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Phong_update_thoigian]
@MaPhong char(10)
as
begin
update Phong set ThoiGianKham=GETDATE() where MaPhong=@MaPhong
end


GO
/****** Object:  StoredProcedure [dbo].[sp_Thuoc_insert]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Thuoc_insert]
@MaThuoc char(10),
@MaLoaiThuoc char(10),
@TenThuoc nvarchar(50),
@GhiChu nvarchar(100),
@Gia char(50),
@CachSuDung nvarchar(200),
@KetQua nvarchar(200) output
as
begin
DECLARE @CountMaThuoc int

SELECT @CountMaThuoc=count(*) FROM Thuoc WHERE MaThuoc=@MaThuoc
IF @CountMaThuoc>0
SET @KetQua=N'Mã thuốc đã sử dụng'
IF @CountMaThuoc=0
begin
	insert into Thuoc values(@MaThuoc, @MaLoaiThuoc, @TenThuoc, @GhiChu, @Gia, @CachSuDung)
	IF @@ERROR=0
SET @KetQua=N'Thêm thuốc thành công'
end
	SELECT @KetQua AS ThongBao
end





GO
/****** Object:  StoredProcedure [dbo].[sp_Thuoc_select]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Thuoc_select]
as
begin
	select MaThuoc,TenLoaiThuoc, TenThuoc, Gia, GhiChu, CachSuDung from Thuoc, LoaiThuoc
	where Thuoc.MaLoaiThuoc=LoaiThuoc.MaLoaiThuoc

end




GO
/****** Object:  StoredProcedure [dbo].[sp_Thuoc_update]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Thuoc_update]
@MaThuoc char(10),
@MaLoaiThuoc char(10),
@TenThuoc nvarchar(50),
@GhiChu nvarchar(100),
@Gia char(50),
@CachSuDung nvarchar(200),
@KetQua nvarchar(200) output
as
begin

update Thuoc set MaLoaiThuoc=@MaLoaiThuoc,TenThuoc=@TenThuoc,GhiChu=@GhiChu,Gia=@Gia, CachSuDung=@CachSuDung where MaThuoc=@MaThuoc

	IF @@ERROR=0
SET @KetQua=N'Lưu thuốc thành công'

end


GO
/****** Object:  Table [dbo].[BenhNhan]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BenhNhan](
	[MaBN] [char](20) NOT NULL,
	[MaQuocGia] [char](10) NULL,
	[MaDanToc] [char](10) NULL,
	[MaTinhThanh] [char](10) NULL,
	[MaQuanHuyen] [char](10) NULL,
	[MaNgheNghiep] [char](10) NULL,
	[TenBN] [nvarchar](30) NOT NULL,
	[NgaySinh] [date] NULL,
	[NoiLamViec] [nvarchar](50) NULL,
	[DienThoai] [char](15) NULL,
	[Email] [char](25) NULL,
	[CMND] [char](10) NULL,
	[SoTheBHYT] [char](15) NULL,
	[GiaTriTu] [char](10) NULL,
	[DenNgay] [char](10) NULL,
	[NoiDKBHYT] [nvarchar](50) NULL,
	[Tuyen] [nvarchar](30) NULL,
	[MaDoiTuongBH] [char](10) NULL,
	[MaLoaiBH] [char](10) NULL,
	[MaLoaiKham] [char](10) NULL,
	[MaGioiTinh] [char](10) NULL,
 CONSTRAINT [PK_BenhNhan] PRIMARY KEY CLUSTERED 
(
	[MaBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CanBo]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CanBo](
	[MaCB] [char](20) NOT NULL,
	[MaKhoa] [char](10) NULL,
	[MaHocVi] [char](10) NULL,
	[MaHocHam] [char](10) NULL,
	[TenCB] [nvarchar](30) NOT NULL,
	[DienThoai] [char](15) NOT NULL,
	[Email] [char](30) NULL,
	[NgaySinh] [date] NULL,
	[MaGioiTinh] [char](10) NULL,
	[SoCMND] [int] NOT NULL,
	[TenTaiKhoan] [char](30) NULL,
	[MatKhau] [char](30) NULL,
	[MaQuyen] [char](10) NULL,
 CONSTRAINT [PK_CanBo] PRIMARY KEY CLUSTERED 
(
	[MaCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietBenhNhanKham]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietBenhNhanKham](
	[MaChiTietBNK] [int] IDENTITY(1,1) NOT NULL,
	[MaHSBN] [int] NOT NULL,
	[MaPhong] [char](10) NULL,
	[ThoiGianKham] [datetime] NULL,
	[TenPhong] [nvarchar](30) NULL,
 CONSTRAINT [PK_ChiTietBenhNhanKham] PRIMARY KEY CLUSTERED 
(
	[MaChiTietBNK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietCBP]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietCBP](
	[MaChiTietCBP] [int] IDENTITY(1,1) NOT NULL,
	[MaCB] [char](20) NULL,
	[MaPhong] [char](10) NULL,
	[ThoiGianDangNhap] [datetime] NULL,
	[ThoiGianDangXuat] [datetime] NULL,
 CONSTRAINT [PK_ChiTietCBP] PRIMARY KEY CLUSTERED 
(
	[MaChiTietCBP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietChucVuCB]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietChucVuCB](
	[MaChiTietChucVuCB] [int] IDENTITY(1,1) NOT NULL,
	[MaChucVuCB] [char](10) NOT NULL,
	[MaCB] [char](20) NOT NULL,
	[ThoiGian] [date] NULL,
	[GhiChu] [nvarchar](200) NULL,
 CONSTRAINT [PK_ChiTietChucVuCB] PRIMARY KEY CLUSTERED 
(
	[MaChiTietChucVuCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietChucVuNV]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietChucVuNV](
	[MaChiTietChucVuNV] [int] IDENTITY(1,1) NOT NULL,
	[MaChucVu] [char](10) NOT NULL,
	[MaNV] [char](20) NOT NULL,
	[ThoiGian] [date] NULL,
	[GhiChu] [nvarchar](200) NULL,
 CONSTRAINT [PK_ChiTietChucVuNV] PRIMARY KEY CLUSTERED 
(
	[MaChiTietChucVuNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietDonThuoc]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietDonThuoc](
	[MaChiTietDonThuoc] [int] IDENTITY(1,1) NOT NULL,
	[MaDonThuoc] [int] NULL,
	[MaThuoc] [char](10) NULL,
	[SoLuong] [nvarchar](20) NULL,
	[CachSuDung] [nvarchar](200) NULL,
	[MaHSBN] [int] NULL,
 CONSTRAINT [PK_ChiTietDonThuoc] PRIMARY KEY CLUSTERED 
(
	[MaChiTietDonThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietLoaiCanBo]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietLoaiCanBo](
	[MaChiTietLoaiCanBo] [int] IDENTITY(1,1) NOT NULL,
	[MaCB] [char](20) NOT NULL,
	[MaLoaiCB] [char](10) NOT NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[GhiChu] [nvarchar](200) NULL,
 CONSTRAINT [PK_ChiTietLoaiCanBo] PRIMARY KEY CLUSTERED 
(
	[MaChiTietLoaiCanBo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietLoaiNhanVien]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietLoaiNhanVien](
	[MaChiTietLoaiNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [char](20) NOT NULL,
	[MaLoaiNhanVien] [char](10) NOT NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[GhiChu] [nvarchar](200) NULL,
 CONSTRAINT [PK_ChiTietLoaiNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaChiTietLoaiNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietLuongCB]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietLuongCB](
	[MaChiTietLuongCB] [int] IDENTITY(1,1) NOT NULL,
	[MaCB] [char](20) NOT NULL,
	[MaHeSoLuong] [char](10) NOT NULL,
	[MaLuongCoBan] [char](10) NOT NULL,
	[NgayLinhLuong] [date] NULL,
	[TongTien] [char](50) NULL,
	[GhiChu] [nvarchar](200) NULL,
 CONSTRAINT [PK_ChiTietLuongCB] PRIMARY KEY CLUSTERED 
(
	[MaChiTietLuongCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietLuongNV]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietLuongNV](
	[MaChiTietLuongNV] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [char](20) NOT NULL,
	[MaHeSoLuong] [char](10) NOT NULL,
	[MaLuongCoBan] [char](10) NOT NULL,
	[NgayLinhLuong] [date] NULL,
	[TongTien] [char](50) NULL,
	[GhiChu] [nvarchar](200) NULL,
 CONSTRAINT [PK_ChiTietLuongNV] PRIMARY KEY CLUSTERED 
(
	[MaChiTietLuongNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietPhieuThu]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietPhieuThu](
	[MaChiTietPhieuThu] [int] IDENTITY(1,1) NOT NULL,
	[MaPhieuThu] [int] NULL,
	[MaDichVu] [char](10) NULL,
	[DonGia] [char](50) NULL,
	[MaHSBN] [int] NULL,
	[TrangThai] [int] NULL,
	[URL] [varchar](200) NULL,
 CONSTRAINT [PK_ChiTietPhieuThu] PRIMARY KEY CLUSTERED 
(
	[MaChiTietPhieuThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChucVuCB]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChucVuCB](
	[MaChucVuCB] [char](10) NOT NULL,
	[TenChucVu] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ChucVuCB] PRIMARY KEY CLUSTERED 
(
	[MaChucVuCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChucVuNV]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChucVuNV](
	[MaChucVuNV] [char](10) NOT NULL,
	[TenChucVuNV] [nvarchar](20) NULL,
 CONSTRAINT [PK_ChucVuNV] PRIMARY KEY CLUSTERED 
(
	[MaChucVuNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DanToc]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DanToc](
	[MaDanToc] [char](10) NOT NULL,
	[MaQuocGia] [char](10) NOT NULL,
	[TenDanToc] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_DanToc] PRIMARY KEY CLUSTERED 
(
	[MaDanToc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DangThuoc]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DangThuoc](
	[MaDangThuoc] [char](10) NOT NULL,
	[TenDangThuoc] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_DangThuoc] PRIMARY KEY CLUSTERED 
(
	[MaDangThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaDichVu] [char](10) NOT NULL,
	[TenDichVu] [nvarchar](50) NULL,
	[DonGia] [char](50) NULL,
	[MaLoaiDichVu] [char](10) NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DoiTuongBH]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DoiTuongBH](
	[MaDoiTuongBH] [char](10) NOT NULL,
	[TenDoiTuongBH] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_DoiTuongBH] PRIMARY KEY CLUSTERED 
(
	[MaDoiTuongBH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonThuoc]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonThuoc](
	[MaDonThuoc] [int] IDENTITY(1,1) NOT NULL,
	[MaCB] [char](20) NOT NULL,
	[MaHSBN] [int] NOT NULL,
	[NgayLapDonThuoc] [date] NULL,
	[CachSuDung] [nvarchar](200) NULL,
	[GhiChu] [nvarchar](300) NULL,
 CONSTRAINT [PK_DonThuoc] PRIMARY KEY CLUSTERED 
(
	[MaDonThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GioiTinh]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GioiTinh](
	[MaGioiTinh] [char](10) NOT NULL,
	[LoaiGioiTinh] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_GioiTinh] PRIMARY KEY CLUSTERED 
(
	[MaGioiTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HeSoLuong]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HeSoLuong](
	[MaHeSoLuong] [char](10) NOT NULL,
	[HeSoLuong] [char](10) NOT NULL,
 CONSTRAINT [PK_HeSoLuong] PRIMARY KEY CLUSTERED 
(
	[MaHeSoLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocHam]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocHam](
	[MaHocHam] [char](10) NOT NULL,
	[TenHocHam] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_HocHam] PRIMARY KEY CLUSTERED 
(
	[MaHocHam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocVi]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocVi](
	[MaHocVi] [char](10) NOT NULL,
	[TenHocVi] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_HocVi] PRIMARY KEY CLUSTERED 
(
	[MaHocVi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoSoBenhNhan]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoSoBenhNhan](
	[MaHSBN] [int] IDENTITY(1,1) NOT NULL,
	[MaBN] [char](20) NOT NULL,
	[TieuHoa] [nvarchar](100) NULL,
	[ThanTietNieu] [nvarchar](100) NULL,
	[CoXuongKhop] [nvarchar](100) NULL,
	[TamThan] [nvarchar](100) NULL,
	[TuanHoan] [nvarchar](100) NULL,
	[ThanKinh] [nvarchar](100) NULL,
	[NgoaiKhoa] [nvarchar](100) NULL,
	[HamTren] [nvarchar](100) NULL,
	[HamDuoi] [nvarchar](100) NULL,
	[BenhRangHamMat] [nvarchar](100) NULL,
	[TaiTraiNoiThuong] [nvarchar](100) NULL,
	[TaiPhaiNoiThuong] [nvarchar](100) NULL,
	[TaiTraiNoiTham] [nvarchar](100) NULL,
	[TaiPhaiNoiTham] [nvarchar](100) NULL,
	[BenhTaiMuiHong] [nvarchar](100) NULL,
	[MatTraiKhongKinh] [nvarchar](100) NULL,
	[MatPhaiKhongKinh] [nvarchar](100) NULL,
	[MatTraiCoKinh] [nvarchar](100) NULL,
	[MatPhaiCoKinh] [nvarchar](100) NULL,
	[BenhMat] [nvarchar](100) NULL,
	[SanPhuKhoa] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](200) NULL,
	[XetNghiemHuyetHoc] [nvarchar](100) NULL,
	[XetNghiemNuocTieu] [nvarchar](100) NULL,
	[XetNghiemSinhHoa] [nvarchar](100) NULL,
	[XetNghiemTeBao] [nvarchar](100) NULL,
	[NhipTim] [nvarchar](100) NULL,
	[HuyetAp] [nvarchar](100) NULL,
	[ChieuCao] [nvarchar](20) NULL,
	[CanNang] [nvarchar](20) NULL,
	[MaPhong] [char](10) NULL,
	[ThoiGianKham] [datetime] NULL,
	[STTKham] [int] NULL,
	[NgayKham] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_HoSoBenhNhan] PRIMARY KEY CLUSTERED 
(
	[MaHSBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [char](10) NOT NULL,
	[TenKhoa] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LichTruc]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LichTruc](
	[MaLichTruc] [int] IDENTITY(1,1) NOT NULL,
	[MaPhong] [char](10) NOT NULL,
	[MaNV] [char](20) NULL,
	[MaCB] [char](20) NULL,
	[BatDau] [datetime] NULL,
	[KetThuc] [datetime] NULL,
 CONSTRAINT [PK_LichTruc] PRIMARY KEY CLUSTERED 
(
	[MaLichTruc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiBaoHiem]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiBaoHiem](
	[MaLoaiBH] [char](10) NOT NULL,
	[TenLoaiBH] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_LoaiBaoHiem] PRIMARY KEY CLUSTERED 
(
	[MaLoaiBH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiCB]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiCB](
	[MaLoaiCB] [char](10) NOT NULL,
	[TenLoaiCB] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiCB] PRIMARY KEY CLUSTERED 
(
	[MaLoaiCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiDichVu]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiDichVu](
	[MaLoaiDichVu] [char](10) NOT NULL,
	[TenLoaiDichVu] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_LoaiDichVu] PRIMARY KEY CLUSTERED 
(
	[MaLoaiDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiKCB]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiKCB](
	[MaLoaiKham] [char](10) NOT NULL,
	[TenLoaiKham] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_LoaiKCB] PRIMARY KEY CLUSTERED 
(
	[MaLoaiKham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiNhanVien]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiNhanVien](
	[MaLoaiNhanVien] [char](10) NOT NULL,
	[TenLoaiNhanVien] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_LoaiNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaLoaiNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiPhieuThu]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiPhieuThu](
	[MaLoaiPhieuThu] [char](10) NOT NULL,
	[TenLoaiPhieuThu] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_LoaiPhieuThu] PRIMARY KEY CLUSTERED 
(
	[MaLoaiPhieuThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiThuoc]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiThuoc](
	[MaLoaiThuoc] [char](10) NOT NULL,
	[MaDangThuoc] [char](10) NOT NULL,
	[TenLoaiThuoc] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_LoaiThuoc] PRIMARY KEY CLUSTERED 
(
	[MaLoaiThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LuongCoBan]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LuongCoBan](
	[MaLuongCoBan] [char](10) NOT NULL,
	[SoTien] [char](20) NOT NULL,
 CONSTRAINT [PK_LuongCoBan] PRIMARY KEY CLUSTERED 
(
	[MaLuongCoBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NgheNghiep]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NgheNghiep](
	[MaNgheNghiep] [char](10) NOT NULL,
	[TenNgheNghiep] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_NgheNghiep] PRIMARY KEY CLUSTERED 
(
	[MaNgheNghiep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVienHC]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVienHC](
	[MaNV] [char](20) NOT NULL,
	[TenNV] [nvarchar](30) NOT NULL,
	[DienThoai] [char](15) NULL,
	[Email] [char](30) NULL,
	[NgaySinh] [date] NULL,
	[MaGioiTinh] [char](10) NULL,
	[SoCMND] [int] NULL,
	[TenTaiKhoan] [char](30) NULL,
	[MatKhau] [char](30) NULL,
	[MaQuyen] [char](10) NULL,
 CONSTRAINT [PK_NhanVienHC] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuThu]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuThu](
	[MaPhieuThu] [int] IDENTITY(1,1) NOT NULL,
	[MaBN] [char](20) NULL,
	[MaLoaiPhieuThu] [char](10) NULL,
	[GhiChu] [nvarchar](200) NULL,
	[TongTien] [char](50) NULL,
	[ThoiGianLapPhieu] [datetime] NULL,
	[HopLe] [bit] NULL,
	[MaNV] [char](20) NULL,
	[TamThu] [char](50) NULL,
	[MaHSBN] [int] NULL,
 CONSTRAINT [PK_PhieuThu] PRIMARY KEY CLUSTERED 
(
	[MaPhieuThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phong](
	[MaPhong] [char](10) NOT NULL,
	[TenPhong] [nvarchar](30) NULL,
	[SoPhong] [char](10) NULL,
	[SoLuongCho] [int] NULL,
	[ThoiGianKham] [datetime] NULL,
 CONSTRAINT [PK_PhongXetNghiem] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuanHuyen]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuanHuyen](
	[MaQuanHuyen] [char](10) NOT NULL,
	[MaTinhThanh] [char](10) NOT NULL,
	[TenQuanHuyen] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_QuanHuyen] PRIMARY KEY CLUSTERED 
(
	[MaQuanHuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuocGia]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuocGia](
	[MaQuocGia] [char](10) NOT NULL,
	[TenQuocGia] [nvarchar](20) NULL,
 CONSTRAINT [PK_QuocGia] PRIMARY KEY CLUSTERED 
(
	[MaQuocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [char](10) NOT NULL,
	[TenQuyen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TinhThanh]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TinhThanh](
	[MaTinhThanh] [char](10) NOT NULL,
	[MaQuocGia] [char](10) NOT NULL,
	[TenTinhThanh] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TinhThanh] PRIMARY KEY CLUSTERED 
(
	[MaTinhThanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Thuoc]    Script Date: 05/06/2015 8:12:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Thuoc](
	[MaThuoc] [char](10) NOT NULL,
	[MaLoaiThuoc] [char](10) NULL,
	[TenThuoc] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
	[Gia] [char](50) NULL,
	[CachSuDung] [nvarchar](200) NULL,
 CONSTRAINT [PK_Thuoc] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[BenhNhan]  WITH CHECK ADD  CONSTRAINT [FK_BenhNhan_DanToc] FOREIGN KEY([MaDanToc])
REFERENCES [dbo].[DanToc] ([MaDanToc])
GO
ALTER TABLE [dbo].[BenhNhan] CHECK CONSTRAINT [FK_BenhNhan_DanToc]
GO
ALTER TABLE [dbo].[BenhNhan]  WITH CHECK ADD  CONSTRAINT [FK_BenhNhan_DoiTuongBH] FOREIGN KEY([MaDoiTuongBH])
REFERENCES [dbo].[DoiTuongBH] ([MaDoiTuongBH])
GO
ALTER TABLE [dbo].[BenhNhan] CHECK CONSTRAINT [FK_BenhNhan_DoiTuongBH]
GO
ALTER TABLE [dbo].[BenhNhan]  WITH CHECK ADD  CONSTRAINT [FK_BenhNhan_GioiTinh] FOREIGN KEY([MaGioiTinh])
REFERENCES [dbo].[GioiTinh] ([MaGioiTinh])
GO
ALTER TABLE [dbo].[BenhNhan] CHECK CONSTRAINT [FK_BenhNhan_GioiTinh]
GO
ALTER TABLE [dbo].[BenhNhan]  WITH CHECK ADD  CONSTRAINT [FK_BenhNhan_LoaiBaoHiem] FOREIGN KEY([MaLoaiBH])
REFERENCES [dbo].[LoaiBaoHiem] ([MaLoaiBH])
GO
ALTER TABLE [dbo].[BenhNhan] CHECK CONSTRAINT [FK_BenhNhan_LoaiBaoHiem]
GO
ALTER TABLE [dbo].[BenhNhan]  WITH CHECK ADD  CONSTRAINT [FK_BenhNhan_LoaiKCB] FOREIGN KEY([MaLoaiKham])
REFERENCES [dbo].[LoaiKCB] ([MaLoaiKham])
GO
ALTER TABLE [dbo].[BenhNhan] CHECK CONSTRAINT [FK_BenhNhan_LoaiKCB]
GO
ALTER TABLE [dbo].[BenhNhan]  WITH CHECK ADD  CONSTRAINT [FK_BenhNhan_NgheNghiep] FOREIGN KEY([MaNgheNghiep])
REFERENCES [dbo].[NgheNghiep] ([MaNgheNghiep])
GO
ALTER TABLE [dbo].[BenhNhan] CHECK CONSTRAINT [FK_BenhNhan_NgheNghiep]
GO
ALTER TABLE [dbo].[BenhNhan]  WITH CHECK ADD  CONSTRAINT [FK_BenhNhan_QuanHuyen] FOREIGN KEY([MaQuanHuyen])
REFERENCES [dbo].[QuanHuyen] ([MaQuanHuyen])
GO
ALTER TABLE [dbo].[BenhNhan] CHECK CONSTRAINT [FK_BenhNhan_QuanHuyen]
GO
ALTER TABLE [dbo].[BenhNhan]  WITH CHECK ADD  CONSTRAINT [FK_BenhNhan_QuocGia] FOREIGN KEY([MaQuocGia])
REFERENCES [dbo].[QuocGia] ([MaQuocGia])
GO
ALTER TABLE [dbo].[BenhNhan] CHECK CONSTRAINT [FK_BenhNhan_QuocGia]
GO
ALTER TABLE [dbo].[BenhNhan]  WITH CHECK ADD  CONSTRAINT [FK_BenhNhan_TinhThanh] FOREIGN KEY([MaTinhThanh])
REFERENCES [dbo].[TinhThanh] ([MaTinhThanh])
GO
ALTER TABLE [dbo].[BenhNhan] CHECK CONSTRAINT [FK_BenhNhan_TinhThanh]
GO
ALTER TABLE [dbo].[CanBo]  WITH CHECK ADD  CONSTRAINT [FK_CanBo_GioiTinh] FOREIGN KEY([MaGioiTinh])
REFERENCES [dbo].[GioiTinh] ([MaGioiTinh])
GO
ALTER TABLE [dbo].[CanBo] CHECK CONSTRAINT [FK_CanBo_GioiTinh]
GO
ALTER TABLE [dbo].[CanBo]  WITH CHECK ADD  CONSTRAINT [FK_CanBo_HocHam] FOREIGN KEY([MaHocHam])
REFERENCES [dbo].[HocHam] ([MaHocHam])
GO
ALTER TABLE [dbo].[CanBo] CHECK CONSTRAINT [FK_CanBo_HocHam]
GO
ALTER TABLE [dbo].[CanBo]  WITH CHECK ADD  CONSTRAINT [FK_CanBo_HocVi] FOREIGN KEY([MaHocVi])
REFERENCES [dbo].[HocVi] ([MaHocVi])
GO
ALTER TABLE [dbo].[CanBo] CHECK CONSTRAINT [FK_CanBo_HocVi]
GO
ALTER TABLE [dbo].[CanBo]  WITH CHECK ADD  CONSTRAINT [FK_CanBo_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[CanBo] CHECK CONSTRAINT [FK_CanBo_Khoa]
GO
ALTER TABLE [dbo].[CanBo]  WITH CHECK ADD  CONSTRAINT [FK_CanBo_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[CanBo] CHECK CONSTRAINT [FK_CanBo_Quyen]
GO
ALTER TABLE [dbo].[ChiTietBenhNhanKham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietBenhNhanKham_HoSoBenhNhan] FOREIGN KEY([MaHSBN])
REFERENCES [dbo].[HoSoBenhNhan] ([MaHSBN])
GO
ALTER TABLE [dbo].[ChiTietBenhNhanKham] CHECK CONSTRAINT [FK_ChiTietBenhNhanKham_HoSoBenhNhan]
GO
ALTER TABLE [dbo].[ChiTietBenhNhanKham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietBenhNhanKham_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[ChiTietBenhNhanKham] CHECK CONSTRAINT [FK_ChiTietBenhNhanKham_Phong]
GO
ALTER TABLE [dbo].[ChiTietCBP]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietCBP_CanBo] FOREIGN KEY([MaCB])
REFERENCES [dbo].[CanBo] ([MaCB])
GO
ALTER TABLE [dbo].[ChiTietCBP] CHECK CONSTRAINT [FK_ChiTietCBP_CanBo]
GO
ALTER TABLE [dbo].[ChiTietCBP]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietCBP_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[ChiTietCBP] CHECK CONSTRAINT [FK_ChiTietCBP_Phong]
GO
ALTER TABLE [dbo].[ChiTietChucVuCB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietChucVuCB_CanBo] FOREIGN KEY([MaCB])
REFERENCES [dbo].[CanBo] ([MaCB])
GO
ALTER TABLE [dbo].[ChiTietChucVuCB] CHECK CONSTRAINT [FK_ChiTietChucVuCB_CanBo]
GO
ALTER TABLE [dbo].[ChiTietChucVuCB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietChucVuCB_ChucVuCB] FOREIGN KEY([MaChucVuCB])
REFERENCES [dbo].[ChucVuCB] ([MaChucVuCB])
GO
ALTER TABLE [dbo].[ChiTietChucVuCB] CHECK CONSTRAINT [FK_ChiTietChucVuCB_ChucVuCB]
GO
ALTER TABLE [dbo].[ChiTietChucVuNV]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietChucVuNV_ChucVuNV] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[ChucVuNV] ([MaChucVuNV])
GO
ALTER TABLE [dbo].[ChiTietChucVuNV] CHECK CONSTRAINT [FK_ChiTietChucVuNV_ChucVuNV]
GO
ALTER TABLE [dbo].[ChiTietChucVuNV]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietChucVuNV_NhanVienHC] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVienHC] ([MaNV])
GO
ALTER TABLE [dbo].[ChiTietChucVuNV] CHECK CONSTRAINT [FK_ChiTietChucVuNV_NhanVienHC]
GO
ALTER TABLE [dbo].[ChiTietDonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonThuoc_DonThuoc] FOREIGN KEY([MaDonThuoc])
REFERENCES [dbo].[DonThuoc] ([MaDonThuoc])
GO
ALTER TABLE [dbo].[ChiTietDonThuoc] CHECK CONSTRAINT [FK_ChiTietDonThuoc_DonThuoc]
GO
ALTER TABLE [dbo].[ChiTietDonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonThuoc_HoSoBenhNhan] FOREIGN KEY([MaHSBN])
REFERENCES [dbo].[HoSoBenhNhan] ([MaHSBN])
GO
ALTER TABLE [dbo].[ChiTietDonThuoc] CHECK CONSTRAINT [FK_ChiTietDonThuoc_HoSoBenhNhan]
GO
ALTER TABLE [dbo].[ChiTietDonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonThuoc_Thuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Thuoc] ([MaThuoc])
GO
ALTER TABLE [dbo].[ChiTietDonThuoc] CHECK CONSTRAINT [FK_ChiTietDonThuoc_Thuoc]
GO
ALTER TABLE [dbo].[ChiTietLoaiCanBo]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoaiCanBo_CanBo] FOREIGN KEY([MaCB])
REFERENCES [dbo].[CanBo] ([MaCB])
GO
ALTER TABLE [dbo].[ChiTietLoaiCanBo] CHECK CONSTRAINT [FK_ChiTietLoaiCanBo_CanBo]
GO
ALTER TABLE [dbo].[ChiTietLoaiCanBo]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoaiCanBo_LoaiCB] FOREIGN KEY([MaLoaiCB])
REFERENCES [dbo].[LoaiCB] ([MaLoaiCB])
GO
ALTER TABLE [dbo].[ChiTietLoaiCanBo] CHECK CONSTRAINT [FK_ChiTietLoaiCanBo_LoaiCB]
GO
ALTER TABLE [dbo].[ChiTietLoaiNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoaiNhanVien_LoaiNhanVien] FOREIGN KEY([MaLoaiNhanVien])
REFERENCES [dbo].[LoaiNhanVien] ([MaLoaiNhanVien])
GO
ALTER TABLE [dbo].[ChiTietLoaiNhanVien] CHECK CONSTRAINT [FK_ChiTietLoaiNhanVien_LoaiNhanVien]
GO
ALTER TABLE [dbo].[ChiTietLoaiNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoaiNhanVien_NhanVienHC] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVienHC] ([MaNV])
GO
ALTER TABLE [dbo].[ChiTietLoaiNhanVien] CHECK CONSTRAINT [FK_ChiTietLoaiNhanVien_NhanVienHC]
GO
ALTER TABLE [dbo].[ChiTietLuongCB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLuongCB_CanBo] FOREIGN KEY([MaCB])
REFERENCES [dbo].[CanBo] ([MaCB])
GO
ALTER TABLE [dbo].[ChiTietLuongCB] CHECK CONSTRAINT [FK_ChiTietLuongCB_CanBo]
GO
ALTER TABLE [dbo].[ChiTietLuongCB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLuongCB_HeSoLuong] FOREIGN KEY([MaHeSoLuong])
REFERENCES [dbo].[HeSoLuong] ([MaHeSoLuong])
GO
ALTER TABLE [dbo].[ChiTietLuongCB] CHECK CONSTRAINT [FK_ChiTietLuongCB_HeSoLuong]
GO
ALTER TABLE [dbo].[ChiTietLuongCB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLuongCB_LuongCoBan] FOREIGN KEY([MaLuongCoBan])
REFERENCES [dbo].[LuongCoBan] ([MaLuongCoBan])
GO
ALTER TABLE [dbo].[ChiTietLuongCB] CHECK CONSTRAINT [FK_ChiTietLuongCB_LuongCoBan]
GO
ALTER TABLE [dbo].[ChiTietLuongNV]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLuongNV_HeSoLuong] FOREIGN KEY([MaHeSoLuong])
REFERENCES [dbo].[HeSoLuong] ([MaHeSoLuong])
GO
ALTER TABLE [dbo].[ChiTietLuongNV] CHECK CONSTRAINT [FK_ChiTietLuongNV_HeSoLuong]
GO
ALTER TABLE [dbo].[ChiTietLuongNV]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLuongNV_LuongCoBan] FOREIGN KEY([MaLuongCoBan])
REFERENCES [dbo].[LuongCoBan] ([MaLuongCoBan])
GO
ALTER TABLE [dbo].[ChiTietLuongNV] CHECK CONSTRAINT [FK_ChiTietLuongNV_LuongCoBan]
GO
ALTER TABLE [dbo].[ChiTietLuongNV]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLuongNV_NhanVienHC] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVienHC] ([MaNV])
GO
ALTER TABLE [dbo].[ChiTietLuongNV] CHECK CONSTRAINT [FK_ChiTietLuongNV_NhanVienHC]
GO
ALTER TABLE [dbo].[ChiTietPhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuThu_DichVu] FOREIGN KEY([MaDichVu])
REFERENCES [dbo].[DichVu] ([MaDichVu])
GO
ALTER TABLE [dbo].[ChiTietPhieuThu] CHECK CONSTRAINT [FK_ChiTietPhieuThu_DichVu]
GO
ALTER TABLE [dbo].[ChiTietPhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuThu_HoSoBenhNhan] FOREIGN KEY([MaHSBN])
REFERENCES [dbo].[HoSoBenhNhan] ([MaHSBN])
GO
ALTER TABLE [dbo].[ChiTietPhieuThu] CHECK CONSTRAINT [FK_ChiTietPhieuThu_HoSoBenhNhan]
GO
ALTER TABLE [dbo].[ChiTietPhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuThu_PhieuThu] FOREIGN KEY([MaPhieuThu])
REFERENCES [dbo].[PhieuThu] ([MaPhieuThu])
GO
ALTER TABLE [dbo].[ChiTietPhieuThu] CHECK CONSTRAINT [FK_ChiTietPhieuThu_PhieuThu]
GO
ALTER TABLE [dbo].[DanToc]  WITH CHECK ADD  CONSTRAINT [FK_DanToc_QuocGia] FOREIGN KEY([MaQuocGia])
REFERENCES [dbo].[QuocGia] ([MaQuocGia])
GO
ALTER TABLE [dbo].[DanToc] CHECK CONSTRAINT [FK_DanToc_QuocGia]
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK_DichVu_LoaiDichVu] FOREIGN KEY([MaLoaiDichVu])
REFERENCES [dbo].[LoaiDichVu] ([MaLoaiDichVu])
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK_DichVu_LoaiDichVu]
GO
ALTER TABLE [dbo].[DonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_DonThuoc_CanBo] FOREIGN KEY([MaCB])
REFERENCES [dbo].[CanBo] ([MaCB])
GO
ALTER TABLE [dbo].[DonThuoc] CHECK CONSTRAINT [FK_DonThuoc_CanBo]
GO
ALTER TABLE [dbo].[DonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_DonThuoc_HoSoBenhNhan] FOREIGN KEY([MaHSBN])
REFERENCES [dbo].[HoSoBenhNhan] ([MaHSBN])
GO
ALTER TABLE [dbo].[DonThuoc] CHECK CONSTRAINT [FK_DonThuoc_HoSoBenhNhan]
GO
ALTER TABLE [dbo].[HoSoBenhNhan]  WITH CHECK ADD  CONSTRAINT [FK_HoSoBenhNhan_BenhNhan] FOREIGN KEY([MaBN])
REFERENCES [dbo].[BenhNhan] ([MaBN])
GO
ALTER TABLE [dbo].[HoSoBenhNhan] CHECK CONSTRAINT [FK_HoSoBenhNhan_BenhNhan]
GO
ALTER TABLE [dbo].[HoSoBenhNhan]  WITH CHECK ADD  CONSTRAINT [FK_HoSoBenhNhan_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[HoSoBenhNhan] CHECK CONSTRAINT [FK_HoSoBenhNhan_Phong]
GO
ALTER TABLE [dbo].[LichTruc]  WITH CHECK ADD  CONSTRAINT [FK_LichTruc_CanBo] FOREIGN KEY([MaCB])
REFERENCES [dbo].[CanBo] ([MaCB])
GO
ALTER TABLE [dbo].[LichTruc] CHECK CONSTRAINT [FK_LichTruc_CanBo]
GO
ALTER TABLE [dbo].[LichTruc]  WITH CHECK ADD  CONSTRAINT [FK_LichTruc_NhanVienHC] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVienHC] ([MaNV])
GO
ALTER TABLE [dbo].[LichTruc] CHECK CONSTRAINT [FK_LichTruc_NhanVienHC]
GO
ALTER TABLE [dbo].[LichTruc]  WITH CHECK ADD  CONSTRAINT [FK_LichTruc_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[LichTruc] CHECK CONSTRAINT [FK_LichTruc_Phong]
GO
ALTER TABLE [dbo].[LoaiThuoc]  WITH CHECK ADD  CONSTRAINT [FK_LoaiThuoc_DangThuoc] FOREIGN KEY([MaDangThuoc])
REFERENCES [dbo].[DangThuoc] ([MaDangThuoc])
GO
ALTER TABLE [dbo].[LoaiThuoc] CHECK CONSTRAINT [FK_LoaiThuoc_DangThuoc]
GO
ALTER TABLE [dbo].[NhanVienHC]  WITH CHECK ADD  CONSTRAINT [FK_NhanVienHC_GioiTinh] FOREIGN KEY([MaGioiTinh])
REFERENCES [dbo].[GioiTinh] ([MaGioiTinh])
GO
ALTER TABLE [dbo].[NhanVienHC] CHECK CONSTRAINT [FK_NhanVienHC_GioiTinh]
GO
ALTER TABLE [dbo].[NhanVienHC]  WITH CHECK ADD  CONSTRAINT [FK_NhanVienHC_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[NhanVienHC] CHECK CONSTRAINT [FK_NhanVienHC_Quyen]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuThu_BenhNhan] FOREIGN KEY([MaBN])
REFERENCES [dbo].[BenhNhan] ([MaBN])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [FK_PhieuThu_BenhNhan]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuThu_HoSoBenhNhan] FOREIGN KEY([MaHSBN])
REFERENCES [dbo].[HoSoBenhNhan] ([MaHSBN])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [FK_PhieuThu_HoSoBenhNhan]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuThu_LoaiPhieuThu] FOREIGN KEY([MaLoaiPhieuThu])
REFERENCES [dbo].[LoaiPhieuThu] ([MaLoaiPhieuThu])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [FK_PhieuThu_LoaiPhieuThu]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuThu_NhanVienHC] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVienHC] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [FK_PhieuThu_NhanVienHC]
GO
ALTER TABLE [dbo].[QuanHuyen]  WITH CHECK ADD  CONSTRAINT [FK_QuanHuyen_TinhThanh] FOREIGN KEY([MaTinhThanh])
REFERENCES [dbo].[TinhThanh] ([MaTinhThanh])
GO
ALTER TABLE [dbo].[QuanHuyen] CHECK CONSTRAINT [FK_QuanHuyen_TinhThanh]
GO
ALTER TABLE [dbo].[TinhThanh]  WITH CHECK ADD  CONSTRAINT [FK_TinhThanh_QuocGia] FOREIGN KEY([MaQuocGia])
REFERENCES [dbo].[QuocGia] ([MaQuocGia])
GO
ALTER TABLE [dbo].[TinhThanh] CHECK CONSTRAINT [FK_TinhThanh_QuocGia]
GO
ALTER TABLE [dbo].[Thuoc]  WITH CHECK ADD  CONSTRAINT [FK_Thuoc_LoaiThuoc] FOREIGN KEY([MaLoaiThuoc])
REFERENCES [dbo].[LoaiThuoc] ([MaLoaiThuoc])
GO
ALTER TABLE [dbo].[Thuoc] CHECK CONSTRAINT [FK_Thuoc_LoaiThuoc]
GO
USE [master]
GO
ALTER DATABASE [QuanLyBenhVien] SET  READ_WRITE 
GO
