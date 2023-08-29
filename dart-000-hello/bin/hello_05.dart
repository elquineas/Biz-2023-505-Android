void main(List<String> args) {
  String str1 = "korea";
  String str2 = 'korea';
  String str3 = """
    멀티라인
    문자열
  """;
  // multi line 문자열
  // 엔터, 스페이스, 탭 등의 값들도 그대로 유지된다.

  print(str1);
  print(str2);
  print(str3);

  int num1;
  double num2; // dart 에서는 float 가 없고 double 를 사용한다.
  num1 = 30;
  num2 = 40.0;
  print("$num1, $num2");

  // late var numA;
  // late var numB;
  // numA = 30;
  // numB = 40;
  // 값이 할당되지 않았을때 초기화를 미루는 선언
  // late를 일부 생략해도 오류가 나지 않는다
}
