----Tabla Universidad (Datos incorrectos)

insert into Universidad values('Universidad Ort','Uruguay','Montevideo') --Error por datos duplicados(primary key)
print 'ERROR INTENCIONAL POR TESTING'

----Tabla Investigador(Datos incorrectos)

insert into Investigador values('Andres de Sosa','andres@gmail.com','077419832','Ingenieria','EMaestria',0,'Universidad Ort') -- Error de unique key en mail
print 'ERROR INTENCIONAL POR TESTING'
insert into Investigador values('Andres de Sosa','andres2@gmail.com','077419832','Ingenieria','EMaestria',0,'Universidad Que no existe') -- Error de foreign key en universidad
print 'ERROR INTENCIONAL POR TESTING'
insert into Investigador values('Andres de Sosa','andres2@gmail.com','077419832','Ingenieria','',0,'Universidad Que no existe') --Error de check en nivelInvestig
print 'ERROR INTENCIONAL POR TESTING'

----Tabla Lugares(Datos Incorrectos) 

insert into Lugares values(1,'Muy interesante',3,YEAR(getdate()),MONTH(GETDATE()),null,null,'www.muyinteresante.com','Universidad Ort','Revistas') --error de PK duplicada
print 'ERROR INTENCIONAL POR TESTING'
insert into Lugares values(100,'Muy interesante',3,YEAR(getdate()),MONTH(GETDATE()),null,null,'www.muyinteresante.com','Universidad Ort','Revistas') --error de unique nombre duplicado
print 'ERROR INTENCIONAL POR TESTING'
insert into Lugares values(100,'Muy interesante2',0,YEAR(getdate()),MONTH(GETDATE()),null,null,'www.muyinteresante.com','Universidad Ort','Revistas') --error de check nivelLugar
print 'ERROR INTENCIONAL POR TESTING'
insert into Lugares values(100,'Muy interesante2',3,YEAR(getdate()),MONTH(GETDATE()),null,null,'www.muyinteresante.com','Universidad Que no existe','Revistas') --error de foreign key universidad
print 'ERROR INTENCIONAL POR TESTING'
insert into Lugares values(100,'Muy interesante2',3,YEAR(getdate()),MONTH(GETDATE()),null,null,'www.muyinteresante.com','Universidad Ort','No existe') --error de check tipoLugar
print 'ERROR INTENCIONAL POR TESTING'

----Tabla Trabajo(Datos Incorrectos)    ---------------------CREAR TRIGGER PARA VALIDAR FORMATO DEL ID ALFANUMERICO, expresiones regulares

insert into Trabajo values('A100','Seguridad Informatica','Articulo sobre Seguridad Informatica','articulo',getdate(),'www.segurinfo.com',100) --error FK lugarPublic
print 'ERROR INTENCIONAL POR TESTING'

----Tabla Tags(Datos Incorrectos)

insert into Tags values(null) --error por valor nulo
print 'ERROR INTENCIONAL POR TESTING'

----Tabla TTags(Datos Incorrectos)

insert into TTags values('A1',1) --error PK duplicada
print 'ERROR INTENCIONAL POR TESTING'
insert into TTags values(null,1) --error valor nulo idTrab
print 'ERROR INTENCIONAL POR TESTING'
insert into TTags values('A1',null) --error valor nulo idTag
print 'ERROR INTENCIONAL POR TESTING'

----Tabla TAutores(Datos Incorrectos)

insert into TAutores values('P2',1,'autor-ppal') --error PK duplicada
print 'ERROR INTENCIONAL POR TESTING'
insert into TAutores values('P2',5,'No Existe') --error CK rolInvestig
print 'ERROR INTENCIONAL POR TESTING'
insert into TAutores values('P100',5,'autor-ppal') --error FK idTrab 
print 'ERROR INTENCIONAL POR TESTING'
insert into TAutores values('P2',73,'autor-ppal') --error FK idInvestig 
print 'ERROR INTENCIONAL POR TESTING'

----Tabla Referencias(Datos Incorrectos)

insert into Referencias values('Z3','X11') --error FK idTrab
print 'ERROR INTENCIONAL POR TESTING'
