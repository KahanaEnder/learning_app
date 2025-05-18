//Librerias
import 'package:flutter/material.dart';
import 'package:learning_app/third_app.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});//La key es el identificador unico para llamarlo


//Función que construye el widget
  @override//Override siempre para construir el widget personalizado que hagamos
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Marca de agua del debug
      theme: ThemeData(
          fontFamily: 'Monocraft',
          iconTheme: const IconThemeData(color: Colors.teal), //Aca en el tema del MaterialApp definimos los estilos para todo lo demas
      ),
      home: const ThirdApp(), //Widget root default para la app 
    );
  }
}
