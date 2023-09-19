import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Power {
  int? id;
  int? power;
  Power({
    this.id,
    this.power,
  });

  @override
  String toString() => 'Power(id: $id, power: $power)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'power': power,
    };
  }

  factory Power.fromMap(Map<String, dynamic> map) {
    return Power(
      id: map['id'] != null ? map['id'] as int : null,
      power: map['power'] != null ? map['power'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Power.fromJson(String source) =>
      Power.fromMap(json.decode(source) as Map<String, dynamic>);

  Power copyWith({
    int? id,
    int? power,
  }) {
    return Power(
      id: id ?? this.id,
      power: power ?? this.power,
    );
  }

  @override
  bool operator ==(covariant Power other) {
    if (identical(this, other)) return true;

    return other.id == id && other.power == power;
  }

  @override
  int get hashCode => id.hashCode ^ power.hashCode;
}
