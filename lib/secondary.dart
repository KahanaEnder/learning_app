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
    setState(() {
      cadena = "Cambio de String";
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Pantalla"),
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(Icons.arrow_back),
          tooltip: "Atras",
          ),
          
        backgroundColor: Colors.blue,
      ),
      
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed:null,
              child: Text("Función desactivada")),
            FloatingActionButton.extended(
              onPressed: _cadenaPrinter,
              label: Text(cadena),
              ),
          ],
        ),
      ),
    );
  }
}

