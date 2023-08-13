import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                height: 64,
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
                height: 5,
              ),
              const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  'forgot password?',
                  style: TextStyle(
                      fontSize: 15,
                      color: blueColor,
                      fontWeight: FontWeight.bold),
                )
              ]),
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
                    child: const Text('Log in')),
              ),
              const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'OR',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Login with Facebook',
                    style: TextStyle(
                        fontSize: 14,
                        color: blueColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Flexible(
                flex: 3,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text('Dont have an account ?'),
                  ),
                  GestureDetector(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: blueColor, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
