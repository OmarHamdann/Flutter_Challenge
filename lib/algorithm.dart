class SortAlgorithm {
  ////////////////////////////////////////////// bubbleSort
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
////////////////////////////////////////////// insertionSort
  String insertionSort(List list) {
    Stopwatch stopwatch2 = Stopwatch()..start();

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
    dynamic stop = stopwatch2.elapsedMicroseconds;
    stopwatch2.stop();

    return stop.toString();
  }
////////////////////////////////////////////// mergesSort

    void merges(List list, int leftIndex, int middleIndex, int rightIndex) {
      int leftSize = middleIndex - leftIndex + 1;
      int rightSize = rightIndex - middleIndex;

      List leftList = List.filled(leftSize, null, growable: false);
      List rightList = List.filled(rightSize, null, growable: false);

      for (int i = 0; i < leftSize; i++) {
        leftList[i] = list[leftIndex + i];
      }
      for (int j = 0; j < rightSize; j++) {
        rightList[j] = list[middleIndex + j + 1];
      }

      int i = 0, j = 0;
      int k = leftIndex;

      while (i < leftSize && j < rightSize) {
        if (leftList[i] <= rightList[j]) {
          list[k] = leftList[i];
          i++;
        } else {
          list[k] = rightList[j];
          j++;
        }
        k++;
      }

      while (i < leftSize) {
        list[k] = leftList[i];
        i++;
        k++;
      }

      while (j < rightSize) {
        list[k] = rightList[j];
        j++;
        k++;
      }
    }

    String mergeSort(List list, int leftIndex, int rightIndex) {
      Stopwatch stopwatch1 =  Stopwatch()..start();
      if (leftIndex < rightIndex) {
        int middleIndex = (rightIndex + leftIndex) ~/ 2;

        mergeSort(list, leftIndex, middleIndex);
        mergeSort(list, middleIndex + 1, rightIndex);

        merges(list, leftIndex, middleIndex, rightIndex);
      }
      dynamic stop = stopwatch1.elapsedMicroseconds;
      stopwatch1.stop();

      return stop.toString();

    }

    /////////////////////////////////////////////heapSort
  void heapIfy(List list, int n, int i) {
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;

    if (l < n && list[l] > list[largest]) {
      largest = l;
    }

    if (r < n && list[r] > list[largest]) {
      largest = r;
    }

    if (largest != i) {
      swapList(list, i, largest);
      heapIfy(list, n, largest);
    }
  }

  void swapList(List list, int i, int largest) {
    int swap = list[i];
    list[i] = list[largest];
    list[largest] = swap;
  }

  void swap(List list, int i) {
    int temp = list[0];
    list[0] = list[i];
    list[i] = temp;
  }

  String heapSort(List list) {
    Stopwatch stopwatch4 =  Stopwatch()..start();
    int n = list.length;
    for (int i = (n ~/ 2); i >= 0; i--) {
      heapIfy(list, n, i);
    }

    for (int i = n - 1; i >= 0; i--) {
      swap(list, i);
      heapIfy(list, i, 0);
    }

    dynamic stop = stopwatch4.elapsedMicroseconds;
    stopwatch4.stop();

    return stop.toString();
  }
  String selectionSort(List a) {
    Stopwatch stopwatch3 = Stopwatch()..start();
    for (var i = a.length - 1; i >= 0; i--) {
      var first = 0, tmp=0;

      for (var j = 1; j <= i; j++) {
        if (a[j] > a[first]) first = j;
      }

      tmp = a[first];
      a[first] = a[i];
      a[i] = tmp;
    }
    dynamic stop = stopwatch3.elapsedMicroseconds;
    stopwatch3.stop();

    return stop.toString();


  }
  }

