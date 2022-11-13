import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'SettingCP.dart';
import 'SettingsRP.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double WFB = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset(0.5, 0.4),
            child: FloatingActionButton.extended(
              icon:Icon(Icons.settings) ,
              label: SizedBox(width:WFB,child: Text("Credit Values")),
              onPressed:(){
                Get.to(
                    Settings_0()
                );
                print("button pressed");
              }
              ,),
          ),
          Align(
            alignment: FractionalOffset(0.5, 0.55),
            child: FloatingActionButton.extended(
              icon:Icon(Icons.settings) ,
              label: SizedBox(width:WFB,child: Text("Result Points")),
              onPressed:(){
                Get.to(
                    Settings_1()
                );
                print("button pressed");
              }
              ,),
          )
        ],
      ),

    );
  }
}
