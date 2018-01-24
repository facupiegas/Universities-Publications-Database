----4)

----4.a)							
go							
create function devolverUltimoTrabajoPublicado(@idUni varchar(100))

RETURNS @trabajo TABLE 
(
    --columnas de la tabla que retorna la funcion
    idTrab varchar(10) not null,    
	nomTrab varchar(100) not null,    
	descripTrab varchar(200) not null,    
	tipoTrab varchar(20) not null,    
	fechaInicio date,    
	linkTrab varchar(200),        
	lugarPublic int
)
AS
BEGIN
insert into @trabajo select top 1 Trabajo.idTrab,Trabajo.nomTrab,Trabajo.descripTrab,Trabajo.tipoTrab,Trabajo.fechaInicio,Trabajo.linkTrab,Trabajo.lugarPublic 
					 from Trabajo,Lugares 
					 where lugarPublic = idLugar and universidad = @idUni
					 group by Trabajo.idTrab,Trabajo.nomTrab,Trabajo.descripTrab,Trabajo.tipoTrab,Trabajo.fechaInicio,Trabajo.linkTrab,Trabajo.lugarPublic
					 having fechaInicio = (select MAX(fechaInicio)
											from Trabajo,Lugares 
										where lugarPublic = idLugar and universidad = @idUni )
return
END				


go
create function devolverUltimoTrabajoPublicadoAlternativa(@idUni varchar(100))

RETURNS varchar(800)

AS
BEGIN

declare @idTrab varchar(10),
		@nomTrab varchar(100),
		@descripTrab varchar(200),
		@tipoTrab varchar(20),
		@fechaInicio date,
		@linkTrab varchar(200),
		@lugarPublic int,
		@retorno varchar(800)

		select top 1 @idtrab=Trabajo.idTrab,
		@nomTrab=Trabajo.nomTrab,
		@descripTrab=Trabajo.descripTrab,
		@tipoTrab=Trabajo.tipoTrab,
		@fechaInicio=Trabajo.fechaInicio,
		@linkTrab=Trabajo.linkTrab,
		@lugarPublic=Trabajo.lugarPublic 
					 from Trabajo,Lugares 
					 where lugarPublic = idLugar and universidad = @idUni
					 group by Trabajo.idTrab,Trabajo.nomTrab,Trabajo.descripTrab,Trabajo.tipoTrab,Trabajo.fechaInicio,Trabajo.linkTrab,Trabajo.lugarPublic
					 having fechaInicio = (select MAX(fechaInicio)
											from Trabajo,Lugares 
										where lugarPublic = idLugar and universidad = @idUni )
		set @retorno = @idTrab + ' - ' + @nomTrab + ' - ' + @descripTrab + ' - ' + @tipoTrab + ' - ' + cast(@fechaInicio as varchar) + ' - ' + @linkTrab + ' - ' + cast(@lugarPublic as varchar)

return @retorno
END	


create FUNCTION devolverUltimoTrabajoPublicadoOtraAlternativa(@idUni varchar(100))

RETURNS varchar(10)

AS
BEGIN

declare @idTrab varchar(10)
		

		select top 1 @idtrab=Trabajo.idTrab
					 from Trabajo,Lugares 
					 where lugarPublic = idLugar and universidad = @idUni
					 group by Trabajo.idTrab,Trabajo.nomTrab,Trabajo.descripTrab,Trabajo.tipoTrab,Trabajo.fechaInicio,Trabajo.linkTrab,Trabajo.lugarPublic
					 having fechaInicio = (select MAX(fechaInicio)
											from Trabajo,Lugares 
										where lugarPublic = idLugar and universidad = @idUni )
		
return @idTrab
END	

----4.b)
go
create function cantidadReferencias(@idTrabajo as varchar(10))
returns int	
as
begin
declare @retorno as int

	select @retorno = count(distinct idTrabreferenciado)
	from Referencias, TAutores
	where Referencias.idTrab = TAutores.idTrab
	and Referencias.idTrab = @idTrabajo
	and TAutores.idInvestigador not in(select idInvestigador 
									   from TAutores a
									   where a.idTrab = Referencias.idTrabReferenciado)

	return @retorno
end



----4.c)	
go	
create function devolverCantidadTrabajosPorAutores(@invA int, @invB int)

RETURNS int
AS
BEGIN
declare @cantidad int

select @cantidad = count(idTrab)
from Trabajo
where idTrab in (select idTrab 
				 from TAutores
			     where idTrab in (select idTrab
								  from TAutores
									where idInvestigador = @invA and 
									rolInvestig = 'autor-ppal' and 
									idTrab in (select idTrab
											   from TAutores
											   where idInvestigador = @invB)) 
											   or idTrab in (select idTrab
														     from TAutores
															 where idInvestigador = @invB and 
															 rolInvestig = 'autor-ppal' and 
															 idTrab in (select idTrab
															 from TAutores
															 where idInvestigador = @invA)))


	return @cantidad
END		

----4.d)
go
create procedure actualizarCantidadTrabajos
		@idInvestigador int
as
begin

declare @valorActual as int,
		@valorNuevo as int
		
		select @valorActual = cantTrabPub
		from Investigador
		where idInvestigador=@idInvestigador

		select @valorNuevo = count(*)
		from TAutores
		where idInvestigador=@idInvestigador

		if(@valorActual<>@valorNuevo)
			begin
			update Investigador
			set cantTrabPub = @valorNuevo
			where idInvestigador=@idInvestigador

			print 'Cantidad actual(' + cast(@valorActual as varchar) + ') incorrecta. El nuevo valor es: ' + cast(@valorNuevo as varchar)
			end
		else
			print 'Cantidad actual('+cast(@valorActual as varchar)+') correcta'

end



----4.e)
go
create function devolverCantidadTrabajosPorTemaEntreFechas(@desde int, @hasta int, @palabra varchar(50))

RETURNS int
AS
BEGIN
declare @cantidad int
select @cantidad = count(idTrab)
from trabajo
where @desde <= year(fechaInicio) and
	  @hasta >= year(fechaInicio) and
	  lugarPublic in (select idLugar
					  from Lugares
					  where tipoLugar = 'Libros' or tipoLugar = 'Revistas') and
	  idTrab in (select idTrab
				 from TTags
				 where idTag in (select idTag
								 from Tags
								 where palabra = @palabra))

return @cantidad
END

go


----4.f)
go
create function generarIdentificador(@tipoTrabajo as varchar(20))
returns varchar(10)
as 
begin
declare @retorno as varchar(10),
		@ultimoValor as int,
		@nuevoValor as int,
		@letra as character(1)

		if(@tipoTrabajo = 'poster')
			set @letra = 'P'
		if(@tipoTrabajo = 'articulo')
			set @letra = 'A'
		if(@tipoTrabajo = 'capitulo')
			set @letra = 'C'
		if(@tipoTrabajo = 'otro')
			set @letra = 'O'

		select @ultimoValor = MAX(cast(substring(idTrab,2,len(idtrab))as int))
		from Trabajo
		where tipoTrab = @tipoTrabajo

		IF (select count(*) from Trabajo where SUBSTRING(idTrab,1,1) = @letra )=0
		begin
			set @nuevoValor = 1
		end
		else
		begin

			set @nuevoValor = @ultimoValor + 1
		end
		set @retorno = @letra + cast(@nuevoValor as varchar)

	return @retorno 
end



----4.g)
go
create procedure devolverLugarUltimoCongresoDeArticuloUniversidad
	@idUni varchar(100)
AS
BEGIN
DECLARE
	@congreso table(nombre varchar(100) not null,   
				        nivelLugar int ,
						tipoLugar varchar(10),   
						año int not null,   
						mes int not null,   
						diaIni int,   
						diaFin int,   
						link varchar(200),   
						universidad varchar(50))


	insert @congreso select top 1 nombre, nivelLugar, tipoLugar, año, mes, diaIni, diaFin, link, universidad
			     from Lugares
		         where universidad = @idUni and
				 tipoLugar = 'Congresos' and
				 idLugar in (select lugarPublic
						    from Trabajo
							where tipoTrab = 'articulo')
				 group by nombre, tipoLugar, nivelLugar, año, mes, diaIni, diaFin, link,universidad
				 order by año desc,mes desc,diaIni desc
	if(select count(*) from @congreso) = 0
		print 'No se encontro un Articulo para la Universidad ingresada'
	else
		print 'Se encontro un Articulo para la Universidad ingresada'
		select * from @congreso

END


----4.h)
go
create function CantidadInvestigadoresConMasDeCinco(@tipoTrabajo as varchar(20))
returns int
as
begin
declare @retorno as int
	
	select @retorno = count(*)
	from (select idInvestigador
		  from TAutores,Trabajo
		  where Trabajo.tipoTrab = @tipoTrabajo and
			    Trabajo.idTrab = TAutores.idTrab 
		  group by idInvestigador
		  having count(*) = (select max(a.cantTrabajos)
							 from (select idInvestigador,count(*) as cantTrabajos
									from TAutores,Trabajo
									where Trabajo.tipoTrab = @tipoTrabajo and
									Trabajo.idTrab = TAutores.idTrab 
									group by idInvestigador
									having count(*)>5) as a)) as b

	return @retorno
end

go