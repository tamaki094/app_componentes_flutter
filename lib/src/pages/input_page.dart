import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _fecha = "";
  String _opcionSelect = "Volar";

  List<String> _poderes = [
    'Volar',
    'Rayos x',
    'Super aliento',
    ' Super fuerza'
  ];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs de texto"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (e) {
        setState(() {
          _nombre = e;
          print(e);
        });
      },
      decoration: InputDecoration(
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo pon tu maldito nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Correo es: $_email'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      //autofocus: true,
      onChanged: (e) {
        setState(() {
          _email = e;
          print(e);
        });
      },
      decoration: InputDecoration(
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      //autofocus: true,
      onChanged: (e) {
        setState(() {
          _email = e;
          print(e);
        });
      },
      decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Tu contrasena',
          suffixIcon: Icon(Icons.security),
          icon: Icon(Icons.lock),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
  }

  _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.datetime,
      //autofocus: true,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      decoration: InputDecoration(
          hintText: 'Fecha Nacimiento',
          labelText: 'Tu nacimiento',
          suffixIcon: Icon(Icons.date_range),
          icon: Icon(Icons.calendar_today),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es'));

    if (picked != null) {
      _fecha = picked.toString();
      _inputFieldDateController.text = _fecha;
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown() {
    // ignore: deprecated_member_use
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(child: Text(poder), value: poder));
    });

    return lista;
  }

  Widget _crearDropDown() {
    return Row(children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0),
      Expanded(
        child: DropdownButton(
          value: _opcionSelect,
          items: getOpcionesDropDown(),
          onChanged: (opt) {
            setState(() {
              _opcionSelect = opt;
            });
          },
        ),
      )
    ]);
  }
}
