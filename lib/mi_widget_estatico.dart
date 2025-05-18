//Librerias

import 'package:flutter/material.dart';

class MiWidgetEstatico extends StatelessWidget {
  const MiWidgetEstatico({super.key});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Title(title :"Widget Estatico",color:(Colors.amber), child: Text("Widget Estatico")),
        backgroundColor: Color.fromARGB(255, 100, 150, 200),
        shape: StadiumBorder(),
        elevation: 10,
        centerTitle: true,
        titleSpacing: 200,
      ),
      body: Center(
        child: Column(
          spacing: 100,
          children: [Row(
            spacing: 100,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {},
              child: Text("1")),
              ElevatedButton(onPressed: () {},
              child: Text("2")),
              ElevatedButton(onPressed: () {},
              child: Text("3")),
            ],
          ),
          Row(
            spacing: 100,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {},
              child: Text("4")),
              ElevatedButton(onPressed: () {},
              child: Text("5")),
              ElevatedButton(onPressed: () {},
              child: Text("6")),
            ],
          ),
          Row(
            spacing: 100,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {},
              child: Text("7")),
              ElevatedButton(onPressed: () {},
              child: Text("8")),
              ElevatedButton(onPressed: () {},
              child: Text("9")),
            ],
          ),],
        ),
      ),
    );
  }
}
