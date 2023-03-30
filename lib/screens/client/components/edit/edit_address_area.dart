import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../helpers/validators.dart';
import '../../../../models/client.dart';

class AddressEdit extends StatelessWidget {
  const AddressEdit(
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
              FontAwesomeIcons.locationDot,
              color: Colors.white,
              size: 34,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 146),
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
                        hintText: 'CEP',
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
                      validator: (cep) {
                        if (cep!.isEmpty) {
                          return 'Insira um CEP';
                        }
                        return null;
                      },
                      onSaved: (cep) {
                        client.cep = cep;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () => client.cepapi(controllers[0].text, controllers),
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 2,
                          color: Color.fromARGB(255, 39, 39, 39),
                        ),
                        color: Color.fromARGB(255, 23, 23, 23)),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
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
                    hintText: 'Rua',
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
                  validator: (street) {
                    if (street!.isEmpty) {
                      return 'Insira uma rua';
                    }
                    return null;
                  },
                  onSaved: (street) {
                    client.street = street;
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
                    hintText: 'Bairro',
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
                  validator: (neigh) {
                    if (neigh!.isEmpty) {
                      return 'Insira um bairro';
                    }
                    return null;
                  },
                  onSaved: (neigh) {
                    client.neigh = neigh;
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
                    hintText: 'Cidade',
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
                  validator: (city) {
                    if (city!.isEmpty) {
                      return 'Insira uma cidade';
                    }
                    return null;
                  },
                  onSaved: (city) {
                    client.city = city;
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
                    hintText: 'IBGE',
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
                  validator: (ibge) {
                    if (ibge!.isEmpty) {
                      return 'Insira um código IBGE';
                    }
                    return null;
                  },
                  onSaved: (ibge) {
                    client.ibge = ibge;
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
                  controller: controllers[5],
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
                    hintText: 'Estado',
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
                  validator: (state) {
                    if (state!.isEmpty) {
                      return 'Insira um estado';
                    }
                    return null;
                  },
                  onSaved: (state) {
                    client.state = state;
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
