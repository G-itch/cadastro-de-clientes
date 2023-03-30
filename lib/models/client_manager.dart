import 'dart:convert';

import 'package:cadastro/models/client.dart';
import 'package:cadastro/models/user.dart';
import 'package:cadastro/models/user_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClientManager extends ChangeNotifier {
  ClientManager() {
    _loadAllClients();
  }
  Usuario? user;
  void updateUser(UserManager userManager) {
    user = userManager.user;
    print(user?.name);
    allClients.clear();
    print("user: ${user}");
    if (user != null) {
      _loadAllClients();
    }
  }

  late List<Client> allClients = [];

  late String _search = '';

  List<Client> get filteredClients {
    final List<Client> filteredClients = [];
    if (search.isEmpty) {
      filteredClients.addAll(allClients);
    } else {
      filteredClients.addAll(allClients
          .where((p) => p.name!.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredClients;
  }

  String get search => _search;
  set search(String value) {
    _search = value;
    notifyListeners();
  }

  Future<void> _loadAllClients() async {
    final QuerySnapshot snapClients = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('clients')
        .get();

    allClients = snapClients.docs.map((d) => Client.fromdoc(d)).toList();
    allClients
        .sort((a, b) => a.toString().toLowerCase().compareTo(b.toString()));
    notifyListeners();
  }

  Client? findClientById(String id) {
    try {
      return allClients.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  void update(Client client) {
    allClients.removeWhere((p) => p.id == client.id);
    allClients.add(client);
    notifyListeners();
  }

  void delete(Client client) {
    client.delete();
    allClients.where((p) => p.id == client.id);
    notifyListeners();
  }
}
