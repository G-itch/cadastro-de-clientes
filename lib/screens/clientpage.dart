import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          "Clientes",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: Align(
            alignment: Alignment.centerLeft,
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
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: 400, maxWidth: 450),
                        child: Container(
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return Container(
                                  height: 46,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        width: 2,
                                        color: Color.fromARGB(255, 39, 39, 39),
                                      ),
                                      color: Color.fromARGB(255, 23, 23, 23)),
                                );
                              },
                              separatorBuilder: (_, index) {
                                return SizedBox(
                                  height: 16,
                                );
                              },
                              itemCount: 10),
                        ),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                        child: SizedBox(
                      height: 20,
                    )),
                    ResponsiveRowColumnItem(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 200,
                                    height: 4,
                                    color: Colors.white,
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
                              Column(
                                children: [
                                  Container(
                                    width: 200,
                                    height: 4,
                                    color: Colors.white,
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
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                          Container(
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
                                    "Manoel gomes da silva ribeiro joaquim",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
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
                                    "(19) 99836-4281",
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
                    ))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
