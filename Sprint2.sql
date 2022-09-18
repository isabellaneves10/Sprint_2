use sprint2;

create table cadastroCliente (idCliente int primary key auto_increment,RazaoSocial varchar(50), CNPJ char(14), email varchar(45), senha char(8));

insert into cadastroCliente values 
(null,'MaisAgro', 01937635000182, 'agro@gmail.com', 'agro1234'),
(null,'Embrapa', 03342589000190, 'empraba@outlook', 'embra123'),
(null,'AlgodãoAgro', 05692361000135, 'algo@gmail.com','algo1234');

create table Hectares (idCampo int primary key auto_increment,  FardosProduzidos int, ValorUnitario float, fkHec int,
constraint foreign key (fkHec) references cadastroCliente (idCliente));

create table sensor (idLeitura int primary key auto_increment, idSensor int auto_increment, fkCampo int,constraint foreign key (fkCampo) references Hectares (idCampo),
Dia datetime , UmidadeLocalizada int);

insert into Hectares values
(null, 23, 1400.00, 1),
(null, 62, 1706.00, 1),
(null, 67, 1869.00, 2),
(null, 33, 1653.00, 3),
(null, 43, 1687.00, 3);


insert into sensor values 
(null, 1, '2022-02-10 12:34', 140),
(null, 1, '2022-02-10 15:45', 170),
(null, 2, '2022-09-12 14:32', 203),
(null, 3, '2022-05-17 9:23', 108),
(null, 3, '2022-05-17 9:43', 153);

select cadastroCliente.RazaoSocial,CNPJ, Hectares.* from cadastroCliente join Hectares on idCliente = fkHec;

select cadastroCliente.RazaoSocial, Hectares.* from cadastroCliente join Hectares on idCliente = fkHec where RazaoSocial like '%MaisAgro%';

select Hectares.idCampo, sensor.idsensor,Dia,UmidadeLocalizada from Hectares join sensor on idCampo = fkCampo;

drop table Hectares,sensor;
