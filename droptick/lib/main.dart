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
  int _index = 0;
  List<String> _titolsPagines = [
    "Tickets",
    "Estadisticas",
    "Home",
  ];
  List<Widget> _paginas = [
    PaginaTickets(),
    PaginaEstadisticas(),
    PaginaHome(),
  ];

  List<Widget> _iconos = [
    Icon(Icons.list),
    Icon(Icons.pie_chart),
    Icon(Icons.home),
  ];

  Color? _color = Colors.grey[700];

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
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  _paginaActual = 2;
                  _index = 0;
                  _color = Colors.grey[700];
                });
              },
            )
          ],
          centerTitle: true,
          backgroundColor: Color.fromRGBO(66, 146, 79, 1),
          elevation: 0.0,
        ),
        body: _paginas[_paginaActual],
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (index) {
              setState(() {
                _index = index;
                _paginaActual = index;
                _color = Color.fromRGBO(66, 146, 79, 1);
              });
            },
            selectedItemColor: _color,
            items: [
              BottomNavigationBarItem(
                icon: _iconos[0],
                label: _titolsPagines[0],
              ),
              BottomNavigationBarItem(
                icon: _iconos[1],
                label: _titolsPagines[1],
              ),
            ]),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
