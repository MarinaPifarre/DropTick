import 'package:droptick/paginaListaTicket.dart';
import 'package:flutter/material.dart';
import 'package:droptick/main.dart';

class PaginaTickets extends StatefulWidget {
  const PaginaTickets({Key? key}) : super(key: key);

  @override
  State<PaginaTickets> createState() => _PaginaTicketsState();
}

class _PaginaTicketsState extends State<PaginaTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Tickets", false),
        body: paginaListaTicket(),
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: CustomBottomNavigatorBar(0, [66, 146, 79, 1]));
  }
}
