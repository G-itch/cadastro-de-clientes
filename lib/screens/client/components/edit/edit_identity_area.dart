import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../helpers/validators.dart';
import '../../../../models/client.dart';

class IdentityEdit extends StatelessWidget {
  const IdentityEdit(
      {super.key, required this.client, required this.controllers});
  final Client client;
  final List<TextEditingController> controllers;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200),
            child: Container(
              child: TextFormField(
                controller: controllers[0],
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                cursorHeight: 20,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Color.fromARGB(255, 23, 23, 23),
                  hintText: 'Nome',
                  enabledBorder: bordertext,
                  disabledBorder: bordertext,
                  border: bordertext,
                  focusedBorder: bordertext,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 113, 113, 113)),
                ),
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                validator: (name) {
                  if (name!.isEmpty) {
                    return 'Insira um nome';
                  }
                  return null;
                },
                onSaved: (name) {
                  client.name = name;
                },
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Container(
                child: TextFormField(
                  controller: controllers[1],
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  cursorHeight: 20,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Color.fromARGB(255, 23, 23, 23),
                    hintText: 'Email',
                    enabledBorder: bordertext,
                    disabledBorder: bordertext,
                    border: bordertext,
                    focusedBorder: bordertext,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 113, 113, 113)),
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty && !emailValid(email)) {
                      return 'Insira um email válido';
                    }
                    return null;
                  },
                  onSaved: (email) {
                    client.email = email;
                  },
                ),
              )),
          SizedBox(
            height: 8,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Container(
                child: TextFormField(
                  controller: controllers[2],
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  cursorHeight: 20,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Color.fromARGB(255, 23, 23, 23),
                    hintText: 'Telefone',
                    enabledBorder: bordertext,
                    disabledBorder: bordertext,
                    border: bordertext,
                    focusedBorder: bordertext,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 113, 113, 113)),
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (number) {
                    if (number!.isEmpty) {
                      return 'Insira um número de telefone';
                    }
                    return null;
                  },
                  onSaved: (number) {
                    client.number = number;
                  },
                ),
              )),
          SizedBox(
            height: 8,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Container(
                child: TextFormField(
                  controller: controllers[3],
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  cursorHeight: 20,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Color.fromARGB(255, 23, 23, 23),
                    hintText: 'RG',
                    enabledBorder: bordertext,
                    disabledBorder: bordertext,
                    border: bordertext,
                    focusedBorder: bordertext,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 113, 113, 113)),
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (rg) {
                    if (rg!.isEmpty) {
                      return 'Insira um rg';
                    }
                    return null;
                  },
                  onSaved: (rg) {
                    client.rg = rg;
                  },
                ),
              )),
          SizedBox(
            height: 8,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Container(
                child: TextFormField(
                  controller: controllers[4],
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  cursorHeight: 20,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Color.fromARGB(255, 23, 23, 23),
                    hintText: 'CPF',
                    enabledBorder: bordertext,
                    disabledBorder: bordertext,
                    border: bordertext,
                    focusedBorder: bordertext,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 113, 113, 113)),
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (cpf) {
                    if (cpf!.isEmpty) {
                      return 'Insira um cpf válido';
                    }
                    return null;
                  },
                  onSaved: (cpf) {
                    client.cpf = cpf;
                  },
                ),
              )),
        ],
      ),
    );
  }
}

OutlineInputBorder bordertext = OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 39, 39, 39)),
    borderRadius: BorderRadius.circular(9));
