import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:test_app_dukantek/utils/routes.dart';
import '../providers/auth_provider.dart';
import '../services/navigation_service.dart';
import '../services/util_service.dart';
import '../utils/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  var navigationService = locator<NavigationService>();
  UtilService? utilService = locator<UtilService>();

  var isLoadingProgress = false;
  // ignore: unused_field
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(360, 690),
        orientation: Orientation.portrait);
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  navigationService.navigateTo(loginScreenRoute);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: SizedBox(
                                height: sy(100),
                                width: sy(100),
                                child: Image.asset(
                                  'assets/images/Logo.png',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                            SizedBox(
                              width: sx(500),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 20,
                                  ),
                                  hintText: 'Email Address',
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
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(242, 243, 247, 1),
                                      width: 2,
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
                            SizedBox(height: 20.h),
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

                                      if (emailController.text == '') {
                                        utilService!
                                            .showToast("Please email field");
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
                                            .forgotPassword(
                                                emailController.text.trim());

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
                                        colors: [
                                          Color.fromRGBO(255, 102, 0, 1),
                                          Color.fromRGBO(255, 76, 1, 1),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
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
                                      "Recover Password",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: sy(
                                          11,
                                        ),
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromRGBO(
                                            234, 227, 241, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                                "An email will be sent to your email address\nwith further instruction",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16.sp)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // child2
                ],
              ),
            ));
      },
    );
  }
}
