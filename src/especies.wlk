import reservaNatural.*

class EspecieFauna {
	const property pesoReferencia
	const property coeficiente
	const property locomocion
	method estaEnTodosLosHabitats()=reserva.habitats().all({h=> h.incluyeEstaEspecie(self)})
	

}
class EspecieFlora {
	var property alturaReferencia
	}
	
class Animal {
	var property peso
	const property especie
	var property habitat

	method cantBiomasa() = peso * peso / especie.coeficiente()
	method esGrande() = peso >= especie.pesoReferencia() * 2
	method esPequenio() = peso < especie.pesoReferencia() / 2
	method esMediano() = not self.esPequenio() and not self.esGrande()
	method seQuema() {
		if (self.especie().locomocion().seSalva(self)) {peso = peso*0.9} 
		else { habitat.eliminarSerVivo(self) }
	}
}

class Planta {

	var property altura
	var property especie
	var property habitat

	method cantBiomasa() = especie.alturaReferencia().min(altura * 2)
	method esGrande() = altura > 10
	method esMediano() = altura == 10
	method esPequenio() = altura < 10
	method seQuema() = 	if (self.esGrande()) { altura = altura - 5} 
						else { habitat.eliminarSerVivo(self) }
}

object correr{
	method seSalva(animal) = animal.esMediano()
}

object quedarseQuieto {
	method seSalva(animal) = false
}

object volar {
	method seSalva(animal) = animal.esGrande()
}

object nadar {
	method seSalva(animal) = true
}

