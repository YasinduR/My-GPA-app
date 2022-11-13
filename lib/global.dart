
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Global methods
// Changetheme() {
//   if (THM == ThemeMode.dark){THM=ThemeMode.light.obs;}
//   else{THM=ThemeMode.dark.obs;}// Changing global theme THM
//   print(THM);
// }
Update(){ // Update GPA VAULE  - Invoke this wh  //globally update  gpa value

    scred =0;
    scgpa =0;
    for (Record F in Records) {
      if(F.isGpa){
        scred += F.Credit();
        scgpa += F.Points()*F.Credit();
      }
    }
    gpa = scgpa/scred;
    if (gpa.isNaN){ // NaN =0.000
      gpa =0;
    }

}

Refresh_Due_To_Credit_Value_Removal(String Delcred){
  for(Record rec in Records){
    if(rec.credit == Delcred){
      rec.credit = Default_credit;
    }}
    Credits.remove(double.parse(Delcred.split(" ")[0]));//remove Credit value
    print(Credits);
    Credits.sort((a, b) => b.compareTo(a));
    Update();

  }

Credit_Value_Addition(double newC){
  if(!Credits.contains(newC) && newC>0 ){
    Credits.add(newC);
    Credits.sort((a, b) => b.compareTo(a));
    Update();
  }
}
Set_Default_Credit(String text){
  Default_credit= text;
}
Set_Default_Result(String text){
  Default_Result = text;
}
Import_all_default_Credit_values(){
  for(double i in Credits_default){
    if(!Credits.contains(i) && i>0 ){
      Credits.add(i);
    }}
  Credits.sort((a, b) => b.compareTo(a));
  Update();
}



bool isInteger(value) => value is int || value == value.roundToDouble(); // check whether double is a int
String Dropcap(num value) { // prepare dropmenuitem names for credits - num values
  String S;
  if (isInteger(value)) {
    S = (value.toInt()).toString()+" Credit";}
  else{ S = value.toString()+" Credit";}
  return S;
}

// Global CLASSES
class Record{  // Class record declaration
  int id;
  String result;
  String credit; // CONVERTED TO STRING 2 --> 2 Credit
  late String subname;
  bool isGpa;
  Record({required this.id,required this.result,required this.credit,required this.isGpa,required this.subname});

  double Points(){
    double P = Results[Results.indexWhere((i)=>i.result==result)].points;
    return P;
  }

  double Credit(){
    String K = credit;
    double a = double.parse(K.split(" ")[0]);
    return a;
  }


}

class Result{   // EX  - A : 4.2
  String result;
  double points;
  Result({key,required this.result,required this.points});


}




//Global Variables
late double scred; //sigma credits
late double scgpa; // sigma credits x gpa
double gpa = 0;

List <double> Credits = [
  5,
  4.5,
  4,
  3.5,
  3,
  2.5,
  2,
  1.5,
  1
  ];
List <double> Credits_default = [
  5,
  4.5,
  4,
  3.5,
  3,
  2.5,
  2,
  1.5,
  1
];
  List<Result> Results =[

    Result(result: "A+", points: 4.2),
    Result(result: "A", points: 4.0),
    Result(result: "A-", points: 3.7),

    Result(result: "B+", points: 3.3),
    Result(result: "B", points: 3.0),
    Result(result: "B-", points: 2.7),

    Result(result: "C+", points: 2.3),
    Result(result: "C", points: 2.0),
    Result(result: "C-", points: 1.7),

    Result(result: "D+", points: 1.5),
    Result(result: "D", points: 1.0),
    Result(result: "F", points: 0),

  ];

//List<Result> Results_updating  = Results;

final List<Result> Results_default  = [

  Result(result: "A+", points: 4.2),
  Result(result: "A", points: 4.0),
  Result(result: "A-", points: 3.7),

  Result(result: "B+", points: 3.3),
  Result(result: "B", points: 3.0),
  Result(result: "B-", points: 2.7),

  Result(result: "C+", points: 2.3),
  Result(result: "C", points: 2.0),
  Result(result: "C-", points: 1.7),

  Result(result: "D+", points: 1.5),
  Result(result: "D", points: 1.0),
  Result(result: "F", points: 0),

];



List<Result> Results_updating  =
          Results_default.map((item)
        => Result(result:item.result, points:item.points)).toList();

int Setting_Pg_No = 0; //---> Result points setting page =1
List<Record> Records =[];  // contains the records
String Default_credit ="2 Credit";
String Default_Result ="B+";

