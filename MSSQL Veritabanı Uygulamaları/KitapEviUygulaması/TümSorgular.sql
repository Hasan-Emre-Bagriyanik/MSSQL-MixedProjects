--Ödünç tablosunda veri tipi para olacak þekilde “Gecikme Cezasý” adýnda yeni bir alan ekleyen SQL kodunu yazýnýz.
alter table odunc add Gecikme_cezasi money

--Üye tablosundaki adres alanýný boþ geçilemez ve karakter uzunluðu 80 olacak þekilde deðiþtiren SQL kodunu yazýnýz.
alter table uye alter column adresi varchar(80) not null

--Aktif üye olarak, kendi bilgilerinizi ve 3 (Ömer, Bade, Feyza) öðrenciye ait bilgileri üye tablosuna ekleyen SQL kodunu yazýnýz.
insert into uye(uye_no,uye_adi,uye_soyadi,aktifmi,adresi) values (1,'Hasan Emre','Baðrýyanýk',1,'Ahmet Cevdet Paþa'),
(2,'Ömer ','Baðrýyanýk',1,'Ahmet Cevdet Paþa'),
(3,'feyza','Baðrýyanýk',1,'Ahmet Cevdet Paþa'),
(4,'bade','Baðrýyanýk',1,'Ahmet Cevdet Paþa')


--Ahmet Hamdi Tanpýnar’ýn Saatleri Ayarlama Enstitüsü adlý kitap bilgilerini kitap, kitap_yazar ve yazar tablolarýna ekleyen SQL kodunu yazýnýz.
insert into yazar(yazar_no,yazar_adi,yazar_soyadi) values(1,'Ahmet Hamdi', 'Tanpýnar')
insert into kitap(kitap_no,kitap_adi) values(1,'Saatleri Ayarlama Enstitüsü')
insert into kitap_yazar(kitap_yazar_no,kitap_no,yazar_no)values(1,1,1)

--Dostoyevksi Suç ve ceza, Beyaz Geceler ve Kumarbaz isimli kitaplarýný ve onlara baðlý tablo bilgilerini veri tabanýna ekleyen SQL kodunu yazýnýz.
insert into yazar(yazar_no,yazar_adi)values(2,'Dostoyevksi')

insert into kitap(kitap_no,kitap_adi) values(2,'Suç ve Ceza'),(3,'Beyaz Geceler'),(4,'kumarbaz')

insert into kitap_yazar(kitap_yazar_no,kitap_no,yazar_no) values(2,2,2),(3,3,2),(4,4,2)



--Dostoyevski’nin adýný Fyodor Dostoyevski olarak güncelleyen SQL kodunu yazýnýz.
update yazar set yazar_adi = 'Fyodor Dostoyevski' where yazar_no = 2


--Ömer adlý üyenin 2021 Þubat, Bade’nin 2021 Mart ve Feyza’nýn 2021 Temmuz ayýnda ödünç aldýðý kitabýn ödünç kayýt bilgilerini ekleyen SQL kodunu yazýnýz.
insert into odunc(odunc_no,verme_tarihi,uye_no)values(1,'02.01.2021',2),(2,'03.01.2021',4),(3,'07.01.2021',3)

--Beyaz Geceler adlý kitabý veritabanýndan siliniz.
delete from kitap_yazar where kitap_yazar_no = 3
delete from kitap where kitap_no = 3






