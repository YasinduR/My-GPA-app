




import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

gAlertYN(String Context) {
  return Get.defaultDialog(
      barrierDismissible: false,
      title: "Confirm",
      middleText:Context,
      //  "Would you like to continue refreshing that will delete all of your current records ?",
    // textConfirm: "Continue",
    //   textCancel: "Cancel",
      actions: [
        Row(
          mainAxisAlignment:MainAxisAlignment.end,
          children:<Widget>[
        ElevatedButton(
            child: Text("Continue"),
            onPressed: (){
              Get.back(result:true); // Return true
            }
        ),SizedBox(width:10),
        ElevatedButton(
            child: Text("Cancel"),
            onPressed: (){
              Get.back(result:false); // Return false
            }
        ),
      ],)
    // onConfirm:(){
    //   Get.back(result:true);},
    // onCancel: (){
    //   Get.back(result:false);}
  ]);
}