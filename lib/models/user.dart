class User {
  static const String Fuma = 'Fuma';
  static const String Hace_ejercicio = '¿Hace ejercicio?';

  String firstName = '';
  String lastName = '';
  int edad = 0;
  Map<String, bool> health_data = {
    Fuma: false,
    Hace_ejercicio: false,
  };

  save() {
    print('saving user using a web service');
  }
}
