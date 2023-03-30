import 'package:cadastro/screens/client/components/client_information.dart';
import 'package:cadastro/screens/client/components/client_tile.dart';
import 'package:cadastro/screens/client/components/edit/edit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../models/client_manager.dart';
import 'components/dialog/search.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  int? index;
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
      backgroundColor: Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: <Widget>[
            Consumer<ClientManager>(builder: (_, clientManager, __) {
              if (clientManager.search.isEmpty) {
                return IconButton(
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
                return LayoutBuilder(builder: (_, constrains) {
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
                });
              }
            },
          )
          //
          ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 23, 23, 23))),
                            onPressed: () {
                              setState(() {
                                index = -1;
                                edit = false;
                                edit = true;
                              });
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
                                    client:
                                        clientManager.filteredClients[index],
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
                  ),
                ),
                ResponsiveRowColumnItem(
                    child: SizedBox(
                  height: 20,
                )),
                ResponsiveRowColumnItem(
                    child: SingleChildScrollView(
                  child: index != null
                      ? edit
                          ? EditCLient(index: index!)
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
      ),
    );
  }
}
