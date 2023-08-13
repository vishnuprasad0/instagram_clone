import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/widgets/textfield_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _biocontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _biocontroller.dispose();
    _usernamecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/id/1420495828/photo/african-american-man-in-vr-headset-exploring-metaverse-world-touching-virtual-reality-subjects.jpg?s=1024x1024&w=is&k=20&c=PhZgYN2qN9j8F1XPGPFpiBhSqVQ99lsL-KVkCb1zky0='),
                  radius: 60,
                ),
                Positioned(
                    bottom: -14,
                    right: -14,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: blueColor,
                        )))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextfield(
              textEditingController: _usernamecontroller,
              hinttext: 'enter your username',
              textInputType: TextInputType.text,
            ),
            const SizedBox(
              height: 30,
            ),
            MyTextfield(
              textEditingController: _emailcontroller,
              hinttext: 'enter your email',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 30,
            ),
            MyTextfield(
              textEditingController: _passwordcontroller,
              hinttext: 'enter your password',
              ispassword: true,
              textInputType: TextInputType.text,
            ),
            const SizedBox(
              height: 30,
            ),
            MyTextfield(
              textEditingController: _biocontroller,
              hinttext: 'enter your bio',
              textInputType: TextInputType.text,
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                  child: const Text('Sign Up')),
            ),
            // const Column(
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Expanded(
            //           child: Divider(
            //             thickness: 1,
            //             color: Colors.white,
            //           ),
            //         ),
            //         Padding(
            //           padding:
            //               EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //           child: Text(
            //             'OR',
            //             style: TextStyle(fontSize: 14, color: Colors.white),
            //           ),
            //         ),
            //         Expanded(
            //           child: Divider(
            //             thickness: 1,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ],
            //     ),
            //     SizedBox(height: 8),
            //     Text(
            //       'Login with Facebook',
            //       style: TextStyle(
            //           fontSize: 14,
            //           color: blueColor,
            //           fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            Flexible(
              flex: 3,
              child: Container(),
            ),
          ]),
        ),
      ),
    );
  }
}
