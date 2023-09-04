class Todo {
  int? id;
  String sdate;
  String stime;
  String content;
  bool complete;

  Todo({
    this.id,
    required this.sdate,
    required this.stime,
    required this.content,
    required this.complete,
  });

  Map<String, Object?> toMap() {
    return {
      // "id": id,
      "sdate": sdate,
      "stime": stime,
      "content": content,
      "complete": complete ? 1 : 0,
    };
  }
}
