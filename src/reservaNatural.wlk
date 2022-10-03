import especies.*

object reserva {

	const property habitats = []

	method esConMayorBiomasa() = habitats.max({ h => h.biomasaTotal() })
	method cualesNoEstanEquilibrados() = habitats.filter({ h => not h.estaEquilibrado() })
	method agregarHabitat(habitat) = habitats.add(habitat)
	method cantTotalBiomasa()=habitats.sum({h=>h.biomasaTotal()})
}

class Habitat {

	const property seresVivos = []

	method seIncendia() = seresVivos.forEach({ s => s.seQuema()})
	method contieneEstasEspecies() = seresVivos.map({s=>s.especie()}).asSet()
	method eliminarSerVivo(serVivo) = seresVivos.remove(serVivo)
	method biomasaTotal() = seresVivos.sum({ s => s.cantBiomasa() })
	method incluyeEstaEspecie(unaEspecie) = self.contieneEstasEspecies().contains(unaEspecie)
	method agregarSerVivo(serVivo) {
		seresVivos.add(serVivo)
		serVivo.habitat(self)}
		
	method estaEquilibrado() = not self.seresMedianos().isEmpty()
	and self.seresGrandes().size() < self.seresPequenios().size() / 3

	method seresGrandes() = seresVivos.filter({ s => s.esGrande() })
	method seresPequenios() = seresVivos.filter({ s => s.esPequenio() })
	method seresMedianos() = seresVivos.filter({ s => s.esMediano() })
}

