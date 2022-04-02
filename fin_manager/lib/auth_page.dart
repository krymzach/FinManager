import 'package:fin_manager/api.dart';
import 'package:fin_manager/panel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key, this.error}) : super(key: key);

  final String? error;

  @override
  State<AuthPage> createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {

  void isSignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('signed_in') == true) {
      signInUserId(context, prefs.getString('id')!);
    }
  }

  bool signUp = false;
  bool hidePassword = true;
  bool hideConfPassword = true;

  String fullName = '';
  String email = '';
  String pass = '';
  String confPass = '';

  @override
  Widget build(BuildContext context) {
    isSignedIn();
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(0, 5, 46, 1),
          body: Center(
            child: Panel(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // Full Name
                          if(signUp)
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.025, right: MediaQuery.of(context).size.width * 0.025),
                              child: TextFormField(
                                onChanged: (value) {
                                  fullName = value;
                                },
                                autocorrect: false,
                                style: const TextStyle(
                                  color: Colors.white70,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(
                                    color: Colors.white30,
                                  ),
                                  icon: Icon(
                                    Icons.person_rounded,
                                    color: Colors.white70,
                                  ),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(122, 95, 0, 1), width: 3)),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(36, 146, 153, 1), width: 3))
                                ),
                              ),
                            ),
                          // Email
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.025, right: MediaQuery.of(context).size.width * 0.025),
                            child: TextFormField(
                              onChanged: (value) {
                                email = value;
                              },
                              autocorrect: false,
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Colors.white30,
                                ),
                                icon: Icon(
                                  Icons.mail_rounded,
                                  color: Colors.white70,
                                ),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(122, 95, 0, 1), width: 3)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(36, 146, 153, 1), width: 3))
                              ),
                            ),
                          ),
                          // Password
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.025, right: MediaQuery.of(context).size.width * 0.025),
                            child: TextFormField(
                              onChanged: (value) {
                                pass = value;
                              },
                              autocorrect: false,
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                              obscureText: hidePassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  color: Colors.white30,
                                ),
                                icon: const Icon(
                                  Icons.lock_rounded,
                                  color: Colors.white70
                                ),
                                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(122, 95, 0, 1), width: 3)),
                                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(36, 146, 153, 1), width: 3)),
                                suffix: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  icon: Icon(
                                    hidePassword ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                                    color: Colors.white
                                  ),
                                )
                              ),
                            )
                          ),
                          // Confirm Password
                          if(signUp)
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.025, right: MediaQuery.of(context).size.width * 0.025),
                              child: TextFormField(
                                onChanged: (value) {
                                  confPass = value;
                                },
                                autocorrect: false,
                                style: const TextStyle(
                                  color: Colors.white70,
                                ),
                                obscureText: hideConfPassword,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: const TextStyle(
                                    color: Colors.white30,
                                  ),
                                  icon: const Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.white70,
                                  ),
                                  enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(122, 95, 0, 1), width: 3)),
                                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(36, 146, 153, 1), width: 3)),
                                  suffix: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        hideConfPassword = !hideConfPassword;
                                      });
                                    },
                                    icon: Icon(
                                      hideConfPassword ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                                      color: Colors.white
                                    ),
                                  )
                                ),
                              ),
                            ),
                          // Auth Button
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: ElevatedButton(
                              onPressed: () {
                                if(signUp) {
                                  signUpUser(fullName, email, pass, confPass, context);
                                } else {
                                  signInUser(context, email, pass);
                                }
                              },
                              style: ButtonStyle(
                                alignment: Alignment.center,
                                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(12, 25, 122, 1)),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ))
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.009375),
                                child: Text(
                                  signUp ? "Sign Up" : "Sign In",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              )
                            )
                          ),
                        ],
                      ),
                    ),
                    if (widget.error != null)
                      Text(
                        widget.error!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.012, left: MediaQuery.of(context).size.width * 0.015),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: <Widget>[
                            Text(
                              signUp ? "Already Have an Account? " : "Don't Have an Account? ",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  signUp = !signUp;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                shadowColor: MaterialStateProperty.all(Colors.transparent),
                                padding: MaterialStateProperty.all(const EdgeInsets.all(0))
                              ),
                              child: Text(
                                signUp ? "Sign In" : "Sign Up",
                                style: const TextStyle(
                                  color: Color.fromRGBO(36, 146, 153, 1),
                                  fontSize: 18,
                                ),
                              )
                            )
                          ]
                        )
                      )
                    )
                  ]
                )
              )
            )
          )
        )
      );
  }
}