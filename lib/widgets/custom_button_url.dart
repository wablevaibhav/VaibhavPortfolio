import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:vaibhav_wable/utils/components/ui_helphers.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonUrl extends StatelessWidget {
  const CustomButtonUrl({
    super.key,
    required this.title,
    required this.icon,
    required this.url,
  });

  final String icon;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await EasyLauncher.url(url: url, mode: Mode.platformDefault);
      },
      child: Container(
        alignment: Alignment.center,
        width: UIHelpers.screenWidth(context) < 870 ? 150 : 200,
        height: UIHelpers.screenHeight(context) * 0.06,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 25,
              height: 25,
            ),
            UIHelpers.horizontalSpaceSmall,
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: UIHelpers.getResponsiveFontSize(context, max: 14)),
            )
          ],
        ),
      ),
    );
  }
}
