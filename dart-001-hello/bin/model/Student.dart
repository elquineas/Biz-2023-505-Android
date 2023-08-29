// ignore_for_file: file_names
class Student {
  int stNum = 0;
  String? stName;
  String? stDept;
  int? stGrade;

  //data class 의 기본 생성자 함수
  // 아래와 같은 코드를 작성하여 매개변수로 받은 데이터를 내부변수( this.* )에 setting 하는 코드를 작성한다.
  // Student(stNum, stName, stDept, stGrade) {
  //   this.stNum = stNum;
  //   this.stName = stName;
  //   this.stDept = stDept;
  //   this.stGrade = stGrade;
  // }

  //다만 stNum 은 null safe 가 아니기떄문에 값을 줘야한다.
  Student({this.stNum = 0, this.stName, this.stDept, this.stGrade});

  set setStNum(int num) => stNum = num;

  @override
  String toString() {
    String str = "이름 : $stName, 학번 : $stNum, 학과 : $stDept, 학년 : $stGrade ";
    return str;
  }
}
