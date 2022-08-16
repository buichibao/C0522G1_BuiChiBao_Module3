drop database if exists quan_ly_vat_tu;
create database quan_ly_vat_tu;
use quan_ly_vat_tu;

create table phieu_xuat(
so_px int primary key,
ngay_xuat date
);

create table vat_tu(
ma_vt int primary key,
ten_vt varchar(45)
);

create table xuat_hang(
dg_xuat double,
sl_xuat int,
so_px int,
ma_vt int,
primary key(so_px,ma_vt),
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vt) references vat_tu(ma_vt)
);

create table phieu_nhap(
so_pn int primary key,
ngay_nhap date
);

create table nhap_hang(
dg_nhap double,
sl_nhap int,
so_pn int,
ma_vt int,
primary key(so_pn,ma_vt),
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key (ma_vt) references vat_tu(ma_vt)
);

create table nha_cc(
ma_cc int primary key,
ten_ncc varchar(45),
dia_chi varchar(45)
);

create table don_dh(
so_dh int primary key,
ngay_hd date,
ma_cc int,
foreign key (ma_cc) references nha_cc(ma_cc)
);

create table dat_hang(
so_dh int,
ma_vt int,
primary key(so_dh,ma_vt),
foreign key (so_dh) references don_dh(so_dh),
foreign key (ma_vt) references vat_tu(ma_vt)
);


create table sdt(
sdt varchar(45),
ma_ncc int,
foreign key (ma_ncc) references nha_cc(ma_cc)
);



