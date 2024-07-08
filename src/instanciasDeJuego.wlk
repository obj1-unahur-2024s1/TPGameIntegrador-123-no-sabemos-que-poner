import wollok.game.*
import items.*
import player.*
import visuals.*
import juego.*

object pantallaDeInicio {
	var property position = game.at(0, 0)
	var property image = "fondoVioleta.jpg"
		
	method iniciar(a) {
		var on = a
		game.addVisual(self)
		keyboard.q().onPressDo({snake.terminarJuego()})
		keyboard.num1().onPressDo({
			 if (on == 1){
			 	snake.personaje("normal")
			    game.removeVisual(self)
			 	on -= 1
			 }})
		
		keyboard.num2().onPressDo({
			 if (on == 1){
			 	snake.personaje("dificil")
			 	snake.activarBombas()
			    game.removeVisual(self)
			 	on -= 1}
			 })
	}
}
