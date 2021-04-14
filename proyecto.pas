
program Leota;

uses crt;

const
	NUM_AUTOS = 3;
	NUM_VENDEDORES = 2;
	
type
	tRangoVendedores = 1..NUM_VENDEDORES;
	tRangoAutos = 1..NUM_AUTOS;
	tAutosVendidos = array[tRangoVendedores] of tRangoAutos;
	tRVendedores = record
		nombre: string;
		autosVendidos: tAutosVendidos;
		//acumuladorAutos: integer;
		mes: string;
		rangoFecha: string;
		rangoFecha2: string;
	end;
	tVendedores = array[tRangoVendedores] of tRVendedores;
var
	vendedores: tVendedores;
	
procedure insertarDatos(var vendedores:tVendedores);
var i,j: integer;
begin
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
						end;
				end;
		end;
end;

procedure reporteUno(var vendedores:tVendedores);
var i,j:integer;
begin
	clrscr;
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
		
		
end;
	

BEGIN
	insertarDatos(vendedores);
	reporteUno(vendedores);
	reporteDos(vendedores);
	readkey;
END.

