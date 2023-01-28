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

--E-maili verilen bir personelin �ifresini bulunuz.
select adi, soyadi,sifre from personel 
where eposta = 'hemrebgrynk@gmail.com'


--Soyad�nda �ik� ge�en t�m personeli listeleyiniz.
select * from personel
where soyadi like '%ik%'

--Telefon numaras� 0212 ile ba�layan b�t�n numaralar� 0216 olarak de�i�tiriniz.
update personel set telefon = '0216' + SUBSTRING(telefon,5,11)
where telefon like '0212%'

select * from personel


--Departman tablosuna  �Pazarlama�  departman�n� ekleyiniz.
insert into departman(departman) values('pazarlama')

--TCKimlik Numaras�  �12345678912� olan ki�inin Ad�n� ve Soyad�n� �Ali Can� olarak de�i�tiriniz.
update personel set adi ='Ali' , soyadi = 'Can'
where tc_no = '12345678912'

select * from personel


--TC Kimlik Numaras� verilen bir  personelin �ki tarih aras�nda(�rne�in 01.01.2017-31.12.2017) ald���
--toplam maa�� listeleyiniz.
select sum(maas) from personel p , maas m
where p.personel_Id = m.personel_Id 
and m.tarih >='2017-01-01'  and  m.tarih <='2017-12-31'
and p.tc_no ='12345678912'


--Personelin Ad�n�, Soyad�n�, Departman�n� ve Maa��n� listeleyiniz.
select p.adi,p.soyadi, d.departman, m.maas from personel p , maas m, departman d
where p.personel_Id = m.personel_Id and p.departman_Id = d.departman_Id


--Departmanlar� toplam maa�lar�na g�re b�y�kten k����e listeleyiniz.

select d.departman, sum(m.maas) from personel p , departman d, maas m
where p.personel_Id = m.personel_Id and  d.departman_Id = p.departman_Id
group by d.departman order by sum(m.maas) desc


--Her departmanda ka� ki�i �al��t���n� DEPARTMAN, �ALI�AN SAYISI �eklinde listeleyiniz.
select d.departman,count(p.personel_Id) as '�al��an Say�s�' from departman d, personel p
where p.departman_Id = d.departman_Id 
group by d.departman