import 'package:flutter/material.dart';
import 'package:gpacal2/Widgets/Summary_item.dart';

import '../global.dart';

class Summary extends StatefulWidget {
  Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {

  @override
  Widget build(BuildContext context) {
    Sum_item List_title = Sum_item(key: UniqueKey(),
      result: "Result",
      credit: "Credits",
      gpangpa: "Status",
      subname: "Subject",
    );
    List<Widget> Records_List = Records.map((rec) => Sum_item(key: UniqueKey(),
      result: rec.result,
      credit: double.parse(rec.credit.split(" ")[0]).toString(),
      gpangpa: rec.isGpa ? "GPA" : "Non-GPA",
      subname: rec.subname,
    )).toList();
    Records_List.insert(0, List_title);
    return Scaffold(
      body: Container(padding: EdgeInsets.all(20),
        child: Column(
          children:<Widget> [
            Row(crossAxisAlignment:CrossAxisAlignment.center,mainAxisSize:MainAxisSize.max,mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  Text(
                      'Your GPA : ${gpa.toStringAsFixed(3)}',style: TextStyle(fontSize: 15)),
                  Text('No of Subjects : ${Records.length}',style: TextStyle(fontSize: 15))]),

            Expanded(child: ListView(
            children:Records_List
            )),
          ],

      ),
    ));
  }
}
