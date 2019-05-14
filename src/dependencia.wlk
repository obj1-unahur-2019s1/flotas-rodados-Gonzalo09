import rodados.*

class Dependencia {
	var flota = []
	var property empleados = 0
	
	method agregarAFlota(rodado) {
		flota.add(rodado)
	}
	
	method quitarDeFlota(rodado) {
		flota.remove(rodado)
	}
	
	method pesoTotalFlota() {
		return flota.sum({ f => f.peso() })
	}
	
	method estaBienEquipada(){
		return flota.size() >=3 and flota.all({ f => f.velocidadMaxima() >= 100})
	}
	
	method capacidadTotalEnColor(color) {
		var autosDeColor = flota.filter ({ f => f.color() == color })
		return autosDeColor.sum({ s => s.capacidad() })
	}
	
	method colorDelRodadoMasRapido() {
		var masVeloz = flota.max({ f => f.velocidadMaxima()})
		return masVeloz.color()
	}
	
	method capacidadFaltante() {
		return empleados - self.capacidadTotal()
	}
	
	method capacidadTotal() {
		return flota.sum ({ f => f.capacidad() })
	}
	
	method esGrande(){
		return (empleados >= 40 and flota.size() >= 5)
	}
	
}