import 'package:flutter/material.dart';

class Categoria {
  String nombre;
  Color color;
  Icon icona;

  Categoria(this.nombre, this.color, this.icona);

  static List<Categoria> getCategorias() {
    return [
      new Categoria('SUPERMERCADO', Colors.red,
          Icon(Icons.local_grocery_store, color: Colors.red)),
      new Categoria(
          'ELECTRONICA', Colors.blue, Icon(Icons.memory, color: Colors.blue)),
      new Categoria('OCIO', Colors.green,
          Icon(Icons.sports_esports, color: Colors.green)),
      new Categoria('FARMACIA', Colors.purple,
          Icon(Icons.local_hospital, color: Colors.purple)),
      new Categoria(
          'ROPA', Colors.orange, Icon(Icons.checkroom, color: Colors.orange)),
      new Categoria('COMBUSTIBLE', Colors.yellow,
          Icon(Icons.local_gas_station, color: Colors.yellow)),
      new Categoria(
          'OTROS', Colors.brown, Icon(Icons.more_horiz, color: Colors.brown)),
      new Categoria('DEPORTE', Colors.grey,
          Icon(Icons.sports_soccer, color: Colors.grey)),
      new Categoria('HOGAR', Colors.pink, Icon(Icons.gite, color: Colors.pink)),
      new Categoria(
          'ESTUDIOS', Colors.black, Icon(Icons.school, color: Colors.black)),
    ];
  }
}
