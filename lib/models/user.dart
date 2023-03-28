import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  Usuario(
      {this.id, this.email, this.password, this.name, this.confirmPassword});
  Usuario.fromDocument(DocumentSnapshot document) {
    id = document.id as String;
    name = document.get('name') as String;
    email = document.get('email') as String;
  }
  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  bool admin = false;
  DocumentReference get firebasefirestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');
  Future<void> saveData() async {
    await firebasefirestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email};
  }
}
