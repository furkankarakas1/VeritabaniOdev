create database Hastane;

use Hastane;

Create table Departman (
 DepartmanID int not null,
 DepartmanAdi varchar(100),
 primary key (DepartmanID)
);

INSERT INTO Departman (DepartmanID, DepartmanAdi)
   VALUES(1,"Cildiye");



Create table Brans (
 BransID int not null primary key,
 DepartmanID int not null,
 BransAdi varchar(100),
 foreign key (DepartmanID)  references Departman(DepartmanID)
);

INSERT INTO Brans (BransID, DepartmanID,BransAdi)
   VALUES(1,1,"Cilt");


Create table Doktor (
 DoktorID int not null primary key,
 DepartmanID int not null,
 BransID int not null,
 isim varchar(100),
 soyisim varchar(100),
 foreign key (DepartmanID)  references Departman(DepartmanID),
 foreign key (BransID)  references Brans(BransID)
);
INSERT INTO Doktor (DoktorID, DepartmanID, BransID, isim, soyisim)
   VALUES(1,1,1,"Furkan","Karakas");


Create table Nobet (
 NobetID int not null primary key,
 DepartmanID int not null,
 DoktorID int not null,
 Tarih date not null,
 foreign key (DepartmanID)  references Departman(DepartmanID),
 foreign key (DoktorID)  references Doktor(DoktorID)
);
INSERT INTO Nobet (NobetID, DoktorID, DepartmanID, Tarih)
   VALUES(1,1,1,12-02-2007);


Create table Hasta (
 HastaID int not null primary key,
 DoktorID int not null,
 isim varchar(100),
 soyisim varchar(100),
 TcKimlik int,
 Telefon int,
 foreign key (DoktorID)  references Doktor(DoktorID)
);

INSERT INTO Hasta (HastaID, DoktorID, isim, soyisim, TcKimlik, Telefon)
   VALUES(1,1,"Salih","Karakas",1555222114,0555455455);


Create table Sonuc (
 SonucID int not null primary key,
 DepartmanID int not null,
 DoktorID int not null,
 HastaID int not null,
 TahlilSonuc varchar(100),
 TahlilTur varchar(100),
 foreign key (DepartmanID)  references Departman(DepartmanID),
 foreign key (DoktorID)  references Doktor(DoktorID),
 foreign key (HastaID)  references Hasta(HastaID)
);

INSERT INTO Sonuc (SonucID, DepartmanID, DoktorID, HastaID, TahlilSonuc, TahlilTur)
   VALUES(1,1,1,1,"Pozitif","Kan Tahlil");


select * from Departman 
inner join Brans on Brans.DepartmanID = Departman.DepartmanID
inner join Doktor on Departman.DepartmanID = Doktor.DepartmanID
inner join Nobet on Nobet.DoktorID = Doktor.DoktorID
inner join Hasta on Hasta.DoktorID = Doktor.DoktorID
inner join Sonuc on Sonuc.HastaID = Hasta.HastaID













