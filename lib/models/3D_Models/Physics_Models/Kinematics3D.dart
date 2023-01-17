// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Kinematics {
  final String id;
  final String name;
  final String image;

  Kinematics(
    this.id,
    this.name,
    this.image,
  );

  Kinematics copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return Kinematics(
      id ?? this.id,
      name ?? this.name,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Kinematics.fromMap(Map<String, dynamic> map) {
    return Kinematics(
      map['id'] as String,
      map['name'] as String,
      map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Kinematics.fromJson(String source) => Kinematics.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Kinematics(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant Kinematics other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
