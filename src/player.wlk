import wollok.game.*
import juego.*
import items.*

const lasPartesDeSnake = []

class ParteDeSnake {
	var property aDondeIr = null
	var property siguienteaDondeIr = null
	var property nroDeParte = 0
	var property position = game.center()
	var property image = "cuerpoArAb.png" //importa que sea una propiedad para que se abra el programa
	
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
	
	method comer(ponerjuegoaqui){
		ponerjuegoaqui.terminarJuego()
	}
	
}

class CabezaDeSnake inherits ParteDeSnake {
	override method image() = image
	
	override method conseguirSiguienteaDondeIr(){/*
        keyboard.up().onPressDo(if (aDondeIr == "down") siguienteaDondeIr = "up" else siguienteaDondeIr)
		keyboard.down().onPressDo(if (aDondeIr == "up") siguienteaDondeIr = "down" else siguienteaDondeIr)
		keyboard.left().onPressDo(if (aDondeIr == "right") siguienteaDondeIr = "left" else siguienteaDondeIr)
		keyboard.right().onPressDo(if (aDondeIr == "left") siguienteaDondeIr = "right" else siguienteaDondeIr)
*/	}
	override method moverse(){
		aDondeIr = siguienteaDondeIr
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
		}
	}
}
