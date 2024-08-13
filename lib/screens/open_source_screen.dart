import 'dart:convert';

import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class OpenSourceScreen extends StatefulWidget {
  const OpenSourceScreen({super.key});

  @override
  State<OpenSourceScreen> createState() => _OpenSourceScreenState();
}

class _OpenSourceScreenState extends State<OpenSourceScreen> {
  List<dynamic> repository = [];

  @override
  void initState() {
    loadBlogData();
    super.initState();
  }

  Future<void> loadBlogData() async {
    const String token = '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';
    final response = await http.get(
      Uri.parse('https://api.github.com/user/repos'),
      headers: {
        'Authorization': 'token $token',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        repository = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to fetch repositories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Open Source Projects",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 30),
              repository.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 100,
                          crossAxisCount:
                              MediaQuery.of(context).size.width < 700 ? 1 : 2,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 15.0),
                      itemCount: repository.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        final item = repository[index];
                        return Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            isThreeLine: true,
                            title: Text(
                              item['name'] ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['description'] ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.commit_rounded,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      item['language'] ?? "",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(Icons.account_tree_rounded,
                                        color: Colors.blue),
                                    const SizedBox(width: 5),
                                    Text(
                                      "${item['forks'] ?? 0}",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () async {
                                  await EasyLauncher.url(
                                      url: item['html_url'],
                                      mode: Mode.platformDefault);
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
      ),
    );
  }
}
