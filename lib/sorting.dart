import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorting/algorithm.dart';
import 'package:sorting/provider/provider_notifer.dart';
import 'package:sorting/visualizer.dart';

import 'components/reusable_widgets.dart';
import 'weather_view.dart';

class Sort extends StatefulWidget {
  const Sort({Key? key}) : super(key: key);

  @override
  State<Sort> createState() => _SortState();
}

class _SortState extends State<Sort> {
  var data = TextEditingController();

  String? timeBubble = "";
  String? timeInsertion = "";
  String? timeHeap = "";
  String? timeSelection = "";
  String? timeMerge = "";
  List sortedArray = [];

  List<dynamic> arrayData(var list) {
    var s1 = list
        .split(",")
        .where((x) {
          return int.tryParse(x) != null;
        })
        .toList()
        .map((x) => int.tryParse(x))
        .toList(); // s1.removeWhere((x){return x=='['||x==']';}); print(s1);

    return s1;
  }

  late SortAlgorithm algorithm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorting Algorithm Analyzer'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => WeatherView()));
              },
              icon: const Icon(Icons.cloud))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "HELLO ${context.read<LoginProvider>().userName.toUpperCase()}",
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'HELLO ${context.read<LoginProvider>().userName.toUpperCase().toString()}'),
                      backgroundColor: Colors.teal,
                    ));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'ReusableButton  ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.print,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: data,
                            onChanged: (e) {
                              setState(() {});
                            },
                            maxLines: 3,
                            minLines: 1,
                            decoration: const InputDecoration(
                                labelText: "Enter Data ...",
                                hintText: "5,7,1,2,4,3,6"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                                  algorithm = SortAlgorithm();
                                  //////////////////////////////////insertion

                                  timeInsertion = algorithm
                                      .insertionSort(arrayData(data.text));
                                  //////////////////////////////////Bubble
                                  timeBubble =
                                      algorithm.bubble(arrayData(data.text));
                                  //////////////////////////////////mergeSort
                                  timeMerge = algorithm.mergeSort(
                                      arrayData(data.text),
                                      0,
                                      arrayData(data.text).length - 1);
                                  //////////////////////////////////heapSort
                                  timeHeap =
                                      algorithm.heapSort(arrayData(data.text));
                                  //////////////////////////////////selectionSort
                                  timeSelection =
                                      algorithm.heapSort(arrayData(data.text));
                                }); //useEffect
                              }
                            : null,
                        child: const Text("sorting")),
                    const SizedBox(width: 23),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (sortedArray.isNotEmpty)
                  Text("Sorting Array : $sortedArray"),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: DataTable(columns: const [
                    DataColumn(label: Text('SortingType')),
                    DataColumn(label: Text('ExecutionTime')),
                    DataColumn(label: Text('TimeComplexity')),
                  ], rows: [
                    DataRow(
                      cells: [
                        const DataCell(
                          Text('SelectionSort'),
                        ),
                        DataCell(
                          Text('$timeSelection'),
                        ),
                        const DataCell(
                          Text('O(n^2)'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(
                          Text('InsertionSort'),
                        ),
                        DataCell(
                          Text(timeInsertion.toString()),
                        ),
                        const DataCell(
                          Text('O(n^2)'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(
                          Text('MergeSort'),
                        ),
                        DataCell(
                          Text(timeMerge.toString()),
                        ),
                        const DataCell(
                          Text('O(n log(n))'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(
                          Text('HeapSort'),
                        ),
                        DataCell(
                          Text(timeHeap.toString()),
                        ),
                        const DataCell(
                          Text('O(n log(n))'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(
                          Text('BubbleSort'),
                        ),
                        DataCell(
                          Text(timeBubble.toString()),
                        ),
                        const DataCell(
                          Text('O(n^2)'),
                        ),
                      ],
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.animation_outlined),
        label: const Text('Show Animation'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Visual()),
          );
        },
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Visual()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
