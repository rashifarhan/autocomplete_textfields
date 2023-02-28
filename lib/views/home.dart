import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:my_task/models/jobdata.dart'
    show JobData;
import 'package:my_task/views/widgets/autocomplete_textfield.dart';
import 'package:my_task/views/widgets/description.dart';


import 'widgets/background_design.dart';
import 'widgets/bottomcontainer.dart';

//colors used in this app
const Color white = Colors.white;
const Color black = Colors.black;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  JobData? _jobData;

  @override
  void initState() {
    super.initState();
    getDataFromApi();
  }

  void getDataFromApi() async {
    var response = await http
        .get(Uri.parse("https://devstaticapi.hire22.co/v1/jobdesignations"));
    if (response.statusCode == 200) {
      setState(() {
        _jobData = JobData.fromJson(json.decode(response.body));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
          child: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            const BackgroundDesign(),
            if (_jobData != null) AutoCompleteTextField(jobData: _jobData!),
            const Description(),
            BottomContainer(),
          ],
        ),
      )),
    );
  }
}
