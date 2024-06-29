import wollok.game.*
import juego.*
import player.*


class ItemEnNivel{
	var property position 
	method reubicar(){
		const nuevox = 0.randomUpTo(game.width())
		const nuevoy = 0.randomUpTo(game.height())
		position = game.at(nuevox,nuevoy)
	}
}

class Manzana inherits ItemEnNivel{
	var property image = "manzana.png"
	
     method comer(ponerjuegoaqui){
		lasPartesDeSnake.last().crecer()
		self.reubicar()
		ponerjuegoaqui.sumarPuntos()
	}
	     
}
