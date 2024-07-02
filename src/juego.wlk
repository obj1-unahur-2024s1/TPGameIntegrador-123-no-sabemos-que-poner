import wollok.game.*
import player.*
import items.*
import interfazYMenu.*

object snake{
	var property puntos = 0
	const puntaje = new Puntaje(quePoner = puntos, position = game.at(15, 11))
	var item = null
	
    method juego(){
		pantallaDeInicio.iniciar(1)
	    game.start()
	    	    	    
	}
	
	method sumarPuntos(){
		puntos += 100 //funciona
		puntaje.cambiarTexto(puntos)
	}
	
	method terminarJuego(){
		game.stop()
	}
	method puntos() = puntos
	
    method personaje(){
    	// el jugador
		const jugador = new CabezaDeSnake(position = game.at(2,3), siguienteaDondeIr = "right")
		const parte1 = new ParteDeSnake(position = game.at(1,3), nroDeParte = 1, siguienteaDondeIr = "right")
		const parte2 = new ParteDeSnake(position = game.at(0,3), nroDeParte = 2, siguienteaDondeIr = "right")
		
		game.addVisual(fondoNivel)
		game.addVisual(puntaje)
		game.addVisual(jugador)
		game.addVisual(parte1)
		game.addVisual(parte2)
		self.items()
		
		lasPartesDeSnake.add(jugador)
		lasPartesDeSnake.add(parte1)
		lasPartesDeSnake.add(parte2)
		
		
		game.onCollideDo(jugador, {a => a.colisionar(/*ponerjuegoaqui*/)})
		
		keyboard.up().onPressDo({if (not (jugador.siguienteaDondeIr() == "down")) jugador.siguienteaDondeIr("up") else jugador.siguienteaDondeIr()})
		keyboard.down().onPressDo({if (not (jugador.siguienteaDondeIr() == "up")) jugador.siguienteaDondeIr("down") else jugador.siguienteaDondeIr()})
		keyboard.left().onPressDo({if (not (jugador.siguienteaDondeIr() == "right")) jugador.siguienteaDondeIr("left") else jugador.siguienteaDondeIr()})
		keyboard.right().onPressDo({if (not (jugador.siguienteaDondeIr() == "left")) jugador.siguienteaDondeIr("right") else jugador.siguienteaDondeIr()})

		
		game.onTick(300, "movimientoDelJugador", {lasPartesDeSnake.forEach({a => a.moverse()})})
		
		/*keyboard.up().onPressDo({jugador.siguienteaDondeIr("up")})
		keyboard.down().onPressDo({jugador.siguienteaDondeIr("down")})
		keyboard.left().onPressDo({jugador.siguienteaDondeIr("left")})
		keyboard.right().onPressDo({jugador.siguienteaDondeIr("right")})*/
		
	}
    method items(){
    	//items
		const manzana = new Manzana(position = game.at(10,10))
		item = manzana
		game.addVisual(manzana)
		keyboard.c().onPressDo({manzana.sacarViablesOcup()})
		
    }
    
    method pantallaDeMuerte(a) {
    	var on = a
    	
		game.addVisual(gameOver) 
		puntaje.position(game.at(10, 6))
		lasPartesDeSnake.forEach({cuerpo => game.removeVisual(cuerpo)})
		game.removeTickEvent("movimientoDelJugador")
		
		keyboard.space().onPressDo({
			if (on == 1){
			    game.removeVisual(gameOver)
			    game.removeVisual(item)
			    game.removeVisual(puntaje)
			    puntaje.position(game.at(15, 11))
			    puntos = 0
			    puntaje.quePoner(puntos)
			    item = null
			    lasPartesDeSnake.clear()
			    game.removeVisual(fondoNivel)                           
			    pantallaDeInicio.iniciar(1)		
			    on -= 1
			} 
				
		})
	}
}

object pantallaDeInicio {
	var property position = game.at(0, 0)
	var property image = "fondoVioleta.jpg"
		
	method iniciar(a) {
		var on = a
		game.addVisual(self)
		keyboard.q().onPressDo({snake.terminarJuego()})
		keyboard.enter().onPressDo({
			 if (on == 1){
			 	snake.personaje()
			    game.removeVisual(self)
			 	on -= 1
			 }
		})
	}
}

object gameOver {
	var property image = "fondoGameOver1.PNG"
	var property position = game.at(0, 0)
}

object fondoNivel {
	var property image = "FondoTablero.png"
	var property position = game.at(0, 0)
}