create table tur (
	tur_no int primary key,
	tur_aciklama varchar(50)

)

create table kitap(
	kitap_no int primary key ,
	kitap_adi varchar(50),
	isbn_no varchar(30),
	sayfa_sayisi int,
	kitap_ozeti varchar(500),


)

create table kitap_tur(
	kitap_tur_no int primary key,
	kitap_no int FOREIGN KEY (kitap_no) REFERENCES kitap(kitap_no),
	tur_no int FOREIGN KEY (tur_no) REFERENCES tur(tur_no),


)
create table uye(
	uye_no int primary key,
	uye_adi varchar(50),
	uye_soyadi varchar(50),
	adresi varchar(100),
	aktifmi bit,

)

create table odunc(
	odunc_no int primary key,
	kitap_no int FOREIGN KEY (kitap_no) REFERENCES kitap(kitap_no),
	verme_tarihi date,
	verme_suresi datetime,
	geldimi bit,
	uye_no int FOREIGN KEY (uye_no) REFERENCES uye(uye_no),


)

create table yazar(
	yazar_no int primary key,
	yazar_adi varchar(50),
	yazar_soyadi varchar(50),
	dogum_tarihi date,
	biyografi varchar(50),

)



create table kitap_yazar(
	kitap_yazar_no int primary key,
	kitap_no int FOREIGN KEY (kitap_no) REFERENCES kitap(kitap_no),
	yazar_no int FOREIGN KEY (yazar_no) REFERENCES yazar(yazar_no),


)







