import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Client extends ChangeNotifier {
  Client(
      {this.id,
      this.name,
      this.deleted = false,
      this.cpf,
      this.rg,
      this.number,
      this.cep,
      this.street,
      this.neigh,
      this.city,
      this.ibge,
      this.state});
  Client.fromdoc(DocumentSnapshot document) {
    id = document.id;
    name = document.get("name") as String;
    email = document.get("email") as String;
    cpf = document.get('cpf') as String;
    rg = document.get('rg') as String;
    number = document.get('number') as String;
    cep = document.get('cep') as String;
    street = document.get('street') as String;
    neigh = document.get('neigh') as String;
    city = document.get('city') as String;
    ibge = document.get('ibge') as String;
    state = document.get('state') as String;
    deleted = document.data().toString().contains('deleted')
        ? document.get('deleted')
        : false;
  }
  DocumentReference get firebasefirestoreref => FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('clients')
      .doc("$id");

  String? id;
  String? name;
  String? email;
  String? cpf;
  String? rg;
  String? number;
  String? cep;
  String? street;
  String? neigh;
  String? city;
  String? ibge;
  String? state;
  bool? deleted;
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  cepapi(String cep, List<TextEditingController> controllers) async {
    String path = 'https://viacep.com.br/ws/${cep}/json/';
    Uri url = Uri.parse(path);
    Map<String, dynamic>? inf;
    http.Response response;
    try {
      response = await http.get(url);
      print(response.body);
      inf = jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
    if (inf == null) {
      return;
    }
    if (inf["erro"] == null) {
      controllers[1].text = inf["logradouro"];
      controllers[2].text = inf["bairro"];
      controllers[3].text = inf["localidade"];
      controllers[4].text = inf["ibge"];
      controllers[5].text = inf["uf"];
    } else {
      controllers[1].text = "CEP não existe";
      controllers[2].text = "";
      controllers[3].text = "";
      controllers[4].text = "";
      controllers[5].text = "";
    }
  }

  Future<void> save() async {
    loading = true;
    Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'deleted': deleted,
      'cpf': cpf,
      'rg': rg,
      'number': number,
      'cep': cep,
      'street': street,
      'neigh': neigh,
      'city': city,
      'ibge': ibge,
      'state': state
    };
    if (id == null) {
      final doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('clients')
          .add(data);
      id = doc.id;
    } else {
      await firebasefirestoreref.update(data);
    }

    loading = false;
  }

  void delete() {
    firebasefirestoreref.delete();
  }

  Client clone() {
    return Client(
        id: id,
        name: name,
        deleted: deleted,
        cpf: cpf,
        rg: rg,
        number: number,
        cep: cep,
        street: street,
        neigh: neigh,
        city: city,
        ibge: ibge,
        state: state);
  }
}
