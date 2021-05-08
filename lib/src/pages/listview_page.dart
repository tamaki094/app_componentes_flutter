import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> listaEnteros = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: listaEnteros.length,
        itemBuilder: (BuildContext context, int posicion) {
          final imagen = listaEnteros[posicion];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FadeInImage(
                image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
                placeholder: AssetImage("assets/img/jar-loading.gif")),
          );
        },
      ),
    );
  }
}
