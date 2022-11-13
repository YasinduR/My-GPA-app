import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../Widgets/Alertboxes.dart';
import '../Widgets/updownvaluebox.dart';
import '../global.dart';


class Settings_1 extends StatefulWidget {
  // Function ChangePage;
  // Settings_1({super.key, required this.ChangePage});
  Settings_1({super.key});
  @override
  State<Settings_1> createState() => _SettingsState();
}

class _SettingsState extends State<Settings_1> {
  //late bool is_set_back_to_default;
  Function Eq = const DeepCollectionEquality.unordered().equals;
  Previous_point(R){
    int Current_index = Results_updating.indexOf(R);
    if(Current_index==0){return 10.0;  } // 10 is considered as the upperbound
    else{return Results_updating[Current_index-1].points;}
  }

  Next_point(R){
    int Current_index = Results_updating.indexOf(R);
    if(Current_index== Results_updating.length-1){return 0.0;  }
    // 0 is considered as the lowerbound
    else{return  Results_updating[Current_index+1].points;}
  }
  refresh(){
    setState(() {
      //only to referesh
    });
  }
  Reset_to_default() async {
    var is_set_back_to_default = await AlertDialogYN(context,
        "Would you like to set back to default points ?");
    if(is_set_back_to_default) {
      setState(() {
        Results_updating =
            Results_default.map((item) =>
                Result(result: item.result, points: item.points)).toList();
        Results =Results_default.map((item) =>
            Result(result: item.result, points: item.points)).toList();
        print(Results_updating.map((e) => e.points).toList());
        print(Results_default.map((e) => e.points).toList());
        print(Results.map((e) => e.points).toList());
        Update();
      });
    }
  }
  Discard_Edits() async {
    var is_discard= await AlertDialogYN(context,
        "Would you like to discard all of your current edits of points ?");
    if(is_discard) {
      setState(() {
        Results_updating =
            Results.map((item) =>
                Result(result: item.result, points: item.points)).toList();
        print(Results_updating.map((e) => e.points).toList());
        print(Results_default.map((e) => e.points).toList());
        print(Results.map((e) => e.points).toList());

      });
    }
  }

  Modify_Results() async {
    var is_changing_result = await AlertDialogYN(context,
        "Would you like to modify result points that may change your entire result sheet ?");
    if(is_changing_result) {
      setState(() {
        Results =
            Results_updating.map((item) =>
                Result(result: item.result, points: item.points)).toList();
        print(Results_updating.map((e) => e.points).toList());
        print(Results_default.map((e) => e.points).toList());
        print(Results.map((e) => e.points).toList());
        Update();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    bool is_Modify_Results =Eq(Results.map((e) => e.points).toList(),Results_updating.map((e) => e.points).toList());
    bool is_Discard_Edits =Eq(Results.map((e) => e.points).toList(),Results_updating.map((e) => e.points).toList());
    bool is_Reset_to_default =Eq(Results.map((e) => e.points).toList(),Results_default.map((e) => e.points).toList());
    double WFB = 100.0;// Width of Floating Buttons's label
    double lft = 95.0;//right offset for results rows from FBs
    // represent icon size+ border+ extra

    return Scaffold(appBar: AppBar(title:Text('Settings > Result Points')),
      floatingActionButton:Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset(1.0, 0.61),
            child: FloatingActionButton.extended(backgroundColor:!is_Modify_Results? null:Colors.grey, //disabledElevation: 100,
              icon:Icon(Icons.build), label: SizedBox(width:WFB,child: Text("Modify Results")),
              onPressed:is_Modify_Results
                  ? null:Modify_Results,),
          ),
          Align(
            alignment: FractionalOffset(1.0, 0.74),
            child: FloatingActionButton.extended(backgroundColor:!is_Discard_Edits? null:Colors.grey,//disabledElevation: 100,
              icon:Icon(Icons.refresh), label: SizedBox(width:WFB,child: Text("Discard Edits")),
              onPressed:is_Discard_Edits
                  ? null:Discard_Edits,),
          ),
          Align(
            alignment: FractionalOffset(1.0, 0.87),
            child: FloatingActionButton.extended(backgroundColor:!is_Reset_to_default? null:Colors.grey,
              icon:Icon(Icons.factory) ,label: SizedBox(width:WFB,child: Text("Reset to Default")),
              onPressed:is_Reset_to_default
                  ? null:Reset_to_default
              ,),
          ),
          // Align(
          //   alignment: FractionalOffset(1.0, 0.1),
          //   child: FloatingActionButton.extended(
          //     icon:Icon(Icons.settings) ,label: SizedBox(width:WFB,child: Text("Credit Values")),
          //     onPressed:(){
          //     widget.ChangePage();
          //     print("button pressed");
          //     }
          //     ,),
          // ),
          Align(
            alignment: FractionalOffset(1.0, 0.4),
            child: FloatingActionButton.extended(
              icon:Icon(Icons.label) ,label: SizedBox(width:WFB,child: Text("Change Default Result : ${Default_Result}")),
              onPressed:()
                async {
                  String defres =
                      await AlertDialogDrops(context,Results.map((i)=>i.result).toList(),Default_Result);
                  setState(() {
                    if (defres==""){}
                    else{Set_Default_Result(defres);}
                  });
                }
              ,),
          )
        ],
      ) ,
      body:Container(
        child:Column(
          children: [
            // Container(height: 40,
            //   child: Row(crossAxisAlignment:CrossAxisAlignment.center,mainAxisSize:MainAxisSize.max,mainAxisAlignment:MainAxisAlignment.start,
            //       children: <Widget> [SizedBox(width:10),
            //         Text('Settings > Result Points',style: TextStyle(fontSize: 15)),
            //         //Text('Points',style: TextStyle(fontSize: 15))
            //       ]),
            // ),
            Expanded(child: ListView(
                children: Results_updating.map(
                        (R)=>menu_item(
                            alignfromright: WFB+lft,
                            result: R.result,
                            points: R.points,
                            max:Previous_point(R),
                            min:Next_point(R),
                            update:(value){
                              setState(() {
                                print("update");
                              R.points=value;
                              refresh();
                              });
                              }
                        )).toList()
            )
            ),

          //other childsn-- ok button
          ],
        )
      ) ,
    );
  }
}

class menu_item extends StatefulWidget {
  String result;
  double points;
  double max;
  double min;
  double alignfromright;
  Function update;
  menu_item({
    super.key,
    required this.result,
    required this.points,
    required this.max,
    required this.min,
    required this.update,
    required this.alignfromright
  });

  @override
  State<menu_item> createState() => _menu_itemState();
}

class _menu_itemState extends State<menu_item> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end,
      //  allignment length measures from right edge
      children:<Widget>[//SizedBox(width:80,),
        SizedBox(width: 20,
        child: Text(widget.result),
      ),
        UpDownValueBox(0.1,widget.points,widget.min,widget.max,widget.update),
        SizedBox(width: widget.alignfromright),
        // Ensure Rows not disturbed by floating buttons and make close to them
      ],
    );

  }
}
