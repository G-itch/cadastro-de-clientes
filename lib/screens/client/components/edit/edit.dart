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
  EditCLient(
      {super.key,
      required this.index,
      required this.namecontroller,
      required this.emailcontroller,
      required this.numbercontroller,
      required this.rgcontroller,
      required this.cpfcontroller,
      required this.cepcontroller,
      required this.streetcontroller,
      required this.neighcontroller,
      required this.citycontroller,
      required this.ibgecontroller,
      required this.statecontroller,
      required this.formkey});
  int index;

  TextEditingController namecontroller;
  TextEditingController emailcontroller;
  TextEditingController numbercontroller;
  TextEditingController rgcontroller;
  TextEditingController cpfcontroller;
  TextEditingController cepcontroller;
  TextEditingController streetcontroller;
  TextEditingController neighcontroller;
  TextEditingController citycontroller;
  TextEditingController ibgecontroller;
  TextEditingController statecontroller;
  CarouselController carouselController = CarouselController();
  final GlobalKey<FormState> formkey;
  @override
  State<EditCLient> createState() => _EditCLientState();
}

class _EditCLientState extends State<EditCLient> {
  late Client client;
  int selectedarea = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientManager>(builder: (_, clientManager, __) {
      if (widget.index.isNegative) {
        client = Client();
      } else {
        client = clientManager.allClients[widget.index];
      }
      if (widget.namecontroller.text.isEmpty) {
        widget.namecontroller.text = client.name ?? "";
      }
      if (widget.emailcontroller.text.isEmpty) {
        widget.emailcontroller.text = client.email ?? "";
      }
      if (widget.numbercontroller.text.isEmpty) {
        widget.numbercontroller.text = client.number ?? "";
      }
      if (widget.rgcontroller.text.isEmpty) {
        widget.rgcontroller.text = client.rg ?? "";
      }
      if (widget.cpfcontroller.text.isEmpty) {
        widget.cpfcontroller.text = client.cpf ?? "";
      }
      if (widget.cepcontroller.text.isEmpty) {
        widget.cepcontroller.text = client.cep ?? "";
      }
      if (widget.streetcontroller.text.isEmpty) {
        widget.streetcontroller.text = client.street ?? "";
      }
      if (widget.neighcontroller.text.isEmpty) {
        widget.neighcontroller.text = client.neigh ?? "";
      }
      if (widget.citycontroller.text.isEmpty) {
        widget.citycontroller.text = client.city ?? "";
      }
      if (widget.ibgecontroller.text.isEmpty) {
        widget.ibgecontroller.text = client.ibge ?? "";
      }
      if (widget.statecontroller.text.isEmpty) {
        widget.statecontroller.text = client.state ?? "";
      }
      return ChangeNotifierProvider.value(
        value: client,
        child: Form(
          key: widget.formkey,
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
                        widget.carouselController.animateToPage(0,
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
                        widget.carouselController.animateToPage(1,
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
                  carouselController: widget.carouselController,
                  items: [
                    IdentityEdit(
                      client: client,
                      controllers: [
                        widget.namecontroller,
                        widget.emailcontroller,
                        widget.numbercontroller,
                        widget.rgcontroller,
                        widget.cpfcontroller
                      ],
                    ),
                    AddressEdit(
                      client: client,
                      controllers: [
                        widget.cepcontroller,
                        widget.streetcontroller,
                        widget.neighcontroller,
                        widget.citycontroller,
                        widget.ibgecontroller,
                        widget.statecontroller
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<Client>(builder: (_, client, __) {
                    return ElevatedButton(
                      onPressed: !client.loading
                          ? () async {
                              if (widget.formkey.currentState!.validate()) {
                                widget.formkey.currentState?.save();
                                await client.save();
                                if (context.mounted) {
                                  Provider.of<ClientManager>(context,
                                          listen: false)
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
                          : widget.index.isNegative
                              ? Text("Adicionar")
                              : Text("Salvar"),
                    );
                  }),
                  if (!widget.index.isNegative) ...[
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clientManager.delete(client);
                        widget.index = -1;
                      },
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 23, 23, 23))),
                      child: client.loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            )
                          : Text("Excluir"),
                    )
                  ]
                ],
              ),
            ],
          ).animate().fadeIn(
              duration: const Duration(seconds: 2),
              delay: const Duration(milliseconds: 600)),
        ),
      );
    });
  }
}

OutlineInputBorder bordertext = OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 39, 39, 39)),
    borderRadius: BorderRadius.circular(9));
