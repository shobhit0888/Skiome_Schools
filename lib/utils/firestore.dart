import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future insertData(
      String school_name,
      String manager_name,
      String principal_name,
      String board,
      String medium,
      String foundation,
      String highest_class,
      String school_email,
      String school_contact,
      String m1_name,
      String m1_contact,
      String m1_email,
      String m2_name,
      String m2_contact,
      String m2_email) async {
    try {
      await firestore.collection('Schools').add({
        'school_name': school_name,
      'manager_name': manager_name,
      'principal_name': principal_name,
      'board': board,
      'medium': medium,
      'foundation': foundation,
      'highest_class': highest_class,
      'school_email': school_email,
      'school_contact': school_contact,
      'm1_name': m1_name,
      'm1_contact': m1_contact,
      'm1_email': m1_email,
      'm2_name': m2_name,
      'm2_contact': m2_contact,
      'm2_email': m2_email,
    }
      );
    } catch (e) {}
  }
}
