class User {
  static const String Fuma = 'Fuma';
  static const String Sexo = 'Sexo';
  static const String Diabetes_Mellitus = '¿Tiene Diabetes Mellitus?';

  String firstName = '';
  String lastName = '';
  int edad = 0;
  int cedula = 0;
  int peso = 0;
  int estatura = 0;
  int pAbdominal = 0;
  int colesterol= 0;
  int transferrina = 0;

  Map<String, bool> health_data = {
    Fuma: false,
    Diabetes_Mellitus: false,
    Sexo: false,
  };

  save() {
    print('saving user using a web service');
  }
}
