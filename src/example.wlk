class RemeraLisa {
	var property color 
	var property talle = 0
	
	method costo(){
    var aux = 0
		if( talle >= 32 or talle <=40 ){
			aux = 80
		} 
		if ( talle >= 41 or talle <= 48){
			aux = 100
		}
		if ( self.esDeColorBasico()){
			aux = aux + (aux * 0.10)
		}
		return aux
		
	}
	
	method esDeColorBasico(){
		return color == "blanco" or color == "negro" or color == "gris"
	}
	
	method PorcentajeDeDescuento() = 10
}

class RemeraBordada inherits RemeraLisa  {
	var coloresBordado =[]
	const costoMinimo = 20
	
	override method costo(){
		return super() +  self.costoBordado()
	}
	
	method costoBordado(){
		var cant =  coloresBordado.size()
		return (cant * 10).max(costoMinimo)
	}
}

class RemeraSublimada inherits RemeraLisa {
	var property alto
	var property ancho 
	
	method superficie() = alto * ancho
	method costoSublimado() = self.superficie() * 0.5
	
	override method costo(){
		return super() + self.costoSublimado()
	}
}

class RemeraSublimadaConDibujo inherits RemeraSublimada {
	var property canonDerechoDeAutor
	
	override method costoSublimado() = super() + canonDerechoDeAutor
	override method costo() = super() + self.costoSublimado()
	
}




class Pedido {
	// el pedido sabe de que sucursal es
	// la remera sabe el porcentaje del descuento
	var property sucursal 
	var property cantRemeras
	var property modeloRemera 
	
	method precioBase() = modeloRemera.costo() * cantRemeras
	
	
}

class Sucursal {
	var pedidos = []
	var property cantMinimaParaDescuento = 0
	method aplicaDescuento(pedido) {
		return pedido.cantRemeras() >= cantMinimaParaDescuento		
	}
	method aplicarDescuento(pedido)
	
	method porcentajeDescuento() {
			
	}
	
	method agregar(nuevoPedido){
		pedidos.add(nuevoPedido)
	}
	
	method facturacion(){
		var aux =  pedidos.map({pedido => pedido.precioBase() })
		return aux.sum()
	}
	
	method cantidadDePedidos(modelo){
		return pedidos.count({pedido => pedido.modeloRemera() == modelo})
		
	}
	
	
	}

class Comercio {
	var sucursales = []
	
	method registrar(pedido){
		var aux =  sucursales.find{sucursal => sucursal == pedido.sucursal()}
		aux.agregar(pedido)
	}
	
	method totalFacturado(){
		var aux =  sucursales.map({sucursal=> sucursal.facturacion()})
		return aux.sum()
	}
	
	method totalFacturadoEn(sucursal){
		return sucursal.facturacion()
	}
	
	method cantidadDePedidosDe(modeloRemera){
		sucursales.sum({sucursal => sucursal.cantidadDePedidos(modeloRemera)})
	}
	
	method pedidoMasCaro(){
		
	}
	
	
	
	
	
}


