
program Leota;

uses crt;

const
	NUM_AUTOS = 2;//Numero de modelos de autos
	NUM_VENDEDORES = 2;//Numero de Vendedores
	
//Defino la estructura
type
	tRangoVendedores = 1..NUM_VENDEDORES;
	tRangoAutos = 1..NUM_AUTOS;
	tAutosVendidos = array[tRangoVendedores] of tRangoAutos;
	tRVendedores = record
		nombre: string;
		autosVendidos: tAutosVendidos;
		acumuladorAutos: integer;
		mes: string;
		rangoFecha: string;
		rangoFecha2: string;
	end;
	tVendedores = array[tRangoVendedores] of tRVendedores;
var
	vendedores: tVendedores;//Se crea la estructura
	
procedure insertarDatos(var vendedores:tVendedores);
var i,j,acumulador: integer;
begin
	acumulador:=0;
	for i:= 1 to NUM_VENDEDORES do
		begin
			with vendedores[i] do
				begin
					writeln('--- Introduzca los datos del vendedor ',i,' ---');
					write('Nombre: ');
					readln(nombre);
					writeln;
					write('Introduzca el mes: ');
					readln(mes);
					writeln;
					write('Introduzca fecha inicial (DD/MM/AA): ');
					readln(rangoFecha);
					writeln;
					write('Introduzca fecha final del mes (DD/MM/AA): ');
					readln(rangoFecha2);
					writeln;
					write('--- Por favor introduzca las ventas del Vendedor ',nombre,' --- ');
					writeln;
					for j:= 1 to NUM_AUTOS do
						begin
							write('Ventas del Modelo ',j,' : ');
							readln(autosVendidos[j]);
							writeln;
							acumulador:=acumulador+autosVendidos[j];
						end;
					acumuladorAutos:=acumulador;
				end;
		end;
end;

procedure reporteUno(var vendedores:tVendedores);
var i,j:integer;
begin
	writeln('----------REPORTE UNO----------');
	writeln;
	for i:= 1 to NUM_VENDEDORES do
		begin
			writeln('--------------------------------------------');
			writeln('Mes: ',vendedores[i].mes);
			writeln(vendedores[i].rangoFecha,' Al ',vendedores[i].rangoFecha2);
			writeln('Vendedor: ',vendedores[i].nombre);
			for j:= 1 to NUM_AUTOS do
				begin
					writeln('Modelo ',j);
					writeln('Total Vendidos: ',vendedores[i].autosVendidos[j]);
					writeln;
				end;
			writeln('--------------------------------------------');
			writeln;
		end;

end;

procedure reporteDos(var vendedores:tVendedores);
var i,j: integer;
begin
	writeln('----------REPORTE DOS----------');
	writeln('Vendedores');
	writeln;
	for i:= 1 to NUM_VENDEDORES do
		begin
			writeln('--------------------------------------------');
			writeln(vendedores[i].nombre);
			for j:= 1 to NUM_AUTOS do
				begin
					write('Del Modelo ',j,' vendio ',vendedores[i].autosVendidos[j]);
					writeln;
				end;
			writeln('--------------------------------------------');
		end;
end;

procedure totalVendidos(var vendedores:tVendedores);
var i,j:integer; acumulador: array [1..NUM_AUTOS] of integer;
begin
	writeln('Total vendido por modelo: ');
	for i:= 1 to NUM_AUTOS do
		acumulador[i]:=0;
	
	for i:= 1 to NUM_VENDEDORES do
		for j:= 1 to NUM_AUTOS do
			acumulador[j]:=acumulador[j]+vendedores[i].autosVendidos[j];
			
	for j:= 1 to NUM_AUTOS do
		writeln('Modelo ',j,' : ',acumulador[j]);
	writeln('--------------------------------------------');
end;

procedure premioVendedor(var vendedores:tVendedores);
var i,j,t:integer;
begin
	t:= vendedores[1].acumuladorAutos; //Suponiendo que el primer vendedor obtuvo las mayores ventas
	for i:= 2 to NUM_VENDEDORES do
		begin
			if(vendedores[i].acumuladorAutos > t) then
				t:= vendedores[i].acumuladorAutos;
		end;
	for j:= 1 to NUM_VENDEDORES do
		if(t=vendedores[j].acumuladorAutos)then
			write(vendedores[j].nombre,' Es el ganador por mas autos vendidos');
		writeln;
end;


BEGIN
	textcolor(10);
	insertarDatos(vendedores);
	reporteUno(vendedores);
	reporteDos(vendedores);
	totalVendidos(vendedores);
	premioVendedor(vendedores);
	readkey;
END.

