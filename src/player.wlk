import wollok.game.*
import juego.*
import items.*
import puntuaciones.*

const lasPartesDeSnake = []

class ParteDeSnake {
	var property aDondeIr = null
	var property siguienteaDondeIr = null
	var property nroDeParte = 0
	var property position = game.center()
	var property image = "cuerpoArAb.png" 
	
	method siguienteaDondeIr() = siguienteaDondeIr
	method aDondeIr() = aDondeIr
	
	method conseguirSiguienteaDondeIr(){
		siguienteaDondeIr = (lasPartesDeSnake.find(
			{p => p.nroDeParte() +1 == self.nroDeParte()}
		).aDondeIr())
	}
	
	method moverse(){
		aDondeIr = siguienteaDondeIr
		if (aDondeIr == "left"){
			position = position.left(1)
			image = "cuerpoIzqDer.png"
		} if (aDondeIr == "up"){
			position = position.up(1)
			image = "cuerpoArAb.png"
		} if (aDondeIr == "right"){
			position = position.right(1)
			image = "cuerpoIzqDer.png"
		} if (aDondeIr == "down"){
			position = position.down(1)
			image = "cuerpoArAb.png"
		}
		self.conseguirSiguienteaDondeIr()
	}	
	
	method crecer(){
		lasPartesDeSnake.add(new ParteDeSnake(
	     	nroDeParte = lasPartesDeSnake.last().nroDeParte() + 1,
	     	position = lasPartesDeSnake.last().position()))
	     	 
	     game.addVisual(lasPartesDeSnake.last())
	}
	
	method colisionar() {
		    snake.pantallaDeMuerte(1)			
		}	

}

class CabezaDeSnake inherits ParteDeSnake {
	override method image() = image
	
	override method moverse(){
		aDondeIr = siguienteaDondeIr
		if (position.y() == 0 or position.y() == 12 or position.x() == 0 or position.x() == 16) 
			{self.colisionar()} 
			else {
		if (aDondeIr == "left"){
			position = position.left(1)
			image = "cabezaIzquierda.png"
		} if (aDondeIr == "up"){
			position = position.up(1)
			image = "cabezaArriba.png"
		} if (aDondeIr == "right"){
			position = position.right(1)
			image = "cabezaDerecha.png"
		} if (aDondeIr == "down"){
			position = position.down(1)
			image = "cabezaAbajo.png"
		}}
		}

}