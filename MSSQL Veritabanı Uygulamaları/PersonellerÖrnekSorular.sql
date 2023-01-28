create database Personeller

create table departman(
	departman_Id int primary key not null,
	departman varchar(50) not null
)


create table personel(
	personel_Id int primary key not null,
	adi varchar(50) not null,
	soyadi varchar(50) not null,
	telefon varchar(11) default '-',
	eposta varchar(50), 
	tc_no varchar(11), 
	sifre varchar(30) not null,
	gorevi varchar(50) not null,
	departman_Id int foreign key(departman_Id) references departman(departman_Id)
)


create table maas(
	maas_Id int primary key not null,
	maas int not null,
	tarih date,
	personel_Id int foreign key(personel_Id) references personel(personel_Id)

)

--E-maili verilen bir personelin şifresini bulunuz.
select adi, soyadi,sifre from personel 
where eposta = 'hemrebgrynk@gmail.com'


--Soyadında “ik” geçen tüm personeli listeleyiniz.
select * from personel
where soyadi like '%ik%'

--Telefon numarası 0212 ile başlayan bütün numaraları 0216 olarak değiştiriniz.
update personel set telefon = '0216' + SUBSTRING(telefon,5,11)
where telefon like '0212%'

select * from personel


--Departman tablosuna  ”Pazarlama”  departmanını ekleyiniz.
insert into departman(departman) values('pazarlama')

--TCKimlik Numarası  ”12345678912” olan kişinin Adını ve Soyadını “Ali Can” olarak değiştiriniz.
update personel set adi ='Ali' , soyadi = 'Can'
where tc_no = '12345678912'

select * from personel


--TC Kimlik Numarası verilen bir  personelin İki tarih arasında(örneğin 01.01.2017-31.12.2017) aldığı
--toplam maaşı listeleyiniz.
select sum(maas) from personel p , maas m
where p.personel_Id = m.personel_Id 
and m.tarih >='2017-01-01'  and  m.tarih <='2017-12-31'
and p.tc_no ='12345678912'


--Personelin Adını, Soyadını, Departmanını ve Maaşını listeleyiniz.
select p.adi,p.soyadi, d.departman, m.maas from personel p , maas m, departman d
where p.personel_Id = m.personel_Id and p.departman_Id = d.departman_Id


--Departmanları toplam maaşlarına göre büyükten küçüğe listeleyiniz.

select d.departman, sum(m.maas) from personel p , departman d, maas m
where p.personel_Id = m.personel_Id and  d.departman_Id = p.departman_Id
group by d.departman order by sum(m.maas) desc


--Her departmanda kaç kişi çalıştığını DEPARTMAN, ÇALIŞAN SAYISI şeklinde listeleyiniz.
select d.departman,count(p.personel_Id) as 'Çalışan Sayısı' from departman d, personel p
where p.departman_Id = d.departman_Id 
group by d.departman