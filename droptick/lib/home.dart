import 'package:flutter/material.dart';

class PaginaHome extends StatefulWidget {
  const PaginaHome({Key? key}) : super(key: key);

  @override
  State<PaginaHome> createState() => _PaginaHomeState();
}

//El paquete del SDK sólo llega a 2.14.2., no más allá

class _PaginaHomeState extends State<PaginaHome> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Pagina Home"));
  }
}
