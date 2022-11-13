
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Theme.dart';
import 'Alertboxes.dart';
import '../global.dart';

class DrawerList extends StatefulWidget {
  Function Changestate;
  // Changestate fuction will refresh scaffold/body currently
  // connected to the material app
  // this Drawerlist <-----> Matapp <----> Myhome/summary/ setttingS
  DrawerList({super.key,required this.Changestate});

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  // Changetheme() {
  //   setState(() {
  //     if (THM == ThemeMode.dark){THM=ThemeMode.light;}
  //     else{THM=ThemeMode.dark;}// Changing global theme THM
  //     print(THM);
  //     widget.Changestate();
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
        SizedBox(height: 75,
        child: DrawerHeader(
        margin : EdgeInsets.zero,
        padding: EdgeInsets.only(left:25,top:12.5),
      //decoration: BoxDecoration(color: Colors.blue,),
      child: Text(style:TextStyle(fontSize: 20),'Menu'),
    ),
    ),
    ListTile(
      leading: Icon(
      Icons.queue,),
      title: const Text(style:TextStyle(fontSize: 16),"Add New Credit Value"),
      onTap: () async {
      var newcred = await AlertDialogDouble(context);
      //print("n:"+newcred.toString());
      setState(() {
      widget.Changestate();
      Credit_Value_Addition(newcred);
    });
    Navigator.pop(context);
    },
    ),
      ListTile(
      leading: Icon(
      Icons.delete_forever,
      ),
      title: const Text(style:TextStyle(fontSize: 16),"Delete A Credit Value"),
      onTap: () async {
      String delcred
      = await AlertDialogDrops(context,Credits.map((i)=>Dropcap(i)).toList(),Default_credit);
      print(delcred);
      setState(() {
      if (delcred==""){}
      // CANCle button is pressed
      else{
        Refresh_Due_To_Credit_Value_Removal(delcred);
        widget.Changestate();
        }
      });
      Navigator.pop(context);
      },
      ),
          ListTile(
            leading: Icon(
              Icons.lock,),
            title: const Text(style:TextStyle(fontSize: 16),"Change The Default Credit"),
            onTap: () async {
              String defcred =
              await AlertDialogDrops(context,Credits.map((i)=>Dropcap(i)).toList(),Default_credit);
              //print("n:"+newcred.toString());
              setState(() {
                if (defcred==""){}
                // CANCle button is pressed
                else{
                  Set_Default_Credit(defcred);
                  widget.Changestate();
                }
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.label,),
            title: const Text(style:TextStyle(fontSize: 16),"Change The Default Result"),
            onTap: () async {
              String defres =
              await AlertDialogDrops(context,Results.map((i)=>i.result).toList(),Default_Result);
              //print("n:"+newcred.toString());
              setState(() {
                if (defres==""){}
                // CANCle button is pressed
                else{
                  Set_Default_Result(defres);
                  widget.Changestate();
                }
              });
              Navigator.pop(context);
            },
          ),


          Divider(),

      ListTile(
        leading:
            Obx(()=>Icon(THM == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode))
      ,
       title: const Text(style:TextStyle(fontSize: 16),"Change Theme"),
        onTap: () {
          themeController.changeThemeMode();
        },
        ),



        ],



    );
  }
}

