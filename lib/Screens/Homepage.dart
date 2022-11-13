import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gpacal2/Widgets/getAlertboxes.dart';

import '../Widgets/Alertboxes.dart';
import '../Widgets/Dropdowns.dart';
import '../global.dart';

class MyHome extends StatefulWidget {
  MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  late int len; // represent to length of records (=num of subs)
  late bool is_refreshing; // refresh or nod 
  late String newS; // space for record strings as subject names from the alertbox
  int id =0; // Id unique to each item created;

  refresh() async { // refresh all the records
    is_refreshing = await AlertDialogYN(context,
        "Would you like to continue refreshing that will delete all of your current records ?");
    setState(() {
      print(is_refreshing);
      if(is_refreshing) {
        Records = [];
        Update();

    Get.snackbar(
        "Refreshed","All of your current records were deleted!",
        //animationDuration:Duration(milliseconds:6000),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        barBlur:100,
        icon: Icon(Icons.delete_forever),
        shouldIconPulse: true,
        duration: Duration(milliseconds:3000),
        snackPosition: SnackPosition.BOTTOM,
    );}
    });
  }
  refresh2() async { // refresh all the records
    is_refreshing = await gAlertYN("Would you like to continue refreshing that will delete all of your current records ?");
    setState(() {
      print(is_refreshing);
      if(is_refreshing){
      Records = [];
      Update();
      Get.snackbar(
        "Refreshed","All of your current records were deleted!",
        //animationDuration:Duration(milliseconds:6000),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        barBlur:100,
        icon: Icon(Icons.delete_forever),
        shouldIconPulse: true,
        duration: Duration(milliseconds:3000),
        snackPosition: SnackPosition.BOTTOM,
      );}
    });
  }
  add(){//add a new record
    setState(() {
      id++;
      print(id);
      Records.add(
          Record(
              id:id,
              result: Default_Result,
              credit: Default_credit,
              isGpa: true,
              subname: ''));
      Update();
    });
  }

  update_string(String text) async {
    // get the new value of text field when updating
    String new_text = await AlertDialogText(context,text);
    newS = new_text;
  }


  @override
  Widget build(BuildContext context) {
    len =Records.length;
    //ListV();
    return Scaffold(
        resizeToAvoidBottomInset: false,

        body: Container(width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),

            child: Column(
                children: <Widget>[
                  Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children: <Widget> [
                        Text(
                            'Your GPA : ${gpa.toStringAsFixed(3)}',style: TextStyle(fontSize: 15)),
                        Text('No of Subjects : ${len}',style: TextStyle(fontSize: 15))]),
                  Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children: <Widget> [
                        TextButton(onPressed: len>0 ? refresh2 : null
                            , child: Row(mainAxisAlignment:MainAxisAlignment.end,children: <Widget> [Text('Caculate GPA',style: TextStyle(fontSize: 12)),Icon(Icons.calculate,size: 12)],
                            )),
                        TextButton(onPressed: add
                            , child: Row(mainAxisAlignment:MainAxisAlignment.end,children: <Widget> [Text('Add Subject',style: TextStyle(fontSize: 12)),Icon(Icons.add,size: 12)],)),
                        TextButton(onPressed: len>0 ? refresh : null
                            , child: Row(mainAxisAlignment:MainAxisAlignment.end,children: <Widget> [Text('Refresh',style: TextStyle(fontSize: 12)),Icon(Icons.refresh,size: 12)],)),]),
                  Expanded(
                        child: ListView(shrinkWrap: true,
                            children: Records.map((rec) => DropdownDemo(key: UniqueKey(),
                              id: rec.id, result: rec.result, credit:rec.credit,isChecked: rec.isGpa,
                              subname: rec.subname,
                              change_subname:(newname)async{  //(value(s) from outside of this)
                                newS = await AlertDialogText(context,newname);
                                print(newS);
                                setState(() {
                                  rec.subname = newS;
                                  print("change rec "+rec.id.toString()+" rec-sub name to "+rec.subname);
                                });

                              },
                              delete: (){
                                setState(() {
                                  print("delete");
                                  Records.remove(rec);
                                  Update();
                                });
                              },
                              update: (String rtext,String ctext,bool isch){
                                setState(() {
                                  print("update");
                                  rec.result = rtext;
                                  rec.isGpa =isch;
                                  rec.credit=ctext;
                                  Update();
                                });
                              },

                            )).toList())
                   // ),
                  )]
            )


        )
    );
  }

}