import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:vaibhav_wable/utils/components/freelancer_icons.dart';
import 'package:vaibhav_wable/utils/components/ui_helphers.dart';
import 'package:vaibhav_wable/widgets/custom_button_url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UIHelpers.screenWidth(context) > 750
        ? const DesktopViewWidget()
        : Container();
  }
}

class DesktopViewWidget extends StatelessWidget {
  const DesktopViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          width: double.infinity,
          height: UIHelpers.screenHeight(context) * 0.7,
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: UIHelpers.screenWidth(context) / 2,
                height: UIHelpers.screenHeight(context) * 0.8,
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi all, I\'m Vaibhav',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: UIHelpers.getResponsiveFontSize(context,
                                max: 24)),
                      ),
                      UIHelpers.verticalSpaceRegular,
                      Text(
                        'A passionate Android Developer 🚀 having an\nexperience of building Mobile applications with\nAndroid / Flutter / Kotlin / Dart and some other\ncool libraries and frameworks.',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: UIHelpers.getResponsiveFontSize(context,
                                max: 22)),
                      ),
                      UIHelpers.verticalSpaceSmall,
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.white, // Text color
                              padding: const EdgeInsets.all(20),
                            ),
                            onPressed: () async {
                              await EasyLauncher.email(
                                  email: 'vaibhavswable@gmail.com',
                                  subject: 'Need to a project');
                            },
                            child: Text(
                              'CONTACT ME',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.white, // Text color
                              padding: const EdgeInsets.all(20),
                            ),
                            onPressed: () async {
                              await EasyLauncher.url(
                                  url:
                                      "https://drive.google.com/file/d/1g-ByJOlQpbyOyXkfXDYkHIjTGjKdpfc3/view?usp=sharing",
                                  mode: Mode.platformDefault);
                            },
                            child: Text(
                              'SEE MY RESUME',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Container(
                width: UIHelpers.screenWidth(context) / 3,
                height: UIHelpers.screenHeight(context) * 0.8,
                padding: const EdgeInsets.only(right: 10),
                child: Lottie.asset(
                  "assets/jsons/android.json",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 80,
          decoration: const BoxDecoration(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made With ',
                style: GoogleFonts.poppins(
                    fontSize:
                        UIHelpers.getResponsiveFontSize(context, max: 30)),
              ),
              const Icon(
                Icons.favorite_rounded,
                color: Colors.red,
                size: 30,
              ),
              Text(
                ' By Vaibhav Wable',
                style: GoogleFonts.poppins(
                    fontSize:
                        UIHelpers.getResponsiveFontSize(context, max: 30)),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomButtonUrl(
              icon: FreeLancerIcons.instagram,
              url: "https://www.instagram.com/_vaibhav.wable/",
              title: "INSTAGRAM",
            ),
            UIHelpers.horizontalSpaceSmall,
            const CustomButtonUrl(
              icon: FreeLancerIcons.github,
              url: "",
              title: "GITHUB",
            ),
            UIHelpers.horizontalSpaceSmall,
            const CustomButtonUrl(
              icon: FreeLancerIcons.linkedin,
              url: "https://www.linkedin.com/in/vaibhavwable/",
              title: "LINKEDIN",
            ),
            UIHelpers.horizontalSpaceSmall,
            const CustomButtonUrl(
              icon: FreeLancerIcons.youtube,
              url: "",
              title: "YOUTUBE",
            ),
            UIHelpers.horizontalSpaceSmall,
          ],
        ),
        UIHelpers.verticalSpaceRegular,
      ]),
    );
  }
}
