// import 'package:column_scroll_view/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:relative_scale/relative_scale.dart';

import 'package:test_app_dukantek/utils/routes.dart';

import '../providers/auth_provider.dart';
import '../services/navigation_service.dart';
import '../services/util_service.dart';
import '../utils/service_locator.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _showPassword = false;
  final bool _confirmShowPassword = false;
  var navigationService = locator<NavigationService>();
  bool isLoadingProgress = false;
  UtilService? utilService = locator<UtilService>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Stack(children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            toolbarHeight: sy(35),
            backgroundColor: Colors.black,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                navigationService.navigateTo(loginScreenRoute);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: sy(100),
                        width: sy(100),
                        child: Image.asset(
                          'assets/images/Logo.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sy(20),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: sy(16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sy(20),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: nameController,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                    horizontal: 20,
                                  ),
                                  hintText: 'User Name',
                                  hintStyle: TextStyle(
                                    color:
                                        const Color.fromRGBO(161, 172, 204, 1),
                                    fontSize: sy(10),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(242, 243, 247, 1),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: const Color.fromRGBO(
                                          242, 243, 247, 1),
                                      width: sx(2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color:
                                          const Color.fromRGBO(255, 101, 0, 1),
                                      width: sx(2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: sy(10),
                            ),
                            Container(
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      width: sx(2),
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        width: sx(2),
                                        color: const Color.fromRGBO(
                                            255, 101, 0, 1)),
                                  ),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 20),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    color:
                                        const Color.fromRGBO(161, 172, 204, 1),
                                    fontSize: sy(10),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(242, 243, 247, 1),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: const Color.fromRGBO(
                                          242, 243, 247, 1),
                                      width: sx(2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color:
                                          const Color.fromRGBO(255, 101, 0, 1),
                                      width: sx(2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: sy(10),
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: passwordController,
                                obscureText: !_showPassword,
                                // validator: validatePassword,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      width: sx(2),
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      width: sx(2),
                                      color:
                                          const Color.fromRGBO(255, 101, 0, 1),
                                    ),
                                  ),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 20),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color:
                                        const Color.fromRGBO(161, 172, 204, 1),
                                    fontSize: sy(10),
                                  ),
                                  suffixIcon: !_showPassword
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.visibility_off,
                                            size: sy(15),
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _showPassword = true;
                                            });
                                          },
                                        )
                                      : IconButton(
                                          icon: Icon(
                                            Icons.visibility,
                                            size: sy(15),
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _showPassword = false;
                                            });
                                          },
                                        ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(242, 243, 247, 1),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: const Color.fromRGBO(
                                            242, 243, 247, 1),
                                        width: sx(2)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color:
                                          const Color.fromRGBO(255, 101, 0, 1),
                                      width: sx(2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: sy(10),
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.text,

                                // validator: validateConfirmPassword,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: confirmPasswordController,
                                obscureText: !_confirmShowPassword,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      width: sx(2),
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      width: sx(2),
                                      color:
                                          const Color.fromRGBO(255, 101, 0, 1),
                                    ),
                                  ),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                    horizontal: 20,
                                  ),
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                    color:
                                        const Color.fromRGBO(161, 172, 204, 1),
                                    fontSize: sy(10),
                                  ),
                                  suffixIcon: !_showPassword
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.visibility_off,
                                            size: sy(15),
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _showPassword = true;
                                            });
                                          },
                                        )
                                      : IconButton(
                                          icon: Icon(
                                            Icons.visibility,
                                            size: sy(15),
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _showPassword = false;
                                            });
                                          },
                                        ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(242, 243, 247, 1),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: const Color.fromRGBO(
                                            242, 243, 247, 1),
                                        width: sx(2)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color:
                                          const Color.fromRGBO(255, 101, 0, 1),
                                      width: sx(2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: sy(15),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  highlightElevation: 3.0,
                                  elevation: 3.0,
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
                                        utilService!.showToast(
                                            "Please fill all fields");
                                        setState(() {
                                          isLoadingProgress = false;
                                        });
                                        return;
                                      }
                                      if (passwordController.text !=
                                          confirmPasswordController.text) {
                                        utilService!.showToast(
                                            "password does not match!");
                                        setState(() {
                                          isLoadingProgress = false;
                                        });
                                        return;
                                      } else if (!emailController.text
                                              .contains("@")
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
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .createUserWithEmailAndPassword(
                                                nameController.text,
                                                emailController.text,
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
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      sx(80.0),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color.fromRGBO(255, 102, 0, 1),
                                            Color.fromRGBO(255, 76, 1, 1),
                                          ]),
                                      borderRadius: BorderRadius.circular(
                                        15.0,
                                      ),
                                    ),
                                    constraints: BoxConstraints(
                                      maxWidth: sy(
                                        290,
                                      ),
                                      minHeight: sy(
                                        35,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sign Up",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: sy(
                                          12,
                                        ),
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(
                                            234, 227, 241, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: sy(5),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: sy(10),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigationService.navigateTo(loginScreenRoute);
                        },
                        child: Text(
                          ' SignIn',
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 101, 0, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: sy(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
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
      ]);
    });
  }
}
