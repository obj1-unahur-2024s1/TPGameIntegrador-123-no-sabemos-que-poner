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
			/*los "on == 1" manejan que la pantalla se ejecute una sola vez,
			 ya que las colisiones implican la misma accion pero con diferentes objetos.
			 Sin esto, las pantallas se intentan iniciar varias veces (una por cada objeto 
			 que colisionó) y saltan los errores de que ya estan en pantalla o no se encuentran
			 en pantalla, etc.
			 */
			 if (on == 1) {
			 	snake.nivel()
			    game.removeVisual(fondoMenu)
			 	on -= 1}})
		
		keyboard.num2().onPressDo({
			 if (on == 1){
			 	nivelDificil.activar()
			 	snake.nivel()
			    game.removeVisual(fondoMenu)
			 	on -= 1}})
	}
}



object pantallaDeMuerte {
	
	method iniciar(a) {
    	var on = a
    	
    	self.detenerTodo()
		
		keyboard.space().onPressDo({
			if (on == 1) {
			    self.settearPuntaje()
			    self.settearSnake()
			    self.settearNivel()	
			    on -= 1}})
	}
	
	method detenerTodo() {
		game.removeVisual(puntaje)
		puntaje.position(game.at(10, 6))
		puntaje.color("3C00FF")
		game.addVisual(gameOver)
		game.addVisual(puntaje)
		cabezaDeSnake.paraTodasLasPartes({cuerpo => game.removeVisual(cuerpo)})
		game.removeTickEvent("movimientoDelJugador")
	}
	
	method settearPuntaje() {
		game.removeVisual(puntaje)
		puntaje.position(game.at(15, 11))
		puntaje.color("F4FF00")
		puntaje.puntos(0)
		puntaje.quePoner(puntaje.puntos())
	}
	
	method settearSnake() {
		snake.paraTodosLosItems({item => game.removeVisual(item)})
		snake.reiniciarItems()
		cabezaDeSnake.reiniciar()
		cabezaDeSnake.position(game.at(2, 3))
		//cabezaDeSnake.image(derecha.image())
		cabezaDeSnake.siguienteaDondeIr("right")
		//izquierda.position(null)
	}
	
	method settearNivel() {
		game.removeVisual(gameOver)
		game.removeVisual(fondoNivel)
		nivelDificil.desactivar()
		pantallaDeInicio.iniciar(1)
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