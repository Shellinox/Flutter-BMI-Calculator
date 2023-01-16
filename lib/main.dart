import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
          primarySwatch: Colors.orange,
      ),
      home:  Homepage(),
    );
  }
}
class Homepage  extends StatefulWidget {
  Homepage ({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var wtControlller= TextEditingController();
  var ftControlller= TextEditingController();
  var inControlller= TextEditingController();
  var result="";
  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: const Text("BMI Calculator"),
      backgroundColor: Colors.orangeAccent,
    ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: wtControlller,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orangeAccent,
                          width: 3
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.orangeAccent
                          )
                      ),
                      prefixIcon: Icon(Icons.person_outline_outlined,color: Colors.orangeAccent,),
                      label: Text('Enter your weight in KG'),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: ftControlller,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orangeAccent,
                          width: 3,
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.orangeAccent,
                          )
                      ),
                      prefixIcon: Icon(Icons.height,color: Colors.orangeAccent,),
                      label: Text('Enter your height in ft.'),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: inControlller,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            width: 3,
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.orangeAccent
                          )
                      ),
                      prefixIcon: Icon(Icons.height,color: Colors.orangeAccent,),
                      label: Text('Enter your height in inch'),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(onPressed: (){
                  var weight=wtControlller.text.toString();
                  var feet=ftControlller.text.toString();
                  var inch=inControlller.text.toString();
                  if(weight!="" && feet!=""&& inch!=""){
                  var wt=int.parse(weight);
                  var ft=int.parse(feet);
                  var Inch=int.parse(inch);
                  var tinch=(ft*12)+Inch;
                  var cm=tinch*2.54;
                  var m=cm/100;
                  var msg="";
                  var bmi=wt/(m*m);
                  if(bmi>25){
                    msg="You are Overweight!!";
                    bgColor=Colors.red.shade100;
                  }
                  else if(bmi<18){
                    msg="You are Underweight!!";
                    bgColor=Colors.yellow.shade100;
                  }
                  else{
                    msg="You are Healthy!";
                    bgColor=Colors.green.shade100;
                  }
                  setState(() {
                    result=" $msg\nYour BMI is ${bmi.toStringAsPrecision(5)}";
                  });

                  }
                  else{
                  setState(() {
                    result="Please fill all required fields!!";
                  });
                  }
                  }, child: Text("Calculate BMI")),
                  SizedBox(
                    height: 20,
                  ),
                  Text(result,style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

