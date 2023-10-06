import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result(
      {super.key,
      required this.result,
      required this.isMale,
      required this.age});

  final double result;
  final bool isMale;
  final int age;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  resultPhrase() {
    String resultText = " ";
    if (widget.result >= 30) {
      resultText = "Obese";
    } else if (widget.result > 25 && widget.result < 30) {
      resultText = "Overweight";
    } else if (widget.result >= 18.5 && widget.result <= 24.9) {
      resultText = "Normal";
    } else {
      resultText = "Underweight";
    }
    return resultText;
  }

  resultImage() {
    String im = "";
    if (widget.result >= 30) {
      im = "assets/images/obese.jpeg";
    } else if (widget.result > 25 && widget.result < 30) {
      im = "assets/images/overweight.jpeg";
    } else if (widget.result >= 18.5 && widget.result <= 24.9) {
      im = "assets/images/normal.jpeg";
    } else {
      im = "assets/images/underweight.jpeg";
    }
    return im;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("The Result"), centerTitle: true),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Your Result Is: ",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                /*----------------------------------------------------------------------------------*/
                Container(
                  padding: const EdgeInsets.all(10),
                  child: buildCard(
                      context, "Gender: ", widget.isMale ? "Male" : "Female"),
                ),
                /*----------------------------------------------------------------------------------*/
                Container(
                  padding: const EdgeInsets.all(10),
                  child: buildCard(context, "Age: ", "${widget.age}"),
                ),
                /*----------------------------------------------------------------------------------*/
                Container(
                  padding: const EdgeInsets.all(10),
                  child: buildCard(
                      context, "Result: ", widget.result.toStringAsFixed(2)),
                ),
                /*----------------------------------------------------------------------------------*/
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    margin: const EdgeInsets.all(20),
                    color: Theme.of(context).colorScheme.secondary,
                    shadowColor: Colors.pinkAccent,
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Healthiness: ",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              resultPhrase(),
                              style: const TextStyle(
                                fontSize: 35,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Image.asset(resultImage())
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card buildCard(BuildContext context, String title, String res) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).colorScheme.secondary,
      shadowColor: Colors.pinkAccent,
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
            ),
            Text(
              res,
              style: const TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
