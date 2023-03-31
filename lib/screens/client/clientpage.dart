import 'dart:html';

import 'package:cadastro/models/user_manager.dart';
import 'package:cadastro/screens/client/components/client_information.dart';
import 'package:cadastro/screens/client/components/client_tile.dart';
import 'package:cadastro/screens/client/components/edit/edit.dart';
import 'package:cadastro/screens/client/components/login/login_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../models/client_manager.dart';
import 'components/dialog/search.dart';

class ClientsPage extends StatefulWidget {
  ClientsPage({super.key});
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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  int? index;
  bool reset = true;
  bool edit = false;
  clientid(int newindex) {
    setState(() {
      index = newindex;
      edit = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: widget.scaffoldKey,
        backgroundColor: Color.fromARGB(255, 16, 16, 16),
        appBar: AppBar(
            toolbarHeight: 80,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leadingWidth: 120,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Consumer<UserManager>(builder: (_, userManager, __) {
                if (userManager.isLoggedIn) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Center(
                      child: Text(
                        userManager.user!.name!,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
            ),
            actions: <Widget>[
              Consumer<ClientManager>(builder: (_, clientManager, __) {
                if (clientManager.search.isEmpty) {
                  return IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () async {
                        final search = await showDialog<String>(
                            context: context,
                            builder: (_) => SearchDialog(
                                  initialtext: clientManager.search,
                                ));
                        if (search != null) {
                          clientManager.search = search;
                        }
                      },
                      icon: Icon(Icons.search));
                } else {
                  return IconButton(
                      onPressed: () async {
                        clientManager.search = '';
                      },
                      icon: Icon(Icons.close));
                }
              }),
              SizedBox(
                width: 10,
              ),
              Consumer<UserManager>(builder: (_, userManager, __) {
                if (userManager.isLoggedIn) {
                  return Center(
                    child: GestureDetector(
                        child: TextButton(
                      onPressed: () {
                        context.go('/login');
                        index = null;
                        userManager.SignOut();
                      },
                      child: Text('Sair',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          )),
                    )),
                  );
                } else {
                  return Center(
                      child: GestureDetector(
                    child: TextButton(
                      onPressed: () {
                        context.go('/login');
                      },
                      child: Text("Entrar",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ));
                }
              }),
              SizedBox(
                width: 40,
              )
            ],
            title: Consumer<ClientManager>(
              builder: (_, clientManager, __) {
                if (clientManager.search.isEmpty) {
                  return Text("Clientes",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ));
                } else {
                  return Center(
                    child: LayoutBuilder(builder: (_, constrains) {
                      return GestureDetector(
                        child: Container(
                            width: constrains.biggest.width,
                            child: Text(clientManager.search,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ))),
                        onTap: () async {
                          final search = await showDialog<String>(
                              context: context,
                              builder: (_) => SearchDialog(
                                    initialtext: clientManager.search,
                                  ));
                          if (search != null) {
                            clientManager.search = search;
                          }
                        },
                      );
                    }),
                  );
                }
              },
            )
            //
            ),
        body: Consumer<UserManager>(builder: (_, userManager, __) {
          if (userManager.isLoggedIn) {
            return Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: SingleChildScrollView(
                  child: ResponsiveRowColumn(
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    rowCrossAxisAlignment: CrossAxisAlignment.start,
                    columnCrossAxisAlignment: CrossAxisAlignment.center,
                    columnMainAxisAlignment: MainAxisAlignment.center,
                    layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                        ? ResponsiveRowColumnType.COLUMN
                        : ResponsiveRowColumnType.ROW,
                    children: [
                      ResponsiveRowColumnItem(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromARGB(255, 23, 23, 23))),
                                  onPressed: () {
                                    setState(() {
                                      index = -1;
                                      reset = true;
                                      widget.namecontroller.text = "";
                                      widget.emailcontroller.text = "";
                                      widget.numbercontroller.text = "";
                                      widget.rgcontroller.text = "";
                                      widget.cpfcontroller.text = "";
                                      widget.cepcontroller.text = "";
                                      widget.streetcontroller.text = "";
                                      widget.neighcontroller.text = "";
                                      widget.citycontroller.text = "";
                                      widget.ibgecontroller.text = "";
                                      widget.statecontroller.text = "";
                                      edit = false;
                                      edit = true;
                                    });
                                    // await Future.delayed(Duration(seconds: 2));
                                    // setState(() {
                                    //   reset = false;
                                    // });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          "Adicionar Cliente",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromARGB(255, 23, 23, 23))),
                                  onPressed: () {
                                    setState(() {
                                      reset = false;
                                      edit = true;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          "Editar informações",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxHeight: 400, maxWidth: 450),
                              child: Container(
                                child: Consumer<ClientManager>(
                                    builder: (_, clientManager, __) {
                                  return ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (_, index) {
                                        return ClientTile(
                                          client: clientManager
                                              .filteredClients[index],
                                          clientid: clientid,
                                          index: index,
                                        );
                                      },
                                      separatorBuilder: (_, index) {
                                        return SizedBox(
                                          height: 16,
                                        );
                                      },
                                      itemCount:
                                          clientManager.filteredClients.length);
                                }),
                              ),
                            ),
                          ],
                        ).animate().fadeIn(
                            duration: const Duration(seconds: 2),
                            delay: const Duration(milliseconds: 600)),
                      ),
                      ResponsiveRowColumnItem(
                          child: SizedBox(
                        height: 20,
                      )),
                      ResponsiveRowColumnItem(
                          child: SingleChildScrollView(
                        child: index != null
                            ? edit
                                ? EditCLient(
                                    namecontroller: widget.namecontroller,
                                    emailcontroller: widget.emailcontroller,
                                    numbercontroller: widget.numbercontroller,
                                    rgcontroller: widget.rgcontroller,
                                    cpfcontroller: widget.cpfcontroller,
                                    cepcontroller: widget.cepcontroller,
                                    statecontroller: widget.statecontroller,
                                    neighcontroller: widget.neighcontroller,
                                    citycontroller: widget.citycontroller,
                                    ibgecontroller: widget.ibgecontroller,
                                    streetcontroller: widget.streetcontroller,
                                    index: index!,
                                    formkey: widget.formkey,
                                  )
                                : ClientInformation(index: index!)
                            // ClientInformation(
                            //     index: index ?? 0,
                            //   )
                            : Container(),
                      ))
                    ],
                  ),
                ),
              ),
            );
          } else {
            return LoginCard();
          }
        }));
  }
}
