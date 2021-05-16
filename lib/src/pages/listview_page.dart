import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> listaEnteros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('ultima pagina');
        //_agregar10();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listas"),
        ),
        body: Stack(
          children: <Widget>[_crearLista(), _crearLoading()],
        ));
  }

  Widget _crearLista() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RefreshIndicator(
        onRefresh: obtenerPagina1,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: listaEnteros.length,
          itemBuilder: (BuildContext context, int posicion) {
            final imagen = listaEnteros[posicion];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FadeInImage(
                  image:
                      NetworkImage('https://picsum.photos/id/$imagen/500/300'),
                  placeholder: AssetImage("assets/img/jar-loading.gif")),
            );
          },
        ),
      ),
    );
  }

  _agregar10() {
    setState(() {
      for (var i = 0; i < 10; i++) {
        _ultimoItem++;
        listaEnteros.add(_ultimoItem);
      }
    });
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {
      final duration = new Duration(seconds: 5);
      new Timer(duration,
          respuestaHTTP); //si se pone parentesis la ejecutaria en se instante , manda la referencia
    });
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregar10();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      listaEnteros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }
}
