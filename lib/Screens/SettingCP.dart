import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gpacal2/Widgets/Alertboxes.dart';

import '../global.dart';




class Settings_0 extends StatefulWidget {
  //Function ChangePage;
  //Settings_0({super.key, required this.ChangePage});
  Settings_0({super.key});
  @override
  State<Settings_0> createState() => _Setting_0State();
}
bool is_unlocked(value) => value!=Default_credit;
// if cred value equals


class _Setting_0State extends State<Settings_0> {
  @override
  Widget build(BuildContext context) {
    List Credits_copy =Credits.map((i)=>Dropcap(i)).toList();
    double WFB = 100.0;// Width of Floating Buttons's label

   bool ContainsAll(){
      for(double cred in Credits_default){
        if(!Credits.contains(cred)){
          return false;
        }
      }
      return true;
    }
  Import_All() async {
    var is_import_values = await AlertDialogYN(context,
        "Would you like to import all default values ?");
    if(is_import_values){
      setState(() {
        Import_all_default_Credit_values();
      });
    }
  }

    return Scaffold(appBar: AppBar(title:Text('Settings > Credit Values')),
        floatingActionButton:Stack(
          children: <Widget>[
            Align(
              alignment: FractionalOffset(1.0, 0.61),
              child: FloatingActionButton.extended(//backgroundColor:!is_Modify_Results? null:Colors.grey, //disabledElevation: 100,
                icon:Icon(Icons.add_box), label: SizedBox(width:WFB,child: Text("Add Value")),
                onPressed:()async{
                  var newV = await AlertDialogDouble(context);
                  setState(() {
                    Credit_Value_Addition(newV);
                  });
                },),
            ),
            Align(
              alignment: FractionalOffset(1.0, 0.74),
              child: FloatingActionButton.extended(backgroundColor:Credits.length>1? null:Colors.grey,//disabledElevation: 100,
                icon:Icon(Icons.lock), label: SizedBox(width:WFB,child: Text("Set Default")),
                onPressed:()async{
                  var newV =
                  await AlertDialogDrops(context,Credits.map((i)=>Dropcap(i)).toList(),Default_credit);
                  if (newV==""){}
                  else{setState(() {
                    Set_Default_Credit(newV);
                  });}
                },),
            ),
            Align(
              alignment: FractionalOffset(1.0, 0.87),
              child: FloatingActionButton.extended(backgroundColor:!ContainsAll()? null:Colors.grey,
                icon:Icon(Icons.factory) ,label: SizedBox(width:WFB,child: Text("Import Default Values")),
                onPressed:ContainsAll()?null:Import_All
                ,),
            ),
            // Align(
            //   alignment: FractionalOffset(1.0, 0.1),
            //   child: FloatingActionButton.extended(
            //     icon:Icon(Icons.settings) ,
            //     label: SizedBox(width:WFB,child: Text("Result Points")),
            //     onPressed:(){
            //       //widget.ChangePage();
            //       print("button pressed");
            //     }
            //     ,),
            // )
          ],
        ),
        body:Container(
            child:Column(
              children: [
                // Container(height: 40,
                //   child: Row(crossAxisAlignment:CrossAxisAlignment.center,mainAxisSize:MainAxisSize.max,mainAxisAlignment:MainAxisAlignment.start,
                //       children: <Widget> [SizedBox(width:10),
                //         Text('Settings > Credit Values',style: TextStyle(fontSize: 15)),
                //         //Text('Points',style: TextStyle(fontSize: 15))
                //       ]),
                // ),
                Expanded(flex: 1,
                    child: ListView(
                    children: Credits_copy.map((e)=>
                        Dismissible(onDismissed:(i){
                          print(e);
                          if(is_unlocked(e)){
                            Refresh_Due_To_Credit_Value_Removal(e);

                            Get.snackbar(
                                "Deleted","${e} value was deleted!",
                                animationDuration:Duration(milliseconds:1000),
                                isDismissible: true,
                                dismissDirection: DismissDirection.horizontal,
                                barBlur:100,
                                icon: Icon(Icons.delete),
                                shouldIconPulse: true,
                                duration: Duration(milliseconds:3000),
                                snackPosition: SnackPosition.BOTTOM,
                                mainButton:
                                TextButton(
                                    onPressed:(){
                                      Get.back();//pop out the snxkbar
                                      setState(() {
                                        Credit_Value_Addition(double.parse(e.split(" ")[0]));
                                      });
                                      },
                                    // ADD DELETED VALUE AGAIN
                                    child: Icon(Icons.undo))
                            );
                          setState(() {
                            //Refresh_Due_To_Credit_Value_Removal(e);
                            //print(e);
                            print(Credits);
                          });}
                        } ,
                            direction: is_unlocked(e)? DismissDirection.endToStart:DismissDirection.none,
                            key: UniqueKey(),
                              child: Container(margin:EdgeInsets.only(top:10,bottom:10,right:230,left:20) ,width: 150,
                                decoration: BoxDecoration(border: Border.all()//color:THM == ThemeMode.dark ? Colors.white54 : Colors.black),
                                   , borderRadius:BorderRadius.circular(10) ),
                                child: Row(
                          children: [SizedBox(width:60,height:50,child:Icon(is_unlocked(e)? Icons.delete:Icons.lock) ,),
                                Text(style: TextStyle(fontSize: 15),e.toString())
                          ],
                        ),
                              ),
                           // )
                        )).toList()
                )
                ),
                //other childsn-- ok button
              ],
            )
        )
    );
  }
}
