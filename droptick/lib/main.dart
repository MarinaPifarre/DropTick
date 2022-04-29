import 'package:flutter/material.dart';
import 'package:droptick/estadisticas.dart';
import 'package:droptick/home.dart';
import 'package:droptick/tickets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _paginaActual = 0;
  List<String> _titolsPagines = [
    "Home",
    "Tickets",
    "Estadisticas",
  ];
  List<Widget> _paginas = [
    PaginaHome(),
    PaginaTickets(),
    PaginaEstadisticas(),
  ];

  List<Widget> _iconos = [
    Icon(Icons.home),
    Icon(Icons.list),
    Icon(Icons.pie_chart)
  ];

  String icona1 = "Icons.home";

  int paginaSeguent(int paginaActual) {
    int numeroARetornar;
    if (paginaActual == 2) {
      numeroARetornar = 0;
    } else {
      numeroARetornar = paginaActual + 1;
    }
    return numeroARetornar;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(_titolsPagines[_paginaActual],
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
            currentIndex: 0,
            onTap: (index) {
              setState(() {
                if (index == 0) {
                  print("pagina actual: ${_paginaActual} ");
                  _paginaActual = paginaSeguent(_paginaActual);
                  print("cambiamos a pagina: ${_paginaActual} ");
                } else {
                  _paginaActual = paginaSeguent(paginaSeguent(_paginaActual));
                }
              });
            },
            selectedItemColor: Colors.grey[700],
            items: [
              BottomNavigationBarItem(
                icon: _iconos[paginaSeguent(_paginaActual)],
                label: _titolsPagines[paginaSeguent(_paginaActual)],
              ),
              BottomNavigationBarItem(
                icon: _iconos[paginaSeguent(paginaSeguent(_paginaActual))],
                label:
                    _titolsPagines[paginaSeguent(paginaSeguent(_paginaActual))],
              ),
            ]),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
