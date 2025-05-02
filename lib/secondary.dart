import 'package:flutter/material.dart';

class SecondaryApp extends StatefulWidget {
  const SecondaryApp({super.key});

  @override
  State<SecondaryApp> createState() => _SecondaryAppState(); 
}

class _SecondaryAppState extends State<SecondaryApp> {
  String cadena = "Lugar para variables";

//Lugar para funciones
  void _cadenaPrinter() {
    print(cadena);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _cadenaPrinter,
          child: Text(cadena)),
      ),
    );
  }
}