// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Article {
  int? id;
  String aName;
  String aCount;
  String aDate;

  Article({
    this.id,
    required this.aName,
    required this.aCount,
    required this.aDate,
  });

  Article copyWith({
    int? id,
    String? aName,
    String? aCount,
    String? aDate,
  }) {
    return Article(
      id: id ?? this.id,
      aName: aName ?? this.aName,
      aCount: aCount ?? this.aCount,
      aDate: aDate ?? this.aDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'aName': aName,
      'aCount': aCount,
      'aDate': aDate,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] != null ? map['id'] as int : null,
      aName: map['aName'] as String,
      aCount: map['aCount'] as String,
      aDate: map['aDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Article(id: $id, aName: $aName, aCount: $aCount, aDate: $aDate)';
  }

  @override
  bool operator ==(covariant Article other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.aName == aName &&
        other.aCount == aCount &&
        other.aDate == aDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^ aName.hashCode ^ aCount.hashCode ^ aDate.hashCode;
  }
}
