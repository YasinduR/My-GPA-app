

import 'package:flutter/material.dart';
import 'Alertboxes.dart';
import '../global.dart';

class DropdownDemo extends StatefulWidget {
  String result;
  String credit;
  String subname;

  //List <String> Credits = ["5 Credit","4.5 Credit","4 Credit", "3.5 Credit","3 Credit","2.5 Credit", "2 Credit","1.5 Credit", "1 Credit","Other"];
  //List <String> Results = ["A+", "A", "A-", "B+", "B", "B-","C+", "C", "C-","D", "iwe"];
  //List <String> Results = RE.Results.map((i)=>i.result).toList();

  Function delete;
  Function update;
  Function change_subname;

  int id;
  bool isChecked;
  //bool hasDeleted = false;


  DropdownDemo({super.key,
    required this.id,
    required this.delete,
    required this.credit,
    required this.result,
    required this.isChecked,
    required this.update,
    required this.subname,
    required this.change_subname,
  });

/*
  void delete(){
    this.isChecked = false;
    this.hasDeleted =true;
    print("check box "+this.isChecked.toString());
    print("delete  "+this.hasDeleted.toString());
  }
*/

  @override
  State<DropdownDemo> createState() => _DropdownDemoState();
}
class _DropdownDemoState extends State<DropdownDemo> {

  //late String dropdownValue ;
 // late String dropdownsub ;
  //String SubName ="change";
  //String S ="";
  String newCred ="";
  //late bool isChecked;
  //List <String> Credits =["5 Credit","4.5 Credit","4 Credit", "3.5 Credit","3 Credit","2.5 Credit", "2 Credit","1.5 Credit", "1 Credit","Other"];
  double newval = 0;
  other() async {
    newval = await AlertDialogDouble(context);
  }

  


  @override

  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start,
        children: [IconButton(onPressed: () {
            widget.change_subname(widget.subname);
          }
              , icon: Icon(Icons.create,size: 13,),
              //child: Row(mainAxisAlignment:MainAxisAlignment.start,children: <Widget> [Icon(Icons.create,size: 12),SizedBox(width: 5.00),Text(widget.subname,style: TextStyle(fontSize: 12))],)
          ),
          SizedBox(width:75,child: Text(widget.subname,style: TextStyle(fontSize: 12))),
          //Container(width: 15,height: 50,),
          //SizedBox(height: 50,)
         // ,
          // Step 2.
          Container(width: 75,
            child: DropdownButton<String>(menuMaxHeight: 350,isExpanded:true ,
              // Step 3.
              value: widget.credit,
              // Step 4.
              items: Credits.map((i)=>Dropcap(i)).toList().map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 12),
                  ),
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) //async
              {
                //if(newValue=="Other"){
                 // newval = await AlertDialogDouble(this.context);
               //   if(isInteger(newval)){newCred = (newval.toInt()).toString()+" Credit";}
                //  else{newCred = newval.toString()+" Credit";}
                 // if(!widget.Credits.contains(newCred)){widget.Credits.add(newCred);}
                 // newValue = newCred;
                //}
                setState(() {
                  widget.credit = newValue!;// to update value in this
                  widget.update(widget.result,widget.credit,widget.isChecked);

                });
              },
            ),
          ),
          //Container(width: 15,height: 50,),
          //SizedBox(height: 50,),
          // Step 2.
          DropdownButton<String>(menuMaxHeight: 350,
            // Step 3.
            value: widget.result,
            // Step 4.
            items: Results.map((i)=>i.result).toList()
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 12),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                widget.result= newValue!;// to update value in this
                widget.update(widget.result,widget.credit,widget.isChecked);// to update value in global
              });
            },
          ),
              Checkbox(activeColor: Colors.blue,
              value: widget.isChecked,
              onChanged: (bool? value) {
              setState(() {
                  widget.isChecked = value!;
                  widget.update(widget.result,widget.credit,widget.isChecked);
    });
    },
    ),IconButton(onPressed:(){
          widget.delete();
          }, icon: Icon(Icons.delete,size: 13))
        ]);
  }
}