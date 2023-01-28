/* 1. soru*/
select ogr_no , final from notlar
where ders_kodu=106 and final >=70 and final<=95


/* 2.soru*/
select ogr_no , vize*0.4+final*0.6 as ortalama from notlar
where 75 < vize*0.4+final*0.6 


/* 3.soru*/
select (adi + ' ' + soyadi) as 'Ad soyad' , DATEDIFF(year,dogum_tar,getdate() ) as Yaþ
from ogrenci 
where  (ogr_no like '2%' or ogr_no like '3%') and cinsiyet=1
