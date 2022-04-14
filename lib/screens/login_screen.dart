import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_dukantek/services/navigation_service.dart';
import 'package:test_app_dukantek/utils/routes.dart';

import '../providers/auth_provider.dart';
import '../services/util_service.dart';
import '../utils/service_locator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UtilService? utilService = locator<UtilService>();
  NavigationService? navigationService = locator<NavigationService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoadingProgress = false;

  String validateemail(String? value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value!)) {
      return 'Enter valid email';
    } else {
      return '';
    }
  }

  String validatePassword(String? value) {
    if (value!.length < 8) {
      return 'Password must be of 8 characters';
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoadingProgress,
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Login Page"),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Center(
                    child: SizedBox(
                        width: 200,
                        height: 150,
                        /*decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset('assets/images/logo_app.png')),
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // utilService!.showToast('work in progress');
                    navigationService!.navigateTo(forgetPasswordScreenRoute);
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () async {
                      // navigationService
                      //     .navigateTo(MaindeshboardRoute);
                      try {
                        setState(() {
                          isLoadingProgress = true;
                        });

                        if (emailController.text == '' ||
                            passwordController.text == '') {
                          utilService!.showToast("Please fill all fields");
                          setState(() {
                            isLoadingProgress = false;
                          });
                          return;
                        } else if (!emailController.text.contains("@")
                            //     ||
                            // !emailController.text
                            //     .contains(".com")
                            ) {
                          utilService!.showToast("Invalid email");

                          setState(() {
                            isLoadingProgress = false;
                          });
                          return;
                        } else {
                          FocusScope.of(context).requestFocus(FocusNode());
                          await Provider.of<AuthProvider>(context,
                                  listen: false)
                              .signInWithEmailAndPassword(emailController.text,
                                  passwordController.text);

                          setState(() {
                            isLoadingProgress = false;
                          });
                        }
                        return;
                      } catch (er) {
                        setState(() {
                          isLoadingProgress = false;
                        });
                        print(er.toString());
                        // utilService!.showToast(er.toString());
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        setState(() {
                          isLoadingProgress = true;
                        });

                        FocusScope.of(context).requestFocus(FocusNode());
                        await Provider.of<AuthProvider>(context, listen: false)
                            .signInWithGoogle();

                        setState(() {
                          isLoadingProgress = false;
                        });

                        return;
                      } catch (er) {
                        setState(() {
                          isLoadingProgress = false;
                        });
                        print(er.toString());
                        // utilService!.showToast(er.toString());
                      }
                    },
                    child: const Text(
                      'Login with Google',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                 TextButton(
                   onPressed: ()=> navigationService!.navigateTo(signUpScreenRoute),
                   child:const Text('New User? Create Account'))
              ],
            ),
          ),
        ),
        if (isLoadingProgress)
          Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).backgroundColor,
                  )))
      ]),
    );
  }
}
