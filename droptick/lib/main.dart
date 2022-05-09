import 'package:flutter/material.dart';
import 'package:droptick/estadisticas.dart';
import 'package:droptick/home.dart';
import 'package:droptick/tickets.dart';
import 'package:droptick/camara.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => PaginaHome(),
          '/tickets': (context) => PaginaTickets(),
          '/estadisticas': (context) => PaginaEstadisticas(),
          '/camara': (context) => PaginaCamara(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );

class CustomBottomNavigatorBar extends StatefulWidget {
  int _index;
  List<int> _intColor;
  late Color _color;
  List<Widget> _iconos = [
    Icon(Icons.list),
    Icon(Icons.camera),
    Icon(Icons.pie_chart),
    Icon(Icons.home),
  ];
  List<String> _titolsPagines = [
    "Tickets",
    "Camara",
    "Estadisticas",
  ];
  List<String> _rutas = [
    "/tickets",
    "/camara",
    "/estadisticas",
  ];

  CustomBottomNavigatorBar(this._index, this._intColor, {Key? key})
      : super(key: key) {
    _color = Color.fromRGBO(_intColor[0], _intColor[1], _intColor[2], 1);
  }

  @override
  State<CustomBottomNavigatorBar> createState() =>
      _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget._index,
        onTap: (index) {
          setState(() {
            widget._index = index;
            Navigator.pushNamed(
              context,
              widget._rutas[index],
            );
            widget._color = Color.fromRGBO(66, 146, 79, 1);
          });
        },
        selectedItemColor: widget._color,
        items: [
          BottomNavigationBarItem(
            icon: widget._iconos[0],
            label: widget._titolsPagines[0],
          ),
          BottomNavigationBarItem(
            icon: widget._iconos[1],
            label: widget._titolsPagines[1],
          ),
          BottomNavigationBarItem(
            icon: widget._iconos[2],
            label: widget._titolsPagines[2],
          ),
        ]);
  }
}

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  String _title;
  late List<Widget> _actions;
  bool _home;

  CustomAppBar(this._title, this._home, {Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  void Function()? getOnPressed() {
    void Function()? funcionOnPressed;
    if (widget._home) {
      funcionOnPressed = () {};
    } else {
      funcionOnPressed = () {
        Navigator.pushNamed(context, '/');
      };
    }
    return funcionOnPressed;
  }

  /*goToHome() {
    Navigator.pushNamed(context, '/');
  }*/

  List<Widget> getActions() {
    List<Widget> actions;
    if (!widget._home) {
      actions = [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: getOnPressed(),
        ),
      ];
    } else {
      actions = [];
    }
    return actions;
  }

  Widget? getIcon() {
    Widget? icon;
    if (widget._home) {
      icon = Icon(Icons.home);
    } else {
      icon = null;
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: !widget._home,
      title: Text(
        widget._title,
        style: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 24.0,
        ),
      ),
      actions: getActions(),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(66, 146, 79, 1),
      elevation: 0.0,
    );
  }
}

  //Color? _color = Colors.grey[700];
  //backgroundColor: Colors.grey[300],
  //debugShowCheckedModeBanner: false,