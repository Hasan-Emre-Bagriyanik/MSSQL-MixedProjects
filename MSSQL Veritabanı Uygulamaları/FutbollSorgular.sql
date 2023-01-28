create table takimlar(
	takim_id int primary key not null,
	takim_Adi varchar(50) not null
)

create table oyuncular(
	Oyuncu_id int primary key not null,
	ad varchar(50) not null,
	soyad varchar(50) not null,
	forma_no varchar(50) not null,
	boy varchar(10) not null,
	takim_id int foreign key (takim_id) references takimlar(takim_id)
)

create table yapilan_maclar(
	mac_id int primary key not null,
	tarih date,
	saat datetime,
	takim_set varchar(50),
	takim2_set varchar(50),
	takim1_id int foreign key (takim1_id) references takimlar(takim_id),
	takim2_id int foreign key (takim2_id) references takimlar(takim_id)
)

create table hakemler(
	hakem_id int primary key not null,
	ad varchar(50) not null,
	soyad varchar(50) not null
)

create table hakem_mac(
	hm_id int  primary key not null,
	mac_id int foreign key (mac_id) references yapilan_maclar(mac_id),
	hakem_id int foreign key (hakem_id) references hakemler(hakem_id)
)


alter table takimlar add kurulus_tarihi varchar(50)

alter table oyuncular add dogum_yeri varchar(50)

alter table hakem_mac add hakemin_gorev varchar(50)

