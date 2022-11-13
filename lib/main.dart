
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Screens/Settings.dart';
import 'Screens/Summary.dart';
import 'Screens/Homepage.dart';
import 'Theme.dart';
import 'Widgets/Commondrawer.dart';
import 'global.dart';
import 'global.dart';

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
  int current_index = 0;
  late List Pages;
  late List Setting_Pages;
  //final themeController = Get.put(ThemeController());
  //ThemeMode THM = ThemeMode.dark;
  // Changetheme() {
  //   if (THM == ThemeMode.dark){THM=ThemeMode.light.obs;}
  //   else{THM=ThemeMode.dark.obs;}// Changing global theme THM
  //   print(THM);
  // }
  // ChangeSettingPage(){
  //   setState(() {
  //     if (Setting_Pg_No == 1){Setting_Pg_No=0;}
  //     else{Setting_Pg_No = 1;}// Changing global theme THM
  //     print("Setting_Pg_No ${Setting_Pg_No}");
  //   });
  // }
  void StateR(){ //STATE REFERSH
    setState((){/**/});
    // ONLY TO REFERESH
  }

  Widget build(BuildContext context) {

    Pages =[MyHome(),Summary(),Settings()];

    void onTapped(int index) {
      setState(() {
        current_index = index;

      });
    }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //theme: ThemeData(backgroundColor: Colors.black, primarySwatch: Colors.blueGrey,),
      theme: ThemeData.light(),
      darkTheme:ThemeData.dark() ,
      themeMode: themeController.theme,
      home: Scaffold(resizeToAvoidBottomInset: false,
        appBar:AppBar(
          title: Obx(()=>Text(THM.toString())),
          actions: <Widget> [
            IconButton(
                onPressed: (){
                  themeController.changeThemeMode();
                  },
              icon:
              Obx(()=>Icon(THM == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode))
            )],

        ),
        body: Pages[current_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: current_index,
          onTap:(int index)
          { setState((){
            onTapped(index);
          print(current_index);});},
          items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),

          label: 'Home',
          backgroundColor: Colors.red,),
        BottomNavigationBarItem(activeIcon:Icon(Icons.list) ,
          icon: Icon(Icons.list),
          label: 'Summary',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.pink,
        )],

      // selectedItemColor: Colors.amber[800],
    )
        ,drawer: Drawer(width: 225,
        child: DrawerList(Changestate:(){ StateR();}),
      )
      ),
    );
  }
}


/* -----------------------------------------------------------------------
class MyHome extends StatefulWidget {
  final Function getThm;
  bool isdark = true;
  MyHome({super.key, required this.getThm});
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late double scred;
  late double scgpa;
  late int len;
  late bool A;
  late String newS;
  int id =0;
  double gpa =0;
  ThemeMode THM = ThemeMode.dark;
  List<DropdownDemo> Drops =[];
  List<ListTile> Tiles =[];






  Update(){
    setState(() {
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
    });
  }
  ListV() {
    setState(() {
      len =Records.length;
    });
  }
  refresh() async {
    //showAlertDialog(context);
    A = await AlertDialogYN(context);
    setState(() {
      print(A);
      if(A) {
        Records = [];
        Update();
      }
    });
  }
  add(){
    setState(() {
      id++;
      print(id);
      Records.add(Record(id:id,result: "B",credit: "2 Credit",isGpa: true, subname: ''));
      Update();
    });
  }
  delete(){
    setState(() {
      Records.removeLast();
      Update();
    });
  }

  update_string(String text) async {
  String new_text = await AlertDialogText(context,text);
  newS = new_text;
}

  bool isInteger(num value) => value is int || value == value.roundToDouble();

  void toggleThemeMode() {
    THM = THM == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
  @override
  Widget build(BuildContext context) {
    ListV();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: Drawer(width: 225,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 75,
                child: DrawerHeader(
                  margin : EdgeInsets.zero,
                  padding: EdgeInsets.only(left:25,top:12.5),
                  //decoration: BoxDecoration(color: Colors.blue,),
                  child: Text(style:TextStyle(fontSize: 20),'Menu'),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.queue,
                ),
                title: const Text(style:TextStyle(fontSize: 17),"Add New Credit Value"),
                onTap: () async {
                  var newcred = await AlertDialogDouble(this.context);
                  setState(() {

                    if(!Credits.contains(newcred) && newcred>0 ){
                      Credits.add(newcred);
                      Credits.sort((a, b) => b.compareTo(a));
                    }

                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.delete_forever,
                ),
                title: const Text(style:TextStyle(fontSize: 17),"Delete A Credit Value"),
                onTap: () async {
                  String delcred = await AlertDialogDrops(this.context);
                  setState(() {
                      if (delcred==""){}
                      else if(delcred==Default_result){
                        print("default cantbe removed");
                      }// CANCle button is pressed
                      else{
                        for( Record rec in Records){
                            if(rec.credit == delcred){
                              rec.credit = Default_result;
                            }
                        }
                        Credits.remove(double.parse(delcred.split(" ")[0]));//remove Credit value
                      Credits.sort((a, b) => b.compareTo(a));
                        Update();
                      }
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  THM == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
                ),
                title: const Text(style:TextStyle(fontSize: 17),"Change Theme"),
                onTap: () {
                  setState(() {
                    toggleThemeMode();
                    widget.getThm(THM);
                    print(THM);
                  });
                },
              ),
            ],
          ),
        ),
          appBar: AppBar(
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
              widget.getThm(THM);
              print(THM);
            });
          }, icon: Icon(THM == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode))],
            title: Text("GPA Calculator"),
          ),
          body:

          Container(width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),

              child: Column(

                //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children: <Widget> [
                          Text(
                              'Your GPA : ${gpa.toStringAsFixed(3)}',style: TextStyle(fontSize: 15)),
                          Text('No of Subjects : ${len}',style: TextStyle(fontSize: 15))]),
                    Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children: <Widget> [
                          TextButton(onPressed: len>0 ? Update : null
                              , child: Row(mainAxisAlignment:MainAxisAlignment.end,children: <Widget> [Text('Caculate GPA',style: TextStyle(fontSize: 12)),Icon(Icons.calculate,size: 12)],
                              )),
                          TextButton(onPressed: add
                              , child: Row(mainAxisAlignment:MainAxisAlignment.end,children: <Widget> [Text('Add Subject',style: TextStyle(fontSize: 12)),Icon(Icons.add,size: 12)],)),
                          //TextButton(onPressed: len>0 ? delete : null
                             // , child: Row(mainAxisAlignment:MainAxisAlignment.end,children: <Widget> [Text('Delete',style: TextStyle(fontSize: 15)),Icon(Icons.delete,size: 15)],)),
                          TextButton(onPressed: len>0 ? refresh : null
                              , child: Row(mainAxisAlignment:MainAxisAlignment.end,children: <Widget> [Text('Refresh',style: TextStyle(fontSize: 12)),Icon(Icons.refresh,size: 12)],)),]),
                    Container (height: MediaQuery.of(context).size.height-250,
                        child: ListView(
                            children: Records.map((rec) => DropdownDemo(key: UniqueKey(),
                                id: rec.id, result: rec.result, credit:rec.credit,isChecked: rec.isGpa,
                                subname: rec.subname,
                                change_subname:(newname)async{
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
                    )]
              )


          )
        ,bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.red,),
                  BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Summary',
                backgroundColor: Colors.green,
    ),
        BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.pink,
    )],
    //currentIndex: _selectedIndex,
   // selectedItemColor: Colors.amber[800],
    ));
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
*

 */



 */




