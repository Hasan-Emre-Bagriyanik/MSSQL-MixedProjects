/*��renci tablosundan ogr_noalan�n� NUMARA, adi alan�n� AD, soyadialan�n� SOYAD �eklinde de�i�tirerek 
do�um tarihine g�re artan s�ralayan (yandaki gibi listeleyen) SQL kodunu yaz�n.*/

select ogr_no as NUMARA, adi as AD, soyadi as SOYAD from ogrenci order by dogum_tar


--Ayn� sorguya DO�UM TAR�H� alan�n� ekleyelim.
select ogr_no as NUMARA, adi as AD, soyadi as SOYAD, dogum_tar as 'DO�UM TAR�H�' from ogrenci order by dogum_tar


/*��renci numaras�n�, dersin kodunu, vize, final notunu ve notlar�n ba�ar� notunu 
(ortalama hesab�: vize*0.4 + final*0.6) listeleyen SQL kodu yaz�n�z.*/
select ogr_no, ders_kodu, vize ,final, (vize*0.4 + final*0.6) as ortalama from notlar

/*��rencilerin numara, ad, soyad ve ya� bilgilerini, ya�a g�re k���kten b�y��e listeleyen SQL sorgusunu yaz�n.*/
select ogr_no, adi, soyadi , (year(getdate()) - year(dogum_tar))  as ya� from ogrenci order by ya�


/*��rencilerin numaras�n�, ad ve soyad bilgilerini (tek alan alt�nda aralar�nda bo�luk b�rakarak, 
ad soyadalan�na g�re azalan) ekrandaki gibi listeleyen SELECT sorgusunu yaz�n.*/

select ogr_no, adi + ' ' + soyadi as 'AD SOYAD' from ogrenci


/*1999 ve 2001 y�llar� aras�nda do�an k�z ��rencilerin ad�n�, soyad�n� ve do�um tarihi bilgilerini 
do�um tarihine g�re artan olacak �ekilde ekranda listeleyin.*/

select adi, soyadi, YEAR(dogum_tar) from ogrenci
where (YEAR(dogum_tar) between 1999 and 2001) and cinsiyet = 1 


