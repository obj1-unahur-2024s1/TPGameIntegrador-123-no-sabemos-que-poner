import wollok.game.*
import player.*
import items.*
import puntuaciones.*
import visuals.*
import instanciasDeJuego.*

object snake {
	var item = null
	var property hayBombas = false
	var nroDeBombas = 1
	
    method juego(){
		pantallaDeInicio.iniciar(1)
	    game.start()}
	
	method terminarJuego() {game.stop()}
	
    method personaje(dificultad){
		const jugador = new CabezaDeSnake(position = game.at(2,3), siguienteaDondeIr = "right")
		const parte1 = new ParteDeSnake(position = game.at(1,3), nroDeParte = 1, siguienteaDondeIr = "right")
		const parte2 = new ParteDeSnake(position = game.at(0,3), nroDeParte = 2, siguienteaDondeIr = "right")
		
		game.addVisual(fondoNivel)
		game.addVisual(puntaje)
		game.addVisual(jugador)
		game.addVisual(parte1)
		game.addVisual(parte2)
		self.items(dificultad)
		
		lasPartesDeSnake.add(jugador)
		lasPartesDeSnake.add(parte1)
		lasPartesDeSnake.add(parte2)
		
		
		game.onCollideDo(jugador, {a => a.colisionar()})
		
		keyboard.up().onPressDo({if (not (jugador.siguienteaDondeIr() == "down")) jugador.siguienteaDondeIr("up") else jugador.siguienteaDondeIr()})
		keyboard.down().onPressDo({if (not (jugador.siguienteaDondeIr() == "up")) jugador.siguienteaDondeIr("down") else jugador.siguienteaDondeIr()})
		keyboard.left().onPressDo({if (not (jugador.siguienteaDondeIr() == "right")) jugador.siguienteaDondeIr("left") else jugador.siguienteaDondeIr()})
		keyboard.right().onPressDo({if (not (jugador.siguienteaDondeIr() == "left")) jugador.siguienteaDondeIr("right") else jugador.siguienteaDondeIr()})

		
		game.onTick(300, "movimientoDelJugador", {lasPartesDeSnake.forEach({a => a.moverse()})})
			
	}
	
    method items(dificultad) {
		const manzana = new Manzana(position = game.at(10,10))
		const bomba = new Bomba(position = game.at (10,5))
		if (dificultad == "dificil") item =[manzana,bomba] else item = [manzana]
		item.forEach({items => game.addVisual(items)})
		keyboard.c().onPressDo({manzana.sacarViablesOcup()})	
    }
    
    method resetAllItems() {item.forEach({items => items.reset()})}
    
    method activarBombas() {hayBombas = true}
    
    method agregarBomba() {
    	if (nroDeBombas < 15) {
    		item.add(new Bomba(position = game.at(19,19)))
    		const nuevaBomba = item.last()
    		game.addVisual(nuevaBomba)
    		nroDeBombas += 1}
    }
    
    method pantallaDeMuerte(a) {
    	var on = a
    	
    	game.removeVisual(puntaje)
		puntaje.position(game.at(10, 6))
		puntaje.color("3C00FF")
		game.addVisual(gameOver)
		game.addVisual(puntaje)
		lasPartesDeSnake.forEach({cuerpo => game.removeVisual(cuerpo)})
		game.removeTickEvent("movimientoDelJugador")
		
		keyboard.space().onPressDo({
			if (on == 1) {
			    game.removeVisual(gameOver)
			    item.forEach({items => game.removeVisual(items)})
			    game.removeVisual(puntaje)
			    hayBombas = false
			    nroDeBombas = 1
			    puntaje.position(game.at(15, 11))
			    puntaje.color("F4FF00")
			    puntaje.puntos(0)
			    puntaje.quePoner(puntaje.puntos())
			    item = null
			    lasPartesDeSnake.clear()
			    game.removeVisual(fondoNivel)                           
			    pantallaDeInicio.iniciar(1)		
			    on -= 1}
		})
	}
}