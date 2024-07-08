import wollok.game.*
import player.*
import items.*

object puntaje {
	var property position = game.at(15, 11)
	var property color = "F4FF00"
	var property puntos = 0
	var property quePoner = puntos
	
	
	method text() = quePoner.toString()
	
	method textColor() = color
	
	method sumarPuntos() {puntos = puntos + 100}
	
	method colisionar() {}
	
	method reset(){}				  
}
