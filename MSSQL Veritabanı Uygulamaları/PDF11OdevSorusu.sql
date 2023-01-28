--Matematik dersinden 70 -95 arasýnda final notu alan öðrencilerin numarasýný ve final notunu ekranda listeleyin.
select ogr_no, final  from notlar 
where final between 70 and 95

--Vize ve final ortalamasý (vize*0.4+final*0.6) 75 üzerindeki öðrencilerin numarasýný ve ortalamasýný ekrandaki gibi listeleyin.
select ogr_no, (vize*0.4+final*0.6) as ortalama from notlar
where  (vize*0.4+final*0.6) > 75


--2.Öðretim (numarasý 2 ile baþlayan) ve Uzaktan Öðretim (numarasý 3 ile baþlayan) 
--kýz öðrencilerin ad, soyad(tek alanda olacak) ve yaþ bilgilerini ekrandaki gibi listeleyin.
select adi + ' ' + soyadi as 'AD SOYAD', DATEDIFF(YEAR,dogum_tar,GETDATE()) as Yaþ from ogrenci  
where (ogr_no like '2%' or ogr_no like '3%') and cinsiyet = 1










































