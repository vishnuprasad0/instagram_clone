import 'package:flutter/material.dart';
import 'package:instagram_bottom_nav_bar/instagram_tab_view.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/instagram_icons_icons.dart';
import 'package:instagram_clone/screens/add_post_screen.dart';
import 'package:instagram_clone/screens/feed_screens.dart';
// import 'package:instagram_clone/models/user_model.dart' as model;
// import 'package:instagram_clone/providers/user_provider.dart';
// import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  late PageController pageController;

  @override
  Widget build(BuildContext context) {
    // model.User user = Provider.of<UserProvider>(context).getUser;
    // return Scaffold(body: Center(child: Text(user.bio)));
    return Scaffold(
        bottomNavigationBar: InstagramTabView(
            iconSize: 20,
            backgroundColor: Colors.black,
            selectedItemColor: primaryColor,
            unselectedItemColor: primaryColor,
            dividerColor: primaryColor,
            selectedIconTheme: const IconThemeData(
                color: primaryColor, fill: 1.0, size: 22, grade: 0.2),
            isDivider: true,
            unselectedIconTheme: const IconThemeData(color: secondaryColor),
            items: [
              InstagramTabItem(
                label: '',
                page: const FeedScreen(),
                icon: InstagramIcons.instagram_home,
              ),
              InstagramTabItem(
                  label: '',
                  page: const Text(''),
                  icon: InstagramIcons.instagram_search),
              InstagramTabItem(
                  label: '',
                  page: const AddPostScreen(),
                  icon: InstagramIcons.addpost),
              InstagramTabItem(
                  label: '',
                  page: const Text(''),
                  icon: InstagramIcons.instagram_reels),
              InstagramTabItem(
                  label: '',
                  page: const Text(''),
                  icon: InstagramIcons.instagram_user)
            ],
            iconType: IconType.icon));
  }
}
