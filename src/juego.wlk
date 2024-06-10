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
		game.addVisual(jugador)
		keyboard.up().onPressDo{jugador.moveArriba()}
		keyboard.down().onPressDo{jugador.moveAbajo()}
		keyboard.left().onPressDo{jugador.moveIzquierda()}
		keyboard.right().onPressDo{jugador.moveDerecha()}
	}
}

