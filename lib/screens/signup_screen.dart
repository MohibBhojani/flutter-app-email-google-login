import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_dukantek/utils/routes.dart';

import '../providers/auth_provider.dart';
import '../services/navigation_service.dart';
import '../services/util_service.dart';
import '../utils/service_locator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoadingProgress = false;
  UtilService? utilService = locator<UtilService>();
  NavigationService? navigationService = locator<NavigationService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoadingProgress,
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Signup Page"),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                        hintText: 'Alon Musk'),
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                        hintText: 'Confirm Password'),
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
                      // navigationService
                      //     .navigateTo(MaindeshboardRoute);
                      try {
                        setState(() {
                          isLoadingProgress = true;
                        });

                        if (emailController.text == '' ||
                            passwordController.text == '' ||
                            nameController.text == '') {
                          utilService!.showToast("Please fill all fields");
                          setState(() {
                            isLoadingProgress = false;
                          });
                          return;
                        }
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          utilService!.showToast("password does not match!");
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
                              .createUserWithEmailAndPassword(nameController.text, emailController.text,
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
                      'Sign up',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () =>
                        navigationService!.navigateTo(loginScreenRoute),
                    child: const Text('already have account? login now')),
                const SizedBox(
                  height: 130,
                ),
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
