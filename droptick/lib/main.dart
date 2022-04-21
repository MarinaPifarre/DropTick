import 'package:flutter/material.dart';
import 'package:droptick/estadisticas.dart';
import 'package:droptick/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _paginaActual = 0;
  List<Widget> _paginas = [
    PaginaEstadisticas(),
    PaginaHome(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tickets",
              style: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 24.0,
              )),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(66, 146, 79, 1),
          elevation: 0.0,
        ),
        body: _paginas[_paginaActual],
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _paginaActual,
            onTap: (index) {
              setState(() {
                _paginaActual = index;
              });
            },
            selectedItemColor: Colors.green[800],
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart),
                label: "Estadísticas",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
            ]),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
