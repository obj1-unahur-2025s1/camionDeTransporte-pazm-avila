object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    var estaComoRobot = false // es mas comodo usar un bool (xq son solo 2 estados)
    method estaComoRobot() = estaComoRobot
    method transformarseEnAuto() {estaComoRobot=false}
    method transformarseEnRobot() {estaComoRobot=true} // importante no excederse en la cantidad de variables. Podria implementar un solo metodo para transformarse también .
    method peso() = 800
    method peligrosidad() = if(estaComoRobot) 30 else 15 // expresión ternaria (no hace faltan las llaves)   
}

object ladrillos {
    var cantidad = 0 // si puede variar. siempre necesito un método que me permita cambiar
    method cantidad(unaCantidad) {cantidad = unaCantidad}
    method peso() = 2 * cantidad
    method peligrosidad() = 2
}

object arena {
    var property peso = 0 // La palabra reservada property despues de var y antes del nombre de la variable. Lo que hace es definir un setter y un getter automaticamente. Es definirle un atributo público.  Me ahorro las 2 lineas de abajo
    // solo la uso si debo hacer la variable PUBLICA, TANTO SU GETTER COMO SU SETTER !! (de consulta como de seteo). Setear una variable es pisarle el valor. Setear no es sumar ni nada, es directamente PISAR la variable con un nuevo valor .
 //   method peso(unPeso) {peso = unPeso} // esto se puede resumir usando una propiedad que tienen los atributos: "property"
 //   method peso() = peso
    method peligrosidad() = 1
}

object bateriaAntiaerea {
    var estaConMisiles = false
    method cargarMisiles() {estaConMisiles = true}
    method descargarMisiles() {estaConMisiles = false}
    method peso() = if(estaConMisiles) 300 else 200
    method peligrosidad() = if(estaConMisiles) 100 else 0
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
}

object residuos {
    var property peso = 0
    method peligrosidad() = 200
}

object embalaje {
    // suponiendo que el embalaje se puede reutilizar
    var property cosaEnvuelta = arena // podria ir null
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() / 2 // o * 0.5
}