
import 'package:flutter/material.dart';

import '../global.dart';
class Sum_item extends StatefulWidget {
  String result;
  String credit;
  String subname;
  String gpangpa;

  Sum_item({super.key,
    //required this.id,
    //required this.delete,
    required this.credit,
    required this.result,
    required this.gpangpa,
    required this.subname,
    // required this.change_subname,
  });

  @override
  State<Sum_item> createState() => _Sum_itemState();
}

class _Sum_itemState extends State<Sum_item> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
        B_Cont(120,widget.subname),
        B_Cont(65,widget.credit),
        B_Cont(65,widget.result),
        B_Cont(80,widget.gpangpa),

      ],
    );
  }
}


class B_Cont extends StatelessWidget { //bordered sized texted container
  double width;
  String text;
  B_Cont(this.width,this.text);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(4),width:width,child:Text(text),
        decoration: BoxDecoration(
            border: Border.all()//color:THM == ThemeMode.dark ? Colors.white54 : Colors.black)
        )
    );
  }
}
