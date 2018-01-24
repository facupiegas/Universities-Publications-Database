--Tabla Universidad
alter table Universidad alter column nombre varchar(100) not null
go
alter table Universidad add constraint PK_Universidad primary key(nombre)

--Tabla Investigador
alter table Investigador add idUniversidad varchar(100) not null
go
alter table Investigador drop column idInvestigador
alter table Investigador add idInvestigador int identity (1,1) not null
go
alter table Investigador add constraint PK_Investigador primary key(idInvestigador)
alter table Investigador add constraint FK_Investigador_Universidad foreign key(idUniversidad) references Universidad(nombre)
alter table Investigador add constraint CK_Investigador_NivelInvestig check(nivelInvestig in('EGrado','EMaestria','EDoctor','Doctor'))
alter table Investigador add constraint UK_Investigador_Mail unique(mail)

--Tabla Trabajo
alter table Trabajo alter column idTrab varchar(10) not null
go
alter table Trabajo add constraint PK_Trabajo primary key(idTrab)
alter table Trabajo alter column lugarPublic int
alter table Trabajo add constraint FK_Trabajo_Lugares foreign key(lugarPublic) references Lugares(idLugar)
alter table Trabajo alter column descripTrab varchar(200) not null
alter table Trabajo alter column fechaInicio date
alter table Trabajo add constraint CK_Trabajo_TipoTrab check(tipoTrab in('poster','articulo','capitulo','otro'))

--Tabla Tags
alter table Tags drop column idTag
alter table Tags add idTag int identity (1,2) not null
go
alter table Tags add constraint PK_Tags primary key(idtag)
alter table tags alter column palabra varchar(50) not null

--Tabla TTags
alter table TTags add constraint FK_TTags_Trabajo foreign key(idTrab) references Trabajo(idTrab)
alter table TTags add constraint FK_TTags_Tags foreign key(idTag) references Tags(idTag)
alter table TTags add constraint PK_TTags primary key(idTrab,idTag)

--Tabla TAutores
alter table TAutores add constraint FK_TAutores_Trabajo foreign key(idTrab) references Trabajo(idTrab)
alter table TAutores add constraint FK_TAutores_Investigador foreign key(idInvestigador) references Investigador(idInvestigador)
alter table TAutores add constraint PK_TAutores primary key(idTrab,idInvestigador)
alter table TAutores alter column rolInvestig varchar(15)
alter table TAutores add constraint CK_TAutores_RolInvestig check(rolInvestig in('autor-ppal','autor-sec','autor-director'))

--Tabla Referencias
alter table Referencias add constraint FK_Referencias_Trabajo foreign key(idTrab) references Trabajo(idTrab)
alter table Referencias add constraint FK_Referencias_Trabajo_2 foreign key(idTrabReferenciado) references Trabajo(idTrab)
alter table Referencias add constraint PK_Referencias primary key(idTrab,idTrabReferenciado)
alter table Referencias add constraint CK_Referencias_Distintas check(idTrab<>idTrabReferenciado)

--Tabla Lugares
alter table Lugares alter column universidad varchar(100) not null
alter table Lugares alter column diaIni int not null
alter table Lugares add constraint FK_Lugares_Universidad foreign key(universidad) references Universidad(nombre)
alter table Lugares alter column nombre varchar(250) not null
alter table Lugares add constraint UK_Lugares_Nombre unique(nombre)
alter table Lugares add tipoLugar varchar(10) not null
go
alter table Lugares add constraint CK_Lugares_TipoLugar check(tipoLugar in('Congresos','Revistas','Libros'))
alter table Lugares add constraint CK_Lugares_NivelLugar check(nivelLugar in(1,2,3,4))