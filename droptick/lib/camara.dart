import 'package:droptick/main.dart';
import 'package:flutter/material.dart';

class PaginaCamara extends StatefulWidget {
  const PaginaCamara({Key? key}) : super(key: key);

  @override
  State<PaginaCamara> createState() => _PaginaCamaraState();
}

class _PaginaCamaraState extends State<PaginaCamara> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Camara", false),
        body: Center(child: Text("Pagina camara")),
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: CustomBottomNavigatorBar(2, [66, 146, 79]));
  }
}
