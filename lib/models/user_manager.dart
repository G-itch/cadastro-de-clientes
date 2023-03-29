import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cadastro/helpers/firebase_errors.dart';
import 'package:cadastro/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class UserManager extends ChangeNotifier {
  UserManager() {
    print(FirebaseAuth.instance.currentUser != null);
    loadCurrentUser();
  }
  final FirebaseAuth auth = FirebaseAuth.instance;
  Usuario? user;
  bool _loading = false;
  bool get loading => _loading;
  bool get isLoggedIn => user != null;
  Future<void> signIn(
      {required Usuario user,
      required Function onFail,
      required Function onSucess}) async {
    loading = true;

    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email as String, password: user.password as String);
      await loadCurrentUser(firebaseUser: result.user);
      onSucess();
    } on FirebaseException catch (e) {
      print(e);
      print(getErrorString(e.code));
      onFail(getErrorString(e.code));
    }
    // await Future.delayed(const Duration(seconds: 4));
    loading = false;
  }

  void SignOut() {
    user = null;
    auth.signOut();
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signUp(
      {required Usuario user,
      required Function onFail,
      required Function onSucess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
          email: user.email as String, password: user.password as String);
      user.id = result.user!.uid;
      print(FirebaseAuth.instance.currentUser);
      this.user = user;
      await user.saveData();
      onSucess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  cepapi(String cep) async {
    String path = 'https://viacep.com.br/ws/${cep}/json/';
    Uri url = Uri.parse(path);
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> inf = jsonDecode(response.body);
  }

  Future<void> loadCurrentUser({User? firebaseUser}) async {
    auth.authStateChanges().listen((User? currentuser) async {
      if (currentuser != null) {
        load(currentuser, user);
        final DocumentSnapshot docUser = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentuser.uid)
            .get();
        user = Usuario.fromDocument(docUser);
        print("savetoken");
        final docAdmin = await FirebaseFirestore.instance
            .collection('admins')
            .doc(user?.id)
            .get();
        if (docAdmin.exists && user != null) {
          user?.admin = true;
        }
        print(user?.name);
        print(user?.admin);
        notifyListeners();
      } else {
        print("Nenhum usuário logado");
      }
    });
    final User? currentUser = firebaseUser ?? FirebaseAuth.instance.currentUser;
  }

  bool get adminEnabled => user?.admin ?? false;
  void load(User currentuser, Usuario? user) async {
    final DocumentSnapshot docUser = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentuser.uid)
        .get();
    // currentuser.getIdToken().then((value) => print("idtoken: ${value}"));
    user = Usuario.fromDocument(docUser);
    final docAdmin = await FirebaseFirestore.instance
        .collection('admins')
        .doc(user.id)
        .get();
    if (docAdmin.exists && user != null) {
      user.admin = true;
    }
    notifyListeners();
  }
}
