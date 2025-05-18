//Librerias
import 'package:flutter/material.dart';
import 'package:learning_app/mi_widget.dart' show MiWidget;
import 'package:learning_app/mi_widget_estatico.dart';
import 'package:learning_app/secondary.dart';

class ThirdApp extends StatefulWidget { //Widget con estado, aca solo crea la clase
  const ThirdApp({super.key});



  @override
  State<ThirdApp> createState() => _ThirdAppState(); //Aca creamos el estado
}
class _ThirdAppState extends State<ThirdApp> { //Estado del widget
  String vartext = "";

  void _function() {
    setState(() { //SetState actualiza el estado, no recibe funciones async ni funciona en Stateless
      vartext = "Bienvenido";
    });
  }

  void _changeToUsefulWidget() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MiWidget())); //Navegación simplemente con push
  }

  void _otraFuncion()  {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MiWidgetEstatico())); //Navegación con push sirve a baja escalabilidad

  }

  void _changeScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondaryApp())); //Navegacion PushNamed y GenerationRoute mejor para apps mas grandes y de mayor escala

  }


  @override //Aca buildeamos el widget con sus respectivos hijos que pueden actualizar su estado
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
              FloatingActionButton.extended(
                heroTag: "button-1",
                tooltip: "Ir a siguiente pagina",
                onPressed:() {
                  _function();
                  _otraFuncion();
                },
                icon: Icon(Icons.account_box, color: Colors.purple[900]),
                label: Text(
                  vartext,  // primer parámetro: el string
                  selectionColor: Colors.pink,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 40), //Usa el estilo del MaterialApp
                ),
                backgroundColor: Colors.amberAccent,
                shape: const StadiumBorder(),
              ),
              Text(
                "Flutter App",
                selectionColor: Colors.pink,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 40,
                letterSpacing: 8, 
                ),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.rectangle,
                  border: Border.symmetric(),
                  ),
                child: GestureDetector(
                  onDoubleTap: _changeScreen,
                  child: Image(
                    image:AssetImage(("assets/images/adtime.png")),
                    fit: BoxFit.scaleDown,
                    semanticLabel: "Soy una imagen de hora de aventura",
                    ),
                ),
              ),
              Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(color: Colors.amber,shape: BoxShape.rectangle),
                child: Image(
                  image:
                  NetworkImage("https://th.bing.com/th/id/OIP.S9ys_hBZMdBZzIOurhMTOwHaEK?rs=1&pid=ImgDetMain"),
                  fit: BoxFit.scaleDown,
                  width: 50,
                  height: 50,
                  ),
              )
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Center(
          child: SizedBox(
            width: 500,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 100,
              children: [
                ElevatedButton(
                  onPressed: _changeScreen,
                  child: Text(
                    style: TextStyle(fontSize: 20,color: Colors.black,
                    ),
                    "USAME",
                  ),
                ),
                FloatingActionButton(
                  onPressed: _changeToUsefulWidget,
                  heroTag: "Boton-2",
                  shape: StadiumBorder(),
                  hoverColor: Colors.white,
                  tooltip: "Cambiar pantalla",
                  child:
                    Text(
                      "LIC",
                      style: TextStyle(fontSize: 20,color: Colors.black,
                    ),
                  ),
                    
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
