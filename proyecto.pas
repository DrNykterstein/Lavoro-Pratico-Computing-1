{
*Este programa es software libre; Puedes redistribuirlo y modificarlo. 
* Bajo los términos de La Licencia Pública General de GNU 
* Esperando que sirva como referencia para proximos trabajos practicos y 
* ayude asi sea un poco a los estudiantes

* }
program Leota;

uses crt;

const
	NUM_AUTOS = 2;//Numero de modelos de autos
	NUM_VENDEDORES = 2;//Numero de Vendedores
	
//Defino la estructura
type
	tRangoVendedores = 1..NUM_VENDEDORES;
	tRangoAutos = 1..2000;//Suponiendo que vendan 2000 como maximo
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
var i,j,acumulador,cod: integer; getString:string[25]; flag: boolean;
begin
	acumulador:=0;
	for i:= 1 to NUM_VENDEDORES do
		begin
			with vendedores[i] do
				begin
					writeln('--- Introduzca los datos del vendedor ',i,' ---');
					repeat
					write('Nombre: ');
					readln(nombre);
					if(not((nombre[i] in ['A'..'Z']) or (nombre[i] in ['a'..'z']))) then
						writeln('Error, el nombre no puede tener caracteres numericos');
					until(((nombre[i] in ['A'..'Z']) or (nombre[i] in ['a'..'z'])));
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
							repeat
							//Robustez
							flag:= false;
							write('Ventas del Modelo ',j,' : ');
							readln(getString);//Obetengo el string
							//Convierto el string en un entero y lo paso a la autos vendidos
							val(getString,autosVendidos[j],cod);
							//Si el codigo es 0, la conversion fue correcta
							if(cod = 0) then
							begin
								writeln;
								acumulador:=acumulador+autosVendidos[j];
								flag:=true;//Lo declaro true para salir del repeat
							end
							else
								writeln('Por favor Introduzca un numero ');
							until(flag);
						end;
					acumuladorAutos:=acumulador;
				end;
		end;
end;

procedure reporteUno(var vendedores:tVendedores);
var i,j:integer;
begin
	clrscr;
	writeln('----------REPORTE UNO--------------------');
	for i:= 1 to NUM_VENDEDORES do
		begin
			writeln('-----------Vendedor ',i,'---------------------');
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
		end;

end;

procedure reporteDos(var vendedores:tVendedores);
var i,j,acumulador: integer;
begin
	clrscr;
	writeln('----------REPORTE DOS----------');
	writeln('Vendedores');
	writeln;
	for i:= 1 to NUM_VENDEDORES do
		begin
			acumulador:=0;
			writeln('--------------------------------------------');
			writeln(vendedores[i].nombre);
			for j:= 1 to NUM_AUTOS do
				begin
					write('Del Modelo ',j,' vendio ',vendedores[i].autosVendidos[j]);
					writeln;
					acumulador:=acumulador+vendedores[i].autosVendidos[j];
				end;
			writeln('Vendio en total ',acumulador);
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
var i,t,j:integer;
begin
	clrscr;
	t:= vendedores[1].acumuladorAutos; //Suponiendo que el primer vendedor obtuvo las mayores ventas
	for i:= 1 to NUM_VENDEDORES do
		begin
			if(vendedores[i].acumuladorAutos > t) then
				t:= vendedores[i].acumuladorAutos;
		end;
	for j:= 1 to NUM_VENDEDORES do
		begin
			if(t=vendedores[j].acumuladorAutos)then
				writeln(vendedores[j].nombre,' Es el ganador por mas autos vendidos');
			writeln;
		end;
end;


BEGIN
	textcolor(10);
	insertarDatos(vendedores);
	reporteUno(vendedores);
	writeln('Presione enter para ver el reporte 2...');
	readln;
	reporteDos(vendedores);
	totalVendidos(vendedores);
	writeln('Presione enter para ver el vendedor ganador...');
	readln;
	premioVendedor(vendedores);
	readkey;
END.

