import 'package:get/get.dart';

class Firstcontroller
    extends GetxController /*using because for injection and seprate logic program from ui program*/ {
  RxInt current = 0.obs;
  RxInt previousvalue = 0.obs;
  RxInt futurevalue = 0.obs;

  void increment() {
    previousvalue.value = current.value;
    current.value++;
    futurevalue.value = current.value + 1;
  }

  void decrement() {
    if (current.value != 0) {
      futurevalue.value = current.value;
      current.value = previousvalue.value;
      previousvalue--;
    } else {
      return;
    }
  }

  void reset() {
    current.value = 0;
    previousvalue.value = 0;
    futurevalue.value = 0;
  }

  void ontap(String tag) {
    if (tag == '/future') {
      previousvalue.value = current.value;
      current.value = futurevalue.value;
      futurevalue.value++;
    } else if (tag == '/previous') {
      futurevalue.value = current.value;
      current.value = previousvalue.value;
      previousvalue.value--;
    } else
      return;
  }

  void submit(var number) {
    if (number < 0) {
      current.value = 0;
      futurevalue.value = 1;
    } else {
      previousvalue.value = number - 1;
      current.value = number;
      futurevalue.value = number + 1;
    }
  }
}
