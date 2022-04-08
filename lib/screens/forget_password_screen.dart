import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_dukantek/utils/routes.dart';

import '../providers/auth_provider.dart';
import '../services/navigation_service.dart';
import '../services/util_service.dart';
import '../utils/service_locator.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  UtilService? utilService = locator<UtilService>();
  final NavigationService? _navigationService = locator<NavigationService>();

  var navigationService = locator<NavigationService>();
  TextEditingController emailController = TextEditingController();
  var isLoadingProgress = false;
  @override
  void initState() {
    super.initState();
    // analyticService!.setCurrentScreen('ForgetPasswordScreen');
  }

  @override
  void dispose() {
    _navigationService!.closeScreen();
    super.dispose();
  }

  // ignore: unused_field
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
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'abc@test.com'),
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

                        if (emailController.text == '') {
                          utilService!.showToast("Please email field");
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
                              .forgotPassword(emailController.text.trim());

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
                      'Send',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextButton(
                      onPressed: () =>
                          navigationService.navigateTo(loginScreenRoute),
                      child: const Text("An email will be sent to your email address with further instruction",textAlign: TextAlign.center,)),
                ),
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
