import 'package:flutter/material.dart';
import 'package:flutter_todo_app_ui/screens/home_screen.dart';
import 'package:flutter_todo_app_ui/widgets/custom_button.dart';
import 'package:flutter_todo_app_ui/widgets/custom_textfield.dart';
import 'package:flutter_todo_app_ui/widgets/responsive.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        largeScreen: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black45,
                        BlendMode.darken,
                      ),
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'image/bridge.jpg',
                      ))),
            ),
            RotatedBox(
                quarterTurns: 1,
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.pink,
                    child: Form(
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [TextFormField()],
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
        smallScreen: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black87,
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                  image: AssetImage('image/bridge.jpg'))),
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
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(10)),
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        isLogin
                            ? SizedBox()
                            : CustomTextfield(
                                hintText: 'Username',
                              ),
                        CustomTextfield(
                          hintText: 'Email',
                        ),
                        CustomTextfield(
                          hintText: 'Password',
                        ),
                        isLogin
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              )
                            : Container(),
                        CustomButton(
                          text: isLogin ? 'LOGIN' : 'SIGN UP',
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        isLogin
                            ? Container()
                            : Center(
                                child: FlatButton(
                                    onPressed: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (
                                          ctx,
                                        ) =>
                                                    HomeScreen())),
                                    child: Text(
                                      'Maybe Later',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    )),
                              )
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
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 8, size.height - 80, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height + 20, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
