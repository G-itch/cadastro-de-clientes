import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({Key? key, required this.initialtext}) : super(key: key);
  final String initialtext;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 22,
                left: 20,
                right: 20,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      initialValue: initialtext,
                      textInputAction: TextInputAction.search,
                      autofocus: true,
                      style: GoogleFonts.poppins(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          border: InputBorder.none,
                          hintText: "Pesquisar",
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: Colors.white,
                          )),
                      onFieldSubmitted: (text) {
                        Navigator.of(context).pop(text);
                      },
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
