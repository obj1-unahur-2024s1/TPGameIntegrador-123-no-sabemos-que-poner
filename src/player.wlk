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
	
	method comido(){}
}

class CabezaDeSnake inherits ParteDeSnake {
	override method image() = image
	
	override method conseguirSiguienteaDondeIr(){
		keyboard.up().onPressDo(siguienteaDondeIr = "up")
		keyboard.down().onPressDo(siguienteaDondeIr = "down")
		keyboard.left().onPressDo(siguienteaDondeIr = "left")
		keyboard.right().onPressDo(siguienteaDondeIr = "right")
	}
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
class Manzana{
	var position
	var image = "manzana.png"
	method position() = position
	method image() = image
	method comido(){
		 
	     lasPartesDeSnake.add(new ParteDeSnake(
	     	nroDeParte = lasPartesDeSnake.last().nroDeParte() + 1,
	     	position = lasPartesDeSnake.last().position()))
	     	 
	     game.addVisual(lasPartesDeSnake.last())
	     game.removeVisual(self)
	     
	}
}

/*object jugador {
	
	var position = game.at(1,1)
	
	
	
	method position() = position
	method position(posicion){
		position = posicion
		
	}
	method image() = "cabeza.png"

	
	
	method moveArriba(){ 
		if (position.y()<14){
		self.position(position.up(1))
	}
		
	}
		
	method moveAbajo(){ 
		if (position.y()>0){
			self.position(position.down(1))
		}
		
	}
		
	method moveIzquierda(){ 
		if (position.x()>0){
			self.position(position.left(1))
		}
		
	}
		
	method moveDerecha(){ 
		if (position.x()<14){
			self.position(position.right(1))
		}
		
		
	}
		
	
}*/
/*class Cuerpo{
	
	var position = 0
	
	
	
	method image() = "cuerpo.png"
	method position() = position
	method position(posicion){
		position = posicion
	}
	
}*/
