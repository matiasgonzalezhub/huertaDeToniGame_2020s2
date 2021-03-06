import wollok.game.*
import plantas.*
import pachamama.*

object toni {
	const property image = "toni.png"
	var property position = game.at(3, 3)
		
	var plantasSembradas = []
	var cantidadDeOroAcumulado = 0
	var plantasCosechadas = []
	
	
	
	const property posicionesVisitadas = #{}
		
	method agregarPlantaCosechada(planta)
	{
		plantasCosechadas.add(planta)
	}
	
	method entregarCosecha()
	{
		return plantasCosechadas
	}
	
	
	method agregarOroPorVenta(cantidad)
	{
		cantidadDeOroAcumulado += cantidad
	}
	
	method agregarAPlantaSembradas(planta)
	{
		plantasSembradas.add(planta)
	}
	
	method eliminarDePlantasSembradas(planta)
	{
		plantasSembradas.remove(planta)
	}
	
	method regarLasPlantas()
	{
		plantasSembradas.forEach({ p => p.regar()})		
	}
	
	method regarUnaPlanta(planta)
	{
		planta.regar()
	}
	
	method sembrarPlanta(tipoPlanta)
	{
		var planta
		
		
		if(tipoPlanta == "Maiz")
		{
			planta = new Maiz(position = position )
		}
		else if (tipoPlanta == "Trigo")
		{
			planta = new Trigo(position = position )
		}
		else if(tipoPlanta == "Tomaco")
		{
			planta = new Tomaco(position = position )
		}
		
		self.agregarAPlantaSembradas(planta)
		
		position.clone().drawElement(planta)
		
		return planta
	}
	
	method plantasListasParaCosechar()
	{
		return plantasSembradas.filter({ p => p.aptaCosecha()})
	}
	
	method cosecharTodo()
	{
		var plantasAcosechar = self.plantasListasParaCosechar()
		
		plantasAcosechar.forEach({ p =>  self.cosecharPlanta(p)})	
	
	}
	
	method cosecharPlanta(planta)
	{
		self.agregarPlantaCosechada(planta)
		self.eliminarDePlantasSembradas(planta)	
		game.removeVisual(planta)
	}
	
	method venderCosecha()
	{		
		self.agregarOroPorVenta(plantasCosechadas.sum({ p => p.precioDeVenta() })) 
		plantasCosechadas.clear()
	}
	
	method cuantoOroSumaSiVendoCosecha()
	{
		return plantasCosechadas.sum({ p => p.precioDeVenta() })
	}
	
	method paraCuantosDiasLeAlcanza()
	{
		return cantidadDeOroAcumulado + self.cuantoOroSumaSiVendoCosecha() / 200
	}
	
	method cuantoHayParaCeliacos()
	{		
		var listasParaCosechar = self.plantasListasParaCosechar()
		
		return listasParaCosechar.count({ p => p.libreDeGluten()})
	}
	
	method convieneRegar()
	{
		return plantasSembradas.any({ p => !p.aptaCosecha() })
	}
	
	method cuantoOroTengo()
	{
		return cantidadDeOroAcumulado
	}
	
	method cantidadPlantasPorVender()
	{
		return plantasCosechadas.size()
	}
	
	method moverDerecha() { self.cambiarPosicion(self.position().right(1)) }
	method moverIzquierda() { self.cambiarPosicion(self.position().left(1)) }
	method moverArriba() { self.cambiarPosicion(self.position().up(1)) }
	method moverAbajo() { self.cambiarPosicion(self.position().down(1)) }
	
	method cambiarPosicion(p) 
	{
		 self.position(p)
		 posicionesVisitadas.add(p)
	}
	
	method hacerOfrenda()
	{
		if(!plantasSembradas.isEmpty())
		{
			var plantaAzar = plantasSembradas.first()
			game.removeVisual(plantaAzar)
			plantasSembradas.remove(plantaAzar)
			
		}
		
		if(!pachamama.estaAgradecida())
			pachamama.setNivel(10)
		else
			{
				pachamama.llover()
				self.regarLasPlantas()
			}	
		
	}
	
	
}