




import 'package:flutter/material.dart';
import 'TextFieldWithRefresh.dart';


Future<bool> AlertDialogYN(BuildContext context,String Dialogue)  async {
  // Create a AlertDialog - Yes / No Type.
  bool isok = false;
  //
  AlertDialog dialog = AlertDialog(
    title: Text("Confirm"),
    content: Text(Dialogue),
    shape: RoundedRectangleBorder(
      //side:  BorderSide(color: Colors.green,width: 3),
        borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    actions: [
      ElevatedButton(
          child: Text("Continue"),
          onPressed: (){
            Navigator.of(context).pop(true); // Return true
          }
      ),
      ElevatedButton(
          child: Text("Cancel"),
          onPressed: (){
            Navigator.of(context).pop(false); // Return false
          }
      ),
    ],
  );

  // Call showDialog function.
  Future futureValue = showDialog(barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return dialog;
      }
  );

  await futureValue.then( (value) { // value will return from show dialog when it pops out
    //wait
    isok = value;// true/false
  });
  //print(isok);
  return isok;
}





Future<String> AlertDialogText(BuildContext context,String S)  async {

  TextWithRefresh T =TextWithRefresh(text:S); // TEXTBOX WITH REFRESH BUTTON
  // Create a AlertDialog - return string Type.//
  //  S = Existing Value of the Field

  AlertDialog dialog = AlertDialog(
    title: Text("Enter the Subject Name"),
    content: T,
    shape: RoundedRectangleBorder(
      //side:  BorderSide(color: Colors.green,width: 3),
        borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    actions: [
      ElevatedButton(
          child: Text("OK"),
          onPressed: (){
            Navigator.of(context).pop(true); // Return true
          }
      ),
      ElevatedButton(
          child: Text("Cancel"),
          onPressed: (){
            Navigator.of(context).pop(false); // Return false
          }
      ),
    ],
  );

  // Call showDialog function.
  Future futureValue = showDialog(barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return dialog;
      }
  );

  await futureValue.then( (value) {
    // value will return from show dialog when it pops out
    if(value){
       S = T.text;
    };// ok==> true => newtext / cancle => false==> existing text
  });
  return S;
}


Future<double> AlertDialogDouble(BuildContext context)  async {
  // Create a AlertDialog - return Double Type.
  double Num = 0;
  AlertDialog dialog = AlertDialog(
    title: Text("Enter a new credit value"),
    content: TextField(keyboardType: TextInputType.number,maxLength: 5,onChanged:(text){
      Num = double.parse(text);
    } ),
    shape: RoundedRectangleBorder(
      //side:  BorderSide(color: Colors.green,width: 3),
        borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    actions: [
      ElevatedButton(
          child: Text("OK"),
          onPressed: (){
            Navigator.of(context).pop(true); // Return true
          }
      ),

    ],
  );

  // Call showDialog function.
  Future futureValue = showDialog(barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return dialog;
      }
  );

  await futureValue.then( (value) {
    // to make sure ok button pressed
    // valude will return from show dialog when it pops out
    // ok==> true => text field/ cancle => false==>""
  });
  return Num;
}


Future<String> AlertDialogDrops(BuildContext context,list ,Def_V)  async {
  // Create a AlertDialog - Yes / No Type.
  //bool isok = false;
  String output ="";
  //String DefaultC ="0 Credits";
  //List <String> list = Credits.map((i)=>Dropcap(i)).toList();
  list.remove(Def_V); // default credit value is not removable
  print(list);
  SingleDropmenu Drop = SingleDropmenu(list: list,value: list[0]);
  AlertDialog dialog = AlertDialog(
    title: Text("Confirm"),
    content: Container(width: 75,
      child:Drop ,
    ),
    shape: RoundedRectangleBorder(
      //side:  BorderSide(color: Colors.green,width: 3),
        borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    actions: [
      ElevatedButton(
          child: Text("Continue"),
          onPressed: (){
            Navigator.of(context).pop(true); // Return true
          }
      ),
      ElevatedButton(
          child: Text("Cancel"),
          onPressed: (){
            Navigator.of(context).pop(false); // Return false
          }
      ),
    ],
  );

  // Call showDialog function.
  Future futureValue = showDialog(barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return dialog;
      }
  );

  await futureValue.then( (value) { // value will return from show dialog when it pops out
    if(value){
      output = Drop.value;
    }

  });
  //print(isok);
  return output;
}


class SingleDropmenu extends StatefulWidget {
  List <String> list;

  String value;

  //String title;
  SingleDropmenu({super.key, required this.list,
  required this.value
  });

  @override
  State<SingleDropmenu> createState() => _SingleDropmenuState();
}

class _SingleDropmenuState extends State<SingleDropmenu> {

  @override
  Widget build(BuildContext context) {

    return DropdownButton<String>(isExpanded:true ,
      // Step 3.
      value: widget.value,
      // Step 4.
      items: widget.list.map<DropdownMenuItem<String>>((String v) {
        return DropdownMenuItem<String>(
          value: v,
          child: Text(
            v,
            style: TextStyle(fontSize: 12),
          ),
        );
      }).toList(),

      onChanged: (String? newValue) //async
      {
        setState(() {
          widget.value = newValue!;// to update value in this
        });
      },
    );
  }
}


