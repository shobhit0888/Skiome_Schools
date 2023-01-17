// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:skiome/models/skim.dart';

class OpticsModel {
  static List<Optics> optics = [];
  set op(OpticsModel op) {
    Optics getById(int id) =>
        optics.firstWhere((element) => element.id == id, orElse: null);
    Optics getByPosition(int pos) => optics[pos];
    void add(Optics op) {}
  }
}

class Optics {
  final String id;
  final String name;
  final String image;

  Optics(
    this.id,
    this.name,
    this.image,
  );

  Optics copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return Optics(
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

  factory Optics.fromMap(Map<String, dynamic> map) {
    return Optics(
      map['id'] as String,
      map['name'] as String,
      map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Optics.fromJson(String source) =>
      Optics.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Optics(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant Optics other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
