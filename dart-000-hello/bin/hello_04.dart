void main(List<String> args) {
  final numA = 30;
  final numB = 40;
  addNums(numA, numB);
  final sum = sumNums(numA, numB);
  print(sum);

  // const int sumS = 30 + 40;
  // const int sumC = sumNums(numA, numB);
  // final 과 const 는 둘다 값을 변경할 수 없는데
  // const 는 변수의 값이 무엇을 통하지 않고도 알 수 있는 확실한 변수만 가능
  // 매직 리터럴 : "" 로 묶인 문자열, 직접 사용한 숫자값 등
  // 매직 리터럴은 final 형식의 변수에 저장하고 조금이라도 오류가 나는 것을 방지하는 방법이 사용된다.

  // dart 에서는 매직 리터럴이 값을 저장하는 변수에는 const 선언문을 부착한다.
}

void addNums(int num1, int num2) {
  print("${num1 + num2}");
}

int sumNums(int num1, int num2) {
  return num1 + num2;
}
