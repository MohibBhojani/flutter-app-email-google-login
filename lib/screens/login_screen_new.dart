import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:relative_scale/relative_scale.dart';
import 'package:test_app_dukantek/utils/routes.dart';

import '../providers/auth_provider.dart';
import '../services/navigation_service.dart';
import '../services/storage_service.dart';
import '../services/util_service.dart';
import '../utils/service_locator.dart';
import '../widgets/android_button_widget.dart';
import '../widgets/ios_button_widget.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool checkbox1 = false;
  bool _showPassword = false;
  var navigationService = locator<NavigationService>();
  var storageService = locator<StorageService>();
  UtilService? utilService = locator<UtilService>();

  bool isLoadingProgress = false;

  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Stack(children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              toolbarHeight: sy(35),
              backgroundColor: Colors.black,
              elevation: 0,
              //   leading: IconButton(
              //     icon: const Icon(
              //       Icons.arrow_back,
              //       color: Colors.white,
              //     ),
              //     onPressed: () {
              //       // navigationService.navigateTo(CreateAccountScreenRoute);
              //     },
              //   ),
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
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
                      Container(
                        margin: EdgeInsets.all(sy(20)),
                        child: Column(children: [
                          Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: sy(16),
                            ),
                          ),
                          SizedBox(
                            height: sy(30),
                          ),
                          Form(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  width: sx(500),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 15.0,
                                        horizontal: 20,
                                      ),
                                      hintText: 'Email Address',
                                      hintStyle: TextStyle(
                                        color: const Color.fromRGBO(
                                            161, 172, 204, 1),
                                        fontSize: sy(10),
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromRGBO(
                                          242, 243, 247, 1),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(242, 243, 247, 1),
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: const Color.fromRGBO(
                                              255, 101, 0, 1),
                                          width: sx(2),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: sy(10),
                                ),
                                SizedBox(
                                  width: sx(500),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: passController,
                                    obscureText: !_showPassword,
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 15.0,
                                        horizontal: 20,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: const Color.fromRGBO(
                                            161, 172, 204, 1),
                                        fontSize: sy(10),
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromRGBO(
                                          242, 243, 247, 1),
                                      suffixIcon: !_showPassword
                                          ? IconButton(
                                              icon: Icon(
                                                Icons.visibility_off,
                                                size: sy(15),
                                                color: Colors.grey.shade400,
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
                                                color: Colors.grey.shade400,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _showPassword = false;
                                                });
                                              },
                                            ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(242, 243, 247, 1),
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: const Color.fromRGBO(
                                              255, 101, 0, 1),
                                          width: sx(
                                            2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Theme(
                                    data: ThemeData(),
                                    child: Checkbox(
                                      side: const BorderSide(
                                          width: 1, color: Colors.grey),
                                      value: checkbox1,
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      onChanged: (value) {
                                        //value may be true or false
                                        setState(() {
                                          checkbox1 = !checkbox1;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Remember',
                                    style: TextStyle(
                                      color: const Color.fromRGBO(
                                          187, 193, 201, 1),
                                      fontSize: sy(9),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () {
                                  utilService!.showToast('work in progress');
                                  // navigationService
                                  //     .navigateTo(forgetPasswordScreenRoute);
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(255, 101, 0, 1),
                                    fontSize: sy(
                                      9,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: sy(5),
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
                                        passController.text == '') {
                                      utilService!
                                          .showToast("Please fill all fields");
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
                                          .signInWithEmailAndPassword(
                                              emailController.text,
                                              passController.text);

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
                                    "Login",
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
                          SizedBox(
                            height: sy(7),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: sy(25),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: Colors.white,
                                      width: sy(1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 5.0),
                                child: Text(
                                  'or Login with',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: sy(10),
                                  ),
                                ),
                              ),
                              Container(
                                width: sy(20),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: Colors.white,
                                      width: sy(1),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: sy(10),
                          ),
                          Platform.isIOS
                              ? IosButtonsWidget()
                              : AndroidButtonsWidget(),
                        ]),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: sy(10),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            navigationService.navigateTo(signUpScreenRoute);
                          },
                          child: Text(
                            ' Signup',
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 101, 0, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: sy(10),
                            ),
                          ),
                        ),
                      ],
                    ),
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
        ]);
      },
    );
  }
}
