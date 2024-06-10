import wollok.game.*
import juego.*


object jugador {
	
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
		
	
}
class Cuerpo{
	
	var position = 0
	
	
	
	method image() = "cuerpo.png"
	method position() = position
	method position(posicion){
		position = posicion
	}
	
}
