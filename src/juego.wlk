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
		const jugador = new CabezaDeSnake()
		game.addVisual(jugador)
	}
}

