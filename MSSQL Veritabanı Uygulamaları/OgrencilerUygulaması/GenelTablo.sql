
create table bolumler(
	bol_no int primary key,
	bol_adi varchar(50)

)
create table ogrenci(
	ogr_no int primary key,
	adi  varchar(50),
	soyadi varchar(50),
	dogum_yeri varchar(50),
	dogum_tar date,
	cinsiyet bit,
	adres varchar(max),
	tel varchar(11),
	bol_no int FOREIGN KEY(bol_no) REFERENCES bolumler(bol_no),


)

create table hocalar(
	hoca_no int primary key IDENTITY(1,1),
	ad varchar(20),
	soyad varchar(30),
	unvan varchar(20),



)

create table dersler(
	ders_kodu int primary key,
	ders_adi varchar(30),
	kredisi int,
	hocasi int,
	akts int,
	CONSTRAINT FK_de_ho FOREIGN KEY (hocasi) REFERENCES hocalar(hoca_no),


)

create table notlar(
	not_id int primary key IDENTITY(1,1),
	ogr_no int not null ,
	ders_kodu int not null,

	
	CONSTRAINT FK_ogr_no FOREIGN KEY (ogr_no) REFERENCES ogrenci(ogr_no),
	CONSTRAINT FK_der_ko FOREIGN KEY (ders_kodu) REFERENCES dersler(ders_kodu),
)

