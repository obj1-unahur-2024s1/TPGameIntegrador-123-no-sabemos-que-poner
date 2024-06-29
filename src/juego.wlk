import wollok.game.*
import player.*
import items.*
import interfazYMenu.*

object snake{
	var property puntos = 0
	const puntaje = new Puntaje(quePoner = puntos)
	
	
    method juego(){
		
		
		//sistema de puntaje
		
		//puntaje.text(puntos)
		game.addVisual(puntaje)
		
		self.personaje()
		self.items()
	    game.start()
	    	    	    
	}
	
	method sumarPuntos(){
		puntos += 1 //funciona
		puntaje.cambiarTexto(puntos)
	}
	
	method terminarJuego(){
		game.stop()
	}
	
    method personaje(){
    	
    	
    	// el jugador
		const jugador = new CabezaDeSnake(position = game.at(2,3), siguienteaDondeIr = "right")
		const parte1 = new ParteDeSnake(position = game.at(1,3), nroDeParte = 1, siguienteaDondeIr = "right")
		const parte2 = new ParteDeSnake(position = game.at(0,3), nroDeParte = 2, siguienteaDondeIr = "right")

		game.addVisual(jugador)
		game.addVisual(parte1)
		game.addVisual(parte2)
		
		lasPartesDeSnake.add(jugador)
		lasPartesDeSnake.add(parte1)
		lasPartesDeSnake.add(parte2)
		
		game.onTick(300, "movimientoDelJugador",{lasPartesDeSnake.forEach({a => a.moverse()})})
		
		keyboard.up().onPressDo({if (not (jugador.siguienteaDondeIr() == "down")) jugador.siguienteaDondeIr("up") else jugador.siguienteaDondeIr()})
		keyboard.down().onPressDo({if (not (jugador.siguienteaDondeIr() == "up")) jugador.siguienteaDondeIr("down") else jugador.siguienteaDondeIr()})
		keyboard.left().onPressDo({if (not (jugador.siguienteaDondeIr() == "right")) jugador.siguienteaDondeIr("left") else jugador.siguienteaDondeIr()})
		keyboard.right().onPressDo({if (not (jugador.siguienteaDondeIr() == "left")) jugador.siguienteaDondeIr("right") else jugador.siguienteaDondeIr()})
		
		game.onTick(300, "movimientoDelJugador",{lasPartesDeSnake.forEach({a => a.moverse()})})
		
		game.onCollideDo(jugador,{a => a.comer(self)})
		
		/*keyboard.up().onPressDo({jugador.siguienteaDondeIr("up")})
		keyboard.down().onPressDo({jugador.siguienteaDondeIr("down")})
		keyboard.left().onPressDo({jugador.siguienteaDondeIr("left")})
		keyboard.right().onPressDo({jugador.siguienteaDondeIr("right")})*/
		
		
	}
    method items(){
    	//items
		const manzana = new Manzana(position = game.at(10,10))
		game.addVisual(manzana)
    }
}


