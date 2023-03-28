import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/validators.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 16, 16, 16),
      body: Container(
          child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150),
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Entrar"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 53,
                      width: 112,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color: Color.fromARGB(255, 39, 39, 39),
                          ),
                          color: Color.fromARGB(255, 23, 23, 23)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 53,
                      width: 112,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color: Color.fromARGB(255, 39, 39, 39),
                          ),
                          color: Color.fromARGB(255, 23, 23, 23)),
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        // enabled: !userManager.loading,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
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
                          if (email != null && !emailValid(email)) {
                            return 'Email inválido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 45),
                      TextFormField(
                        controller: passController,
                        // enabled: !userManager.loading,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Color.fromARGB(255, 23, 23, 23),
                          hintText: 'Senha',
                          border: bordertext,
                          disabledBorder: bordertext,
                          enabledBorder: bordertext,
                          focusedBorder: bordertext,
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 113, 113, 113)),
                        ),
                        enableSuggestions: true,
                        autocorrect: false,
                        obscureText: true,
                        validator: (pass) {
                          if (pass!.isEmpty || pass.length < 6) {
                            return 'Senha inválida';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Não possui uma conta?",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 113, 113, 113)),
                          ),
                          TextButton(
                              style: ButtonStyle(
                                  mouseCursor: MaterialStatePropertyAll()),
                              onPressed: () {},
                              child: Text("Cadastre-se",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

OutlineInputBorder bordertext = OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 39, 39, 39)),
    borderRadius: BorderRadius.circular(12));
