import 'package:flutter/material.dart';
import 'package:droptick/main.dart';

class PaginaHome extends StatefulWidget {
  const PaginaHome({Key? key}) : super(key: key);

  @override
  State<PaginaHome> createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PaginaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Home", true),
      body: Center(child: Text("Pagina home")),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: CustomBottomNavigatorBar(0, [255, 97, 97]),
    );
  }
}
