class EstadosModel {
  late String clave;
  late String nombre;
  late String coordenadas;

  EstadosModel({required this.clave,required this.nombre, required this.coordenadas});

  factory EstadosModel.fromJson(Map<String, dynamic> json) {
    return EstadosModel(
      clave: json["clave"],
      nombre: json["nombre"],
      coordenadas: json["coordenadas"],
    );
  }
}