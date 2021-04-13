
program Leota;

uses crt;

const
	NUM_AUTOS = 2;
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
			writeln('Mes: ',vendedores[i].mes);
			writeln(vendedores[i].rangoFecha,' Al ',vendedores[i].rangoFecha2);
			writeln('Vendedor: ',vendedores[i].nombre);
			for j:= 1 to NUM_AUTOS do
				begin
					writeln('-------------');
					write('Modelo ',j);
					writeln;
					write('Total Vendidos: ',vendedores[i].autosVendidos[j]);
					writeln;
					writeln('-------------');
				end;
		end;

end;

	

BEGIN
	insertarDatos(vendedores);
	reporteUno(vendedores);
END.

