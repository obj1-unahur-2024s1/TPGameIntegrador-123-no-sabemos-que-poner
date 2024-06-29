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
	var image = "manzana.png"
	method image() = image
	method comido(){
		 
	     lasPartesDeSnake.add(new ParteDeSnake(
	     	nroDeParte = lasPartesDeSnake.last().nroDeParte() + 1,
	     	position = lasPartesDeSnake.last().position()))
	     	 
	     game.addVisual(lasPartesDeSnake.last())
	     game.removeVisual(self)
	     
	}
}