//Librerias
import 'package:flutter/material.dart';
import 'secondary.dart';



//Metodo Main
void main() {
  runApp(const MainApp());
}


//Clase principal que se llama en el main (Estatica/Stateless/Sin estado)
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

  void _otrafuncion ()  {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MiWidgetEstatico())); //Navegación con push sirve a baja escalabilidad

  }

  void _changeScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondaryApp())); //Navegacion PushNamed y GenerationRoute mejor para apps mas grandes y de mayor escala

  }


  @override //Aca buildeamos el widget con sus respectivos hijos que pueden actualizar su estado
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                FloatingActionButton.extended(
                  heroTag: "button-1",
                  tooltip: "Ir a siguiente pagina",
                  onPressed:() {
                    _function();
                    _otrafuncion();
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
                  decoration: BoxDecoration(color: Colors.amber,shape: BoxShape.rectangle,border: Border.symmetric(),gradient: LinearGradient(colors: [Colors.amber,Colors.white  ])),
                  child: Hero(
                    tag: "adventure-time-image",
                    child: GestureDetector(
                      onDoubleTap: _changeScreen,
                      child: Image(
                        image:AssetImage(("assets/images/adtime.png")),
                        fit: BoxFit.scaleDown,
                        width: 100,
                        height: 100,
                        semanticLabel: "Soy una imagen de hora de aventura",
                        ),
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  width: 500,
                  decoration: BoxDecoration(color: Colors.amber,shape: BoxShape.circle),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Hero(
                      tag: "flutter-example-image-2",
                      child: Image(
                        image:
                        NetworkImage("https://th.bing.com/th/id/OIP.S9ys_hBZMdBZzIOurhMTOwHaEK?rs=1&pid=ImgDetMain"),
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
                        ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]
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







class MiWidgetEstatico extends StatelessWidget {
  const MiWidgetEstatico({super.key});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 100, 150, 200),
        shape: StadiumBorder(),
      
      ),
    );
  }
}









class MiWidget extends StatefulWidget {
  const MiWidget({super.key});

  @override
  State<MiWidget> createState() => _MiWidgetState();
}

class _MiWidgetState extends State<MiWidget> {
  bool _isChecked = false;

  void _statefulfunction(bool? newValue) {
    setState(() {
      _isChecked = newValue ?? false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AboutDialog(
        applicationName: "Learning APP",
        applicationIcon: Icon(Icons.app_shortcut_sharp),
        applicationVersion: "1.0.0",
        children: <Widget>[
          AlertDialog(
            title: Text("LICENCIAS"),
          ),
          Checkbox(
            value: _isChecked,
            onChanged: _statefulfunction,
          ),
        ],
      ),
    );
  }
}