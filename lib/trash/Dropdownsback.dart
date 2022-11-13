
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'Alertboxes.dart';

class DropdownDemo extends StatefulWidget {
  String dropdownValue ="B";
  String dropdownsub ="2 Credit";
  bool isChecked = true;
  bool hasDeleted = false;
  DropdownDemo();
//
  void upVal(String a){
    this.dropdownValue =a;
  }
  void upSub(String a){
    this.dropdownsub =a;
  }
  void upCheck(bool Y){
    this.isChecked = Y;
  }
  void delete(){
    this.isChecked = false;
    this.hasDeleted =true;
    print("check box "+this.isChecked.toString());
    print("delete  "+this.hasDeleted.toString());
  }


  double mark(){
    String K = this.dropdownValue;
    //print("state :"+K);
    if (K=="A"){
      return 4.0;
    }
    else if(K=="A+"){
      return 4.2;
    }
    else if(K=="A-"){
      return 3.7;
    }
    else if(K=="B+"){
      return 3.3;
    }
    else if(K=="B"){
      return 3.0;
    }
    else if(K=="B-"){
      return 2.7;
    }
    else if(K=="C+"){
      return 2.3;
    }
    else if(K=="C"){
      return 2.0;
    }
    else if(K=="C-"){
      return 1.7;
    }
    else if(K=="D"){
      return 1.5;
    }
    else{
      return 0.0;
    }
  }
  double credit(){
      String K = this.dropdownsub;
      double a = double.parse(K.split(" ")[0]);
      return a;
  }

  @override
  State<DropdownDemo> createState() => _DropdownDemoState(this.dropdownValue,this.dropdownsub,this.isChecked);
}
class _DropdownDemoState extends State<DropdownDemo> {

  String dropdownValue ;
  String dropdownsub ;
  String SubName ="";
  String S ="";
  String newCred ="";
  bool isChecked;
  List <String> Credits =["5 Credit","4.5 Credit","4 Credit", "3.5 Credit","3 Credit","2.5 Credit", "2 Credit","1.5 Credit", "1 Credit","Other"];
  _DropdownDemoState(this.dropdownValue,this.dropdownsub, this.isChecked);
  double newval = 0;
  other() async {
    newval = await AlertDialogDouble(this.context);
  }
  bool isInteger(num value) => value is int || value == value.roundToDouble();
  // check whether double is a int


  @override

  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [SizedBox(
          width: 120,
          child: TextButton(onPressed: () async {
            SubName = await AlertDialogText(this.context,S);
            setState(() {
              S = SubName;
            });
          }
              , child: Row(mainAxisAlignment:MainAxisAlignment.start,children: <Widget> [Icon(Icons.create,size: 14),SizedBox(width: 10.00),Text(S,style: TextStyle(fontSize: 14))],
              ))),
          //Container(width: 15,height: 50,),
          //SizedBox(height: 50,)
         // ,
          // Step 2.
          Container(width: 120,
            child: DropdownButton<String>(isExpanded:true ,
              // Step 3.
              value: this.dropdownsub,
              // Step 4.
              items: Credits
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) async {
                if(newValue=="Other"){
                  newval = await AlertDialogDouble(this.context);
                  if(isInteger(newval)){newCred = (newval.toInt()).toString()+" Credit";}
                  else{newCred = newval.toString()+" Credit";}
                  if(!Credits.contains(newCred)){Credits.add(newCred);}
                  newValue = newCred;
                }
                setState(() {
                  this.widget.upSub(newValue!);//to update stored value at the main app
                  this.dropdownsub = newValue!;// to update value in dropbox
                });
              },
            ),
          ),
          //Container(width: 15,height: 50,),
          //SizedBox(height: 50,),
          // Step 2.
          DropdownButton<String>(
            // Step 3.
            value: this.dropdownValue,
            // Step 4.
            items: <String>["A+", "A", "A-", "B+", "B", "B-","C+", "C", "C-","D", "iwe"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 14),
                ),
              );
            }).toList(),
            // Step 5.
            onChanged: (String? newValue) {
              setState(() {
                this.widget.upVal(newValue!);// to update stored value at the main app
                this.dropdownValue = newValue!; // to update value in dropbox

              });
            },
          ),
              Checkbox(
              value: this.isChecked,
              onChanged: (bool? value) {
              setState(() {
                this.widget.upCheck(value!);
                this.isChecked = value!;
    });
    },
    ),//IconButton(onPressed: (){setState(() {this.widget.delete();});}, icon: Icon(Icons.delete))

          //IconButton(onPressed:(){}, icon: Icon(Icons.delete))

        ]);
  }
}