// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

// import 'package:skiome/models/3D_Models/Optics3D.dart';
import 'package:skiome/models/3D_Models/Physics_Models/Kinematics3D.dart';

import 'Optics3D.dart';

class PhysicsModels {
  List<Optics> optics = [];
  List<Kinematics> kinematics = [];
  // Optics optics;
  // Kinematics kinematics;
  PhysicsModels({
    required this.optics,
    required this.kinematics,
  });

  PhysicsModels copyWith({
    List<Optics>? optics,
    List<Kinematics>? kinematics,
  }) {
    return PhysicsModels(
      optics: optics ?? this.optics,
      kinematics: kinematics ?? this.kinematics,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'optics': optics.map((x) => x.toMap()).toList(),
      'kinematics': kinematics.map((x) => x.toMap()).toList(),
    };
  }

  factory PhysicsModels.fromMap(Map<String, dynamic> map) {
    return PhysicsModels(
      optics: List<Optics>.from((map['optics'] as List<int>).map<Optics>((x) => Optics.fromMap(x as Map<String,dynamic>),),),
      kinematics: List<Kinematics>.from((map['kinematics'] as List<int>).map<Kinematics>((x) => Kinematics.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory PhysicsModels.fromJson(String source) => PhysicsModels.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PhysicsModels(optics: $optics, kinematics: $kinematics)';

  @override
  bool operator ==(covariant PhysicsModels other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.optics, optics) &&
      listEquals(other.kinematics, kinematics);
  }

  @override
  int get hashCode => optics.hashCode ^ kinematics.hashCode;
}
