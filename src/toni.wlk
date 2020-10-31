//import wollok.game.*
import plantas.*

object toni {
	const property image = "toni.png"
	//var property position = game.at(3, 3)
		
	var plantasSembradas = []
	var cantidadDeOroAcumulado
	var plantasCosechadas = []
	
	method agregarPlantaCosechada(planta)
	{
		plantasCosechadas.add(planta)
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
		plantasSembradas.foreach({ p => p.regar()})
	}
	
	method sembrarPlanta(tipoPlanta)
	{
		var planta
		
		if(tipoPlanta == "Maiz")
		{
			planta = new Maiz()
		}
		else if (tipoPlanta == "Trigo")
		{
			planta = new Trigo()
		}
		else
		{
			planta = new Tomaco()
		}
		
		self.agregarAPlantaSembradas(planta)
		
	}
	
	method plantasListasParaCosechar()
	{
		return plantasSembradas.filter({ p => p.aptaCosecha()})
	}
	
	method cosecharTodo()
	{
		var plantasAcosechar = self.plantasListasParaCosechar()
		
		plantasAcosechar.foreach({ p =>  self.cosecharPlanta(p)})
		
	}
	
	method cosecharPlanta(planta)
	{
		self.eliminarDePlantasSembradas(planta)
		self.agregarPlantaCosechada(planta)
		
	}
	
	method venderCosecha()
	{
		cantidadDeOroAcumulado += plantasCosechadas.sum({ p => p.precioDeVenta() })
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
		//obtener las q estan listas para cosechar
		var listasParaCosechar = self.plantasListasParaCosechar()
		
		return listasParaCosechar.count({ p => p.libreDeGluten()})
	}
	
	method convieneRegar()
	{
		return plantasSembradas.any({ p => !p.aptaCosecha() })
	}
}