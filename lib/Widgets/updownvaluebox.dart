import 'package:flutter/material.dart';

class UpDownValueBox extends StatefulWidget {
  double step;
  double number;
  double max;
  double min;
  Function update;
  UpDownValueBox(this.step,this.number,this.min,this.max,this.update);

  @override
  State<UpDownValueBox> createState() => _UpDownValueBoxState();
}

class _UpDownValueBoxState extends State<UpDownValueBox> {
  bool is_add_disable =false;
  bool is_remove_disable =false;

  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  TextEditingController txtC = TextEditingController();
  void initState() {
    txtC.text = widget.number.toStringAsFixed(1);

    if(widget.number==widget.max){is_add_disable=true;}
    else{is_add_disable=false;}

    if(widget.number==widget.min){is_remove_disable=true;}
    else{is_remove_disable=false;}

  }
  void Add_(){
  double value =widget.number+widget.step;
  Change_to(value);
  }
  void Remove_(){
    double value = widget.number-widget.step;
    Change_to(value);
  }
  void Change_to(double value){
    setState(() {
      if(widget.max <= value){
        widget.number = widget.max;
        is_add_disable=true;}
      else if(widget.min >= value) {
        widget.number = widget.min;
        is_remove_disable=true;}
      else{
        widget.number = value;
        is_add_disable=false;
        is_remove_disable=false;
      }
      widget.update(widget.number); // update the result_updating list
    });
  }
  @override
  Widget build(BuildContext context) {
    initState();
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
        IconButton(padding: EdgeInsets.all(0),
            onPressed:is_add_disable? null:Add_,
            icon: Icon(Icons.add,size:13,)),
        SizedBox(width: 35,
          child: TextField(textAlign: TextAlign.end,keyboardType:TextInputType.number,
            controller: txtC,
            onSubmitted:(text){
              if(isNumeric(text)){
                print("Numeric");
                double value =double.parse(text);
                Change_to(value);
              }
              else{Change_to(widget.number);}

            },
          //maxLength: 4,
          ),
        ),
        IconButton(padding: EdgeInsets.all(0),
            onPressed:is_remove_disable? null:Remove_,
            icon: Icon(Icons.remove,size:13,))
      ]);
  }
}
