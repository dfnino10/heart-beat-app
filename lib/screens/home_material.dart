import 'package:flutter/material.dart';

import '../models/user.dart';
import './capture_image.dart';

class HomeMaterial extends StatefulWidget {
  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  final _formKey = GlobalKey<FormState>();
  var _myController1 = TextEditingController();
  var _myController2 = TextEditingController();
  var _myController3 = TextEditingController();
  var _myController4 = TextEditingController();
  var _myController5 = TextEditingController();
  var _myController6 = TextEditingController();
  var _myController7 = TextEditingController();
  var _myController8 = TextEditingController();
  var _myController9 = TextEditingController();
  final _user = User();
  int selectedSex = 1;
  int selectedDiabetes = 3;
  int selectedFuma = 6;

  @override
  void initState() {
    super.initState();
    selectedSex = 1;
    selectedDiabetes = 3;
    selectedFuma = 6;
  }

  setSelectedSex(int val) {
    _user.health_data[User.Sexo] = val == 1 ? false : true;
    setState(() {
      selectedSex = val;
    });
  }

  setSelectedDiabetes(int val) {
    _user.health_data[User.Diabetes_Mellitus] = val == 1 ? false : true;
    setState(() {
      selectedDiabetes = val;
    });
  }

  setSelectedFuma(int val) {
    _user.health_data[User.Fuma] = val == 1 ? false : true;
    setState(() {
      selectedFuma = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Builder(
              builder: (context) => Form(
                  key: _formKey,
                  child: ListView(padding: const EdgeInsets.all(8), children: [
                    Row(
                      children:[
                        Expanded(
                          child: Text('Información general'),
                        ),
                        Expanded(
                          child: Image.asset('assets/images/heartLogopng.png'),
                        ),
                      ]),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nombres'),
                      controller: _myController1,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor ingrese sus nombres';
                        }
                        if (value.length > 30) {
                          return 'Nombres no pueden contener más de 30 caracteres';
                        }
                        if (RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%0-9-]')
                            .hasMatch(value)) {
                          return 'Nombres no pueden contener números o caracteres especiales';
                        }
                        return null;
                      },
                      onSaved: (val) => setState(() => _user.firstName = val),
                    ),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'Apellidos'),
                        controller: _myController2,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese sus apellidos';
                          }
                          if (value.length > 30) {
                            return 'Apellidos no pueden contener más de 30 caracteres';
                          }
                          if (RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%0-9-]')
                              .hasMatch(value)) {
                            return 'Apellidos no pueden contener números o caracteres especiales';
                          }
                          return null;
                        },
                        onSaved: (val) => setState(() => _user.lastName = val)),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'Cédula'),
                        keyboardType: TextInputType.number,
                        controller: _myController3,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese su cédula';
                          }
                          if (value.length > 15) {
                            return 'Cédula no puede contener más de 15 dígitos';
                          }
                          if (RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%\s-]')
                              .hasMatch(value)) {
                            return 'Cédula sólo puede contener números';
                          }
                          return null;
                        },
                        onSaved: (val) =>
                            setState(() => _user.cedula = int.parse(val))),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'Edad'),
                        keyboardType: TextInputType.number,
                        controller: _myController4,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese su edad';
                          }
                          if (value.length > 3) {
                            return 'Edad no puede contener más de 3 dígitos';
                          }
                          if (RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%\s-]')
                              .hasMatch(value)) {
                            return 'Edad sólo puede contener números';
                          }
                          return null;
                        },
                        onSaved: (val) =>
                            setState(() => _user.edad = int.parse(val))),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Sexo'),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text('F'),
                              Radio(
                                value: 1,
                                groupValue: selectedSex,
                                activeColor: Colors.blue,
                                onChanged: (val) {
                                  setSelectedSex(val);
                                },
                              ),
                              Text('M'),
                              Radio(
                                value: 2,
                                groupValue: selectedSex,
                                activeColor: Colors.blue,
                                onChanged: (val) {
                                  setSelectedSex(val);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text('Información sobre salud'),
                    ),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'Peso (kg)'),
                        keyboardType: TextInputType.number,
                        controller: _myController5,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese su peso';
                          }
                          if (value.length > 3) {
                            return 'Peso no puede contener más de 3 dígitos';
                          }
                          if (RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%\s-]')
                              .hasMatch(value)) {
                            return 'Peso sólo puede contener números';
                          }
                          return null;
                        },
                        onSaved: (val) =>
                            setState(() => _user.peso = int.parse(val))),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'Estatura (cm)'),
                        keyboardType: TextInputType.number,
                        controller: _myController6,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese su estatura (cm)';
                          }
                          if (value.length > 3) {
                            return 'Estatura no puede contener más de 3 dígitos';
                          }
                          if (RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%\s-]')
                              .hasMatch(value)) {
                            return 'Estatura sólo puede contener números';
                          }
                          return null;
                        },
                        onSaved: (val) =>
                            setState(() => _user.estatura = int.parse(val))),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Perímetro abdominal (cm)'),
                        keyboardType: TextInputType.number,
                        controller: _myController7,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese su perímetro abdominal (cm)';
                          }
                          if (value.length > 3) {
                            return 'Perímetro abdominal no puede contener más de 3 dígitos';
                          }
                          if (RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%\s-]')
                              .hasMatch(value)) {
                            return 'Perímetro abdominal sólo puede contener números';
                          }
                          return null;
                        },
                        onSaved: (val) =>
                            setState(() => _user.pAbdominal = int.parse(val))),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Diabetes Mellitus'),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text('Sí'),
                              Radio(
                                value: 3,
                                groupValue: selectedDiabetes,
                                activeColor: Colors.blue,
                                onChanged: (val) {
                                  setSelectedDiabetes(val);
                                },
                              ),
                              Text('No'),
                              Radio(
                                value: 4,
                                groupValue: selectedDiabetes,
                                activeColor: Colors.blue,
                                onChanged: (val) {
                                  setSelectedDiabetes(val);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Colesterol HDL (mg)'),
                        keyboardType: TextInputType.number,
                        controller: _myController8,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese su Colesterol HDL (mg)';
                          }
                          if (value.length > 3) {
                            return 'Colesterol HDL no puede contener más de 3 dígitos';
                          }
                          if (RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%\s-]')
                              .hasMatch(value)) {
                            return 'Colesterol sólo puede contener números';
                          }
                          return null;
                        },
                        onSaved: (val) =>
                            setState(() => _user.colesterol = int.parse(val))),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Fumador'),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text('Sí'),
                              Radio(
                                value: 5,
                                groupValue: selectedFuma,
                                activeColor: Colors.blue,
                                onChanged: (val) {
                                  setSelectedFuma(val);
                                },
                              ),
                              Text('No'),
                              Radio(
                                value: 6,
                                groupValue: selectedFuma,
                                activeColor: Colors.blue,
                                onChanged: (val) {
                                  setSelectedFuma(val);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Transferrina (mg/dL)'),
                        keyboardType: TextInputType.number,
                        controller: _myController9,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese su transferrina (mg/dL)';
                          }
                          if (value.length > 3) {
                            return 'Transferrina no puede contener más de 3 dígitos';
                          }
                          if (RegExp(r'[!@#<>?",:_`~;[\]\\|=+)(*&^%\s-]')
                              .hasMatch(value)) {
                            return 'Transferrina sólo puede contener números';
                          }
                          return null;
                        },
                        onSaved: (val) => setState(
                            () => _user.transferrina = int.parse(val))),
                    ImageCapture(),
                    //ImageCapture(),
                    //ImageCapture(),
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
                    child: Text('Enviar')))
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Guardando')));
  }
}
