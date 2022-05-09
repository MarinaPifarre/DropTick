import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../ticket.dart';

class DatabaseHandler {
  //Ini DB
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'datos.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE tickets(id INTEGER PRIMARY KEY,"
          "textoImg TEXT,"
          "categoria TEXT,"
          "precio TEXT,"
          "empresa TEXT,"
          "fecha DATE,"
          "imagen BLOB"
          ")",
        );
      },
      version: 1,
    );
  }

  //Save data
  Future<int> insertTicket(List<Ticket> tickets) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var ticket in tickets) {
      result = await db.insert('tickets', ticket.toMap());
    }
    return result;
  }

  //Get all tickets
  Future<List<Ticket>> getTickets() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('tickets');
    return queryResult.map((e) => Ticket.fromMap(e)).toList();
  }

  //Get all tickets ordered by date
  Future<List<Ticket>> getTicketsOrdenados() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.rawQuery('''
      SELECT *
        FROM tickets
        ORDER BY fecha
      ''');
    return queryResult.map((e) => Ticket.fromMap(e)).toList();
  }

  //Delete ticket
  Future<void> deleteTicket(int id) async {
    final db = await initializeDB();
    await db.delete(
      'tickets',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Widget listTickets(String pos) {
    return FutureBuilder(
      future: getTickets(), //load data from json depending on id
      initialData: const [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          physics: const NeverScrollableScrollPhysics(), //Prevent double scroll
          children: listaTickets(snapshot.data!),
        );
      },
    );
  }

  List<Widget> listaTickets(List<dynamic> tickets) {
    final List<Widget> widgets = [];
    for (var ticket in tickets) {
      //for object in 'pasos' in json we do a widget
      final widgTicket = ListTile(
        title: Text(ticket['textoImg'],
            textAlign: TextAlign.center), //Counter steps
        subtitle: Text(
          ticket['precio'],
          textAlign: TextAlign.center,
        ), //Importing 'pas' as text
      );
      widgets.add(widgTicket); //Add widget to our list
    }
    return widgets;
  }
}
