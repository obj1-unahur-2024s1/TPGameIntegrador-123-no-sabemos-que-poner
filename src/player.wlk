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
		
		if (self.estaEnElBorde()) {
			self.colisionar()} 
		else {
			if (aDondeIr == "left") {izquierda.avanzar(position)} 
			if (aDondeIr == "up") {arriba.avanzar(position)} 
			if (aDondeIr == "right") {derecha.avanzar(position)} 
			if (aDondeIr == "down") {abajo.avanzar(position)}}	
	}
	
	method estaEnElBorde() {
		return position.y() == 0 or 
			   position.y() == 12 or 
			   position.x() == 0 or 
			   position.x() == 16
	}
	
	method puedeIrDerecha() {
		if (not (self.siguienteaDondeIr() == "left")) 
			 self.siguienteaDondeIr("right") 
		else self.siguienteaDondeIr()
	}
	
	method puedeIrIzquierda() {
		if (not (self.siguienteaDondeIr() == "right"))
		 	self.siguienteaDondeIr("left") 
		else self.siguienteaDondeIr()
	}
	
	method puedeIrArriba() {
		if (not (self.siguienteaDondeIr() == "down")) 
			self.siguienteaDondeIr("up") 
		else self.siguienteaDondeIr()
	}
	
	method puedeIrAbajo() {
		if (not (self.siguienteaDondeIr() == "up")) 
			self.siguienteaDondeIr("down") 
		else self.siguienteaDondeIr()}
	
	method agregar(parte) {lasPartesDeSnake.add(parte)}
	
	method reiniciar() {
		lasPartesDeSnake.clear()
		lasPartesDeSnake.add(self)
	}
	
	method encontrar(condicion) = lasPartesDeSnake.find(condicion)
	
	method crearParte() {
		self.agregar(new ParteDeSnake(
			nroDeParte = lasPartesDeSnake.last().nroDeParte() + 1,
	     	position = lasPartesDeSnake.last().position()))
	    game.addVisual(lasPartesDeSnake.last())
	}

	method ultimaParte() = lasPartesDeSnake.last()
	
	method colisionar() {pantallaDeMuerte.iniciar(1)}
	
	method paraTodasLasPartes(efecto) = lasPartesDeSnake.forEach(efecto)
	
	method cuerpoTamanio() = lasPartesDeSnake.size()
	
	method reset(){}
}

class ParteDeSnake {
	var property aDondeIr = ""
	var property siguienteaDondeIr = ""
	var property nroDeParte = 0
	var property position = game.center()
	var property image = cuerpoIzqDer.image()
	
	method siguienteaDondeIr() = siguienteaDondeIr
	method aDondeIr() = aDondeIr
	
	method conseguirSiguienteaDondeIr(){
		siguienteaDondeIr = (cabezaDeSnake.encontrar(
			{p => p.nroDeParte() +1 == self.nroDeParte()}
		).aDondeIr())}
	
	method moverse() {
		aDondeIr = siguienteaDondeIr
		
		if (aDondeIr == "left") {cuerpoIzqDer.avanzar(self)} 
		if (aDondeIr == "up") {cuerpoArAb.avanzar(self)} 
		if (aDondeIr == "right") {cuerpoIzqDer.avanzar(self)} 
		if (aDondeIr == "down") {cuerpoArAb.avanzar(self)}
		
		self.conseguirSiguienteaDondeIr()
	}		
	
	method colisionar() {pantallaDeMuerte.iniciar(1)}
	
	method reset(){}	

}
