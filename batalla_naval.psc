Funcion SaltoDeLinea ()
	Escribir ' '
Fin Funcion 

Funcion Separador ()
	Escribir  '------------------------------------------------------------------------'
FinFuncion

Funcion DatoInvalido (Tablero, CANT_FILAS, CANT_COLUMNAS )
	Limpiar Pantalla
	MostrarTablero(Tablero, CANT_FILAS, CANT_COLUMNAS )
	SaltoDeLinea()
	Separador()
	Escribir  'XXXXX Dato inválido XXXXX'
	Separador()
	SaltoDeLinea()
	SaltoDeLinea()
FinFuncion

Funcion text <- Espacios (cant_espacios)
	Definir text Como Caracter
	text = ''
	Para j<-1 Hasta cant_espacios Con Paso 1 Hacer
		text = text + ' ' 
	Fin Para
Fin Funcion 

Funcion Pausa(Tablero, CANT_FILAS, CANT_COLUMNAS )
	Limpiar Pantalla
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	Escribir '######    ####    ##  ##    #####    ####'
	Escribir '##   ##         ##   ##  ##   ##                 ##'
	Escribir '##   ##   #####   ##  ##    #####    #####'
	Escribir '#####   ##   ##   ##  ##          ##   ##    ##'
	Escribir	 '##        #####     ######  ######    #####'
	Escribir '##'
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	SaltoDeLinea()
	
	Separador()
	Escribir 'PULSA CUALQUIER TECLA PARA CONTINUAR'
	Separador()

	Esperar Tecla 
	Limpiar Pantalla
	
	MostrarTablero(Tablero, CANT_FILAS, CANT_COLUMNAS )
Fin Funcion 

Funcion PausaTexto ()
	SaltoDeLinea()
	Separador()
	Escribir "PULSA LA TECLA 0 PARA PAUSAR EL JUEGO"
	Separador()
	SaltoDeLinea()
Fin Funcion 

Funcion DatosIniciales (aciertos Por Referencia, primerAcierto Por Referencia, ultimoAcierto Por Referencia, turnosUsados Por Referencia, totalNoAcertados Por Referencia)
	aciertos = 0
	primerAcierto = 'No hubo aciertos en esta partida :('
	ultimoAcierto = 'No hubo aciertos en esta partida :('
	turnosUsados = 0
	totalNoAcertados = 0
Fin Funcion



Funcion nombre <- IngrearNombre ()
	
	Definir nombre Como Caracter
	
	SaltoDeLinea()
	Escribir 'Comenzando BATALLA NAVAL'
	SaltoDeLinea()	
	Escribir 'Ingresá tu nombre' Sin Saltar
	
	Leer nombre
	SaltoDeLinea()
	Escribir 'Bienvenido al juego ', nombre, '!'
	SaltoDeLinea()
Fin Funcion


Funcion IngresarFilasYColumnas (CANT_FILAS Por Referencia, CANT_COLUMNAS Por Referencia, nombreDeUsuario)
	
	Definir fila, columna Como Entero
	
	Separador()
	Escribir 'Bienvenido a la Batalla Naval ', nombreDeUsuario
	Separador()
	SaltoDeLinea()
	
	Repetir
		Escribir 'Con cuántas FILAS deseas jugar? (Min. 3 - Max. 9)' Sin Saltar
		Leer fila
		
		Si fila < 3 O fila > 9 Entonces
			Limpiar Pantalla
			DatoInvalido(0, 0, 0)
		FinSi
		
	Hasta Que fila >= 3 Y fila <= 9
	
	SaltoDeLinea()
	
	Repetir
		Escribir 'Con cuántas COLUMNAS deseas jugar? (Min. 3 - Max. 9)' Sin Saltar
		Leer columna
		
		Si columna < 3 O columna > 9 Entonces
			Limpiar Pantalla
			
			DatoInvalido(0, 0, 0)
		FinSi
		
	Hasta Que columna >= 3 Y columna <= 9
	
	CANT_FILAS = fila
	CANT_COLUMNAS = columna
	
Fin Funcion


Funcion  CANT_TURNOS_MULTIPLICADOR <- SeleccionarDificultad (CANT_TURNOS_MULTIPLICADOR)
	
	Limpiar Pantalla
	
	Definir dificultad Como Entero
	
	SaltoDeLinea()
	
	Repetir
		Escribir 'Seleccione la dificultad'
		SaltoDeLinea()
		Escribir '1. Facil'
		Escribir '2. Medio'
		Escribir '3. Dificil'
		Escribir '4. Experto'
		SaltoDeLinea()
		Leer dificultad
		
		Si dificultad < 1 O dificultad > 4 Entonces
			DatoInvalido(0, 0, 0 )
		FinSi
		
	Hasta Que dificultad >= 1 Y dificultad <= 4
	
	Limpiar Pantalla
	Separador()
	
	Segun dificultad Hacer
		1:
			CANT_TURNOS_MULTIPLICADOR = 4
			Escribir 'Dificultad: Facil'
		2:
			CANT_TURNOS_MULTIPLICADOR = 3
			Escribir 'Dificultad: Medio'
		3:
			CANT_TURNOS_MULTIPLICADOR = 2
			Escribir 'Dificultad: Dificil'
		4: 
			CANT_TURNOS_MULTIPLICADOR = 1
			Escribir 'Dificultad: Experto'
	Fin Segun
	
	
Fin Funcion



Funcion ArmarTableroVacio (Tablero por referencia, CANT_FILAS, CANT_COLUMNAS, CASILLERO_VACIO)
	
	Para i<-1 Hasta CANT_FILAS Con Paso 1 Hacer
		Para j<-1 Hasta CANT_COLUMNAS Con Paso 1 Hacer
			Tablero[i, j] = CASILLERO_VACIO
		Fin Para
	Fin Para
	
Fin Funcion




Funcion ArmarBarcos ( TableroRival Por Referencia, CANT_A_RELLERNAR Por Referencia, CONTADOR_FLOTAS Por Referencia, CANT_FILAS, CANT_COLUMNAS, CASILLERO_VACIO )
	Dimension Barcos[CANT_A_RELLERNAR]
	
	Definir MIN_BARCOS, MAX_BARCOS Como Entero
	Definir contador, contadorFlotas, flag, filaOColumna, nroFilaOColumna, desd, hast, codigo, valido Como Entero
	
	MIN_BARCOS = 2
	MAX_BARCOS = 4
	
	contador = CANT_A_RELLERNAR
	contadorFlotas = 0
	
	Mientras contador > 1 Hacer
		
		Si contador = MAX_BARCOS Entonces
			flag = MAX_BARCOS
		SiNo
			flag = Aleatorio(MIN_BARCOS, MAX_BARCOS)
		FinSi
		
		
		SI contador - flag >= 0 Entonces
			SI flag <= contador Entonces
				
				filaOColumna = Aleatorio(1,2)
				hast = 0
				
				Segun filaOColumna Hacer
					1:
						nroFilaOColumna = Aleatorio(1, CANT_FILAS)
						
						desd = Aleatorio(1, CANT_COLUMNAS)
						
						Si desd + flag <=  CANT_COLUMNAS Entonces
							hast = desd + flag - 1
						FinSi
					2:
						nroFilaOColumna = Aleatorio(1, CANT_COLUMNAS)
						
						desd = Aleatorio(1, CANT_FILAS)
						
						Si desd + flag <=  CANT_FILAS Entonces
							hast = desd + flag - 1
						FinSi
						
				Fin Segun
				
				Si hast > 0  Entonces
					valido = ValidarPosicionesDisponibles(TableroRival, filaOColumna, nroFilaOColumna, desd, hast, CASILLERO_VACIO)
					
					Si valido = 1 Entonces
						contador = contador - flag
						contadorFlotas = contadorFlotas + 1
					FinSi
					
				FinSi
				
				
			FinSi
			
		FinSi
		
	Fin Mientras
	
	CANT_A_RELLERNAR =  CANT_A_RELLERNAR - contador
	CONTADOR_FLOTAS = contadorFlotas
Fin Funcion


Funcion valido <- ValidarPosicionesDisponibles (TableroRival Por Referencia, filaOColumna, nroFilaOColumna, desd, hast, CASILLERO_VACIO)
	
	Definir i, valido, fila, columna Como Entero
	Definir simbolo Como caracter
	
	valido = 1	
	Segun filaOColumna
		1:
			// FILA
			simbolo = '='
			fila = nroFilaOColumna
			columna = desd
			
		2:
			// COLUMNA
			columna = nroFilaOColumna
			fila = desd
			simbolo = '||'
			
	FinSegun
	
	
	Para i <- desd Hasta hast  Con Paso 1 Hacer
		
		Segun  filaOColumna
			1:
				Si TableroRival[fila, i] = CASILLERO_VACIO Entonces
					TableroRival[fila, i]  = '[' + Espacios(2) + simbolo + Espacios(2) + ']'
				SiNo
					valido = 0
					i = hast + 1
				FinSi
				
				
			2: 
				Si TableroRival[i, columna]  = CASILLERO_VACIO Entonces
					TableroRival[i, columna]  = '[' + Espacios(2) + simbolo + Espacios(2) + ']'
				SiNo
					valido = 0
					i = hast + 1
				FinSi
				
		FinSegun
		
		
	Fin Para
	
FinFuncion

Funcion LlenarTableroRival (TableroRival por referencia, CANT_FILAS, CANT_COLUMNAS, CANT_A_RELLERNAR, CONTADOR_FLOTAS Por Referencia, CASILLERO_VACIO, CASILLERO_CON_BARCO, CANT_TURNOS)
	
	Definir totalALlenar, llenar Como Entero
	
	totalALlenar = CANT_A_RELLERNAR
	
	ArmarTableroVacio(TableroRival, CANT_FILAS, CANT_COLUMNAS, CASILLERO_VACIO)
	
	ArmarBarcos(TableroRival, CANT_A_RELLERNAR, CONTADOR_FLOTAS, CANT_FILAS, CANT_COLUMNAS, CASILLERO_VACIO)
	
	Escribir 'Cantidad de filas: ', CANT_FILAS
	Escribir 'Cantidad de columnas: ', CANT_COLUMNAS
	Escribir 'Tenes que destruir ', CONTADOR_FLOTAS, ' barcos para ganar'
	Separador()
	SaltoDeLinea()
	
Fin Funcion


Funcion MostrarInformacion (aciertos, CANT_TURNOS, CANT_A_RELLERNAR)
	Escribir 'Disparos disponibles: ' , CANT_TURNOS
	SaltoDeLinea()
	SaltoDeLinea()

	
FinFuncion

Funcion MostrarTablero (Tablero, CANT_FILAS, CANT_COLUMNAS)
	
	
	Para i<-1 Hasta CANT_FILAS Con Paso 1 Hacer
		
		Si i = 1 Entonces
			Escribir Espacios(13) Sin Saltar
			
			// Número de columnas
			Para n<-1 Hasta CANT_COLUMNAS Con Paso 1 Hacer
				Escribir Espacios(0) + '[' + Espacios(2) , n , Espacios(2) + ']' + Espacios(2) Sin Saltar
			Fin Para
			SaltoDeLinea()
			SaltoDeLinea()
		FinSi
		
		// Número de filas
		Escribir '[' + Espacios(2) , i , Espacios(2) + ']' + Espacios(4) Sin Saltar
		
		Para j<-1 Hasta CANT_COLUMNAS Con Paso 1 Hacer
			
			Escribir  Espacios(1), Tablero[i, j], Espacios(1) Sin Saltar
		Fin Para
		SaltoDeLinea()
		SaltoDeLinea()
	Fin Para
	
	SaltoDeLinea()
	
Fin Funcion

Funcion Disparar ( Tablero Por Referencia, TableroRival, fila, columna, nombre, turnosUsados Por Referencia, aciertos Por Referencia, primerAcierto Por Referencia, ultimoAcierto Por Referencia, totalNoAcertados Por Referencia, CANT_FILAS, CANT_COLUMNAS, CASILLERO_VACIO, CASILLERO_ACERTADO, CASILLERO_ERRADO, CANT_TURNOS Por Referencia, TOTAL_SIN_ACIERTOS Por Referencia )
	
	SaltoDeLinea()
	
	Si Tablero[fila, columna] = CASILLERO_VACIO Entonces
		Si TableroRival[fila, columna] <> CASILLERO_VACIO Entonces
			Tablero[fila, columna] = CASILLERO_ACERTADO
			aciertos = aciertos + 1
			MostrarTablero(Tablero, CANT_FILAS, CANT_COLUMNAS )
			Separador()
			Escribir CASILLERO_ACERTADO + ' ¡Bien hecho ', nombre,'!'
			Separador()
			
			
			// PRIMER acierto
			Si aciertos = 1 Entonces
				primerAcierto = 'Primer acierto en fila ' + ConvertirATexto(fila) +  ' y columna '+ ConvertirATexto(columna)  
			FinSi
			ultimoAcierto = 'Último acierto en fila ' + ConvertirATexto(fila)  + ' y columna ' + ConvertirATexto(columna)   
		SiNo
			Tablero[fila, columna] = CASILLERO_ERRADO
			MostrarTablero(Tablero, CANT_FILAS, CANT_COLUMNAS )
			Separador()
			Escribir CASILLERO_ERRADO + ' Agua! Vuelve a intentarlo'
			Separador()
			
			totalNoAcertados = totalNoAcertados + 1
		FinSi
		CANT_TURNOS = CANT_TURNOS - 1
		turnosUsados = turnosUsados + 1
	SiNo
		MostrarTablero(Tablero, CANT_FILAS, CANT_COLUMNAS )
		Separador()
		Escribir 'Ya disparaste a este lugar'
		Separador()
	FinSi
	
	SaltoDeLinea()
	
Fin Funcion


Funcion NuevoDisparo ( Tablero, TableroRival, nombre, turnosUsados Por Referencia, aciertos Por Referencia, primerAcierto Por Referencia, ultimoAcierto Por Referencia, totalNoAcertados Por Referencia, CANT_FILAS, CANT_COLUMNAS, CASILLERO_VACIO, CASILLERO_ACERTADO, CASILLERO_ERRADO, CANT_TURNOS Por Referencia )
	
	Definir fila, columna Como Entero
	
	Repetir
		PausaTexto()
		Escribir 'Disparar a la FILA: ( 1 - ', CANT_FILAS,' )' Sin Saltar
		Leer fila
		
		Si fila = 0 Entonces 
			Pausa(Tablero, CANT_FILAS, CANT_COLUMNAS )
		FinSi
		
		Si fila < 0 O fila > CANT_FILAS Entonces
			DatoInvalido(Tablero, CANT_FILAS, CANT_COLUMNAS )
		FinSi
		
	Hasta Que fila >= 1 Y fila <= CANT_FILAS
	
	Repetir
		Limpiar Pantalla
		MostrarTablero(Tablero, CANT_FILAS, CANT_COLUMNAS )
		PausaTexto()
		Escribir 'Disparar a la COLUMNA: ( 1 - ', CANT_COLUMNAS,' )' Sin Saltar
		Leer columna
		
		Si columna = 0 Entonces 
			Pausa(Tablero, CANT_FILAS, CANT_COLUMNAS )
		FinSi
		
		Si columna < 0 O columna > CANT_COLUMNAS Entonces
			DatoInvalido(Tablero, CANT_FILAS, CANT_COLUMNAS )
		FinSi
		
	Hasta Que columna >= 1 Y columna <= CANT_COLUMNAS
	
	Limpiar Pantalla
	
	Disparar( Tablero, TableroRival, fila, columna, nombre, turnosUsados, aciertos, primerAcierto, ultimoAcierto, totalNoAcertados, CANT_FILAS, CANT_COLUMNAS, CASILLERO_VACIO, CASILLERO_ACERTADO, CASILLERO_ERRADO, CANT_TURNOS, TOTAL_SIN_ACIERTOS )
	
Fin Funcion


Funcion MensajeFinal ( Tablero, TableroRival, aciertos, nombre, CANT_A_RELLERNAR, CANT_FILAS, CANT_COLUMNAS, CANT_TURNOS )
	
	Limpiar Pantalla
	
	
	SI CANT_TURNOS < CANT_A_RELLERNAR - aciertos Entonces
		Separador()
		Escribir 'Ya no te alcanzan los turnos para ganar esta partida'
		Separador()
		SaltoDeLinea
	FinSi
	
	Escribir 'Mi Tablero:'
	SaltoDeLinea()
	MostrarTablero(Tablero, CANT_FILAS, CANT_COLUMNAS )
	SaltoDeLinea()

	
	Si aciertos = CANT_A_RELLERNAR Entonces
		Escribir 'Tablero del rival:'
		SaltoDeLinea
		MostrarTablero(TableroRival, CANT_FILAS, CANT_COLUMNAS )
		Separador()
		Escribir '¡Felicidades ', nombre, ' has ganado :D!'
	SiNo
		Separador()
		Escribir'Malas noticias ', nombre, ', has perdido :('
	FinSi
	Separador()
	SaltoDeLinea()
	
Fin Funcion


Funcion accion <- MostrarMenu (Tablero, TableroRival, primerAcierto, ultimoAcierto, porcentajeTablaroUsado, porcentajeEfectividad, turnosUsados, totalNoAcertados, TOTAL_TURNOS, CANT_FILAS, CANT_COLUMNAS)
	
	Definir accion Como Entero
	accion = 9
	//	Repetir
	Mientras accion <> 0 y accion <> 1 Hacer
		
		
		SaltoDeLinea()
		
		Escribir 'Elegí una acción:'
		
		SaltoDeLinea()
		
		Escribir '1. Jugar de nuevo'
		Escribir '2. Primer acierto'
		Escribir '3. Último acierto'
		Escribir '4. Porcentaje del tablero lanzado'
		Escribir '5. Porcentaje de efectividad'
		Escribir '6. Cantidad de turnos usados'
		Escribir '7. Cantidad de casilleros sin aciertos'
		Escribir '8. Ver tablero del rival'
		Escribir '0. Salir'
		
		SaltoDeLinea()
		
		leer accion
		
		Limpiar Pantalla
		
		SaltoDeLinea()
		
		Escribir 'Mi tablero:'
		
		SaltoDeLinea()
		
		MostrarTablero( Tablero, CANT_FILAS, CANT_COLUMNAS )
		
		Separador()
		Segun accion Hacer
			1:
				Escribir '1. Nuevo juego'
			2:
				Escribir '2. ', primerAcierto
			3:
				Escribir '3. ', ultimoAcierto
			4:
				Escribir '4. Total del tablero jugado: ', porcentajeTablaroUsado, '%'
			5:
				Escribir '5. Total de efectividad de disparos: ', porcentajeEfectividad, '%'
			6: 	
				Escribir '6. Usaste ', turnosUsados, ' de ', TOTAL_TURNOS, ' disparos disponibles'
			7: 
				Escribir '7. Disparos no acertados: ', totalNoAcertados
			8: 	
				SaltoDeLinea()
				Escribir 'Tablero del rival:'
				SaltoDeLinea()
				MostrarTablero(TableroRival, CANT_FILAS, CANT_COLUMNAS )
		Fin Segun
		Separador()
		
		SaltoDeLinea()
	Fin Mientras
	
Fin Funcion



Funcion accionFinal <- JugarBatallaNaval (nombreDeUsuario)
	
	Limpiar Pantalla
	
	Definir CANT_FILAS, CANT_COLUMNAS, PORCENTAJE_A_RELLERAR, CANT_A_RELLERNAR, CONTADOR_FLOTAS, CANT_TURNOS_MULTIPLICADOR, CANT_TURNOS, TOTAL_TURNOS Como Entero
	Definir CASILLERO_VACIO, CASILLERO_ACERTADO, CASILLERO_ERRADO, CASILLERO_CON_BARCO Como caracter
	
	CASILLERO_VACIO = '[' + Espacios(2) + '  ' + Espacios(2) + ']'
	CASILLERO_ACERTADO = '[' + Espacios(2) + '#' + Espacios(2) + ']' 
	CASILLERO_ERRADO = '[' + Espacios(2) + '0' + Espacios(2) + ']' 
	CASILLERO_CON_BARCO ='[' + Espacios(2) + 'x' + Espacios(2) + ']'
	PORCENTAJE_A_RELLERAR = 30
	CONTADOR_FLOTAS = 0
	
	Definir primerAcierto, ultimoAcierto Como Caracter
	Definir aciertos, turnosUsados, totalNoAcertados, accionFinal, porcentajeTablaroUsado, porcentajeEfectividad Como Entero
	
	// Inicializamos variables
	DatosIniciales(aciertos, primerAcierto, ultimoAcierto, turnosUsados, totalNoAcertados)
	
	
	// El usuario elige la cantidad de Filas y Columnas del tablero y los definimos
	IngresarFilasYColumnas(CANT_FILAS, CANT_COLUMNAS, nombreDeUsuario)
	Dimension Tablero[CANT_FILAS, CANT_COLUMNAS]
	Dimension TableroRival[CANT_FILAS, CANT_COLUMNAS]
	
	
	// Calculamos los turnos según la dificultad que elija el usuario
	CANT_TURNOS_MULTIPLICADOR = SeleccionarDificultad(CANT_TURNOS_MULTIPLICADOR)
	CANT_A_RELLERNAR = TRUNC(CANT_FILAS * CANT_COLUMNAS * PORCENTAJE_A_RELLERAR / 100)
	CANT_TURNOS = TRUNC(CANT_TURNOS_MULTIPLICADOR * CANT_A_RELLERNAR)
	
	Si CANT_TURNOS > CANT_FILAS * CANT_COLUMNAS Entonces
		CANT_TURNOS = CANT_FILAS * CANT_COLUMNAS
	FinSi
	
	TOTAL_TURNOS = CANT_TURNOS
	
	
	// Llenamos el tablero del rival
	LlenarTableroRival(TableroRival, CANT_FILAS, CANT_COLUMNAS, CANT_A_RELLERNAR, CONTADOR_FLOTAS, CASILLERO_VACIO, CASILLERO_CON_BARCO, CANT_TURNOS)
	//	MostrarTablero(TableroRival, CANT_FILAS, CANT_COLUMNAS )
	
	
	// Llenamos el tablero con casilleros vacíos y lo mostramos
	ArmarTableroVacio(Tablero, CANT_FILAS, CANT_COLUMNAS, CASILLERO_VACIO)
	MostrarTablero(Tablero, CANT_FILAS, CANT_COLUMNAS )
	
	
	
	// Turnos para disparar
	Repetir
		NuevoDisparo(Tablero, TableroRival, nombre, turnosUsados, aciertos, primerAcierto, ultimoAcierto, totalNoAcertados, CANT_FILAS, CANT_COLUMNAS, CASILLERO_VACIO, CASILLERO_ACERTADO, CASILLERO_ERRADO, CANT_TURNOS)
		MostrarInformacion(aciertos, CANT_TURNOS, CANT_A_RELLERNAR)
	Hasta Que aciertos = CANT_A_RELLERNAR O CANT_TURNOS = 0 O CANT_TURNOS < CANT_A_RELLERNAR - aciertos
	
	
	// Mensaje para el final del juego
	MensajeFinal( Tablero, TableroRival, aciertos, nombre, CANT_A_RELLERNAR, CANT_FILAS, CANT_COLUMNAS, CANT_TURNOS  )
	
	// Calculos finales
	porcentajeTablaroUsado = TRUNC(turnosUsados / (CANT_FILAS * CANT_COLUMNAS) *  100)
	porcentajeEfectividad = TRUNC(aciertos / turnosUsados * 100)
	
	
	// Mostrar menú con opciones disponibles
	accionFinal = MostrarMenu(Tablero, TableroRival, primerAcierto, ultimoAcierto, porcentajeTablaroUsado, porcentajeEfectividad, turnosUsados, totalNoAcertados, TOTAL_TURNOS, CANT_FILAS, CANT_COLUMNAS)
	
Fin Funcion


// ALGORITMO
Algoritmo batalla_naval
	
	Definir jugar Como Entero
	
	jugar = 1
	
	Mientras jugar = 1 Hacer
		Escribir 'Ingrese su nombre' Sin Saltar
		Leer nombreDeUsuario 
		jugar = JugarBatallaNaval(nombreDeUsuario)
		Limpiar Pantalla
	Fin Mientras
	
	Limpiar Pantalla
FinAlgoritmo