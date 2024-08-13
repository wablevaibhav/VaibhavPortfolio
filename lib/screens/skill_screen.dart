import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:vaibhav_wable/utils/components/ui_helphers.dart';
import 'package:http/http.dart' as http;

class SkillScreen extends StatefulWidget {
  const SkillScreen({
    super.key,
  });

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  List<dynamic> jsonData = [];

  @override
  void initState() {
    loadBlogData();
    super.initState();
  }

  Future<void> loadBlogData() async {
    final response = await http.get(Uri.parse("assets/jsons/languages.json"));
    if (response.statusCode == 200) {
      setState(() {
        jsonData = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load json data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: UIHelpers.screenHeight(context) * 0.7,
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Lottie.asset(
                    width: UIHelpers.screenWidth(context) * 0.4,
                    "assets/jsons/build.json",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: UIHelpers.screenWidth(context) * 0.5,
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What I do',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: UIHelpers.getResponsiveFontSize(context,
                                  max: 22)),
                        ),
                        UIHelpers.verticalSpaceRegular,
                        Text(
                          'Crazy Android Developer Who Wants To Explore Every Tech Stack',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              fontSize: UIHelpers.getResponsiveFontSize(context,
                                  max: 17)),
                        ),
                        UIHelpers.verticalSpaceSmall,
                        Text(
                          '⚡ Develop highly interactive Front end / User Interfaces for your web and mobile applications',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontSize: UIHelpers.getResponsiveFontSize(context,
                                  max: 17)),
                        ),
                        UIHelpers.verticalSpaceSmall,
                        Text(
                          '⚡ Progressive Android Applications in normal and SPA Stacks',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontSize: UIHelpers.getResponsiveFontSize(context,
                                  max: 17)),
                        ),
                        UIHelpers.verticalSpaceSmall,
                        Text(
                          '⚡ Integration of third party services such as Firebase / AWS / MySQL',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontSize: UIHelpers.getResponsiveFontSize(context,
                                  max: 17)),
                        ),
                        UIHelpers.verticalSpaceSmall,
                      ]),
                ),
              ],
            ),
          ),
          UIHelpers.verticalSpaceSmall,
          Text(
            "Coding Languages",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: UIHelpers.getResponsiveFontSize(context, max: 20)),
          ),
          UIHelpers.verticalSpaceRegular,
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 80,
                  crossAxisCount:
                      MediaQuery.of(context).size.width < 700 ? 2 : 3,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0),
              itemCount: jsonData.length,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: UIHelpers.screenWidth(context) * 0.10,
                          child: LinearProgressIndicator(
                            value: jsonData[index]["value"],
                            backgroundColor: Colors.white,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue),
                          ),
                        ),
                        UIHelpers.horizontalSpaceRegular,
                        Text(
                          jsonData[index]["title"],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: UIHelpers.getResponsiveFontSize(context,
                                max: 14),
                          ),
                        ),
                      ],
                    ));
              })),
          UIHelpers.verticalSpaceRegular,
        ]),
      ),
    );
  }
}
