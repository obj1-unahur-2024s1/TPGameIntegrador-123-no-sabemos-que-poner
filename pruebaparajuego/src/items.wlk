import wollok.game.*

class ItemEnNivel{
	var property position 
	var property image 
	
	method reset(){
		const nuevox = 0.randomUpTo(game.width())
		const nuevoy = 0.randomUpTo(game.height())
		game.onCollideDo(self, {a => a.reset()}) //activar y desactivar esto para mostrar que funciona
		position = game.at(nuevox,nuevoy)
	}
	
	method nuevoitem(){
		const nuevoitem = new ItemEnNivel(position = game.center(), image = "bomba.png")
		game.addVisual(nuevoitem)
	}
	   		
}
