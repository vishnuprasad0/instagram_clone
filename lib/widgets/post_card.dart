import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/instagram_icons_icons.dart';

class PostCard extends StatelessWidget {
  final snap;
  const PostCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  backgroundImage: NetworkImage(snap['profImage']),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text(snap['username'])],
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
              child: Image.network(
                snap['postUrl'],
                fit: BoxFit.cover,
              )),
          //like comment share buttons,
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    InstagramIcons.like,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    InstagramIcons.comment,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    InstagramIcons.arrow_messenger,
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
                      '${snap['likes'].length} likes',
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
                              text: snap['username'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: '  ${snap['description']}')
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text(
                      'View all 10 comments',
                      style: TextStyle(fontSize: 16, color: secondaryColor),
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
