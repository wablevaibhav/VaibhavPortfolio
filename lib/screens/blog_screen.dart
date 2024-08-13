import 'dart:convert';

import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class BlogScreen extends StatefulWidget {
  const BlogScreen({
    super.key,
  });

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  List<dynamic> jsonData = [];

  @override
  void initState() {
    loadBlogData();
    super.initState();
  }

  Future<void> loadBlogData() async {
    final response = await http.get(Uri.parse('assets/jsons/blog.json'));
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
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Blogs",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "WITH LOVE FOR DEVELOPING COOL STUFF, I LOVE TO WRITE AND TEACH OTHERS WHAT I HAVE LEARNT.",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 30),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 100,
                    crossAxisCount:
                        MediaQuery.of(context).size.width < 700 ? 1 : 2,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0),
                itemCount: jsonData.length,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  final item = jsonData[index];
                  return Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      isThreeLine: true,
                      title: Text(
                        item['title'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        item['subtitle'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      trailing: IconButton(
                          onPressed: () async {
                            await EasyLauncher.url(
                                url: item['url'], mode: Mode.platformDefault);
                          },
                          icon: const Icon(
                            Icons.arrow_right_alt_rounded,
                            color: Colors.white,
                          )),
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
