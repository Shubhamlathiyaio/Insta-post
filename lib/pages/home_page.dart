import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:insta_post/commons/CommonCircularIcon.dart';
import 'package:insta_post/commons/common_spacing.dart';
import 'package:insta_post/commons/common_text.dart';
import 'package:insta_post/constants/image_paths.dart';
import 'package:insta_post/constants/text_styles.dart';
import 'package:insta_post/model/post.dart';
import 'package:insta_post/pages/edit_caption.dart';
import 'package:insta_post/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = 0;
  var _selectedTab = _SelectedTab.rocket;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Positioned(right: 0, bottom: 0, child: cameraIcon()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(fullLogo),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, width * .1), child: tabBar()),
      ),
      body: PageView(
        scrollDirection: Axis.vertical, // Scroll up and down
        children: [
          for (int i = 0; i < 3; i++)
            bodyWidge(i, context) // Full-body size widget 3
        ],
      ),
      bottomNavigationBar: CrystalNavigationBar(
        margin: EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        indicatorColor: Colors.white,
        enableFloatingNavBar: false,
        items: [
          /// Home
          CrystalNavigationBarItem(
            icon: FontAwesomeIcons.rocket,
            unselectedIcon: FontAwesomeIcons.rocket,
            unselectedColor: Colors.white,
            selectedColor: Colors.white,
          ),

          /// Favourite
          CrystalNavigationBarItem(
            icon: FontAwesomeIcons.magnifyingGlass,
            unselectedIcon: FontAwesomeIcons.magnifyingGlass,
            unselectedColor: Colors.white,
            selectedColor: Colors.white,
          ),

          /// Add
          CrystalNavigationBarItem(
            icon: FontAwesomeIcons.house,
            unselectedIcon: FontAwesomeIcons.house,
            unselectedColor: Colors.white,
            selectedColor: Colors.white,
          ),

          /// Search
          CrystalNavigationBarItem(
              icon: FontAwesomeIcons.comment,
              unselectedIcon: FontAwesomeIcons.comment,
              unselectedColor: Colors.white,
              selectedColor: Colors.white),

          /// Profile
          CrystalNavigationBarItem(
            icon: FontAwesomeIcons.user,
            unselectedIcon: FontAwesomeIcons.user,
            unselectedColor: Colors.white,
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

enum _SelectedTab { rocket, search, home, comment, user }

Widget bodyWidge(int i, BuildContext context) {
  Post post = posts[i];
  return Stack(
    children: [
      Center(
        child: Image.asset(
          [img1, img2, img3][i],
          fit: BoxFit.fitHeight,
        ),
      ),
      Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: postTile(i + 1),
          ),
          loder(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                title(data: post.title),
                h4,
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditCaption(
                              index: i,
                              data: post.caption,
                            ),
                          ));
                    },
                    child: caption(data: post.caption)),
              ],
            ),
          ),
          quickShareRow(),
          h48
        ],
      )),
    ],
  );
}
