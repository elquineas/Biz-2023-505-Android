import 'dart:math';

void main(List<String> args) {
  List<int> nums = [];
  for (int i = 0; i < 20; i++) {
    var num = Random().nextInt(100) + 1;
    nums.add(num);
  }
  print(nums);

  // 배열에 저장된 요소들중에 소수를 구하여 출력하시오.
  List<int> primeNums = [];
  for (int i = 0; i < nums.length; i++) {
    var num = nums[i];
    for (int j = 2; j < num; j++) {
      if (num % j == 0) {
        num = 0;
      }
    }

    if (num > 0) {
      primeNums.add(num);
    }
  }
  print(primeNums);
}
