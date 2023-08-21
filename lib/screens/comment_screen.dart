import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/comment_card.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../resources/firestore_methods.dart';

class CommentScreen extends StatefulWidget {
  final postId;
  const CommentScreen({super.key, this.postId});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController commentEditingController =
      TextEditingController();

  void postComment(String uid, String name, String profilePic) async {
    try {
      String res = await FireStoreMethods().postComment(
        widget.postId,
        commentEditingController.text,
        uid,
        name,
        profilePic,
      );

      if (res != 'success') {
        if (context.mounted) ;
        // showSnackBar(context as String, res as BuildContext);
      }
      setState(() {
        commentEditingController.text = "";
      });
    } catch (err) {
      // showSnackBar(
      //   context as String,
      //   err.toString() as BuildContext,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .doc(widget.postId)
              .collection('comments')
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (ctx, index) => CommentCard(
                snap: snapshot.data!.docs[index],
              ),
            );
          },
        ),
        backgroundColor: mobileSearchColor,
        appBar: AppBar(
          backgroundColor: mobileSearchColor,
          title: const Text('comments'),
          bottom: const PreferredSize(
              child: Divider(
                color: Colors.white,
              ),
              preferredSize: Size(20, 21)),
          centerTitle: true,
        ),
        bottomNavigationBar: SafeArea(
            child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: primaryColor,
                radius: 18,
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Comment as   usernm',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => postComment(
                  user.uid,
                  user.username,
                  user.photoUrl,
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: const Text(
                    'Post',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
