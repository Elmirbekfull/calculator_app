


import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calcbutton(String btntxt, Color btncolor, Color btntxtcolor){
    return Container(
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          fixedSize: Size(80, 80),
          shape: CircleBorder(),
          backgroundColor: btncolor,

        ),
        onPressed: (){
          // TODO add funtion for button press
            calculation(btntxt);
        },
       child: Text(btntxt, style: TextStyle(
        fontSize: 30,
        color: btntxtcolor
       ),),
       

       ),
      

    );
  }


  Widget calcbutton1(String btntxt, Color btncolor, Color btntxtcolor){
    return SizedBox(
      width: 170,
      child: Container(
       
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          
            // padding: EdgeInsets.fromLTRB(left, top, right, bottom)
            // padding: EdgeInsets.fromLTRB(20, 20, 128, 90),
            fixedSize: Size(80, 80),
            shape: StadiumBorder(),
            
            backgroundColor: Color.fromARGB(255, 92, 89, 89),
          ),
          onPressed: (){
          
          },
           child: Align(
            alignment: Alignment.centerLeft,
             child: Padding(
               padding: const EdgeInsets.only(left: 10),
               child: Text(btntxt, style: TextStyle(
                color: btntxtcolor,
                fontSize: 30
               ),),
             ),
           )),
    
      ),
    );


  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0.0,
      
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // calculator display
             Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(padding: EdgeInsets.all(10.0),
                  child: Text(text,
                  textAlign: TextAlign.left,
                   style: TextStyle(
                    color: Colors.white,
                    fontSize: 100
                  ),),
                  
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,        
                children: [
                  // here buttons functions will be called where we will some arguments
                calcbutton("AC", Colors.grey, Colors.black),
                calcbutton("+/-", Colors.grey, Colors.black),
                calcbutton("%", Colors.grey, Colors.black),
                calcbutton("/", Colors.amber.shade700, Colors.white),
                ],
              ),
              SizedBox(height: 10,),
              // now we will copy above row code and mane more rows  
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,        
                children: [
                  // here buttons functions will be called where we will some arguments
                calcbutton("7", Color.fromARGB(255, 92, 89, 89), Colors.black),
                calcbutton("8", Color.fromARGB(255, 92, 89, 89), Colors.black),
                calcbutton("9", Color.fromARGB(255, 92, 89, 89), Colors.black),
                calcbutton("x", Colors.amber.shade700, Colors.white),
                ],
              ),
              SizedBox(height: 10,),  
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,        
                children: [
                  // here buttons functions will be called where we will some arguments
                calcbutton("4", Color.fromARGB(255, 92, 89, 89), Colors.black),
                calcbutton("5", Color.fromARGB(255, 92, 89, 89), Colors.black),
                calcbutton("6", Color.fromARGB(255, 92, 89, 89), Colors.black),
                calcbutton("-", Colors.amber.shade700, Colors.white),
                ],
              ),
              SizedBox(height: 10,),  
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,        
                children: [
                  // here buttons functions will be called where we will some arguments
                calcbutton("5", Color.fromARGB(255, 92, 89, 89), Colors.black),
                calcbutton("4", Color.fromARGB(255, 92, 89, 89), Colors.black),
                calcbutton("3", Color.fromARGB(255, 92, 89, 89), Colors.black),
                calcbutton("+", Colors.amber.shade700, Colors.white),
                ],
              ),
              SizedBox(height: 10,),  
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,        
                children: [
                  // here buttons 0
                calcbutton1("0", Color.fromARGB(255, 92, 89, 89), Colors.black),
                calcbutton(",", Color.fromARGB(255, 92, 89, 89), Colors.black),
                calcbutton("=", Colors.amber.shade700, Colors.white),
                ],
              ),
              SizedBox(height: 10,),        
          ],
        ),
      ),
    );
  }

  //Calculator logic

  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
   void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    
    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
         finalResult = add();
      } else if( preOpr == '-') {
          finalResult = sub();
      } else if( preOpr == 'x') {
          finalResult = mul();
      } else if( preOpr == '/') {
          finalResult = div();
      } 

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
          numOne = double.parse(result);
      } else {
          numTwo = double.parse(result);
      }

      if(opr == '+') {
          finalResult = add();
      } else if( opr == '-') {
          finalResult = sub();
      } else if( opr == 'x') {
          finalResult = mul();
      } else if( opr == '/') {
          finalResult = div();
      } 
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
     result = numOne / 100;
     finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }
    
    else if(btnText == '+/-') {
        result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();        
        finalResult = result;        
    
    } 
    
    else {
        result = result + btnText;
        finalResult = result;        
    }


    setState(() {
          text = finalResult;
        });

  }


  String add() {
         result = (numOne + numTwo).toString();
         numOne = double.parse(result);           
         return doesContainDecimal(result);
  }

  String sub() {
         result = (numOne - numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String mul() {
         result = (numOne * numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String div() {
          result = (numOne / numTwo).toString();
          numOne = double.parse(result);
          return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {
    
    if(result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if(!(int.parse(splitDecimal[1]) > 0))
         return result = splitDecimal[0].toString();
    }
    return result; 
  }






}