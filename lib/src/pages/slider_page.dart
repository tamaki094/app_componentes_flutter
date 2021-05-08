import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      label: 'Tamano de la imagen',
      onChanged: (_bloquearCheck)
          ? null
          : (double value) {
              //_valorSlider = value;
              setState(() {
                _valorSlider = value;
                print(value);
              });
            },
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
    );
  }

  Widget _crearImagen() {
    return Image(
        image: NetworkImage(
            "https://www.pngkit.com/png/full/851-8510602_render-naruto-uzumaki-modo-biju-imagenes-de-naruto.png"),
        width: _valorSlider,
        fit: BoxFit.contain);
  }

  Widget _crearCheckbox() {
    // return Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (bool val) {
    //       setState(() {
    //         _bloquearCheck = val;
    //       });
    //     });

    return CheckboxListTile(
        title: Text("Activar Slider"),
        value: _bloquearCheck,
        onChanged: (bool val) {
          setState(() {
            _bloquearCheck = val;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text("Activar Slider"),
        value: _bloquearCheck,
        onChanged: (bool val) {
          setState(() {
            _bloquearCheck = val;
          });
        });
  }
}
