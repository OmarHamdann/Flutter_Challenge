import 'package:flutter/material.dart';

class Sort extends StatefulWidget {
  const Sort({Key? key}) : super(key: key);

  @override
  State<Sort> createState() => _SortState();
}

class _SortState extends State<Sort> {
  var data = TextEditingController();
  var intList = [];

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

            ElevatedButton(
                onPressed: () {

                  setState(() {var output = data.text.split(",");
                  intList = output.map((element) {
                    return int.parse(element);
                  }).toList();
                  intList.sort();}); //useEffect
                },
                child: const Text("sorting")),
            const SizedBox(height: 23),
            if (intList.isNotEmpty) Text("Sorting Array : ${intList}")
          ],
        ),
      ),
    );
  }
}
