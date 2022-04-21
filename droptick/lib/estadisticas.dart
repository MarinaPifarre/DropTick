import 'package:flutter/material.dart';

class PaginaEstadisticas extends StatefulWidget {
  const PaginaEstadisticas({Key? key}) : super(key: key);

  @override
  State<PaginaEstadisticas> createState() => _PaginaEstadisticasState();
}

class _PaginaEstadisticasState extends State<PaginaEstadisticas> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Pagina estadisticas"),
    );
  }
}
