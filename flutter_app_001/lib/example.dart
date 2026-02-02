// ===============================
// REPASO COMPLETO DE DART
// ===============================

import 'dart:async';

// ---------- ENUM ----------
enum Rol { admin, usuario, invitado }

// ---------- MIXIN ----------
mixin Logger {
  void log(String mensaje) {
    print('[LOG] $mensaje');
  }
}

// ---------- CLASE BASE ----------
class Persona with Logger {
  String nombre;
  int edad;
  Rol rol;

  Persona({
    required this.nombre,
    required this.edad,
    this.rol = Rol.usuario,
  });

  void saludar() {
    log('Hola, soy $nombre y tengo $edad años');
  }
}

// ---------- HERENCIA ----------
class Empleado extends Persona {
  double salario;

  Empleado({
    required String nombre,
    required int edad,
    required this.salario,
  }) : super(nombre: nombre, edad: edad, rol: Rol.admin);

  @override
  void saludar() {
    super.saludar();
    print('Mi salario es \$${salario.toStringAsFixed(2)}');
  }
}

// ---------- EXTENSION ----------
extension StringExtension on String {
  bool get esEmail => contains('@') && contains('.');
}

// ---------- FUNCIONES ----------
int suma(int a, int b) => a + b;

double dividir(double a, double b) {
  if (b == 0) {
    throw Exception('No se puede dividir entre 0');
  }
  return a / b;
}

// ---------- ASYNC / AWAIT ----------
Future<String> obtenerDatos() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Datos cargados correctamente';
}

// ---------- STREAM ----------
Stream<int> contador(int hasta) async* {
  for (int i = 1; i <= hasta; i++) {
    await Future.delayed(Duration(milliseconds: 300));
    yield i;
  }
}

// ---------- MAIN ----------
void main() async {
  print('===== VARIABLES =====');
  int edad = 25;
  double precio = 19.99;
  String nombre = 'Carlos';
  bool activo = true;

  print('$nombre | $edad | $precio | $activo');

  print('\n===== NULL SAFETY =====');
  String? apodo;
  print(apodo ?? 'Sin apodo');

  print('\n===== COLECCIONES =====');
  List<int> numeros = [1, 2, 3];
  Set<String> frutas = {'manzana', 'pera', 'manzana'};
  Map<String, int> edades = {'Ana': 20, 'Luis': 30};

  numeros.add(4);
  frutas.add('uva');
  edades['Carlos'] = 25;

  print(numeros);
  print(frutas);
  print(edades);

  print('\n===== CONTROL DE FLUJO =====');
  for (var n in numeros) {
    if (n.isEven) {
      print('$n es par');
    } else {
      print('$n es impar');
    }
  }

  print('\n===== FUNCIONES =====');
  print('Suma: ${suma(3, 5)}');

  try {
    print('División: ${dividir(10, 2)}');
  } catch (e) {
    print('Error: $e');
  }

  print('\n===== CLASES Y HERENCIA =====');
  var persona = Persona(nombre: 'Ana', edad: 22);
  var empleado = Empleado(nombre: 'Luis', edad: 30, salario: 2500);

  persona.saludar();
  empleado.saludar();

  print('\n===== ENUM =====');
  print('Rol de empleado: ${empleado.rol}');

  print('\n===== EXTENSION =====');
  String email = 'correo@test.com';
  print('¿Es email válido? ${email.esEmail}');

  print('\n===== ASYNC / AWAIT =====');
  String datos = await obtenerDatos();
  print(datos);

  print('\n===== STREAM =====');
  await for (var valor in contador(5)) {
    print('Stream: $valor');
  }

  print('\n===== FIN DEL REPASO 🚀 =====');
}
