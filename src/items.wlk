import wollok.game.*
import juego.*
import player.*
import puntuaciones.*
import instanciasDeJuego.*


class ItemEnNivel{
	var property position 
	
	method reset(){
		const nuevox = 0.randomUpTo(game.width())
		const nuevoy = 0.randomUpTo(game.height())
		game.onCollideDo(self, {a => a.reset()})
		position = game.at(nuevox,nuevoy)
	}
	   		
}

class Manzana inherits ItemEnNivel{
	var property image = "manzana.png"
	
     method colisionar() {
		cabezaDeSnake.crear()
		puntaje.sumarPuntos()
		puntaje.quePoner(puntaje.puntos())
		snake.resetAllItems()
		if (nivelDificil.estaActivado()){
			nivelDificil.agregarBomba()
		}
	}
	     
}

class Bomba inherits ItemEnNivel{
	var property image = "bomba.png"
	
	method colisionar(){
		pantallaDeMuerte.iniciar(1)
	}
}
