import 'dart:math';
import 'result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 160;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    m1Expanded(context, "male"),
                    const SizedBox(
                      width: 15,
                    ),
                    m1Expanded(context, "female"),
                  ],
                ),
              ),
            ),
            /*----------------------------------------------------------------------------------*/
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                       Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 40,
                            color: Theme.of(context).canvasColor,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children:  <Widget>[
                          Text(
                            heightVal.toStringAsFixed(2),
                            style:  const TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                           Text(
                            "cm",
                            style: TextStyle(
                                fontSize: 25,
                                color: Theme.of(context).canvasColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Slider(
                        min: 90,
                        max: 220,
                        value: heightVal,
                        onChanged: (val) {
                          setState(() {
                            heightVal = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /*----------------------------------------------------------------------------------*/
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    m2Expanded(context, "weight"),
                    const SizedBox(
                      width: 15,
                    ),
                    m2Expanded(context, "age"),
                  ],
                ),
              ),
            ),
            /*----------------------------------------------------------------------------------*/
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                // height: MediaQuery.of(context).size.height/8,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(20),
                    shadowColor: MaterialStateProperty.all(Colors.pinkAccent),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15)),
                    overlayColor: MaterialStateProperty.all(
                        const Color.fromRGBO(150, 77, 120, 1)),
                  ),
                  onPressed: () {
                    var res = weight / pow(heightVal / 100, 2);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Result(
                        result: res,
                        isMale: isMale,
                        age: age,
                      );
                    }));
                  },
                  child: const Text(
                    "Calculate",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String gender) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = gender == "male" ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (gender == "male" && isMale) ||
                      ((gender == "female" && !isMale))
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(gender == "male" ? Icons.male : Icons.female,
                  color: Colors.white, size: 90),
              const SizedBox(
                height: 15,
              ),
              Text(
                gender == "male" ? "Male" : "Female",
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              type == "age" ? "Age" : "Weight",
              style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).canvasColor,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            /* const SizedBox(
              height: 15,
            ),*/
            Text(
              type == "age" ? "$age" : "$weight",
              style: const TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  mini: true,
                  heroTag: type == "age" ? "age--" : "weight--",
                  onPressed: () {
                    setState(() {
                      type == "age" ? age-- : weight--;
                    });
                  },
                  splashColor: Theme.of(context).canvasColor,
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  mini: true,
                  heroTag: type == "age" ? "age++" : "weight++",
                  onPressed: () {
                    setState(() {
                      type == "age" ? age++ : weight++;
                    });
                  },
                  splashColor: Theme.of(context).canvasColor,
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
