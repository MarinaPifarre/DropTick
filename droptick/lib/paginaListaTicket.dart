import 'package:droptick/DatabaseHandler.dart';
import 'package:droptick/ticket.dart';
import 'package:flutter/material.dart';
import 'package:droptick/Categoria.dart';

Future<List<Ticket>> fetchTicketFromDatabase() async {
  var dbHelper = DatabaseHandler();

  //addTickets(dbHelper);
  //dbHelper.deleteTicket(2);
  //dbHelper.deleteTicket(3);
  Future<List<Ticket>> tickets = dbHelper.getTicketsOrdenados();
  return tickets;
}

class paginaListaTicket extends StatefulWidget {
  @override
  paginaListaTicketPageState createState() => paginaListaTicketPageState();
}

class paginaListaTicketPageState extends State<paginaListaTicket> {
  Categoria getCategoria(String categoria) {
    Categoria? categoriaARetornar;
    for (Categoria categ in Categoria.getCategorias()) {
      print(categ.nombre);
      print(categoria);
      print(categ.nombre == categoria);
      if (categ.nombre == categoria) {
        categoriaARetornar = categ;
      }
    }
    return categoriaARetornar!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ticket>>(
      future: fetchTicketFromDatabase(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 70.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getCategoria(snapshot.data![index].categoria).icona,
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Column(children: [
                          Text(snapshot.data![index].empresa),
                          Text(snapshot.data![index].precio),
                        ]),
                      ),
                      Text(snapshot.data![index].fecha),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            getCategoria(snapshot.data![index].categoria).color,
                        width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
          alignment: AlignmentDirectional.center,
          child: const CircularProgressIndicator(),
        );
      },
    );
  }
}

Future<int> addTickets(var dbHelper) async {
  Ticket t1 = Ticket(
      id: 1,
      textoImg: "aaa",
      categoria: "SUPERMERCADO",
      precio: "4.99",
      empresa: "Mercadona",
      fecha: "15/06/2021");
  Ticket t2 = Ticket(
      id: 5,
      textoImg: "bbb",
      categoria: "OCIO",
      precio: "2.99",
      empresa: "Mercadona",
      fecha: "05/05/2021");
  Ticket t3 = Ticket(
      id: 9,
      textoImg: "ccc",
      categoria: "SUPERMERCADO",
      precio: "5.00",
      empresa: "Plusfresc",
      fecha: "07/08/2021");
  List<Ticket> lTick = [t1];
  return await dbHelper.insertTicket(lTick);
}
