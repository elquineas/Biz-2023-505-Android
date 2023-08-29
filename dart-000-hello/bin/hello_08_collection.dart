// List(배열)
var nums = [1, 2, 3, 4, 5, 5, 6, 7, 8, 9];
var nations = ["한식", "중식", "일식", '양식'];
List<String> names = ["홍길동", "이몽룡", "성춘향", "임꺽정"];

void main(List<String> args) {
  print(nums);
  print(nations);
  nums.add(100);
  nations.add("모름");
  names.add("장보고");

  print(nums);
  print(nations);
  print(names);

  nations.remove("중식");
  print(nations);
  nations.removeAt(3);
  print(nations);

  print(names.first);
  print(names.last);
  print(names.reversed);
  names.shuffle();
  print(names);
}
