import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(41, 40, 40, 1),                    //🔥one more to give color
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  late Timer timer;                                                             //late == this variable will insilise later
  var timecontroller = TextEditingController();

  void startTimer(int value){
    counter = value;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      //where 1 second over state will changeed
      //and you will see time goes on decreasing
      setState(() {
        if(counter>0)counter--;
        else timer.cancel();
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (counter>0) ? Text("") : Text("Timer Done" , style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 40),),
            Text('$counter',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
            Container(
              width: 300,
              child: TextField(
                controller: timecontroller,
                decoration: InputDecoration(
                    hintText: "Enter Timer",
                    hintStyle: TextStyle(),
                    fillColor: Colors.grey.shade400,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: CircleBorder(),
                fixedSize: Size(110, 110),
              ),
                child: Text("Start Timer",style: TextStyle(fontWeight: FontWeight.bold),),
                onPressed: (){
                  int value =int.parse(timecontroller.text.toString());
                  startTimer(value);
                }
            )


          ],
        ),
      ),
    );
  }
}
