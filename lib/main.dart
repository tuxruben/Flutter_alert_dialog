import 'package:flutter/material.dart';

void main() => runApp(Miapp());

class Miapp extends StatelessWidget {
  const Miapp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Myapp",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  bool _subscrito = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertDialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                color: Color(0xffFF0000),
                textColor: Color(0xffFFFFFF),
                child: Text("Subscribirme a este canal",
                    style: TextStyle(fontSize: 20.0)),
                onPressed: () {
                  _mostrarAlerta(context);
                }),
            SizedBox(
              height: 100,
            ),
            Text(
              _subscrito ? "subscrito" : "No subscrito",
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: _subscrito
                ? Text("Cancelar subscripcion")
                : Text("Suscribirse"),
            content: _subscrito
                ? Text("¿Quieres cancelar tu subscripcion?")
                : Text("Estas seguro que quieres suscribirte?"),
            actions: [
              TextButton(
                onPressed: () {
                  print("no");

                  Navigator.pop(context);
                },
                child: Text("No"),
              ),
              TextButton(
                onPressed: () {
                  print("si");
                  setState(() {
                    _subscrito = !_subscrito;
                  });
                  Navigator.pop(context);
                },
                child: Text("Si quiero."),
              )
            ],
          );
        });
  }
}
