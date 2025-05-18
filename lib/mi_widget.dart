//Librerias
import 'package:flutter/material.dart';

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
