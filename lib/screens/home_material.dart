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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Nombres'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por favor ingrese sus nombres';
                            }
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
                        ImageCapture()
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
