import 'dart:typed_data';

class Ticket {
  final int? id;
  final String textoImg;
  final String categoria;
  final String precio;
  final String empresa;
  final String fecha;
  Uint8List? imagen;

  Ticket({
    this.id,
    required this.textoImg,
    required this.categoria,
    required this.precio,
    required this.empresa,
    required this.fecha,
    this.imagen,
  });

  Ticket.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        textoImg = res["textoImg"],
        categoria = res["categoria"],
        precio = res["precio"],
        empresa = res["empresa"],
        fecha = res["fecha"],
        imagen = res["imagen"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'textoImg': textoImg,
      'categoria': categoria,
      'precio': precio,
      'empresa': empresa,
      'fecha': fecha,
      'imagen': imagen
    };
  }
}
