import 'package:flutter/material.dart';

class Sort extends StatefulWidget {
  const Sort({Key? key}) : super(key: key);

  @override
  State<Sort> createState() => _SortState();
}

class _SortState extends State<Sort> {
  var data = TextEditingController();
  var intList = [];
  int time = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AppBar(
              title: const Text('Sorting Algorithm Analyzer'),
            ),
            SizedBox(
              child: TextField(
                controller: data,
                decoration: const InputDecoration(
                    labelText: "Enter Data ...", hintText: "5,7,1,2,4,3,6"),
              ),
              width: 500,
              height: 100,
            ),
            Center(
              child: Row(
                children: [
                  //////////////////////////////////sort
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (data.text.isEmpty) {
                            return;
                          }

                          var output = data.text.split(",");

                          intList = output.map((element) {
                            return int.parse(element);
                          }).toList();

                          intList.sort();
                        }); //useEffect
                      },
                      child: const Text("sorting")),
                  const SizedBox(height: 23),
                  //////////////////////////////////bubble
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          var output = data.text.split(",");

                          intList = output.map((element) {
                            return int.parse(element);
                          }).toList();

                          print(intList);

                          Stopwatch stopwatch1 = Stopwatch()..start();

                          // if(data.text.isEmpty){ return;}

                          for (var i = 0; i < intList.length; i++) {
                            var swapped = false;

                            for (var j = i + 1; j < intList.length; j++) {
                              if (intList[i] > intList[j]) {
                                var tmp = intList[i];

                                intList[i] = intList[j];

                                intList[j] = tmp;

                                swapped = true;
                              }
                            }

                            if (!swapped) break;
                          }

                          int stop = stopwatch1.elapsedMicroseconds;

                          setState(() {
                            time = stop;
                          });
                        }); //useEffect
                      },
                      child: const Text("bubbleSort")),
                  //////////////////////////////////insertion


                ],
              ),
            ),
            const SizedBox(height: 23),
            if (intList.isNotEmpty) Text("Sorting Array : $intList"),
            const SizedBox(height: 23),
            if (intList.isNotEmpty) Text("Time : $time"),
          ],
        ),
      ),
    );
  }
}
