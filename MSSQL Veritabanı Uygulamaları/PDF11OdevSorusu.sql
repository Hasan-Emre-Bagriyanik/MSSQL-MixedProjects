--Matematik dersinden 70 -95 aras�nda final notu alan ��rencilerin numaras�n� ve final notunu ekranda listeleyin.
select ogr_no, final  from notlar 
where final between 70 and 95

--Vize ve final ortalamas� (vize*0.4+final*0.6) 75 �zerindeki ��rencilerin numaras�n� ve ortalamas�n� ekrandaki gibi listeleyin.
select ogr_no, (vize*0.4+final*0.6) as ortalama from notlar
where  (vize*0.4+final*0.6) > 75


--2.��retim (numaras� 2 ile ba�layan) ve Uzaktan ��retim (numaras� 3 ile ba�layan) 
--k�z ��rencilerin ad, soyad(tek alanda olacak) ve ya� bilgilerini ekrandaki gibi listeleyin.
select adi + ' ' + soyadi as 'AD SOYAD', DATEDIFF(YEAR,dogum_tar,GETDATE()) as Ya� from ogrenci  
where (ogr_no like '2%' or ogr_no like '3%') and cinsiyet = 1










































