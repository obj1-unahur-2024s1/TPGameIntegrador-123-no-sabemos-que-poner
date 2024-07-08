import wollok.game.*

// cabeza direcciones
object izquierda {
	var property image = "assets/cabezaIzquierda.png"
	var property position = null
}

object derecha {
	var property image = "assets/cabezaDerecha.png"
	var property position = null
}



object arriba {
	var property image = "assets/cabezaArriba.png"
	var property position = null
}

object abajo {
	var property image = "assets/cabezaAbajo.png"
	var property position = null
}


// cuerpo direcciones
object cuerpoArAb {
	var property image = "assets/CuerpoArAb.png"
	var property position = null
}

object cuerpoIzqDer {
	var property image = "assets/CuerpoIzqDer.png"
	var property position = null
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