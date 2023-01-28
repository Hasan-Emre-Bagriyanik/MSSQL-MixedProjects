create table bolumler(
	bol_no int primary key not null,
	bol_adi varchar(50) not null
)

create table ogrenci(
	ogr_no int primary key not null,
	adi varchar(50) not null,
	soyadi varchar(50) not null,
	dogum_yeri varchar(50),
	dogum_tar date ,
	cinsiyet bit ,
	adres varchar(50),
	telefon varchar(11) default '-',
	bol_no int foreign key(bol_no) references bolumler(bol_no)

)
create table hocalar(
	hoca_no int primary key identity(1,1) not null,
	ad varchar(50) not null,
	soyad varchar(50) not null,
	unvan varchar(50)
)

create table dersler(
	ders_kodu int primary key not null,
	ders_adi varchar(50) not null,
	kredisi int,
	akts int,
	hocasi int foreign key (hocasi) references hocalar(hoca_no)
)

create table notlar (
	not_id int primary key identity(1,1) not null ,
	ogr_no int foreign key(ogr_no) references ogrenci(ogr_no),
	ders_kodu int foreign key (ders_kodu) references dersler(ders_kodu)
)


alter table bolumler add eposta varchar(50), telefon varchar(11), web_adresi varchar(50)

alter table hocalar add ders_sayisi int , dogum_tarihi date 

alter table ogrenci add ekleme_tarihi datetime default getdate()

alter table notlar add ders_yili int , vize int, final int 

alter table  dersler add teori varchar(50) , uygulama varchar(50)




insert into hocalar(hoca_no,ad,soyad,unvan) values(2,'Sait', 'Oðuz Erenler','Dr.Öðrt.Üyesi')

insert into dersler(ders_kodu,ders_adi,kredisi) values(1,'Matematik',4),(2,'Yazýlým Mühendilið',3),(3,'Veritabaný',4)

insert into bolumler(bol_no,bol_adi) values(1,'Yazýlým Mühendisliði'), (2,'Ýnþaat Mühendisliði')

insert into ogrenci(ogr_no,adi,soyadi,dogum_yeri,dogum_tar,cinsiyet,adres,bol_no,telefon)
values(1210505018,'Mehmet Ali','Sivri', 'Bursa','03.18.2002',0,'Bursa Nilüfer',1,'12457896325'),
(1210505023,'Hasan Emre','Baðrýyanýk', 'Hatay','02.05.2003',0,'Hatay Ýskenderun',1,'12345678901'),
(1210505037,'Veysel','Uðurlu', 'Siirt','05.20.2002',0,'Ýstanbul Gazi Osman paþa',1,'24587169310')

set identity_insert notlar on
insert into notlar(not_id,ogr_no,ders_kodu,vize,ders_yili,final) values (1,1210505023,2,85,2022,1),
(2,1210505018,2,65,2022,1),
(3,1210505037,2,55,2022,1)
set identity_insert notlar off

insert into ogrenci(ogr_no,adi,soyadi,dogum_yeri,dogum_tar,cinsiyet,adres,bol_no,telefon)
values(1210505015,'Ahmet','Yýlmaz', 'Ankara','03.18.2000',0,'Ankara Gölbaþý',2,'12457848759')
 
update ogrenci set adres = 'Ýstanbul' where bol_no = 2

update notlar set vize = 75 where ogr_no = 1210505018  and ders_kodu = 2 

update hocalar set unvan = 'Doç.Dr.' where ad = 'Sait'

delete from notlar where ders_kodu = 2 and  vize = 55


alter table hocalar drop column ders_sayisi

drop table notlar 

drop database Okul





