import 'package:flutter/material.dart';

import '../models/user.dart';
import './capture_image.dart';

class HomeMaterial extends StatefulWidget {
  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Builder(
              builder: (context) => Form(
                  key: _formKey,
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Nombres'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por favor ingrese sus nombres';
                            }
                            if (value.length >30) {
                              return 'Nombres no pueden contener más de 30 caracteres';
                            }
                            if(RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)){
                              return 'Nombres no pueden contener números o caracteres especiales';
                            }
                            return null;
                          },
                          onSaved: (val) =>
                              setState(() => _user.firstName = val),
                        ),
                        TextFormField(
                            decoration: InputDecoration(labelText: 'Apellidos'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Por favor ingrese sus apellidos';
                              }
                              if (value.length >30) {
                                return 'Apellidos no pueden contener más de 30 caracteres';
                              }
                              if(RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)){
                                return 'Apellidos no pueden contener números o caracteres especiales';
                              }
                              return null;
                            },
                            onSaved: (val) =>
                                setState(() => _user.lastName = val)),
                        TextFormField(
                            decoration: InputDecoration(labelText: 'Cédula'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Por favor ingrese su cédula';
                              }
                              if (value.length >15) {
                                return 'Cédula no puede contener más de 15 dígitos';
                              }
                              if(RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%\s-]').hasMatch(value)){
                                return 'Cédula sólo puede contener números';
                              }
                              return null;
                            },
                            onSaved: (val) =>
                                setState(() => _user.lastName = val)),
                        TextFormField(
                            decoration: InputDecoration(labelText: 'Edad'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Por favor ingrese su edad';
                              }
                              if (value.length >3) {
                                return 'Edad no puede contener más de 3 dígitos';
                              }
                              if(RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%\s-]').hasMatch(value)){
                                return 'Edad sólo puede contener números';
                              }
                              return null;
                            },
                            onSaved: (val) =>
                                setState(() => _user.lastName = val)),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                          child: Text('Información sobre salud'),
                        ),
                        CheckboxListTile(
                            title: const Text('¿Fuma?'),
                            value: _user.health_data[User.Fuma],
                            onChanged: (val) {
                              setState(
                                  () => _user.health_data[User.Fuma] = val);
                            }),
                        CheckboxListTile(
                            title: const Text('¿Hace ejercicio?'),
                            value: _user.health_data[User.Hace_ejercicio],
                            onChanged: (val) {
                              setState(() =>
                                  _user.health_data[User.Hace_ejercicio] = val);
                            }),
                        ImageCapture(),
                      ])))),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(
                child: RaisedButton(
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form.validate()) {
                        form.save();
                        _user.save();
                        _showDialog(context);
                      }
                    },
                    child: Text('Guardar'))
            )
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Guardando')));
  }
}
