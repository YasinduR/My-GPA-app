

import 'package:flutter/material.dart';
import 'Alertboxes.dart';

class DropdownDemo extends StatefulWidget {
  String dropdownValue = "B";
  String dropdownsub = "2 Credit";
  List <String> Credits = ["5 Credit","4.5 Credit","4 Credit", "3.5 Credit","3 Credit","2.5 Credit", "2 Credit","1.5 Credit", "1 Credit","Other"];
  List <String> results = ["A+", "A", "A-", "B+", "B", "B-","C+", "C", "C-","D", "iwe"];
  Function delete;
  int id;
  bool isChecked = true;
  bool hasDeleted = false;
  DropdownDemo({super.key, required this.id, required this.delete});

//
  void upVal(String a){
    dropdownValue =a;
  }
  void upSub(String a){
    dropdownsub =a;
  }
  void upCheck(bool Y){
    isChecked = Y;
  }
/*
  void delete(){
    this.isChecked = false;
    this.hasDeleted =true;
    print("check box "+this.isChecked.toString());
    print("delete  "+this.hasDeleted.toString());
  }
*/

  double mark(){
    String K = dropdownValue;
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
      String K = dropdownsub;
      double a = double.parse(K.split(" ")[0]);
      return a;
  }

  @override
  State<DropdownDemo> createState() => _DropdownDemoState();
}
class _DropdownDemoState extends State<DropdownDemo> {

  //late String dropdownValue ;
 // late String dropdownsub ;
  String SubName ="";
  String S ="";
  String newCred ="";
  //late bool isChecked;
  //List <String> Credits =["5 Credit","4.5 Credit","4 Credit", "3.5 Credit","3 Credit","2.5 Credit", "2 Credit","1.5 Credit", "1 Credit","Other"];
  double newval = 0;
  other() async {
    newval = await AlertDialogDouble(context);
  }
  bool isInteger(num value) => value is int || value == value.roundToDouble();
  // check whether double is a int


  @override

  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [SizedBox(
          width: 110,
          child: TextButton(onPressed: () async {
            SubName = await AlertDialogText(this.context,S);
            setState(() {
              S = SubName;
            });
          }
              , child: Row(mainAxisAlignment:MainAxisAlignment.start,children: <Widget> [Icon(Icons.create,size: 15),SizedBox(width: 5.00),Text(S,style: TextStyle(fontSize: 15))],
              ))),
          //Container(width: 15,height: 50,),
          //SizedBox(height: 50,)
         // ,
          // Step 2.
          Container(width: 80,
            child: DropdownButton<String>(isExpanded:true ,
              // Step 3.
              value: widget.dropdownsub,
              // Step 4.
              items: widget.Credits.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 15),
                  ),
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) async {
                if(newValue=="Other"){
                  newval = await AlertDialogDouble(this.context);
                  if(isInteger(newval)){newCred = (newval.toInt()).toString()+" Credit";}
                  else{newCred = newval.toString()+" Credit";}
                  if(!widget.Credits.contains(newCred)){widget.Credits.add(newCred);}
                  newValue = newCred;
                }
                setState(() {

                  widget.dropdownsub = newValue!;// to update value in dropbox
                });
              },
            ),
          ),
          //Container(width: 15,height: 50,),
          //SizedBox(height: 50,),
          // Step 2.
          DropdownButton<String>(
            // Step 3.
            value: widget.dropdownValue,
            // Step 4.
            items: widget.results
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 15),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                widget.dropdownValue = newValue!; // to update value in dropbox
              });
            },
          ),
              Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
              setState(() {
                  widget.isChecked = value!;
    });
    },
    ),IconButton(onPressed: (){setState(() {
      print(widget.id);
     widget.delete;});}, icon: Icon(Icons.delete,size: 17))

          //IconButton(onPressed:(){}, icon: Icon(Icons.delete))

        ]);
  }
}