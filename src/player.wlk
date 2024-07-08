import wollok.game.*
import juego.*
import items.*
import visuals.*
import puntuaciones.*
import instanciasDeJuego.*

object cabezaDeSnake {
	var property aDondeIr 
	var property siguienteaDondeIr = "right" 
	var property nroDeParte = 0
	var property position = game.at(2, 3)
	var property image = derecha.image()
	const lasPartesDeSnake = [self]
	
	method image() = image
	
	method moverse() {
		aDondeIr = siguienteaDondeIr
		
		if (position.y() == 0 or position.y() == 12 or position.x() == 0 or position.x() == 16) 
			{self.colisionar()} 
			else {
		if (aDondeIr == "left") {
			position = position.left(1)
			image = "cabezaIzquierda.png"
		} if (aDondeIr == "up") {
			position = position.up(1)
			image = "cabezaArriba.png"
		} if (aDondeIr == "right") {
			position = position.right(1)
			image = "cabezaDerecha.png"
		} if (aDondeIr == "down") {
			position = position.down(1)
			image = "cabezaAbajo.png"}
		}
	}
	
	method agregar(parte) {lasPartesDeSnake.add(parte)}
	
	method reiniciar() {
		lasPartesDeSnake.clear()
		lasPartesDeSnake.add(self)
	}
	
	method encontrar(condicion) = lasPartesDeSnake.find(condicion)
	
	method crear() {
		self.agregar(new ParteDeSnake(
			nroDeParte = lasPartesDeSnake.last().nroDeParte() + 1,
	     	position = lasPartesDeSnake.last().position()))
	    game.addVisual(lasPartesDeSnake.last())
	}

	method ultimaParte() = lasPartesDeSnake.last()
	
	method colisionar() {pantallaDeMuerte.iniciar(1)}
	
	method paraTodas(efecto) = lasPartesDeSnake.forEach(efecto)
	
	method cuerpoTamanio() = lasPartesDeSnake.size()
}

class ParteDeSnake {
	var property aDondeIr = ""
	var property siguienteaDondeIr = ""
	var property nroDeParte = 0
	var property position = game.center()
	var property image = "cuerpoArAb.png" 
	
	method siguienteaDondeIr() = siguienteaDondeIr
	method aDondeIr() = aDondeIr
	
	method conseguirSiguienteaDondeIr(){
		siguienteaDondeIr = (cabezaDeSnake.encontrar(
			{p => p.nroDeParte() +1 == self.nroDeParte()}
		).aDondeIr())}
	
	method moverse() {
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
	
	
	method colisionar() {pantallaDeMuerte.iniciar(1)}	

}