import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task/models/jobdata.dart';
import 'package:my_task/views/home.dart';
import 'package:substring_highlight/substring_highlight.dart';

class AutoCompleteTextField extends StatelessWidget {
  final JobData jobData;
  late TextEditingController controller;
  AutoCompleteTextField({super.key, required this.jobData});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.35,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Job Title",
              style: GoogleFonts.openSans(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
                child: ClayContainer(
              color: white,
              borderRadius: 30,
              depth: -30,
              child: Autocomplete<Jobdesignation>(
                  optionsBuilder: (TextEditingValue Value) {
                    if (Value.text.isEmpty) {
                      return List.empty();
                    }
                    return jobData.jobdesignations
                        .where((element) => element.designation
                            .toLowerCase()
                            .contains(Value.text.toLowerCase()))
                        .toList();
                  },
                  onSelected: (option) {
                    print(option);
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    this.controller = textEditingController;
                    return TextField(
                      style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: black,
                        prefixIcon:
                            Icon(Icons.search, color: black.withOpacity(0.2)),
                        hintText: "Designation",
                        hintStyle:
                            GoogleFonts.openSans(color: black.withOpacity(0.3)),
                      ),
                      controller: textEditingController,
                      focusNode: focusNode,
                    );
                  },
                  optionsViewBuilder: (context, onSelected, options) {
                    return Material(
                      elevation: 5,
                      child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final option = options.elementAt(index);
                            return ListTile(
                              title: SubstringHighlight(
                                text: option.designation,
                                term: controller.text,
                                textStyleHighlight:
                                    const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                onSelected(option);
                              },
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                                endIndent: 35,
                              ),
                          itemCount: options.length),
                    );
                  },
                  displayStringForOption: (Jobdesignation j) => j.designation),
            )),
          ],
        ),
      ),
    );
  }
}
