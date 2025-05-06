object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bultos() = 1
    method consecuenciaDeLaCarga() {} // método vacío (es con llaves). método abstracto es sin llaves (todavía no lo vimos)
}

object bumblebee {
    var estaComoRobot = false // es mas comodo usar un bool (xq son solo 2 estados)
    method estaComoRobot() = estaComoRobot
    method transformarseEnAuto() {estaComoRobot=false}
    method transformarseEnRobot() {estaComoRobot=true} // importante no excederse en la cantidad de variables. Podria implementar un solo metodo para transformarse también .
    method peso() = 800
    method peligrosidad() = if(estaComoRobot) 30 else 15 // expresión ternaria (no hace faltan las llaves)   
    method bultos() = 2
    method consecuenciaDeLaCarga() {self.transformarseEnRobot()}
}

object ladrillos {
    var cantidad = 0 // si puede variar. siempre necesito un método que me permita cambiar
    method cantidad(unaCantidad) {cantidad = unaCantidad}
    method peso() = 2 * cantidad
    method peligrosidad() = 2
    method bultos() =   if (cantidad <= 100) 1
                        else if (cantidad.between(101, 300)) 2
                        else 3
    method bultosSinIf() = (2.min(1.max(cantidad-99))).max(3.min(cantidad-298))
    method consecuenciaDeLaCarga() {cantidad += 12}
}

object arena {
    var property peso = 0 // La palabra reservada property despues de var y antes del nombre de la variable. Lo que hace es definir un setter y un getter automaticamente. Es definirle un atributo público.  Me ahorro las 2 lineas de abajo
    // solo la uso si debo hacer la variable PUBLICA, TANTO SU GETTER COMO SU SETTER !! (de consulta como de seteo). Setear una variable es pisarle el valor. Setear no es sumar ni nada, es directamente PISAR la variable con un nuevo valor .
 //   method peso(unPeso) {peso = unPeso} // esto se puede resumir usando una propiedad que tienen los atributos: "property"
 //   method peso() = peso
    method peligrosidad() = 1
    method bultos() = 1
    method consecuenciaDeLaCarga() {peso = 0.max(peso - 10)} // controlo que no sea menos que 0
}

object bateriaAntiaerea {
    var estaConMisiles = false
    method cargarMisiles() {estaConMisiles = true}
    method descargarMisiles() {estaConMisiles = false}
    method peso() = if(estaConMisiles) 300 else 200
    method peligrosidad() = if(estaConMisiles) 100 else 0
    method bultos() = if(estaConMisiles) 2 else 1
    method consecuenciaDeLaCarga() {self.cargarMisiles()}
}

// #{} conjunto
object contenedor {
    const cosas = [] // esto hace referencia al objeto que apunta! Siempre debe apuntar a la misma lista !!
    method agregarCosa(unaCosa) {cosas.add(unaCosa)}
    method quitarCosa(unaCosa) {cosas.remove(unaCosa)}
    method agregarVariasCosas(unaListaDeCosas) {cosas.addAll(unaListaDeCosas)}
    method peso() = 100 + self.pesoDeLasCosas()
    method pesoDeLasCosas() = cosas.sum({c => c.peso()}) // el argumento es un closure. si no le pongo un transformer, va a intentar sumar numeros
    method peligrosidad() = if(cosas.isEmpty()) 0 else cosas.max({c => c.peligrosidad()}).peligrosidad() // lista.max(transformer) devuelve un objeto, entonces como necesito el valor, le pregunto por su peligrosidad() porque por POLIMORFISMO, es un mensaje que todos saben responder.
    method bultos() = 1 + cosas.sum({c=>c.bultos()})
    method consecuenciaDeLaCarga() {cosas.forEach({c=>c.consecuenciaDeLaCarga()})}
}

object residuos {
    var property peso = 0
    method peligrosidad() = 200
    method bultos() = 1
    method consecuenciaDeLaCarga() {peso += 15}
}

object embalaje {
    // suponiendo que el embalaje se puede reutilizar
    var property cosaEnvuelta = arena // podria ir null
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() / 2 // o * 0.5
    method bultos() = 2
    method consecuenciaDeLaCarga() {}
}