import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/instagram_icons_icons.dart';
import 'package:instagram_clone/widgets/post_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              backgroundColor: mobileBackgroundColor,
              centerTitle: false,
              title: Padding(
                padding: const EdgeInsets.only(top: 28, left: 3),
                child: SvgPicture.asset(
                  'assets/ic_instagram.svg',
                  color: primaryColor,
                  height: 36,
                ),
              ),
              actions: [
                // IconButton(
                //     padding: const EdgeInsets.only(top: 28, right: 4, left: 10),
                //     onPressed: () {},
                //     icon: const Icon(InstagramIcons.settings)),
                IconButton(
                    padding:
                        const EdgeInsets.only(top: 28, right: 15, left: 10),
                    onPressed: () {},
                    icon: const Icon(InstagramIcons.like)),
                IconButton(
                    padding: const EdgeInsets.only(
                      top: 28,
                      right: 8,
                    ),
                    onPressed: () {},
                    icon: const Icon(InstagramIcons.chat)),
              ],
            ),
            body: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('posts').snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => PostCard(
                      snap: snapshot.data!.docs[index].data(),

                    ),
                  );
                })));
  }
}
