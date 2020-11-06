object pachamama {
	
	var nivelDeAgradecimiento = 10
	
	method image() {
		
		return if (self.estaAgradecida()) {"pachamama-agradecida.png"} else {"pachamama-triste.png"}
	}
	
	method setNivel(nivel){ nivelDeAgradecimiento = nivel }
	
	method getNivel(){return nivelDeAgradecimiento}
	
	method llover(){ nivelDeAgradecimiento += 5}
	
	method fumigar(){ nivelDeAgradecimiento = 0}
	
	method estaAgradecida(){ return nivelDeAgradecimiento >= 10}
	
	
	
}
