import 'package:flutter/material.dart';
import 'package:vaibhav_wable/screens/blog_screen.dart';
import 'package:vaibhav_wable/screens/home.dart';
import 'package:vaibhav_wable/screens/open_source_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaibhav_wable/screens/skill_screen.dart';

class Website extends StatefulWidget {
  const Website({Key? key}) : super(key: key);

  @override
  WebsiteState createState() => WebsiteState();
}

class WebsiteState extends State<Website> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const SkillScreen(),
    Container(color: Colors.orange),
    Container(color: Colors.blue),
    const OpenSourceScreen(),
    const BlogScreen(),
  ];

  int _selectedIndex = 0;

  Widget _buildNavItem(int index, String title) {
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: _selectedIndex == index
              ? Colors.white
              : Colors.white.withOpacity(0.5),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _getNavItemTitle(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Skills";
      case 2:
        return "Work Experiences";
      case 3:
        return "Projects";
      case 4:
        return "Open Source";
      case 5:
        return "Blogs";
      case 6:
        return "Contact Me";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MediaQuery.of(context).size.width < 600
          ? AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.blue,
              title: Text(
                'Vaibhav Wable',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            )
          : AppBar(
              backgroundColor: Colors.black,
              title: Text(
                'Vaibhav Wable',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
              actions: [
                for (int i = 0; i < _pages.length; i++)
                  _buildNavItem(i, _getNavItemTitle(i)),
                const SizedBox(width: 5),
              ],
            ),
      drawer: MediaQuery.of(context).size.width < 600
          ? Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Center(
                        child: Text(
                      'Freelancer Website',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                  for (int i = 0; i < _pages.length; i++)
                    ListTile(
                      selectedTileColor: _selectedIndex == i
                          ? Colors.blue
                          : Colors.transparent,
                      selectedColor: _selectedIndex == i
                          ? Colors.white
                          : Colors.transparent,
                      title: Text(
                        _getNavItemTitle(i),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      selected: _selectedIndex == i,
                      onTap: () {
                        setState(() {
                          _selectedIndex = i;
                          Navigator.pop(context);
                        });
                      },
                    ),
                ],
              ),
            )
          : null,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return _pages[_selectedIndex];
          } else {
            return _pages[_selectedIndex];
          }
        },
      ),
    );
  }
}
