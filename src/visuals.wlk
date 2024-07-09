import wollok.game.*
import player.*

// cabeza direcciones
object izquierda {
	var property image = "assets/cabezaIzquierda.png"
	var property position = null
	
	method avanzar(posicion) {
		position = posicion.left(1)
		cabezaDeSnake.position(position)
		cabezaDeSnake.image(image)
	}
	
}

object derecha {
	var property image = "assets/cabezaDerecha.png"
	var property position = null
	
	method avanzar(posicion){
		position = posicion.right(1)
		cabezaDeSnake.position(position)
		cabezaDeSnake.image(image)
	}
}



object arriba {
	var property image = "assets/cabezaArriba.png"
	var property position = null
	
	method avanzar(posicion){
		position = posicion.up(1)
		cabezaDeSnake.position(position)
		cabezaDeSnake.image(image)
	}
}

object abajo {
	var property image = "assets/cabezaAbajo.png"
	var property position = null
	
	method avanzar(posicion){
		position = posicion.down(1)
		cabezaDeSnake.position(position)
		cabezaDeSnake.image(image)
	}
}


// cuerpo direcciones
object cuerpoArAb {
	var property image = "assets/CuerpoArAb.png"
	var property position = null
	
	method avanzar(objeto){
		if (objeto.siguienteaDondeIr() == "down") {
			position = objeto.position().down(1)
			objeto.position(position) }
		else {
			position = objeto.position().up(1)
			objeto.position(position)
		}
		objeto.image(image)
	}
}

object cuerpoIzqDer {
	var property image = "assets/CuerpoIzqDer.png"
	var property position = null
	
	method avanzar(objeto){
		if (objeto.siguienteaDondeIr() == "left") {
			position = objeto.position().left(1)
			objeto.position(position) }
		else {
			position = objeto.position().right(1)
			objeto.position(position)
		}
		objeto.image(image)
	}
}


// pantallas
object gameOver {
	const property image = "assets/fondoGameOver.png"
	const property position = game.at(0, 0)
}

object fondoNivel {
	const property image = "assets/FondoTablero.png"
	const property position = game.at(0, 0)
	method reset(){}
}

object fondoMenu {
	const property position = game.at(0, 0)
	const property image = "assets/fondoVioleta.jpg"
}