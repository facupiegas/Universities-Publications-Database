----5)

----5.a)
go
create trigger insertarTrabajo
on Trabajo
instead of insert
as
begin

	if (select count(*) from inserted where fechaInicio is null) >0
	begin
		insert into Trabajo select dbo.generarIdentificador(tipoTrab),nomTrab,descripTrab,tipoTrab,'01/01/'+CAST(YEAR(GETDATE()) as varchar),linkTrab,lugarPublic 
								   from inserted 
								   where fechaInicio is null

		insert into Trabajo select dbo.generarIdentificador(tipoTrab),nomTrab,descripTrab,tipoTrab,fechaInicio,linkTrab,lugarPublic 
								   from inserted 
								   where fechaInicio is not null
		
	end
	else
		insert into Trabajo select dbo.generarIdentificador(tipoTrab),nomTrab,descripTrab,tipoTrab,fechaInicio,linkTrab,lugarPublic 
								   from inserted								   
end

----5.b)
go
create trigger noEliminarTrabajosNoPublicadosHaceMenosDeDosAnios
on Trabajo
instead of delete
as
begin
	delete from Referencias
	where idTrab in (select idTrab
					 from deleted
					 where lugarPublic in (select idTrab
										   from deleted
										   where abs(datediff(year, cast(GetDate() as date), fechaInicio)) > 2 and
										   lugarPublic is null)) or
					 idTrabReferenciado in (select idTrab
											from deleted
											where abs(datediff(year, cast(GetDate() as date), fechaInicio)) > 2 and
											lugarPublic is null)
	delete from TAutores
	where idTrab in (select idTrab
					 from deleted
					 where abs(datediff(year, cast(GetDate() as date), fechaInicio)) > 2 and
					 lugarPublic is null)
	delete from TTags
	where idTrab in (select idTrab
					 from deleted
					 where abs(datediff(year, cast(GetDate() as date), fechaInicio)) > 2 and
					 lugarPublic is null)
	delete from Trabajo
	where idTrab in (select idTrab
					 from deleted
					 where abs(datediff(year, cast(GetDate() as date), fechaInicio)) > 2 and
					 lugarPublic is null)
end

----5.c)
go
create trigger noInsertarReferenciasConTemaEnComun
on Referencias
instead of insert
as
begin

		insert into Referencias select inserted.idTrab,inserted.idTrabReferenciado from inserted
								where idTrab not in (select inserted.idTrab 
												from TTags,inserted 
												where TTags.idTrab = inserted.idTrab and idTag in (select idTag 
																									   from TTags 
																									   where TTags.idTrab = inserted.idTrabReferenciado))
end


----5.d)
go
create table AuditoriaLugares (id int identity(1,1),
							   idLugar int not null,   
							   operacion varchar(100) not null,
							   usuario varchar(100) not null,   
							   fechaYHora datetime,
							   constraint PK_AuditoriaLugares primary key(id),
							   constraint FK_AuditoriaLugares_Lugares foreign key(idLugar) references Lugares(idLugar) )


go


create trigger auditoriaInsertsUpdatesLugares
on Lugares
after insert, update
as
begin
	
	 if(select count(*) from inserted)>0
		if(select count(*) from deleted)>0
		
		
			insert into AuditoriaLugares select inserted.idLugar,'UPD',user_name(),getdate()
										 from inserted,deleted
										 where inserted.idLugar = deleted.idLugar and inserted.idLugar in (select lugarPublic
																								  from Trabajo
																								  where lugarPublic is not null)
		else
		
			insert into AuditoriaLugares select idLugar,'INS',user_name(),getdate()
										 from inserted
end