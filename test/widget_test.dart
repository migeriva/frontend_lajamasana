// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'package:lajamasana/api/usuario_controller.dart';
import 'package:lajamasana/modelos/comidas_model.dart';
import 'package:lajamasana/modelos/usuarios_model.dart';
import 'package:lajamasana/pantallas/pantallaHome.dart';
import 'package:lajamasana/pantallas/pantallaInfoDia.dart';
import 'package:lajamasana/pantallas/pantallaInformacionComida.dart';
import 'package:lajamasana/pantallas/pantallaLogin.dart';
import 'package:lajamasana/pantallas/pantallaPerfiles.dart';
import 'package:lajamasana/pantallas/pantallaSuscripciones.dart';

void main() {
  test("El listado de perfiles no debe ser null", () {
    PantallaPerfiles perfiles = PantallaPerfiles();
    expect(perfiles.createState().listasCargadas(), false);
  });

  test("La cantidad de pedidos debe ser 0", () {
    Comida comida = Comida(
        id: 1,
        nombre: "prueba",
        descripcion: "prueba",
        precio: 20,
        caloriasTotales: 100,
        macronutrientes: "223",
        idCategoria: 1,
        idVendedor: 1,
        imagen: "prueba",
        estado: false);
    PantallaInformacionComida informacion = PantallaInformacionComida(comida);

    expect(informacion.createState().getContador(), 0);
  });

  test("La lista de suscripciones no debe ser null", () {
    PantallaSuscripciones suscripciones = PantallaSuscripciones();

    expect(suscripciones.createState().getDataSuscripciones(), false);
  });

  test("El usuario no debe ser null en pantalla home", () async {
    Usuario user =
        await UsuarioController.validarUsuario("karengomez", "thisisatest");
    PantallaHome home = PantallaHome(user);

    expect(home.user, isNotNull);
  });

  test("Los campos de username y password deben estar limpios", () {
    LoginPage login = LoginPage();
    expect(login.createState().getUser(), "");
    expect(login.createState().getPass(), "");
  });

  test("Los datos de informacion de comidas por dia no debe estar vacio", () {
    PantallaInformacionDia informacion = PantallaInformacionDia();

    expect(informacion.createState().getDataComidas(), false);
  });
}
