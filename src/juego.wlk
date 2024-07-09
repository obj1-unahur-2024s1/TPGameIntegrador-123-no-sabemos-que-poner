import wollok.game.*
import player.*
import items.*
import puntuaciones.*
import visuals.*
import instanciasDeJuego.*

object snake {
	const items = []
	
    method juego(){
		pantallaDeInicio.iniciar(1)
	    game.start()}
	
	method terminarJuego() {game.stop()}
	
	
	
    method nivel(){
		const parte1 = new ParteDeSnake(position = game.at(1,3), nroDeParte = 1, siguienteaDondeIr = "right")
		const parte2 = new ParteDeSnake(position = game.at(0,3), nroDeParte = 2, siguienteaDondeIr = "right")
		
		game.addVisual(fondoNivel)
		game.addVisual(puntaje)
		cabezaDeSnake.image(derecha.image())
		game.addVisual(cabezaDeSnake)
		game.addVisual(parte1)
		game.addVisual(parte2)
		self.itemsEnJuego()
		
		cabezaDeSnake.agregar(parte1)
		cabezaDeSnake.agregar(parte2)
		
		
		game.onCollideDo(cabezaDeSnake, {a => a.colisionar()})
		
		keyboard.up().onPressDo({cabezaDeSnake.puedeIrArriba()})
		keyboard.down().onPressDo({cabezaDeSnake.puedeIrAbajo()})
		keyboard.left().onPressDo({cabezaDeSnake.puedeIrIzquierda()})
		keyboard.right().onPressDo({cabezaDeSnake.puedeIrDerecha()})

		
		game.onTick(300, "movimientoDelJugador", {cabezaDeSnake.paraTodasLasPartes({a => a.moverse()})})
			
	}
	
    method itemsEnJuego() {
		const manzana = new Manzana(position = game.at(10,10))
		const bomba = new Bomba(position = game.at (10,5))
		
		if (nivelDificil.estaActivado()) items.addAll([manzana,bomba]) else items.add(manzana)
		
		items.forEach({item => game.addVisual(item)})
    }
    
    
    
    method resetAllItems() {items.forEach({item => item.reset()})}
    
    method bombaNueva() {
    	items.add(new Bomba(position = game.at(19,19)))
    		const nuevaBomba = items.last()
    		game.addVisual(nuevaBomba)
    }
    
    method reiniciarItems() = items.clear()
    
    method paraTodosLosItems(condicion) = items.forEach(condicion)
}

