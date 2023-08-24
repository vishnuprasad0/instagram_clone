import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insta_like_button/insta_like_button.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/instagram_icons_icons.dart';
import 'package:instagram_clone/resources/firestore_methods.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone/models/user_model.dart' as model;
import '../providers/user_provider.dart';
import '../screens/comment_screen.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int commentLen = 0;

  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }

  fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
      commentLen = snap.docs.length;
    } catch (err) {
      showSnackBar(
        err.toString(),
        context,
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final model.User user = Provider.of<UserProvider>(context).getUser;
    //needed model for uid

    //username and options
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(widget.snap['profImage']),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text(widget.snap['username'])],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: ListView(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            children: [
                              'Delete',
                              'Report',
                              'Edit',
                              'Share to',
                              'Copy Link',
                              'Cancel',
                            ]
                                .map((e) => InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 16),
                                        child: Text(e),
                                      ),
                                    ))
                                .toList()),
                      ),
                    );
                  },
                  icon: const Icon(Icons.more_horiz_outlined),
                ),
              ],
            ),
            //post content,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            width: double.infinity,
            child: InstaLikeButton(
              image: NetworkImage(
                widget.snap['postUrl'],
              ),
              onChanged: () async {
                await FireStoreMethods().likePost(widget.snap['postId'],
                    widget.snap['uid'], widget.snap['likes']);
              },
              iconColor: Colors.red,
              curve: Curves.fastLinearToSlowEaseIn,
              imageBoxfit: BoxFit.cover,
            ),
          ),
          //like comment share buttons,
          Row(
            children: [
              LikeButton(
                likeBuilder: (bool isLiked) {
                  return IconTheme(
                    data: IconThemeData(size: isLiked ? 28.0 : 24),
                    child: Icon(
                      isLiked ? Icons.favorite : InstagramIcons.like,
                      color: isLiked ? Colors.red : Colors.grey,
                    ),
                  );
                },
                onTap: (isLiked) async {
                  await FireStoreMethods().likePost(widget.snap['postId'],
                      widget.snap['uid'], widget.snap['likes']);
                  return isLiked;
                },
                size: 29,
                isLiked: widget.snap['likes'].contains(user.uid),
              ),
              IconButton(
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => CommentScreen(
                            postId: widget.snap['postId'],
                          ),
                        ),
                      ),
                  icon: const Icon(
                    InstagramIcons.comment,
                  )),
              Expanded(
                  child: IconButton(
                      alignment: Alignment.bottomRight,
                      onPressed: () {},
                      icon: const Icon(
                        size: 26,
                        Icons.bookmark_border_outlined,
                      )))
            ],
          ),
          //captions and comment numbers,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w900),
                    child: Text(
                      '${widget.snap['likes'].length} likes',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: TextSpan(
                        style: const TextStyle(color: primaryColor),
                        children: [
                          TextSpan(
                              text: widget.snap['username'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: '  ${widget.snap['description']}')
                        ]),
                  ),
                ),

                //number of comments and captions
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CommentScreen(
                        postId: widget.snap['postId'].toString(),
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'View all $commentLen comments',
                      style:
                          const TextStyle(fontSize: 16, color: secondaryColor),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text(
                      'Add a comment',
                      style: TextStyle(fontSize: 14, color: secondaryColor),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
