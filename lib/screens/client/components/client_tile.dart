import 'package:cadastro/models/client.dart';
import 'package:flutter/material.dart';

class ClientTile extends StatelessWidget {
  const ClientTile(
      {super.key,
      required this.client,
      required this.clientid,
      required this.index});
  final Client client;
  final Function(int) clientid;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => clientid(index),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              color: Color.fromARGB(255, 39, 39, 39),
            ),
            color: Color.fromARGB(255, 23, 23, 23)),
        child: Text("oi"),
      ),
    );
  }
}
