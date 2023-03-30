import 'package:cadastro/models/client.dart';
import 'package:cadastro/screens/client/components/client_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class IdentityArea extends StatelessWidget {
  const IdentityArea({super.key, required this.client});
  final Client client;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: FaIcon(
            FontAwesomeIcons.idCardClip,
            color: Colors.white,
            size: 34,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: client.name)).then((value) {
              //only if ->
              ScaffoldMessenger.of(context).showSnackBar(snack("Nome copiado"));
            });
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          child: Container(
            width: 200,
            height: 46,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: Color.fromARGB(255, 39, 39, 39),
                ),
                color: Color.fromARGB(255, 23, 23, 23)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    client.name!,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: client.email)).then((value) {
              //only if ->
              ScaffoldMessenger.of(context)
                  .showSnackBar(snack("Email copiado"));
            });
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          child: Container(
            width: 200,
            height: 46,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: Color.fromARGB(255, 39, 39, 39),
                ),
                color: Color.fromARGB(255, 23, 23, 23)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    client.email!,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: client.number)).then((value) {
              //only if ->
              ScaffoldMessenger.of(context)
                  .showSnackBar(snack("Telefone copiado"));
            });
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          child: Container(
            width: 200,
            height: 46,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: Color.fromARGB(255, 39, 39, 39),
                ),
                color: Color.fromARGB(255, 23, 23, 23)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    client.number!,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: client.rg)).then((value) {
              //only if ->
              ScaffoldMessenger.of(context).showSnackBar(snack("RG copiado"));
            });
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          child: Container(
            width: 200,
            height: 46,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: Color.fromARGB(255, 39, 39, 39),
                ),
                color: Color.fromARGB(255, 23, 23, 23)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    client.rg!,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: client.cpf)).then((value) {
              //only if ->
              ScaffoldMessenger.of(context).showSnackBar(snack("CPF copiado"));
            });
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          child: Container(
            width: 200,
            height: 46,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: Color.fromARGB(255, 39, 39, 39),
                ),
                color: Color.fromARGB(255, 23, 23, 23)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    client.cpf!,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
