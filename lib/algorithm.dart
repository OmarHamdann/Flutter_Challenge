class SortAlgorithm {
  String bubble(List intList) {
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

    dynamic stop = stopwatch1.elapsedMicroseconds;

    stopwatch1.stop();

    return stop.toString();
  }

  String insertionSort(List list) {
    Stopwatch stopwatch1 = Stopwatch()..start();

    int n = list.length;
    int temp, i, j;

    for (i = 1; i < n; i++) {
      temp = list[i];
      j = i - 1;
      while (j >= 0 && temp < list[j]) {
        list[j + 1] = list[j];
        --j;
      }
      list[j + 1] = temp;
    }
    dynamic stop = stopwatch1.elapsedMicroseconds;
    stopwatch1.stop();

    return stop.toString();
  }
}
