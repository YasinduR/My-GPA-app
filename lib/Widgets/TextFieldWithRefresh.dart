import 'package:flutter/material.dart';
class TextWithRefresh extends StatefulWidget {
  late String text;

  TextWithRefresh({super.key, required this.text});


  @override
  State<TextWithRefresh> createState() => _TextWithRefreshState();
}

class _TextWithRefreshState extends State<TextWithRefresh> {
  late String Ntext = widget.text;
  //late TextEditingController txtC;
  TextEditingController txtC = TextEditingController();
  void initState() {
    txtC.text = widget.text;
    txtC.selection = TextSelection.fromPosition(TextPosition(offset: txtC.text.length));
    // to Ensure adjustmet of  the cursor
    //super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            suffixIcon: IconButton(onPressed: () {
              setState(() {
                widget.text="";
                txtC.text="";
              });
            }, icon: Icon(Icons.refresh),)),
        controller: txtC, // default text on field is existing Value
        maxLength: 6,
        onChanged:(text){widget.text = text;
        setState(() {
          /////
        });

        } );
  }
}