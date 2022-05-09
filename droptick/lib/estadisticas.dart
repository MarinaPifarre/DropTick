import 'package:droptick/main.dart';
import 'package:flutter/material.dart';

class PaginaEstadisticas extends StatefulWidget {
  const PaginaEstadisticas({Key? key}) : super(key: key);

  @override
  State<PaginaEstadisticas> createState() => _PaginaEstadisticasState();
}

class _PaginaEstadisticasState extends State<PaginaEstadisticas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Estadísticas", false),
      body: Center(child: Text("Pagina estadisticas")),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: CustomBottomNavigatorBar(2, [66, 146, 79, 1]),
    );
  }
}
