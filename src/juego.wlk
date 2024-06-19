import wollok.game.*
import player.*

object snake{
	
 method iniciar(){
		game.cellSize(32)
		game.height(15)
		game.width(15)
		self.personaje()
	    game.start()
	    
	}
    method personaje(){
		const jugador = new CabezaDeSnake(position = game.at(2,3))
		const parte1 = new ParteDeSnake(position = game.at(1,3), nroDeParte = 1)
		const parte2 = new ParteDeSnake(position = game.at(0,3), nroDeParte = 2)
		game.addVisual(jugador)
		game.addVisual(parte1)
		game.addVisual(parte2)
		
		
		lasPartesDeSnake.add(jugador)
		lasPartesDeSnake.add(parte1)
		lasPartesDeSnake.add(parte2)
		
		keyboard.up().onPressDo({jugador.siguienteaDondeIr("up")})
		keyboard.down().onPressDo({jugador.siguienteaDondeIr("down")})
		keyboard.left().onPressDo({jugador.siguienteaDondeIr("left")})
		keyboard.right().onPressDo({jugador.siguienteaDondeIr("right")})
		
		game.onTick(500, "movimientoDelJugador",{lasPartesDeSnake.forEach({a => a.moverse()})})
	}
}

