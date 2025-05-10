class Tarea {
  final int? id;
  final String nombre;

  Tarea({
    this.id,
    required this.nombre,
  });

  // Convertir un objeto Tarea a un Map para la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }

  //Crear un objeto Tarea desde un Map
  factory Tarea.fromMap(Map<String, dynamic> map) {
    return Tarea(
      id: map['id'],
      nombre: map['nombre'],
    );
  }
}
