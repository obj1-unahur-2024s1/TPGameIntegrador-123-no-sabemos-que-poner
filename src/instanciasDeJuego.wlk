import wollok.game.*
import items.*
import player.*
import visuals.*
import juego.*
import puntuaciones.*

object pantallaDeInicio {
		
	method iniciar(a) {
		var on = a
		game.addVisual(fondoMenu)
		
		keyboard.q().onPressDo({snake.terminarJuego()})
		
		keyboard.num1().onPressDo({
			 if (on == 1){
			 	snake.personaje()
			    game.removeVisual(fondoMenu)
			 	on -= 1
			 }})
		
		keyboard.num2().onPressDo({
			 if (on == 1){
			 	nivelDificil.activar()
			 	snake.personaje()
			    game.removeVisual(fondoMenu)
			 	on -= 1}
			 })
	}
}



object pantallaDeMuerte {
	
	method iniciar(a) {
    	var on = a
    	
    	game.removeVisual(puntaje)
		puntaje.position(game.at(10, 6))
		puntaje.color("3C00FF")
		game.addVisual(gameOver)
		game.addVisual(puntaje)
		cabezaDeSnake.paraTodas({cuerpo => game.removeVisual(cuerpo)})
		game.removeTickEvent("movimientoDelJugador")
		
		keyboard.space().onPressDo({
			if (on == 1) {
			    game.removeVisual(gameOver)
			    snake.paraTodosLosItems({item => game.removeVisual(item)})
			    game.removeVisual(puntaje)
			    nivelDificil.desactivar()
			    nivelDificil.reiniciarBombas()
			    puntaje.position(game.at(15, 11))
			    puntaje.color("F4FF00")
			    puntaje.puntos(0)
			    puntaje.quePoner(puntaje.puntos())
			    snake.reiniciarItems()
			    cabezaDeSnake.reiniciar()
			    cabezaDeSnake.position(game.at(2, 3))
			    cabezaDeSnake.image(derecha.image())
			    cabezaDeSnake.siguienteaDondeIr("right")
			    game.removeVisual(fondoNivel)                           
			    pantallaDeInicio.iniciar(1)		
			    on -= 1}
		})
	}
}



object nivelDificil {
	var hayBombas = false
	var nroDeBombas = 1
	var activado = false
	
	method activarBombas() {hayBombas = true}
    
    method agregarBomba() {
    	if (nroDeBombas < 15) {
    		snake.bombaNueva()
    		nroDeBombas += 1}
    }
    
    method reiniciarBombas() {nroDeBombas = 1}
    
    method activar() {
    	hayBombas = true
    	activado = true
    }
    
    method desactivar() {
    	hayBombas = false
    	activado = false
    }
    
    method estaActivado() = hayBombas
}