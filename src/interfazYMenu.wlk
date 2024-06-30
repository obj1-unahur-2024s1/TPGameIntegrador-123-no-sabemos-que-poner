import wollok.game.*
import player.*
import items.*

class Puntaje {
	var property position = game.center()
	var property quePoner 
	method text() = quePoner.toString()
	method cambiarTexto(nuevo){
		quePoner = nuevo.toString()
	}
	method colisionar(/*ponerjuegoaqui*/){}
}
