import 'package:droptick/paginaListaTicket.dart';
import 'package:flutter/material.dart';

class PaginaTickets extends StatefulWidget {
  const PaginaTickets({Key? key}) : super(key: key);

  @override
  State<PaginaTickets> createState() => _PaginaTicketsState();
}

class _PaginaTicketsState extends State<PaginaTickets> {
  @override
  Widget build(BuildContext context) {
    return paginaListaTicket();
  }
}
