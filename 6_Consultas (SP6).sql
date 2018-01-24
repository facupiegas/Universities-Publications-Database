----6)


----6.a)


select Trabajo.idTrab,Trabajo.nomTrab,Lugares.idLugar,Lugares.nombre,(select count(*) from TAutores where Trabajo.idTrab = TAutores.idTrab) as 'Cantidad Autores'
from Trabajo,Lugares
where idTrab in(select idTrab
				from TAutores
				group by idTrab
				having count(idTrab)>3)
	and Trabajo.lugarPublic = Lugares.idLugar			 


----6.b)

select distinct palabra --esta consulta trae todas las palabras para los idTrabajo filtrados en el where
from  Tags, TTags
where Tags.idTag = TTags.idTag and 
	  TTags.idTrab in ( select Trabajo.idTrab --esta consulta filtra los id de los trabajos que tienen Palabra clave BASE DE DATOS
					    from Trabajo, TTags, Tags
					    where Trabajo.idTrab = TTags.idTrab and
						      TTags.idTag = Tags.idTag and
						      lugarPublic in (select idLugar
										      from Lugares
										      where tipoLugar = 'Revistas' and año = year(getdate())) and
						      Tags.idTag = (select idTag
										    from Tags
										    where palabra = 'Base de Datos'))
and palabra <>'Base de Datos'
order by palabra											

----6.c)

select Universidad.nombre,Universidad.pais,Universidad.ciudad,Lugares.link 
from Lugares,Universidad
where nivelLugar = 4 and 
	  tipoLugar = 'Congresos' and 
	  año > YEAR(GETDATE()) - 5 and 
	  Lugares.universidad = Universidad.nombre
	  and Lugares.idLugar in (select lugarPublic 
							  from Trabajo
							  where lugarPublic = Lugares.idLugar
							  group by lugarPublic
							  having COUNT(*)>20)

----6.d)

select i.nombre, t.idTrab, t.nomTrab, t.descripTrab, t.tipoTrab, t.fechaInicio, t.linkTrab, t.lugarPublic, ta.rolinvestig
from Investigador i, Trabajo t, TAutores ta,
	 (select xta.idInvestigador, max(xt.fechaInicio) as fechaInicio 	      
	  from Trabajo xt,TAutores xta  	     
	  where xta.rolinvestig = 'autor-ppal' and 
			xt.idTrab = xta.idTrab  	  
	  group by xta.idInvestigador) as miTabla 
where miTabla.idInvestigador = i .idInvestigador and  	  
	  t.fechaInicio = miTabla.fechaInicio and  	  
	  t.idTrab = ta.idTrab and 	 	  
	  ta.idInvestigador = i.idInvestigador and
	  ta.rolinvestig = 'autor-ppal'



----6.e)


select idInvestigador,nombre,idUniversidad,(select count(*) 
											from Trabajo 
											where idTrab in (select idTrab 
															from TAutores
															 where TAutores.idInvestigador=Investigador.idInvestigador)
											and lugarPublic in(select idLugar 
															   from Lugares 
															   where nivelLugar=1 and 
															   año > YEAR(GETDATE()) - 5)) as 'Cantidad trabajos nivel 1',
											(select count(*) 
											 from Trabajo 
											 where idTrab in (select idTrab 
															 from TAutores
															 where TAutores.idInvestigador=Investigador.idInvestigador)
											 and lugarPublic in(select idLugar 
															   from Lugares 
															   where nivelLugar=2 and 
															   año > YEAR(GETDATE()) - 5)) as 'Cantidad trabajos nivel 2',
											(select count(*) 
											 from Trabajo 
											 where idTrab in (select idTrab 
															  from TAutores
															  where TAutores.idInvestigador=Investigador.idInvestigador)
											and lugarPublic in(select idLugar 
															   from Lugares 
															   where nivelLugar=3 and 
															   año > YEAR(GETDATE()) - 5)) as 'Cantidad trabajos nivel 3',
											(select count(*) 
											 from Trabajo 
											 where idTrab in (select idTrab 
															  from TAutores
															  where TAutores.idInvestigador=Investigador.idInvestigador)
											and lugarPublic in(select idLugar 
															   from Lugares 
															   where nivelLugar=4 and 
															   año > YEAR(GETDATE()) - 5)) as 'Cantidad trabajos nivel 4'
from Investigador
where carrera = 'Ingenieria'


----6.f)
select i.idInvestigador,s.nivel4 as 'Cantidad trabajos congresos de nivel 4'
from Investigador i,(select i.idInvestigador,count(nivelLugar) nivel4
						from Investigador i left join Lugares l join TAutores ta  join Trabajo t
						on t.idTrab = ta.idTrab
						on l.idLugar = t.lugarPublic
						on i.idinvestigador = ta.idInvestigador
						and year(t.fechaInicio) = year(getdate())
						and nivelLugar = 4 and TipoLugar = 'congresos'
						group by i.idInvestigador ) as s
where i.idinvestigador = s.idinvestigador
and i.idUniversidad = 'Universidad Ort'



----6.g)



--Devuelve error porque no puede retornar una tabla para cada resultado
select nombre,(select * from dbo.devolverUltimoTrabajoPublicado(nombre)) --esta funcion devuelve una tabla como retorno, por lo tanto no puede ser usada dentro de otra sentencia Select, por eso fue creada la version alternativa
from Universidad

--Alternativa, retorno el nombre de la universidad y un varchar que contiene todos los datos del ultimo trabajo
select nombre,dbo.devolverUltimoTrabajoPublicadoAlternativa(nombre) as 'Ultimo trabajo'
from Universidad
where nombre in(select universidad
				from Lugares,Trabajo
				where Trabajo.lugarPublic = Lugares.idLugar)


--Otra alternativa, la funcion devuelve el idTrab del ultimo trabajo de la universidad enviada por parametro

select nombre, Trabajo.*
from Universidad,Trabajo
where nombre in(select universidad
				from Lugares,Trabajo
				where Trabajo.lugarPublic = Lugares.idLugar)
and idTrab = dbo.devolverUltimoTrabajoPublicadoOtraAlternativa(nombre)



----6.h) 
delete 
from Tags
where idTag not in (select idTag
					from TTags)