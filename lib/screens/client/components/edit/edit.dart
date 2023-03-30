import 'package:cadastro/helpers/validators.dart';
import 'package:cadastro/models/client.dart';
import 'package:cadastro/models/client_manager.dart';
import 'package:cadastro/screens/client/components/edit/edit_address_area.dart';
import 'package:cadastro/screens/client/components/edit/edit_identity_area.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditCLient extends StatefulWidget {
  const EditCLient({super.key, required this.index});
  final int index;

  @override
  State<EditCLient> createState() => _EditCLientState();
}

class _EditCLientState extends State<EditCLient> {
  late Client client;
  int selectedarea = 0;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController rgcontroller = TextEditingController();
  TextEditingController cpfcontroller = TextEditingController();
  TextEditingController cepcontroller = TextEditingController();
  TextEditingController streetcontroller = TextEditingController();
  TextEditingController neighcontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController ibgecontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  CarouselController carouselController = CarouselController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<ClientManager>(builder: (_, clientManager, __) {
      if (widget.index.isNegative) {
        client = Client();
      } else {
        client = clientManager.allClients[widget.index];
      }
      if (namecontroller.text.isEmpty) {
        namecontroller.text = client.name ?? "";
      }
      if (emailcontroller.text.isEmpty) {
        emailcontroller.text = client.email ?? "";
      }
      if (numbercontroller.text.isEmpty) {
        numbercontroller.text = client.number ?? "";
      }
      if (rgcontroller.text.isEmpty) {
        rgcontroller.text = client.rg ?? "";
      }
      if (cpfcontroller.text.isEmpty) {
        cpfcontroller.text = client.cpf ?? "";
      }
      if (cepcontroller.text.isEmpty) {
        cepcontroller.text = client.cep ?? "";
      }
      if (streetcontroller.text.isEmpty) {
        streetcontroller.text = client.street ?? "";
      }
      if (neighcontroller.text.isEmpty) {
        neighcontroller.text = client.neigh ?? "";
      }
      if (citycontroller.text.isEmpty) {
        citycontroller.text = client.city ?? "";
      }
      if (ibgecontroller.text.isEmpty) {
        ibgecontroller.text = client.ibge ?? "";
      }
      if (statecontroller.text.isEmpty) {
        statecontroller.text = client.state ?? "";
      }
      return ChangeNotifierProvider.value(
        value: client,
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedarea = 0;
                        carouselController.animateToPage(0,
                            curve: Curves.easeInOut,
                            duration: Duration(seconds: 1));
                      });
                    },
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: 180,
                          height: 4,
                          color: selectedarea == 0
                              ? Colors.white
                              : Colors.transparent,
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
                        carouselController.animateToPage(1,
                            curve: Curves.easeInOut,
                            duration: Duration(seconds: 1));
                      });
                    },
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: 180,
                          height: 4,
                          color: selectedarea == 1
                              ? Colors.white
                              : Colors.transparent,
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
                  carouselController: carouselController,
                  items: [
                    IdentityEdit(
                      client: client,
                      controllers: [
                        namecontroller,
                        emailcontroller,
                        numbercontroller,
                        rgcontroller,
                        cpfcontroller
                      ],
                    ),
                    AddressEdit(
                      client: client,
                      controllers: [
                        cepcontroller,
                        streetcontroller,
                        neighcontroller,
                        citycontroller,
                        ibgecontroller,
                        statecontroller
                      ],
                    )
                  ],
                  options: CarouselOptions(
                    height: 380,
                    onPageChanged: (index, reason) {
                      setState(() {
                        selectedarea = index;
                      });
                    },
                  ),
                ),
              ),
              Consumer<Client>(builder: (_, client, __) {
                return ElevatedButton(
                  onPressed: !client.loading
                      ? () async {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState?.save();
                            await client.save();
                            if (context.mounted) {
                              Provider.of<ClientManager>(context, listen: false)
                                  .update(client);
                            }
                          }
                        }
                      : null,
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 23, 23, 23))),
                  child: client.loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        )
                      : const Text("Salvar"),
                );
              }),

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
              // ConstrainedBox(
              //   constraints: BoxConstraints(maxWidth: 200),
              //   child: Container(
              //     child: TextFormField(
              //       initialValue: client.name ?? "",
              //       style: GoogleFonts.poppins(
              //           fontSize: 14,
              //           fontWeight: FontWeight.w600,
              //           color: Colors.white),
              //       cursorHeight: 20,
              //       cursorColor: Colors.white,
              //       decoration: InputDecoration(
              //         isDense: true,
              //         filled: true,
              //         fillColor: Color.fromARGB(255, 23, 23, 23),
              //         hintText: 'Nome',
              //         enabledBorder: bordertext,
              //         disabledBorder: bordertext,
              //         border: bordertext,
              //         focusedBorder: bordertext,
              //         hintStyle: GoogleFonts.poppins(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             color: Color.fromARGB(255, 113, 113, 113)),
              //       ),
              //       autocorrect: false,
              //       keyboardType: TextInputType.emailAddress,
              //       validator: (name) {
              //         if (name!.isEmpty) {
              //           return 'Insira um nome';
              //         }
              //         return null;
              //       },
              //       onSaved: (name) {
              //         client.name = name;
              //       },
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 8,
              // ),
              // ConstrainedBox(
              //     constraints: BoxConstraints(maxWidth: 200),
              //     child: Container(
              //       child: TextFormField(
              //         initialValue: client.email ?? "",
              //         style: GoogleFonts.poppins(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             color: Colors.white),
              //         cursorHeight: 20,
              //         cursorColor: Colors.white,
              //         decoration: InputDecoration(
              //           isDense: true,
              //           filled: true,
              //           fillColor: Color.fromARGB(255, 23, 23, 23),
              //           hintText: 'Email',
              //           enabledBorder: bordertext,
              //           disabledBorder: bordertext,
              //           border: bordertext,
              //           focusedBorder: bordertext,
              //           hintStyle: GoogleFonts.poppins(
              //               fontSize: 14,
              //               fontWeight: FontWeight.w600,
              //               color: Color.fromARGB(255, 113, 113, 113)),
              //         ),
              //         autocorrect: false,
              //         keyboardType: TextInputType.emailAddress,
              //         validator: (email) {
              //           if (email!.isEmpty && !emailValid(email)) {
              //             return 'Insira um email válido';
              //           }
              //           return null;
              //         },
              //         onSaved: (email) {
              //           client.email = email;
              //         },
              //       ),
              //     )),
              // SizedBox(
              //   height: 8,
              // ),
              // ConstrainedBox(
              //     constraints: BoxConstraints(maxWidth: 200),
              //     child: Container(
              //       child: TextFormField(
              //         initialValue: client.number ?? "",
              //         style: GoogleFonts.poppins(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             color: Colors.white),
              //         cursorHeight: 20,
              //         cursorColor: Colors.white,
              //         decoration: InputDecoration(
              //           isDense: true,
              //           filled: true,
              //           fillColor: Color.fromARGB(255, 23, 23, 23),
              //           hintText: 'Telefone',
              //           enabledBorder: bordertext,
              //           disabledBorder: bordertext,
              //           border: bordertext,
              //           focusedBorder: bordertext,
              //           hintStyle: GoogleFonts.poppins(
              //               fontSize: 14,
              //               fontWeight: FontWeight.w600,
              //               color: Color.fromARGB(255, 113, 113, 113)),
              //         ),
              //         autocorrect: false,
              //         keyboardType: TextInputType.emailAddress,
              //         validator: (number) {
              //           if (number!.isEmpty) {
              //             return 'Insira um número de telefone';
              //           }
              //           return null;
              //         },
              //         onSaved: (number) {
              //           client.number = number;
              //         },
              //       ),
              //     )),
              // SizedBox(
              //   height: 8,
              // ),
              // ConstrainedBox(
              //     constraints: BoxConstraints(maxWidth: 200),
              //     child: Container(
              //       child: TextFormField(
              //         initialValue: client.rg ?? "",
              //         style: GoogleFonts.poppins(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             color: Colors.white),
              //         cursorHeight: 20,
              //         cursorColor: Colors.white,
              //         decoration: InputDecoration(
              //           isDense: true,
              //           filled: true,
              //           fillColor: Color.fromARGB(255, 23, 23, 23),
              //           hintText: 'RG',
              //           enabledBorder: bordertext,
              //           disabledBorder: bordertext,
              //           border: bordertext,
              //           focusedBorder: bordertext,
              //           hintStyle: GoogleFonts.poppins(
              //               fontSize: 14,
              //               fontWeight: FontWeight.w600,
              //               color: Color.fromARGB(255, 113, 113, 113)),
              //         ),
              //         autocorrect: false,
              //         keyboardType: TextInputType.emailAddress,
              //         validator: (rg) {
              //           if (rg!.isEmpty) {
              //             return 'Insira um rg';
              //           }
              //           return null;
              //         },
              //         onSaved: (rg) {
              //           client.rg = rg;
              //         },
              //       ),
              //     )),
              // SizedBox(
              //   height: 8,
              // ),
              // ConstrainedBox(
              //     constraints: BoxConstraints(maxWidth: 200),
              //     child: Container(
              //       child: TextFormField(
              //         initialValue: client.number ?? "",
              //         style: GoogleFonts.poppins(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             color: Colors.white),
              //         cursorHeight: 20,
              //         cursorColor: Colors.white,
              //         decoration: InputDecoration(
              //           isDense: true,
              //           filled: true,
              //           fillColor: Color.fromARGB(255, 23, 23, 23),
              //           hintText: 'CPF',
              //           enabledBorder: bordertext,
              //           disabledBorder: bordertext,
              //           border: bordertext,
              //           focusedBorder: bordertext,
              //           hintStyle: GoogleFonts.poppins(
              //               fontSize: 14,
              //               fontWeight: FontWeight.w600,
              //               color: Color.fromARGB(255, 113, 113, 113)),
              //         ),
              //         autocorrect: false,
              //         keyboardType: TextInputType.emailAddress,
              //         validator: (cpf) {
              //           if (cpf!.isEmpty) {
              //             return 'Insira um cpf válido';
              //           }
              //           return null;
              //         },
              //         onSaved: (cpf) {
              //           client.cpf = cpf;
              //         },
              //       ),
              //     )),
            ],
          ).animate().fadeIn(
              duration: const Duration(seconds: 2),
              delay: const Duration(seconds: 1, milliseconds: 400)),
        ),
      );
    });
  }
}

OutlineInputBorder bordertext = OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 39, 39, 39)),
    borderRadius: BorderRadius.circular(9));
