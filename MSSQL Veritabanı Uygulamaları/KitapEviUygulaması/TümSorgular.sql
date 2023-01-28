--�d�n� tablosunda veri tipi para olacak �ekilde �Gecikme Cezas�� ad�nda yeni bir alan ekleyen SQL kodunu yaz�n�z.
alter table odunc add Gecikme_cezasi money

--�ye tablosundaki adres alan�n� bo� ge�ilemez ve karakter uzunlu�u 80 olacak �ekilde de�i�tiren SQL kodunu yaz�n�z.
alter table uye alter column adresi varchar(80) not null

--Aktif �ye olarak, kendi bilgilerinizi ve 3 (�mer, Bade, Feyza) ��renciye ait bilgileri �ye tablosuna ekleyen SQL kodunu yaz�n�z.
insert into uye(uye_no,uye_adi,uye_soyadi,aktifmi,adresi) values (1,'Hasan Emre','Ba�r�yan�k',1,'Ahmet Cevdet Pa�a'),
(2,'�mer ','Ba�r�yan�k',1,'Ahmet Cevdet Pa�a'),
(3,'feyza','Ba�r�yan�k',1,'Ahmet Cevdet Pa�a'),
(4,'bade','Ba�r�yan�k',1,'Ahmet Cevdet Pa�a')


--Ahmet Hamdi Tanp�nar��n Saatleri Ayarlama Enstit�s� adl� kitap bilgilerini kitap, kitap_yazar ve yazar tablolar�na ekleyen SQL kodunu yaz�n�z.
insert into yazar(yazar_no,yazar_adi,yazar_soyadi) values(1,'Ahmet Hamdi', 'Tanp�nar')
insert into kitap(kitap_no,kitap_adi) values(1,'Saatleri Ayarlama Enstit�s�')
insert into kitap_yazar(kitap_yazar_no,kitap_no,yazar_no)values(1,1,1)

--Dostoyevksi Su� ve ceza, Beyaz Geceler ve Kumarbaz isimli kitaplar�n� ve onlara ba�l� tablo bilgilerini veri taban�na ekleyen SQL kodunu yaz�n�z.
insert into yazar(yazar_no,yazar_adi)values(2,'Dostoyevksi')

insert into kitap(kitap_no,kitap_adi) values(2,'Su� ve Ceza'),(3,'Beyaz Geceler'),(4,'kumarbaz')

insert into kitap_yazar(kitap_yazar_no,kitap_no,yazar_no) values(2,2,2),(3,3,2),(4,4,2)



--Dostoyevski�nin ad�n� Fyodor Dostoyevski olarak g�ncelleyen SQL kodunu yaz�n�z.
update yazar set yazar_adi = 'Fyodor Dostoyevski' where yazar_no = 2


--�mer adl� �yenin 2021 �ubat, Bade�nin 2021 Mart ve Feyza�n�n 2021 Temmuz ay�nda �d�n� ald��� kitab�n �d�n� kay�t bilgilerini ekleyen SQL kodunu yaz�n�z.
insert into odunc(odunc_no,verme_tarihi,uye_no)values(1,'02.01.2021',2),(2,'03.01.2021',4),(3,'07.01.2021',3)

--Beyaz Geceler adl� kitab� veritaban�ndan siliniz.
delete from kitap_yazar where kitap_yazar_no = 3
delete from kitap where kitap_no = 3






