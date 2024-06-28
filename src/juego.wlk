import wollok.game.*
import player.*

object snake{
	
 method iniciar(){
		game.cellSize(72)
		game.height(14)
		game.width(18)
		self.personaje()
	    game.start()
	    
	}
    method personaje(){
		const jugador = new CabezaDeSnake(position = game.at(2,3), siguienteaDondeIr = "right")
		const parte1 = new ParteDeSnake(position = game.at(1,3), nroDeParte = 1, siguienteaDondeIr = "right")
		const parte2 = new ParteDeSnake(position = game.at(0,3), nroDeParte = 2, siguienteaDondeIr = "right")
		const man1 = new Manzana(position = game.at(10,10))
		const man2 = new Manzana(position = game.at(5,10))
		game.addVisual(jugador)
		game.addVisual(parte1)
		game.addVisual(parte2)
		game.addVisual(man1)
		game.addVisual(man2)
		
		
		lasPartesDeSnake.add(jugador)
		lasPartesDeSnake.add(parte1)
		lasPartesDeSnake.add(parte2)
		game.onCollideDo(jugador,{a => a.comido()})
		
		game.onTick(300, "movimientoDelJugador",{lasPartesDeSnake.forEach({a => a.moverse()})})
		
		keyboard.up().onPressDo({if (not (jugador.siguienteaDondeIr() == "down")) jugador.siguienteaDondeIr("up") else jugador.siguienteaDondeIr()})
		keyboard.down().onPressDo({if (not (jugador.siguienteaDondeIr() == "up")) jugador.siguienteaDondeIr("down") else jugador.siguienteaDondeIr()})
		keyboard.left().onPressDo({if (not (jugador.siguienteaDondeIr() == "right")) jugador.siguienteaDondeIr("left") else jugador.siguienteaDondeIr()})
		keyboard.right().onPressDo({if (not (jugador.siguienteaDondeIr() == "left")) jugador.siguienteaDondeIr("right") else jugador.siguienteaDondeIr()})
		/*keyboard.up().onPressDo({jugador.siguienteaDondeIr("up")})
		keyboard.down().onPressDo({jugador.siguienteaDondeIr("down")})
		keyboard.left().onPressDo({jugador.siguienteaDondeIr("left")})
		keyboard.right().onPressDo({jugador.siguienteaDondeIr("right")})*/
		
		
	}
}

