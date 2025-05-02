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

  void _printText() {
    setState(() {
      print("Esto es un mensaje de debug");
    });
    
  }

  void _otrafuncion () async {
    await Future.delayed(Duration(seconds: 10));
//funcion asincrona no referenciada
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
            child: FloatingActionButton(
              onPressed: _changeScreen,
              shape: BeveledRectangleBorder(),
              hoverColor: Color.fromARGB(100, 1, 1, 1),
              child: Text(
                style: TextStyle(fontSize: 20,color: Colors.black,
                ),
                "USAME SOY UN PERSISTENT FOOTER BUTTON",
              ),
            ),
          ),
        )
      ],
    );
  }
}
