import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  Product({this.id, this.name, this.description, this.deleted = false}) {}
  Product.fromdoc(DocumentSnapshot document) {
    id = document.id;
    name = document.get("name") as String;
    description = document.get('description') as String;

    deleted = document.data().toString().contains('deleted')
        ? document.get('deleted')
        : false;
    quantities = (document.data().toString().contains('quantities')
            ? document.get("quantities") as List<dynamic>
            : [])
        .map((q) => ItemQuantity.fromMap(q as Map<String, dynamic>))
        .toList();
  }
  DocumentReference get firebasefirestoreref =>
      FirebaseFirestore.instance.doc('products/$id');

  String? id;
  String? name;
  String? description;

  List<dynamic>? newImages;
  bool? deleted;
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ItemQuantity? _selectedQuantity;
  ItemQuantity? get selectedQuantity => _selectedQuantity;
  set selectedQuantity(ItemQuantity? value) {
    _selectedQuantity = value;
    notifyListeners();
  }

  int get totalStock {
    int stock = 0;
    for (final quantity in quantities!) {
      stock += quantity.stock!;
    }
    return stock;
  }

  bool get hasStock {
    return totalStock > 0 && !deleted!;
  }

  List<Map<String, dynamic>> exportQuantityList() {
    return quantities!.map((quantity) => quantity.toMaps()).toList();
  }

  Future<void> save() async {
    loading = true;
    Map<String, dynamic> data = {
      'name': name,
      'description': description,
      'quantities': exportQuantityList(),
      'deleted': deleted,
    };
    if (id == null) {
      final doc =
          await FirebaseFirestore.instance.collection('products').add(data);
      id = doc.id;
    } else {
      await firebasefirestoreref.update(data);
    }

    loading = false;
  }

  ItemQuantity? findQuantity(String name) {
    try {
      return quantities!.firstWhere((q) => q.name == name);
    } catch (e) {
      return null;
    }
  }

  void delete() {
    firebasefirestoreref.update({'deleted': true});
  }

  Product clone() {
    return Product(
      id: id,
      name: name,
      description: description,
      images: List.from(images!),
      quantities: quantities!.map((quantity) => quantity.clone()).toList(),
      deleted: deleted,
    );
  }
}
