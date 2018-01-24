----7)

----7.a)
go
create view Ejercicio7a
as
(select Lugares.idLugar,Lugares.nombre,Lugares.nivelLugar,
	   Lugares.año,Lugares.mes,Lugares.diaIni,
	   Lugares.diaFin,Lugares.link,Lugares.universidad,
	   Lugares.tipoLugar,count(idLugar) as 'Cantidad Trabajos'
from Lugares,Trabajo
where tipoLugar = 'Congresos' 
and Lugares.idLugar = Trabajo.lugarPublic
and Trabajo.idTrab in (select idTrab 
					   from TAutores 
					   where idInvestigador in(select idInvestigador 
											   from Investigador 
											   where idUniversidad <> Lugares.universidad)
					   group by idTrab)
group by Lugares.idLugar,Lugares.nombre,
		 Lugares.nivelLugar,Lugares.año,
		 Lugares.mes,Lugares.diaIni,
		 Lugares.diaFin,Lugares.link,
		 Lugares.universidad,Lugares.tipoLugar);

go
select * from Ejercicio7a


----7.b)
go
create view Ejercicio7b AS
	SELECT i.idInvestigador, t.tipoTrab,
	(select max(xt.fechaInicio) from Trabajo xt, TAutores xa where xt.idTrab = xa.idTrab and xa.idInvestigador = i.idInvestigador and xt.tipoTrab = t.tipoTrab) as fecha_ini_ult_trab,
	(select min(xt.fechaInicio) from Trabajo xt, TAutores xa where xt.idTrab = xa.idTrab and xa.idInvestigador = i.idInvestigador and xt.tipoTrab = t.tipoTrab) as fecha_ini_primer_trab
	FROM Investigador i
	LEFT OUTER JOIN TAutores a ON a.idInvestigador= i.idInvestigador,
	Trabajo t
	group by i.idInvestigador, t.tipoTrab
	
go
select * from Ejercicio7b
order by idInvestigador