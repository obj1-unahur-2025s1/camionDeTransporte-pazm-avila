object camion {
    const carga = []
// polimorfismo: paso un mensaje, delego la responsabilidad y cada objeto lo resuelve como puede.
    method cargar(unaCosa) {
        carga.add(unaCosa) 
        unaCosa.consecuenciaDeLaCarga()
    }
    method descargar(unaCosa) {carga.remove(unaCosa)}
    method pesoTotal() = 1000 + self.cargaTotal()
    method cargaTotal() = carga.sum({c => c.peso()})
    method todoPesoPar() = carga.all({c=>c.peso().even()})
    method algoQuePesa(unValor) = carga.any({c=>c.peso()==unValor})
    method cosaConPeligrosidad(unNivel) =carga.find({c=>c.peligrosidad()==unNivel}) // el .find() te recupera el priimer objeto que cumpla con la condición a encontrar.
    method cosasQueSuperanPeligrosidad(unNivel) = carga.filter({c => c.peligrosidad() > unNivel}) // devuelve otra lista
    // sin reutilizar codigo:method cosasMasPeligrosasQue(unaCosa) = carga.filter({c=>c.peligrosidad()>unaCosa.peligrosidad()})
    method cosasMasPeligrosasQue(unaCosa) = self.cosasQueSuperanPeligrosidad(unaCosa.peligrosidad()) // reutilizando código .
    method excedidoDePeso() = self.pesoTotal() > 2500
    method puedeCircular(unNivel) = !self.excedidoDePeso() && self.cosasQueSuperanPeligrosidad(unNivel).isEmpty()
    method tieneAlgoQuePesaEntre(min,max) = carga.any({c=>c.peso().between(min,max)}) // las listas no entienden el mensaje between (ese solo lo entienden los números) 
    method cosaMasPesada() = carga.max({c=>c.peso()})
}

// la idea es usar mensajes. Todos los objetos saben entender mensajes!! La idea es resolver orientandonos a objetos (con mensajes), no de manera estructurada (con lógica y estructuras).

