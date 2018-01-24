----Tabla Universidad

insert into Universidad values('Universidad Ort','Uruguay','Montevideo'),
							  ('Universidad De La Republica','Uruguay','Montevideo'),
							  ('Universidad Catolica','Uruguay','Montevideo'),
							  ('Universidad De Buenos Aires','Argentina','Buenos Aires'),
							  ('Universidad De Medellin','Colombia','Medellin'),
							  ('Universidad De Massachusetts','Estados Unidos','Boston'),
							  ('Universidad Harvard','Estados Unidos','Cambridge')

----Tabla Investigador

insert into Investigador values ('Andres de Sosa','andres@gmail.com','077419832','Ingenieria','EMaestria',0,'Universidad Ort')
insert into Investigador values ('Plinio Gañi','plinio.gañi@gmail.com','177254471','Medicina','EGrado',0,'Universidad Ort')
insert into Investigador values ('Fernando Thul','fernando.thul@gmail.com','644127784','Ingenieria en Computacion','Doctor',0,'Universidad Catolica')
insert into Investigador values ('Rafael Cohen','rafael.cohen@gmail.com','177458836','Ingenieria','EDoctor',0,'Universidad De Buenos Aires')
insert into Investigador values ('Rodrigo Arim','rodrigo.arim@gmail.com','544117322','Economia','Doctor',0,'Universidad De Medellin')
insert into Investigador values ('Carlos Gomez','carlos.gomez@gmail.com','411669974','Abogacia','EGrado',0,'Universidad Harvard')
insert into Investigador values ('Pepe Gonzalez','pepe.gonzalez@gmail.com','41154344','Ingenieria','Doctor',0,'Universidad De La Republica')
insert into Investigador values ('Armando Gervaz','garvaza@gmail.com','547711248','Ingenieria','Doctor',0,'Universidad Ort')
insert into Investigador values ('Francisco Bouza','bouzaf@gmail.com','467711451','Ingenieria','EMaestria',0,'Universidad Ort')
insert into Investigador values ('Pepe Mujica','mujica@gmail.com','227748124','Ingenieria','EGrado',0,'Universidad Ort')


----Tabla Lugares

insert into Lugares values(1,'Muy interesante',3,2017,8,25,null,'www.muyinteresante.com','Universidad Ort','Revistas')
insert into Lugares values(2,'Bases de datos relacionales',3,2017,12,24,null,'www.bdrelacionales.com','Universidad Catolica','Revistas')
insert into Lugares values(3,'Cancer de Mama',4,2017,11,20,30,'www.cancerdemama.com','Universidad Harvard','Congresos')
insert into Lugares values(4,'Bitcoins',2,2017,11,12,25,'www.bitcoins.com','Universidad De Medellin','Congresos')
insert into Lugares values(5,'La importancia de las leyes',2,2015,10,12,null,'www.leyes.com','Universidad De Massachusetts','Libros')
insert into Lugares values(6,'La vida',1,2016,9,23,null,'www.lavida.com','Universidad De Buenos Aires','Libros')
insert into Lugares values(7,'Cancer de Pulmon',4,2017,10,15,25,'www.cancerdepulmon.com','Universidad Harvard','Congresos')
insert into Lugares values(8,'Hacking etico',4,2015,10,15,20,'www.hackingetico.com','Universidad Ort','Congresos')
insert into Lugares values(9,'Informatizate',3,2012,9,17,null,'www.informatizate.com','Universidad Harvard','Revistas')
insert into Lugares values(10,'Tecnologia a Diario',1,1999,12,31,null,'www.tecnodiario.com','Universidad De Medellin','Libros')

----Tabla Trabajo

insert into Trabajo values('A1','Seguridad Informatica','Articulo sobre Seguridad Informatica','articulo','2017-7-12','www.segurinfo.com',1)
insert into Trabajo values('A2','Inserts y Alters','Articulo sobre integridad referencial','articulo','2016-12-20','www.inseralt.com',2)
insert into Trabajo values('A3','Hackea para ayudar','Articulo sobre hacking etico','articulo','2015-09-01','www.hackeayuda.com',8)
insert into Trabajo values('A4','Informatica para cuidar tu salud','Articulo sobre la ayuda de la informatica para cuidar la salud','articulo','2012-9-10','www.inseralt.com',9)
insert into Trabajo values('A5','Adios a la era del papel','Articulo sobre los medios digitales','articulo','1999-11-20','www.adiospapel.com',10)
insert into Trabajo values('A6','No a las relaciones','Articulo sobre la tendencia en bases de datos no relacionales','articulo','2016-11-23','www.noalasrelaciones.com',2)

insert into Trabajo values('O1','Como Prevenir','Exposicion sobre prevencion de cancer','otro','2017-4-11','www.prevenir.com',3)
insert into Trabajo values('O2','Mineria de Bitcoins','Exposicion sobre mineria de bitcoins','otro','2017-9-10','www.mineria.com',4)
insert into Trabajo values('O3','Comida Saludable','Publicacion sobre comida saludable','otro','2017-7-20','www.comidasaludable.com',1)
insert into Trabajo values('O4','Reciclá','Publicacion sobre reciclar','otro','2016-5-10','www.recilar.com',6)
insert into Trabajo values('O5','Inversiones Digitales','Publicacion sobre inversiones en monedas digitales','otro','2016-12-12','www.inversiondigital.com',4)
insert into Trabajo values('O6','Ley de bancarizacion','Ley sobre inclusion financiera','otro','2015-9-5','www.mineria.com',5)

insert into Trabajo values('C1','Leyes','Capitulo sobre leyes','capitulo','2014-7-23','www.leyescapitulo.com',5)
insert into Trabajo values('C2','Salud y Bienestar','Capitulo sobre Salud','capitulo','2016-6-11','www.saludybien.com',6)
insert into Trabajo values('C3','Un mundo sin ataduras','Capitulo sobre articulos inalambricos','capitulo','1999-12-10','www.sinataduras.com',10)
insert into Trabajo values('C4','Ayuda en linea','Capitulo sobre servicios con asistencia en linea','capitulo','1998-8-11','www.asistenciaenlinea.com',10)
insert into Trabajo values('C5','Relacionate','Capitulo sobre los benificios de las BD relacionales','capitulo','2016-5-26','www.relacionate.com',2)
insert into Trabajo values('C6','Prohibido Fumar','Capitulo sobre los daños del cigarro','capitulo','2017-5-15','www.prohibidofumar.com',7)

insert into Trabajo values('P1','Genera ingresos extra','Poster sobre ingresos extra','poster','2017-9-12','www.generaextra.com',4)
insert into Trabajo values('P2','Relaciones en bases de datos','Poster sobre bases de datos relacionales','poster','2016-9-22',null,2)
insert into Trabajo values('P3','La tecnologia y la agricultura','Poster sobre la ayuda de la tecnologia en el agro','poster','2017-08-11','www.tecnoagro.com',1)
insert into Trabajo values('P4','La importancia de la prevencion','Poster sobre prevencion','poster','2017-3-9','www.impopreven.com',3)
insert into Trabajo values('P5','Tecnologia y sueño','Poster sobre ayuda tecnologica para el sueño','poster','2012-5-4','www.tecnosuenio.com',9)
insert into Trabajo values('P6','Fumadores pasivos','Poster sobre fumadores pasivos','poster','2017-3-5','www.fumadorpasivo.com',7)

insert into Trabajo values('A7','Filosofia de Bases de Datos','Articulo lo que no se ve de las bases de datos','articulo','2016-11-09','www.todoinsert.com',null)
insert into Trabajo values('O7','Historias de un DBA','Relatos sobre la vida de un DBA','otro','2015-11-09','www.dbahistorias.com',null)
insert into Trabajo values('C7','La vida de un Vegano','Como vivir sin la carne','capitulo','2017-08-09','www.onlyvegans.com',null)
insert into Trabajo values('P7','Los Peligros del Borrado en Cascada','Como no eliminar datos de una base de datos','poster','2017-05-09','www.borradocascada.com',null)

--------CREACION DE TRABAJOS PARA 4.h) y 6.c)------------
insert into Trabajo values('P8','SP 4H y 6C 1','Como testear un SP 1','poster','2017-05-09','www.testing4H.com',3)
insert into Trabajo values('P9','SP 4H y 6C 2','Como testear un SP 2','poster','2017-04-09','www.testing4H.com',3)
insert into Trabajo values('P10','SP 4H y 6C 3','Como testear un SP 3','poster','2017-07-09','www.testing4H.com',3)
insert into Trabajo values('P11','SP 4H y 6C 4','Como testear un SP 4','poster','2017-09-01','www.testing4H.com',3)
insert into Trabajo values('P12','SP 4H y 6C 5','Como testear un SP 5','poster','2017-02-09','www.testing4H.com',3)
insert into Trabajo values('P13','SP 4H y 6C 6','Como testear un SP 6','poster','2017-03-10','www.testing4H.com',3)
insert into Trabajo values('P14','SP 6C 7','Como testear un SP 7','poster','2017-05-09','www.testing4H.com',3) --
insert into Trabajo values('P15','SP 6C 8','Como testear un SP 8','poster','2017-04-09','www.testing4H.com',3)
insert into Trabajo values('P16','SP 6C 9','Como testear un SP 9','poster','2017-07-09','www.testing4H.com',3)
insert into Trabajo values('P17','SP 6C 10','Como testear un SP 10','poster','2017-09-19','www.testing4H.com',3)
insert into Trabajo values('P18','SP 6C 11','Como testear un SP 11','poster','2017-02-09','www.testing4H.com',3)
insert into Trabajo values('P19','SP 6C 12','Como testear un SP 12','poster','2017-03-10','www.testing4H.com',3)
insert into Trabajo values('P20','SP 6C 13','Como testear un SP 13','poster','2017-05-09','www.testing4H.com',3)
insert into Trabajo values('P21','SP 6C 14','Como testear un SP 14','poster','2017-04-09','www.testing4H.com',3)
insert into Trabajo values('P22','SP 6C 15','Como testear un SP 15','poster','2017-07-09','www.testing4H.com',3)
insert into Trabajo values('P23','SP 6C 16','Como testear un SP 16','poster','2017-09-09','www.testing4H.com',3)
insert into Trabajo values('P24','SP 6C 17','Como testear un SP 17','poster','2017-02-09','www.testing4H.com',3)
insert into Trabajo values('P25','SP 6C 18','Como testear un SP 18','poster','2017-03-10','www.testing4H.com',3)
insert into Trabajo values('P26','SP 6C 19','Como testear un SP 19','poster','2017-05-09','www.testing4H.com',3)
insert into Trabajo values('P27','SP 6C 20','Como testear un SP 20','poster','2017-04-09','www.testing4H.com',3) 
insert into Trabajo values('P28','SP 6C 21','Como testear un SP 21','poster','2017-07-09','www.testing4H.com',3)


--------AUTORES DE TRABAJOS PARA 4.h)------------
insert into TAutores values('P8',10,'autor-ppal')
insert into TAutores values('P8',9,'autor-sec')

insert into TAutores values('P9',10,'autor-ppal')
insert into TAutores values('P9',9,'autor-sec')

insert into TAutores values('P10',10,'autor-ppal')
insert into TAutores values('P10',9,'autor-sec')

insert into TAutores values('P11',10,'autor-ppal')
insert into TAutores values('P11',9,'autor-sec')

insert into TAutores values('P12',10,'autor-ppal')
insert into TAutores values('P12',9,'autor-sec')

insert into TAutores values('P13',10,'autor-ppal')
insert into TAutores values('P13',9,'autor-sec')

insert into TAutores values('P14',10,'autor-ppal')
insert into TAutores values('P14',9,'autor-sec')

insert into TAutores values('P15',10,'autor-ppal')
insert into TAutores values('P15',9,'autor-sec')

insert into TAutores values('P16',10,'autor-ppal')
insert into TAutores values('P16',9,'autor-sec')

insert into TAutores values('P17',10,'autor-ppal')
insert into TAutores values('P17',9,'autor-sec')

insert into TAutores values('P18',10,'autor-ppal')
insert into TAutores values('P18',9,'autor-sec')

insert into TAutores values('P19',10,'autor-ppal')
insert into TAutores values('P19',9,'autor-sec')

insert into TAutores values('P20',10,'autor-ppal')
insert into TAutores values('P20',9,'autor-sec')

insert into TAutores values('P21',10,'autor-ppal')
insert into TAutores values('P21',9,'autor-sec')

insert into TAutores values('P22',10,'autor-ppal')
insert into TAutores values('P22',9,'autor-sec')

insert into TAutores values('P23',10,'autor-ppal')
insert into TAutores values('P23',9,'autor-sec')

insert into TAutores values('P24',10,'autor-ppal')
insert into TAutores values('P24',9,'autor-sec')

insert into TAutores values('P25',10,'autor-ppal')
insert into TAutores values('P25',9,'autor-sec')

insert into TAutores values('P26',10,'autor-ppal')
insert into TAutores values('P26',9,'autor-sec')

insert into TAutores values('P27',10,'autor-ppal')
insert into TAutores values('P27',9,'autor-sec')

insert into TAutores values('P28',10,'autor-ppal')
insert into TAutores values('P28',9,'autor-sec')

----Tabla Tags

insert into Tags values('Informatica'),
						('Salud'),
						('Bitcoins'),
						('Cancer'),
						('Seguridad'),
						('Leyes'),
						('Economia'),
						('Bienestar'),
						('Base de Datos'),
						('Cryptomonedas'),
						('Oferta y Demanda'),
						---PALABRAS BASES DE DATOS---
						('Constraints'),
						('SQL'),               
						('Oracle'),            
						('Mongo'),			  
						('Triggers'),       
						('Tablas'),			   
						('Borrado en Cascada') 
--Tags para ser borrados por la consulta 6.h
insert into Tags values ('No pertence a ningun trabajo 1')
insert into Tags values ('No pertence a ningun trabajo 2')
insert into Tags values ('No pertence a ningun trabajo 3')
insert into Tags values ('No pertence a ningun trabajo 4')

----Tabla TTags

insert into TTags values
('A1',1),('A1',9),
('A2',17),('A2',19),
('O1',3),('O1',7),
('O2',13),('O2',23),
('C1',11),
('C2',15),
('P1',5),('P1',21),
('P2',1),('P2',27),
('A7',17),('A7',19),('A7',29),('A7',35), 
('O7',1),('O7',25),('O7',31),('O7',33), 
('C7',3), 
('P7',29),('P7',31),('P7',35),
('A3',1),('A3',9),
('A4',1),('A4',3),('A4',15),
('A5',1),
('A6',1),('A6',17),('A6',19),('A6',29),
('C3',1),('C3',15),
('C4',1),('C4',15),
('C5',1),('C5',17),('C5',25),
('C6',3),('C6',7),('C6',15),
('O3',3),('O3',15),
('O4',15),
('O5',1),('O5',5),('O5',13),('O5',21),('O5',23),
('O6',23),('O6',13),
('P3',1),('P3',13),
('P4',3),('P4',7),
('P5',1),('P5',15),
('P6',3),('P6',15)

----Tabla TAutores

insert into TAutores values('A1',1,'autor-ppal')
insert into TAutores values('A1',2,'autor-sec')
insert into TAutores values('A1',3,'autor-director')

insert into TAutores values('A2',3,'autor-ppal')
insert into TAutores values('A2',4,'autor-sec')
insert into TAutores values('A2',5,'autor-sec')
insert into TAutores values('A2',7,'autor-director')

insert into TAutores values('A3',10,'autor-ppal')
insert into TAutores values('A3',9,'autor-sec')
insert into TAutores values('A3',8,'autor-director')

insert into TAutores values('A4',4,'autor-ppal')
insert into TAutores values('A4',6,'autor-sec')
insert into TAutores values('A4',9,'autor-director')

insert into TAutores values('A5',8,'autor-ppal')
insert into TAutores values('A5',10,'autor-sec')
insert into TAutores values('A5',3,'autor-director')
insert into TAutores values('A5',2,'autor-sec')

insert into TAutores values('A6',3,'autor-ppal')
insert into TAutores values('A6',5,'autor-sec')
insert into TAutores values('A6',7,'autor-director')

insert into TAutores values('O1',2,'autor-director')

insert into TAutores values('O2',4,'autor-ppal')
insert into TAutores values('O2',5,'autor-sec')

insert into TAutores values('O3',2,'autor-ppal')
insert into TAutores values('O3',8,'autor-sec')

insert into TAutores values('O4',7,'autor-ppal')
insert into TAutores values('O4',9,'autor-sec')

insert into TAutores values('O5',1,'autor-ppal')

insert into TAutores values('O6',4,'autor-ppal')
insert into TAutores values('O6',5,'autor-sec')
insert into TAutores values('O6',8,'autor-director')
insert into TAutores values('O6',9,'autor-sec')


insert into TAutores values('C1',5,'autor-ppal')
insert into TAutores values('C1',6,'autor-sec')

insert into TAutores values('C2',2,'autor-ppal')

insert into TAutores values('C3',3,'autor-ppal')
insert into TAutores values('C3',8,'autor-sec')

insert into TAutores values('C4',8,'autor-ppal')
insert into TAutores values('C4',2,'autor-sec')

insert into TAutores values('C5',1,'autor-ppal')
insert into TAutores values('C5',2,'autor-sec')
insert into TAutores values('C5',4,'autor-director')
insert into TAutores values('C5',10,'autor-sec')

insert into TAutores values('C6',2,'autor-ppal')
insert into TAutores values('C6',1,'autor-sec')


insert into TAutores values('P1',4,'autor-ppal')
insert into TAutores values('P1',5,'autor-sec')
insert into TAutores values('P1',7,'autor-sec')
insert into TAutores values('P1',6,'autor-director')

insert into TAutores values('P2',1,'autor-ppal')
insert into TAutores values('P2',4,'autor-sec')
insert into TAutores values('P2',7,'autor-director')

insert into TAutores values('P3',1,'autor-ppal')
insert into TAutores values('P3',9,'autor-sec')
insert into TAutores values('P3',10,'autor-director')

insert into TAutores values('P4',2,'autor-ppal')
insert into TAutores values('P4',8,'autor-sec')
insert into TAutores values('P4',7,'autor-director')

insert into TAutores values('P5',7,'autor-ppal')

insert into TAutores values('P6',4,'autor-ppal')
insert into TAutores values('P6',9,'autor-director')


insert into TAutores values('A7',8,'autor-ppal') 
insert into TAutores values('A7',10,'autor-director')

insert into TAutores values('O7',10,'autor-ppal') 
insert into TAutores values('O7',9,'autor-director')

insert into TAutores values('C7',2,'autor-ppal') 
insert into TAutores values('C7',4,'autor-director')

insert into TAutores values('P7',3,'autor-ppal') 
insert into TAutores values('P7',10,'autor-director')

----Tabla Referencias
insert into Referencias values('P1','O2')
insert into Referencias values('P2','A2') 
insert into Referencias values('C2','O1')
insert into Referencias values('A7','O7') 
insert into Referencias values('C2','C7') 
insert into Referencias values('P7','A2') 


