class Corsa {
	var property color = ""
	
	method capacidad() { return 4 }
	method velocidadMaxima() { return  150 }
	method peso() { return 1300 }
}

class Kwid {
	var property tanqueDeGas = true
	const pesoTanqueDeGas = 150
	
	method capacidad() {
		if(tanqueDeGas){ return 3 }
		else { return 4 }
	}
	
	method velocidadMaxima() {
		if(tanqueDeGas) { return 120 }
		else { return 110 }
	}
	
	method peso() {
		if(tanqueDeGas) { return 1200 + pesoTanqueDeGas }
		else { return 1200 }
	}
	
	method color() { return "Azul" }
}

object trafic {
	var property interior = interiorComodo
	var property motor = motorPulenta
	
	method peso() { return 4000 + interior.peso() + motor.peso() }
	method velocidadMaxima() { return motor.velocidadMaxima() }
	method capacidad() { return interior.capacidad() }
	method color() { return "Blanco"}
}

object interiorComodo {
	method capacidad() { return 5 }
	method peso() { return 700 }
}

object interiorPopular {
	method capacidad() { return 12 }
	method peso() { return 1000 }
}

object motorPulenta {
	method peso() { return 800 }
	method velocidadMaxima() { return 130 }
}

object motorBataton {
	method peso() { return 500 }
	method velocidadMaxima() { return 80 }
}

class AutoEspecial {
	var property capacidad = 0
	var property velocidadMaxima = 0
	var property peso = 0
	var property color = ""
}

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
		//return(flota.count({ f => f.velocidadMaxima() >= 100 }) >= 3 )
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
		//NO//var capacidadTotal = flota.sum({ f => f.capacidad() })
		//return empleados - capacidadTotal
	}
	
	method esGrande(){
		return (empleados >= 40 and flota.size() >= 5)
	}
}


