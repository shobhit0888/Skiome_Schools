// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class School {
//   final String school_name;
//   final String manager_name;
//   final String principal_name;
//   final String board;
//   final String medium;
//   final int foundation;
//   final String highest_class;
//   final String school_email;
//   final int school_contact;
//   final String m1_name;
//   final int m1_contact;
//   final String m1_email;
//   final String m2_name;
//   final int m2_contact;
//   final String m2_email;

//   School(
//     this.school_name,
//     this.manager_name,
//     this.principal_name,
//     this.board,
//     this.medium,
//     this.foundation,
//     this.highest_class,
//     this.school_email,
//     this.school_contact,
//     this.m1_name,
//     this.m1_contact,
//     this.m1_email,
//     this.m2_name,
//     this.m2_contact,
//     this.m2_email,
//   );

//   School copyWith({
//     String? school_name,
//     String? manager_name,
//     String? principal_name,
//     String? board,
//     String? medium,
//     int? foundation,
//     String? highest_class,
//     String? school_email,
//     int? school_contact,
//     String? m1_name,
//     int? m1_contact,
//     String? m1_email,
//     String? m2_name,
//     int? m2_contact,
//     String? m2_email,
//   }) {
//     return School(
//       school_name ?? this.school_name,
//       manager_name ?? this.manager_name,
//       principal_name ?? this.principal_name,
//       board ?? this.board,
//       medium ?? this.medium,
//       foundation ?? this.foundation,
//       highest_class ?? this.highest_class,
//       school_email ?? this.school_email,
//       school_contact ?? this.school_contact,
//       m1_name ?? this.m1_name,
//       m1_contact ?? this.m1_contact,
//       m1_email ?? this.m1_email,
//       m2_name ?? this.m2_name,
//       m2_contact ?? this.m2_contact,
//       m2_email ?? this.m2_email,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'school_name': school_name,
//       'manager_name': manager_name,
//       'principal_name': principal_name,
//       'board': board,
//       'medium': medium,
//       'foundation': foundation,
//       'highest_class': highest_class,
//       'school_email': school_email,
//       'school_contact': school_contact,
//       'm1_name': m1_name,
//       'm1_contact': m1_contact,
//       'm1_email': m1_email,
//       'm2_name': m2_name,
//       'm2_contact': m2_contact,
//       'm2_email': m2_email,
//     };
//   }

//   factory School.fromMap(Map<String, dynamic> map) {
//     return School(
//       map['school_name'] as String,
//       map['manager_name'] as String,
//       map['principal_name'] as String,
//       map['board'] as String,
//       map['medium'] as String,
//       map['foundation'] as int,
//       map['highest_class'] as String,
//       map['school_email'] as String,
//       map['school_contact'] as int,
//       map['m1_name'] as String,
//       map['m1_contact'] as int,
//       map['m1_email'] as String,
//       map['m2_name'] as String,
//       map['m2_contact'] as int,
//       map['m2_email'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory School.fromJson(String source) =>
//       School.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'School(school_name: $school_name, manager_name: $manager_name, principal_name: $principal_name, board: $board, medium: $medium, foundation: $foundation, highest_class: $highest_class, school_email: $school_email, school_contact: $school_contact, m1_name: $m1_name, m1_contact: $m1_contact, m1_email: $m1_email, m2_name: $m2_name, m2_contact: $m2_contact, m2_email: $m2_email)';
//   }

//   @override
//   bool operator ==(covariant School other) {
//     if (identical(this, other)) return true;

//     return other.school_name == school_name &&
//         other.manager_name == manager_name &&
//         other.principal_name == principal_name &&
//         other.board == board &&
//         other.medium == medium &&
//         other.foundation == foundation &&
//         other.highest_class == highest_class &&
//         other.school_email == school_email &&
//         other.school_contact == school_contact &&
//         other.m1_name == m1_name &&
//         other.m1_contact == m1_contact &&
//         other.m1_email == m1_email &&
//         other.m2_name == m2_name &&
//         other.m2_contact == m2_contact &&
//         other.m2_email == m2_email;
//   }

//   @override
//   int get hashCode {
//     return school_name.hashCode ^
//         manager_name.hashCode ^
//         principal_name.hashCode ^
//         board.hashCode ^
//         medium.hashCode ^
//         foundation.hashCode ^
//         highest_class.hashCode ^
//         school_email.hashCode ^
//         school_contact.hashCode ^
//         m1_name.hashCode ^
//         m1_contact.hashCode ^
//         m1_email.hashCode ^
//         m2_name.hashCode ^
//         m2_contact.hashCode ^
//         m2_email.hashCode;
//   }
//   // factory School.fromFirestore(
//   //   DocumentSnapshot<Map<String, dynamic>> snapshot,
//   //   SnapshotOptions? options,
//   // ) {
//   //   final data = snapshot.data();
//   //   return School(
//   // school_name,
//   // manager_name,
//   // principal_name,
//   // board,
//   // medium,
//   // foundation,
//   // highest_class,
//   // school_email,
//   // school_contact,
//   // m1_name,
//   // m1_contact,
//   // m1_email,
//   // m2_name,
//   // m2_contact,
//   // m2_email);
//   // }
// }
