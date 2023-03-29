import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      this.state}) {}
  Client.fromdoc(DocumentSnapshot document) {
    id = document.id;
    name = document.get("name") as String;
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
  DocumentReference get firebasefirestoreref =>
      FirebaseFirestore.instance.doc('Clients/$id');

  String? id;
  String? name;
  String? cpf;
  String? rg;
  String? number;
  String? cep;
  String? street;
  String? neigh;
  String? city;
  String? ibge;
  String? state;
  List<dynamic>? newImages;
  bool? deleted;
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> save() async {
    loading = true;
    Map<String, dynamic> data = {
      'name': name,
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
      final doc =
          await FirebaseFirestore.instance.collection('Clients').add(data);
      id = doc.id;
    } else {
      await firebasefirestoreref.update(data);
    }

    loading = false;
  }

  void delete() {
    firebasefirestoreref.update({'deleted': true});
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
