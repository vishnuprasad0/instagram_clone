import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/instagram_icons_icons.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

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
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: primaryColor,
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text('username')],
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
                'https://s3.amazonaws.com/media.mediapost.com/dam/cropped/2023/01/10/image-42_oihgDSL.png',
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
                      '1.3m',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        style: TextStyle(color: primaryColor),
                        children: [
                          TextSpan(
                              text: 'username',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '  description or captions came hereee ')
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
