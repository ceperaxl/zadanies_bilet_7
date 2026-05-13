create database zadanie;
go
use zadanie

create table otdel(
otdelid int identity(1,1) primary key,
otdelname nvarchar(50) not null
);

create table doljen(
doljenid int identity(1,1) primary key,
doljenname nvarchar(50) not null
);

create table statusi(
statusiid int identity(1,1) primary key,
statusiname nvarchar(50) not null
);

create table oplata (
oplataid int primary key identity(1,1) not null,
oplatatype nvarchar(25) not null, 
)
go
create table sotrudnic (
sotrudnicid int primary key identity(1,1) not null,
sotrudnicname nvarchar(50) not null,
otdelid int foreign key references otdel(otdelid),
doljen int foreign key references doljen(doljenid)
);

create table client (
clientid int primary key identity(1,1) not null,
clientname nvarchar(25) not null,
clientsotrudnicid int foreign key references sotrudnic(sotrudnicid)
);

create table project (
projectid int primary key identity(1,1) not null,
clientid int foreign key references client(clientid),
sotrudnicid int foreign key references sotrudnic(sotrudnicid),
projectname nvarchar(50),
nomer nvarchar(25),
dataend date default getdate()
);

create table rabota (
rabotaid int primary key identity(1,1)not null,
rabotaprojectid int foreign key references project(projectid),
rabotasotrudnicid int foreign key references sotrudnic(sotrudnicid),
statusi int foreign key references statusi(statusiid),
oplataId int foreign key references oplata(oplataid),
rabotaoplata decimal(12,2)
);

INSERT INTO oplata (oplatatype)
VALUES ('Наличными'), ('Безналичными');

INSERT INTO statusi (statusiname)
VALUES ('Консультация'), ('Создание ТЗ'), ('Выпуск документации'), ('Шефмонтаж');

INSERT INTO doljen (doljenname)
VALUES ('Руководитель отдела'), ('Ведущий инженер'), ('Менеджер по продажам'), ('Инженер-программист'), ('Монтажник'), ('Менеджер по закупкам'), ('Логист'), ('Генеральный директор'), ('Коммерческий директор'), ('Секретарь');






