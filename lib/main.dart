import 'package:flutter/material.dart';
import 'secondary.dart';
void main() {
  runApp(const MainApp());
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        fontFamily: 'Monocraft',
        iconTheme: const IconThemeData(color: Colors.teal),
      ),
      home: const ThirdApp(),
    );
  }
}




class ThirdApp extends StatefulWidget {
  const ThirdApp({super.key});

  @override
  State<ThirdApp> createState() => _ThirdAppState();
}

class _ThirdAppState extends State<ThirdApp> {
  String vartext = "";

  void _function() {
    setState(() {
      vartext = "Soy esta función";
    });
  }

  void _changeToUsefulWidget() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MiWidget()));
  }

  void _otrafuncion ()  {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MiWidgetEstatico()));

  }

  void _changeScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondaryApp()));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 99, 75, 143),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                FloatingActionButton.extended(
                  heroTag: "Soy otro tag",
                  tooltip: "Botón",
                  onPressed:() {
                    _function();
                    _otrafuncion();
                  },
                  icon: const Icon(Icons.account_box, color: Colors.green),
                  label: Text(
                    vartext,  // primer parámetro: el string
                    selectionColor: Colors.pink,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 40),
                  ),
                  backgroundColor: Colors.amberAccent,
                  shape: const StadiumBorder(),
                ),
                Text(
                  "TEXTIBIRIS",
                  selectionColor: Colors.pink,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 40,
                  letterSpacing: 10,
                  ),
                ),
                Hero(
                  tag: "adventure-time",
                  child: Image(
                    image:AssetImage(("assets/images/adtime.png")),
                    fit: BoxFit.contain,
                    //width: 900,
                    //height: 900,
                    semanticLabel: "Soy una imagen de hora de aventura",
                    ),
                ),
                Hero(
                  tag: "flutter-example-image-2",
                  child: Image(
                    image:
                    NetworkImage("https://th.bing.com/th/id/OIP.S9ys_hBZMdBZzIOurhMTOwHaEK?rs=1&pid=ImgDetMain"),
                    fit: BoxFit.fitWidth,
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
            title: Text("SOY UN TEXTO"),
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