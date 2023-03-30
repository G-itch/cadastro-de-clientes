import 'package:cadastro/models/client.dart';
import 'package:cadastro/screens/client/components/client_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressArea extends StatelessWidget {
  const AddressArea({super.key, required this.client});
  final Client client;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: FaIcon(
            FontAwesomeIcons.locationDot,
            color: Colors.white,
            size: 34,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: client.cep)).then((value) {
              //only if ->
              ScaffoldMessenger.of(context).showSnackBar(snack("CEP copiado"));
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
                    client.cep!,
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
            Clipboard.setData(ClipboardData(text: client.street)).then((value) {
              //only if ->
              ScaffoldMessenger.of(context).showSnackBar(snack("Rua copiada"));
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
                    client.street!,
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
            Clipboard.setData(ClipboardData(text: client.neigh)).then((value) {
              //only if ->
              ScaffoldMessenger.of(context)
                  .showSnackBar(snack("Bairro copiado"));
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
                    client.neigh!,
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
            Clipboard.setData(ClipboardData(text: client.city)).then((value) {
              //only if ->
              ScaffoldMessenger.of(context)
                  .showSnackBar(snack("Cidade copiada"));
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
                    client.city!,
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
            Clipboard.setData(ClipboardData(text: client.ibge)).then((value) {
              //only if ->
              ScaffoldMessenger.of(context).showSnackBar(snack("IBGE copiado"));
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
                    client.ibge!,
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
            Clipboard.setData(ClipboardData(text: client.state)).then((value) {
              //only if ->
              ScaffoldMessenger.of(context)
                  .showSnackBar(snack("Estado copiado"));
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
                    client.state!,
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
