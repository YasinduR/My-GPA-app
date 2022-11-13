/*
remove(s){
  setState(() {
    Drops_ups =[];
    for(DropdownDemo F in Drops){
      if(F.Id != s) {
        Drops_ups.add(DropdownDemo(dropdownValue:F.dropdownValue,dropdownsub:F.dropdownsub,Id:F.Id));
      }}
    Drops = Drops_ups;
  });
}
import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'GPA Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double scred;
  late double scgpa;
  double gpa =0;
  int idx = 1;
  late String id;
  //T d = T("y","r");
  //String A= d.outA();
  //C c = C();
  //List<String,String> d = [("B","2 Credit")];

  List<DropdownDemo> Drops =[DropdownDemo(Id:"0")];
  List<DropdownDemo> Drops_ups =[];
  List<ListTile> Tile =[];
  List<String> S = ["A","B","C"];
  //DropdownDemo F1 =DropdownDemo(dropdownValue:"B",dropdownsub:"2 Credit");
  //DropdownDemo F2 =DropdownDemo(dropdownValue:"B",dropdownsub:"2 Credit");
  //DropdownDemo F3 =DropdownDemo(dropdownValue:"B",dropdownsub:"2 Credit");
  //static String re = F1.Val();
  //double K = s();

  //person p1 =person("y",25);
  //p1.details();
  //String k = p1.Name;
  //String K = d.A;
  update(){
    setState(() {
      scred =0;
      scgpa =0;
      for (DropdownDemo F in Drops) {
        scred += F.credit();
        scgpa += F.mark()*F.credit();
      }
     // scred = F1.credit()+F2.credit()+F3.credit();
     gpa = scgpa/scred;
     // print('gpa : ${gpa.toStringAsFixed(2)}');
      //F1.upVal("C");
     // print(F1.dropdownsub);
     // print(F1.dropdownValue);
    });
  }
 add(){
    id =idx.toString();
    setState(() {
      Drops.add(DropdownDemo(Id:id));
    });
    idx++;
 }
 remove(s){
   setState(() {
     Drops_ups =[];
     for(DropdownDemo F in Drops){
       if(F.Id != s) {
         Drops_ups.add(DropdownDemo(Id:F.Id));
       }}
     Drops = Drops_ups;
   });
 }

 ListV(){
   setState(() {
     Tile =[];
     for (var i=0; i<Drops.length; i++) {
       Tile.add(ListTile(title: Row(
         children: <Widget>[Text(Drops[i].Id),Container(child: Drops[i])
         ]

       ))
       );
     };
   });
 }
  //void _incrementCounter() {
  //  setState(() {
  //  _counter++;
  // });
  // }

  @override
  Widget build(BuildContext context) {
    ListV();
    //Drops.removeAt(1);
    //update();
    //double scred = credit(F1)+credit(F2)+credit(F3);
    //double gpa = (mark(F1)*credit(F1)+mark(F2)*credit(F2)+mark(F3)*credit(F3))/scred;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget> [Text(
              'Your GPA : ${gpa.toStringAsFixed(3)}',style: TextStyle(fontSize: 25)),
              IconButton(onPressed: update, icon: Icon(Icons.calculate)),
                IconButton(onPressed: add, icon: Icon(Icons.add)),
                IconButton(onPressed: (){setState(() {
                  remove(0);
                });}, icon: Icon(Icons.delete))]),
              Container(height: 500,
                child: ListView.builder(
                    itemCount:Tile.length ,
                    itemBuilder:(context,index){
                      return ListTile(title:Container(child:Tile[index]),
                        trailing: IconButton(onPressed: () { setState(() {
                          int a = index;
                          print(Drops[a].Id);
                          remove(Drops[a].Id);
                          //DropdownDemo D = Drops[a];
                          //Drops.remove(D);
                        }); }, icon: Icon(Icons.delete),),

                      );
                    }
                  //[ListTile(
                   // title:F1,
                    //onTap: update,

                  //),ListTile(title:F2),ListTile(title:F3)
                  //],

                )
            ),
            //Text(
            //'$_counter',
            //style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class C {
  int x;

  C() : x = 0;

  int get defaultX => 0;
}




class Texts extends StatefulWidget {
  //const Texts(String T, {Key? key}) : super(key: key);

  @override
  State<Texts> createState() => _TextsState();
}

class _TextsState extends State<Texts> {

  @override
  Widget build(BuildContext context) {
    return Text("S");
  }
}
class T{ //extends StatelessWidget {
  String A;
  String B;
  T(this.A,this.B);
  String outA(){
    return this.A;
  }
//@override
//Widget build(BuildContext context) {
// return Text(A);
}
//}
class person{
  String Name;
  int id;
  person(this.Name,this.id);
  details()=>print(this.Name +" ${this.id}");

}


 */
/*


import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'GPA Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double scred;
  late double scgpa;
  double gpa =0;
  int idx = 3;
  late String id;
  //T d = T("y","r");
  //String A= d.outA();
  //C c = C();
  //List<String,String> d = [("B","2 Credit")];
  List<String> S = ["0","1","2"];

  List<DropdownDemo> Drops_ups =[];
  List<DropdownDemo> Drops =[];
  List<ListTile> Tile =[];




  //DropdownDemo F1 =DropdownDemo(dropdownValue:"B",dropdownsub:"2 Credit");
  //DropdownDemo F2 =DropdownDemo(dropdownValue:"B",dropdownsub:"2 Credit");
  //DropdownDemo F3 =DropdownDemo(dropdownValue:"B",dropdownsub:"2 Credit");
  //static String re = F1.Val();
  //double K = s();

  //person p1 =person("y",25);
  //p1.details();
  //String k = p1.Name;
  //String K = d.A;
  /*update(){
    setState(() {
      scred =0;
      scgpa =0;
      for (DropdownDemo F in Drops) {
        scred += F.credit();
        scgpa += F.mark()*F.credit();
      }
     // scred = F1.credit()+F2.credit()+F3.credit();
     gpa = scgpa/scred;
     // print('gpa : ${gpa.toStringAsFixed(2)}');
      //F1.upVal("C");
     // print(F1.dropdownsub);
     // print(F1.dropdownValue);
    });
  }
if(newValue =="Other"){
                return AlertDialog(
                  title: Text('TextField in Dialog'),
                  content: TextField(
                    onChanged: () {newValue = },
                    controller: _textFieldController,
                    decoration: InputDecoration(hintText: "Text Field in Dialog"),
                  )
                )

              }
 remove(s){
   setState(() {
     Drops_ups =[];
     for(DropdownDemo F in Drops){
       if(F.Id != s) {
         //Drops_ups.add(DropdownDemo(Id:F.Id));
       }}
     Drops = Drops_ups;
   });
 }

 ListV(){
   setState(() {
     Tile =[];
     for (var i=0; i<Drops.length; i++) {
       Tile.add(ListTile(title: Row(
         children: <Widget>[Text(Drops[i].Id),Container(child: Drops[i])
         ]

       ))
       );
     };
   });
 }
  //void _incrementCounter() {
  //  setState(() {
  //  _counter++;
  // });
  // }
*/
  update(){
    setState(() {
      scred =0;
      scgpa =0;
      for (DropdownDemo F in Drops) {
        scred += F.credit();
        scgpa += F.mark()*F.credit();
      }
      // scred = F1.credit()+F2.credit()+F3.credit();
      gpa = scgpa/scred;
      // print('gpa : ${gpa.toStringAsFixed(2)}');
      //F1.upVal("C");
      // print(F1.dropdownsub);
      // print(F1.dropdownValue);
    });
  }
  ListV(){
    setState(() {
      Drops = S.map((e) => DropdownDemo(Id: e,
          delete:(){
            setState(() {
              print("del");
              S.remove(e);
            });
          }
      )).toList();
    });
  }
  add(){
    id =idx.toString();
    setState(() {
      S.add(id);
    });
    idx++;
  }

  @override
  Widget build(BuildContext context) {
    ListV();
    //Drops.removeAt(1);
    //update();
    //double scred = credit(F1)+credit(F2)+credit(F3);
    //double gpa = (mark(F1)*credit(F1)+mark(F2)*credit(F2)+mark(F3)*credit(F3))/scred;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget> [Text(
              'Your GPA : ${gpa.toStringAsFixed(3)}',style: TextStyle(fontSize: 25)),
              IconButton(onPressed: update, icon: Icon(Icons.calculate)),
                IconButton(onPressed: add, icon: Icon(Icons.add)),
                IconButton(onPressed: de{setState(() {
                  //remove(0);
                });}, icon: Icon(Icons.delete))]),
              Container (height: 500,
                child: ListView(children:Drops)
                )]
            )
            //Text(
            //'$_counter',
            //style: Theme.of(context).textTheme.headline4,
            // ),

        ),
      );
      // This trailing comma makes auto-formatting nicer for build methods.

  }
}

class DropdownDemo extends StatefulWidget {
  String dropdownValue ="B";
  String dropdownsub ="2 Credit";
  String Id;
  Function delete;
  DropdownDemo({required this.Id,required this.delete});
  void del(){
    print("del-1");
    delete();
  }
  void upVal(a){
    this.dropdownValue =a;
  }
  void upSub(a){
    this.dropdownsub =a;
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
  State<DropdownDemo> createState() => _DropdownDemoState(this.dropdownValue,this.dropdownsub);
}
class _DropdownDemoState extends State<DropdownDemo> {

 // get delete => null;

 String dropdownValue ;
 String dropdownsub ;
  //Function delete;
 _DropdownDemoState(this.dropdownValue,this.dropdownsub);

  @override
  //String get dropdownvalue => this.dropdownValue;
  Widget build(BuildContext context) {
    return Row(
      children: [SizedBox(
        height: 50,
      ),
        // Step 2.
        DropdownButton<String>(
          // Step 3.
          value: this.dropdownsub,
          // Step 4.
          items: <String>["5 Credit","4.5 Credit","4 Credit", "3.5 Credit","3 Credit","2.5 Credit", "2 Credit","1.5 Credit", "1 Credit"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 20),
              ),
            );
          }).toList(),
          // Step 5.
          onChanged: (String? newValue) {
            setState(() {
              this.widget.upSub(newValue);//to update stored value at the main app
             // print("change sub to");
              this.dropdownsub = newValue!;// to update value in dropbox
             // print(this.dropdownsub);
            });
          },
        ),
        Container(width: 35,height: 50,

        ),
        SizedBox(
          height: 50,
        ),
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
                style: TextStyle(fontSize: 20),
              ),
            );
          }).toList(),
          // Step 5.
          onChanged: (String? newValue) {
            setState(() {
              this.widget.upVal(newValue);// to update stored value at the main app
              //print("change result to");
              this.dropdownValue = newValue!; // to update value in dropbox
             // print(this.dropdownValue);
            });
          },
        ),
        IconButton(onPressed:this.widget.del, icon: Icon(Icons.delete))

    ]);
  }
}


mport 'package:flutter/material.dart';
import 'Alertboxes.dart';
import 'Dropdowns.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //theme: ThemeData(backgroundColor: Colors.black, primarySwatch: Colors.blueGrey,),
      theme: ThemeData.light(),
      darkTheme:ThemeData.dark() ,
      home: const MyHomePage(title: 'GPA Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double scred;
  late double scgpa;
  late int len;
  late bool A;
  double gpa =0;
  List<DropdownDemo> Drops =[];
  List<ListTile> Tiles =[];

  update(){
    setState(() {
      scred =0;
      scgpa =0;
      for (DropdownDemo F in Drops) {
        if(F.isChecked){
          scred += F.credit();
          scgpa += F.mark()*F.credit();
        }
      }
      gpa = scgpa/scred;
      if (gpa.isNaN){ // NaN =0.000
        gpa =0;
      }
    });
  }
  ListV() {
    setState(() {
      Tiles = [];

    for(DropdownDemo F in Drops){
      if(!F.hasDeleted){Tiles.add(ListTile(title: F));}
    }
    len =Tiles.length;
    });
  }
  refresh() async {
    //showAlertDialog(context);
    A = await AlertDialogYN(context);
    setState(() {
      print(A);
      if(A) {
        Drops = [];
        update();
      }
    });
  }
  add(){
    setState(() {
      Drops.add(DropdownDemo());
      update();
    });
  }
  delete(){
    setState(() {
      Drops.removeLast();
      update();
    });
  }
  @override
  Widget build(BuildContext context) {
    ListV();
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(actions: <Widget> [IconButton(onPressed: (){}, icon: Icon(Icons.light_mode))],
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),

        child: Column(

          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Text(
              'Your GPA : ${gpa.toStringAsFixed(3)}',style: TextStyle(fontSize: 18)),
                Text('No of Subjects : ${len}',style: TextStyle(fontSize: 18))]),
              Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  TextButton(onPressed: len>0 ? update : null
                    , child: Row(mainAxisAlignment:MainAxisAlignment.end,children: <Widget> [Text('Caculate GPA',style: TextStyle(fontSize: 15)),Icon(Icons.calculate,size: 15)],
                    )),
                TextButton(onPressed: add
              , child: Row(mainAxisAlignment:MainAxisAlignment.end,children: <Widget> [Text('Add',style: TextStyle(fontSize: 15)),Icon(Icons.add,size: 15)],)),
                  TextButton(onPressed: len>0 ? delete : null
                      , child: Row(mainAxisAlignment:MainAxisAlignment.end,children: <Widget> [Text('Delete',style: TextStyle(fontSize: 15)),Icon(Icons.delete,size: 15)],)),
                  TextButton(onPressed: len>0 ? refresh : null
                      , child: Row(mainAxisAlignment:MainAxisAlignment.end,children: <Widget> [Text('Refresh',style: TextStyle(fontSize: 15)),Icon(Icons.refresh,size: 15)],)),]),
              Container (height: MediaQuery.of(context).size.height-195,
                child: ListView(children:Tiles)
                )]
            )


        ),
      );

  }
}i

 */