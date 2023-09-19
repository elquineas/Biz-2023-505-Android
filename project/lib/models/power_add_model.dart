import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PowerAdd {
  int? id;
  int? power;
  String pName;

  PowerAdd({
    this.id,
    this.power,
    required this.pName,
  });

  PowerAdd copyWith({
    int? id,
    int? power,
    String? pName,
  }) {
    return PowerAdd(
      id: id ?? this.id,
      power: power ?? this.power,
      pName: pName ?? this.pName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'power': power,
      'pName': pName,
    };
  }

  factory PowerAdd.fromMap(Map<String, dynamic> map) {
    return PowerAdd(
      id: map['id'] != null ? map['id'] as int : null,
      power: map['power'] != null ? map['power'] as int : null,
      pName: map['pName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PowerAdd.fromJson(String source) =>
      PowerAdd.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PowerAdd(id: $id, power: $power, pName: $pName)';

  @override
  bool operator ==(covariant PowerAdd other) {
    if (identical(this, other)) return true;

    return other.id == id && other.power == power && other.pName == pName;
  }

  @override
  int get hashCode => id.hashCode ^ power.hashCode ^ pName.hashCode;
}
