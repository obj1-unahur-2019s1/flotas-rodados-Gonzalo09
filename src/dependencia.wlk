import rodados.*

class Dependencia {
	var flota = []
	var property empleados = 0
	var pedidos
	
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
	
	method agregarPedido(pedido) {pedidos.add(pedido)}
	method quitarPedido(pedido) {pedidos.remove(pedido)}
	
	method totalPasajerosEnPedidos() {
		return pedidos.sum ({ pedido => pedido.cantPasajeros() })
	}
	
	method pedidosInsatisfechos() {
		return pedidos.filter({ pedido => not self.puedeSatisfacerPedido(pedido) })
	}
	
	method puedeSatisfacerPedido(pedido) {
		return flota.any ({ veh => pedido.puedeSatisfacerPedido(veh) })
	}
	
	method esColorRechazado(color) {
		return pedidos.all ({ pedido => pedido.coloresIncompatibles().contains(color) })
	}
	
	method relajarTodosLosPedidos() {
		pedidos.forEach ({ pedido => pedido.relajar() })
	}
	
}