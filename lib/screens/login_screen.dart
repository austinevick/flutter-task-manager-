import 'package:flutter/material.dart';
import 'package:flutter_todo_app_ui/widgets/custom_button.dart';
import 'package:flutter_todo_app_ui/widgets/custom_textfield.dart';
import 'package:flutter_todo_app_ui/widgets/responsive.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        largeScreen: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.green,
              ),
            ),
            Expanded(
                child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.pink,
              ),
            ))
          ],
        ),
        smallScreen: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black54,
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                  image: AssetImage('image/bg.jpeg'))),
          child: Stack(
            // alignment: Alignment.center,
            children: [
              Positioned(
                top: 50,
                left: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                        onPressed: () => setState(() => isLogin = true),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: isLogin ? Colors.yellow : Colors.grey,
                            fontSize: 22,
                          ),
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    FlatButton(
                        onPressed: () => setState(() => isLogin = false),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              color: isLogin ? Colors.grey : Colors.yellow,
                              fontSize: 22),
                        )),
                  ],
                ),
              ),
              Positioned(
                top: 100,
                left: 80,
                child: Container(
                  height: 4,
                  width: 100,
                  color: isLogin ? Colors.yellow : Colors.grey,
                ),
              ),
              Positioned(
                top: 100,
                left: 200,
                child: Container(
                  height: 4,
                  width: 100,
                  color: isLogin ? Colors.grey : Colors.yellow,
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(10)),
                  child: Form(
                    child: Column(
                      children: [
                        isLogin
                            ? CustomTextfield(
                                hintText: 'Username',
                              )
                            : SizedBox(),
                        CustomTextfield(
                          hintText: 'Email',
                        ),
                        CustomTextfield(
                          hintText: 'Password',
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        CustomButton(
                          text: isLogin ? 'LOGIN' : 'SIGN UP',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(10, size.height);
    var s = Offset(10, size.width);
    path.quadraticBezierTo(s.direction, size.height, 12, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
