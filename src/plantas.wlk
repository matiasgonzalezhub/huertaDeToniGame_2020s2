import wollok.game.*
import pachamama.*

class Planta {
	
	var pacha = pachamama
	
	var property aptaCosecha = false
	var property position 
	
	method image() {
		return "maiz_bebe.png"
	}
	
	method regar(){}
	
	method aptaCosecha()
	{
		return aptaCosecha
	}
	
	method precioDeVenta(){ return 0}
	
    //method getPosition(){return position}
	//method setPosition(x,y){position = new Position()}
}


class Maiz inherits Planta {
	
	var esAdulto = false
	var imagen = "maiz_bebe.png"
	
	override method image() {
		return imagen
	}
	
	override method regar()
	{
		if(!esAdulto) 
		{ 
			esAdulto = true 
			imagen = "maiz_adulto.png"
			aptaCosecha = true
		}
	}
	
	override method precioDeVenta()
	{
//		if(pacha.estaAgradecida())
//			return 180
//		else
//			return 150
	return if (pacha.estaAgradecida()) {180} else {150}
	}
	
	method libreDeGluten()
	{
		return true
	}
	
}


class Trigo inherits Planta {
	
	var imagen = "trigo_0.png"
	var etapaEvolucion = 0
	
	override method image() {		
		return imagen
	}
	
	override method regar()
	{
		if(etapaEvolucion == 0)
		{
			if(pacha.estaAgradecida())
				etapaEvolucion = 2
			else
				etapaEvolucion = 1
				
			imagen = "trigo_1.png"
		}
		else if (etapaEvolucion == 1)
		{
			if(pacha.estaAgradecida())
				etapaEvolucion = 3
			else
				etapaEvolucion = 2
			
			imagen = "trigo_2.png"
		}
		else if (etapaEvolucion == 2)
		{
			if(pacha.estaAgradecida())
				etapaEvolucion = 3
			else
				etapaEvolucion = 3
			
			imagen = "trigo_3.png"
			aptaCosecha = true
		}	
	}
	
	override method precioDeVenta()
	{
		if (etapaEvolucion==2)
			return 100
		else 
			return 200
			
	}
	
	method libreDeGluten()
	{
		return false
	}	
	
}

class Tomaco inherits Planta {
		
	override method aptaCosecha()
	{
		aptaCosecha = true
		return aptaCosecha
	}
	
	override method image() 
	{	
		return if (pacha.estaAgradecida()) {"tomaco_ok.png"} else {"tomaco_podrido.png"}
		//return "tomaco_ok.png"		
	}
	
	override method precioDeVenta()
	{
		return 80
			
	}
	
	method libreDeGluten()
	{
		return true
	}

}
	
	