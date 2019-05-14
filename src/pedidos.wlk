import dependencia.*
import rodados.*

class Pedido {
	var property distancia = 0
	var property tiempoMaximo = 0
	var property cantPasajeros = 0
	var property coloresIncompatibles = #{}
	
	method velocidadRequerida() {
		return distancia/tiempoMaximo
	}
	
	method puedeSatisfacerPedido(auto) {
		return auto.velocidadMaxima() >= self.velocidadRequerida() +10 and
		auto.capacidad() >= cantPasajeros and not
		coloresIncompatibles.contains(auto.color())
	}
	method acelerar() {
		tiempoMaximo = tiempoMaximo - 1
	}
	
	method relajar() {
		tiempoMaximo = tiempoMaximo + 1
	}
}