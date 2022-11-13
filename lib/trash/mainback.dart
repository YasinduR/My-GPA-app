
import 'package:flutter/material.dart';
import 'Alertboxes.dart';
import 'Dropdowns.dart';
import 'Records.dart';

void main() {
  runApp(
     MyApp(),
      );

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  ThemeMode THM = ThemeMode.dark;
  void toggleThemeMode() {
    THM = THM == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    print(THM);
  }
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //theme: ThemeData(backgroundColor: Colors.black, primarySwatch: Colors.blueGrey,),
      theme: ThemeData.light(),
      darkTheme:ThemeData.dark() ,
      themeMode: THM,
      home: MyHome(),
    );
  }
}



class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late double scred;
  late double scgpa;
  late int len;
  late bool A;
  int id =0;
  double gpa =0;
  ThemeMode THM = ThemeMode.dark;
  List<DropdownDemo> Drops =[];
  List<ListTile> Tiles =[];
  List<Record> Records =[];
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
      id++;
      print(id);
      Drops.add(DropdownDemo(
          key: UniqueKey(),
          delete:() {setState(() {
            //Drops.removeLast();
          });},
          id:id));
      update();
    });
  }
  delete(){
    setState(() {
      Drops.removeLast();
      update();
    });
  }

  void toggleThemeMode() {
    THM = THM == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    print(THM);
  }
  @override
  Widget build(BuildContext context) {
    ListV();
    return Scaffold(resizeToAvoidBottomInset: false,
          appBar: AppBar(actions: <Widget> [IconButton(onPressed: (){
            setState(() {
              toggleThemeMode();
            });
          }, icon: Icon(Icons.light_mode))],
            title: Text("GPA"),
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
                    Container (height: MediaQuery.of(context).size.height-190,
                        child: ListView(children: Tiles)
                    )]
              )


          )
    );
  }

}

/*
void main() {
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => new ThemeNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        theme: theme.getTheme(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hybrid Theme'),
          ),
          body: Row(
            children: [
              Container(
                child: TextButton(
                  onPressed: () => {
                    print('Set Light Theme'),
                    theme.setLightMode(),
                  },
                  child: Text('Set Light Theme'),
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () => {
                    print('Set Dark theme'),
                    theme.setDarkMode(),
                  },
                  child: Text('Set Dark theme'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/



/*
class MyHomePage extends StatefulWidget {


  const MyHomePage({super.key, required this.title,required this.TTM});
  final String title;
  final Function TTM;
  //final ThemeMode model;

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
      ///Drops.add(DropdownDemo());
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
      appBar: AppBar(actions: <Widget> [IconButton(onPressed: (){
        setState(() {
          //this.widget.TTM;
        });
      }, icon: Icon(Icons.light_mode))],
        title: Text(widget.title),
      ),
      body: Container(height: MediaQuery.of(context).size.height,
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
                Container (
                    child: ListView(children:Tiles)
                )]
          )


      ),
    );

  }
}
*/
/*appBar: AppBar(
          /*leading: IconButton(
                onPressed: () async {
                  var newcred = await AlertDialogDouble(this.context);
                  setState(() {

                    if(!global.Credits.contains(newcred) && newcred>0 ){
                      global.Credits.add(newcred);
                      global.Credits.sort((a, b) => b.compareTo(a));
                    }

                  });

                  // newValue = newCred;

                },
                icon: Icon(Icons.menu)),*/
          actions: <Widget> [IconButton(onPressed: (){
            setState(() {
              toggleThemeMode();
              print(THM);
            });
          }, icon: Icon(THM == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode))],
          title: Text("GPA Calculator"),
        ),*/