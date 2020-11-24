import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = '0';
  String output = '0', ButtonText, operand = '';
  double num1 = 0.0, num2 = 0.0;

  buttonPressed(String ButtonText) {
    if (ButtonText == 'AC') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (ButtonText == '+' ||
        ButtonText == '-' ||
        ButtonText == '*' ||
        ButtonText == '/' ||
        ButtonText == '%') {
      operand = ButtonText;
      num1 = double.parse(output);
      _output = '0';
    } else if (ButtonText == 'CALCULATE') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == '*') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      if (operand == '%') {
        _output = (num1 % num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _output = ButtonText;
    }
    print(_output);
    setState(() {
      output = _output;
    });
  }

/*
 buttonPressed(String ButtonText){
   if(ButtonText=='+'||ButtonText=='-'||ButtonText=='*'||ButtonText=='/'||ButtonText=='%'){
     operand=ButtonText;
   }else if(ButtonText=='CALCULATE') {
     if (operand == '+') {
       output = (num1 + num2).toString();
     }
     if (operand == '-') {
       output = (num1 - num2).toString();
     }
     if (operand == '*') {
       output = (num1 * num2).toString();
     }
     if (operand == '/') {
       output = (num1 / num2).toString();
     }
     if (operand == '%') {
       output = (num1 % num2).toString();
     }
   }else if(ButtonText=='AC'){
     num1=0.0;
     num2=0.0;
     operand='';
   }else{
     output=ButtonText;
     if(operand!=''){
       num2=double.parse(ButtonText);
     }else{
       num1=double.parse(ButtonText);
     }
   }
 }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Calculator'),
      ),
      body: Container(
        //color: Colors.grey,
        child: Stack(
          children: <Widget>[
            Container(
              child: Text(
                output,
                style: TextStyle(color: Colors.white, fontSize: 60.0),
              ),
              height: 220.0,
              width: 432.0,
              color: Colors.black,
              padding: EdgeInsets.only(left: 10.0),
              margin: EdgeInsets.only(top: 0.0),
              /*decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0)
                    ),
                  color: Colors.black
                ),*/
            ),
            GridView.count(
              padding: EdgeInsets.only(top: 220.0),
              shrinkWrap: true,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              crossAxisCount: 4,
              children: <Widget>[
                num('AC'),
                num('0'),
                num('%'),
                num('/'),
                num('7'),
                num('8'),
                num('9'),
                num('*'),
                num('4'),
                num('5'),
                num('6'),
                num('-'),
                num('1'),
                num('2'),
                num('3'),
                num('+'),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 577.0),
              height: 54.0,
              width: 432.0,
              child: num('CALCULATE'),
            )
          ],
        ),
      ),
    );
  }

  Widget num(String ButtonText) {
    return RaisedButton(
        /* shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),*/
        child: Text(
          ButtonText,
          style: TextStyle(
            color: Colors.orange[800],
            fontSize: 28.0,
          ),
        ),
        splashColor: Colors.grey,
        color: Colors.black,
        onPressed: () {
          buttonPressed(ButtonText);
        });
  }
}
