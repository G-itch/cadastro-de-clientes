import 'package:cadastro/models/client.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 220,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    client.name!,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontWeight: FontWeight.w600),
                    maxLines: 1,
                  ),
                ),
              ),
              Container(
                width: 120,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(client.email!,
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
