import 'package:cadastro/models/client.dart';
import 'package:cadastro/models/client_manager.dart';
import 'package:cadastro/screens/client/components/address_area.dart';
import 'package:cadastro/screens/client/components/identity_area.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientInformation extends StatefulWidget {
  const ClientInformation({super.key, required this.index});
  final int index;

  @override
  State<ClientInformation> createState() => _ClientInformationState();
}

class _ClientInformationState extends State<ClientInformation> {
  int selectedarea = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientManager>(builder: (_, clientManager, __) {
      Client client = clientManager.allClients[widget.index];
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedarea = 0;
                    // carouselController.animateToPage(0,
                    //     curve: Curves.easeInOut,
                    //     duration: Duration(seconds: 1));
                  });
                },
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: 180,
                      height: 4,
                      color:
                          selectedarea == 0 ? Colors.white : Colors.transparent,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Identidade",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedarea = 1;
                    // carouselController.animateToPage(1,
                    //     curve: Curves.easeInOut,
                    //     duration: Duration(seconds: 1));
                  });
                },
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: 180,
                      height: 4,
                      color:
                          selectedarea == 1 ? Colors.white : Colors.transparent,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Endereço",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 400,
            child: CarouselSlider(
              items: [
                IdentityArea(client: client),
                AddressArea(client: client)
              ],
              options: CarouselOptions(
                height: 400,
                onPageChanged: (index, reason) {
                  setState(() {
                    selectedarea = index;
                  });
                },
              ),
            ),
          )
          // Center(
          //   child: FaIcon(
          //     FontAwesomeIcons.idCardClip,
          //     color: Colors.white,
          //     size: 34,
          //   ),
          // ),
          // SizedBox(
          //   height: 8,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Clipboard.setData(ClipboardData(text: client.cpf)).then((value) {
          //       //only if ->
          //       ScaffoldMessenger.of(context)
          //           .showSnackBar(snack("Nome copiado"));
          //     });
          //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
          //   },
          //   child: Container(
          //     width: 200,
          //     height: 46,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8),
          //         border: Border.all(
          //           width: 2,
          //           color: Color.fromARGB(255, 39, 39, 39),
          //         ),
          //         color: Color.fromARGB(255, 23, 23, 23)),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Center(
          //         child: SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: Text(
          //             client.name!,
          //             style: GoogleFonts.montserrat(
          //                 color: Colors.white, fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 8,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Clipboard.setData(ClipboardData(text: client.cpf)).then((value) {
          //       //only if ->
          //       ScaffoldMessenger.of(context)
          //           .showSnackBar(snack("Email copiado"));
          //     });
          //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
          //   },
          //   child: Container(
          //     width: 200,
          //     height: 46,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8),
          //         border: Border.all(
          //           width: 2,
          //           color: Color.fromARGB(255, 39, 39, 39),
          //         ),
          //         color: Color.fromARGB(255, 23, 23, 23)),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Center(
          //         child: SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: Text(
          //             client.email!,
          //             style: GoogleFonts.montserrat(
          //                 color: Colors.white, fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 8,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Clipboard.setData(ClipboardData(text: client.cpf)).then((value) {
          //       //only if ->
          //       ScaffoldMessenger.of(context)
          //           .showSnackBar(snack("Telefone copiado"));
          //     });
          //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
          //   },
          //   child: Container(
          //     width: 200,
          //     height: 46,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8),
          //         border: Border.all(
          //           width: 2,
          //           color: Color.fromARGB(255, 39, 39, 39),
          //         ),
          //         color: Color.fromARGB(255, 23, 23, 23)),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Center(
          //         child: SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: Text(
          //             client.number!,
          //             style: GoogleFonts.montserrat(
          //                 color: Colors.white, fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 8,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Clipboard.setData(ClipboardData(text: client.cpf)).then((value) {
          //       //only if ->
          //       ScaffoldMessenger.of(context).showSnackBar(snack("RG copiado"));
          //     });
          //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
          //   },
          //   child: Container(
          //     width: 200,
          //     height: 46,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8),
          //         border: Border.all(
          //           width: 2,
          //           color: Color.fromARGB(255, 39, 39, 39),
          //         ),
          //         color: Color.fromARGB(255, 23, 23, 23)),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Center(
          //         child: SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: Text(
          //             client.rg!,
          //             style: GoogleFonts.montserrat(
          //                 color: Colors.white, fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 8,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Clipboard.setData(ClipboardData(text: client.cpf)).then((value) {
          //       //only if ->
          //       ScaffoldMessenger.of(context)
          //           .showSnackBar(snack("CPF copiado"));
          //     });
          //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
          //   },
          //   child: Container(
          //     width: 200,
          //     height: 46,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8),
          //         border: Border.all(
          //           width: 2,
          //           color: Color.fromARGB(255, 39, 39, 39),
          //         ),
          //         color: Color.fromARGB(255, 23, 23, 23)),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Center(
          //         child: SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: Text(
          //             client.cpf!,
          //             style: GoogleFonts.montserrat(
          //                 color: Colors.white, fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ).animate().fadeIn(
          duration: const Duration(seconds: 2),
          delay: const Duration(milliseconds: 600));
    });
  }
}

SnackBar snack(String text) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    width: 200,
    content: Text(
      text,
      style: GoogleFonts.poppins(
          color: Color.fromARGB(255, 16, 16, 16),
          fontWeight: FontWeight.bold,
          fontSize: 16),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor: Colors.white,
  );
}
