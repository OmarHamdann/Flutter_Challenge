import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sorting/algorithm.dart';

class Sort extends StatefulWidget {
  const Sort({Key? key}) : super(key: key);

  @override
  State<Sort> createState() => _SortState();
}

class _SortState extends State<Sort> {
  var data = TextEditingController();

  String timeBubble = "";
  String timeInsertion = "";
  List sortedArray = [];

  List<dynamic> arrayData(var list) {
    var s1 = list
        .split(",")
        .where((x) {
          return double.tryParse(x) != null;
        })
        .toList()
        .map((x) => double.tryParse(x))
        .toList(); // s1.removeWhere((x){return x=='['||x==']';}); print(s1);

    return s1;
  }

  late SortAlgorithm bubble;

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
                onChanged: (e) {
                  setState(() {});
                },
                decoration: const InputDecoration(
                    labelText: "Enter Data ...", hintText: "5,7,1,2,4,3,6"),
              ),
              width: 500,
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //////////////////////////////////sort
                ElevatedButton(
                    onPressed: data.text.isNotEmpty
                        ? () {
                            setState(() {
                              sortedArray = arrayData(data.text);
                              sortedArray.sort();
                              bubble = SortAlgorithm();
                              //////////////////////////////////bubble

                              timeInsertion =
                                  bubble.insertionSort(arrayData(data.text));
                              //////////////////////////////////insertion
                              timeBubble = bubble.bubble(arrayData(data.text));
                            }); //useEffect
                          }
                        : null,
                    child: const Text("sorting")),
                const SizedBox(width: 23),
              ],
            ),
            const SizedBox(height: 23),
            if (sortedArray.isNotEmpty) Text("Sorting Array : $sortedArray"),
            const SizedBox(height: 23),
            if (sortedArray.isNotEmpty) Text("Time Bubble : $timeBubble"),
            if (sortedArray.isNotEmpty) Text("Time Insertion : $timeInsertion"),
          ],
        ),
      ),
    );
  }
}
