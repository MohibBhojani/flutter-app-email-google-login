import 'dart:core';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';

import '../providers/auth_provider.dart';
// import 'package:swingles_flutter/utils/service_locator.dart';

class AndroidButtonsWidget extends StatefulWidget {
  @override
  _AndroidButtonsWidgetState createState() => _AndroidButtonsWidgetState();
}

class _AndroidButtonsWidgetState extends State<AndroidButtonsWidget> {
  // var navigationService = locator<NavigationService>();
  var isLoadingProgress = false;
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: sx(210),
                height: sy(35),
                // ignore: deprecated_member_use
                child: RaisedButton.icon(
                    color: const Color.fromRGBO(242,243,245,1),
                    elevation: 0,
                    onPressed: () async {
                      // try {
                      //   setState(() {
                      //     isLoadingProgress = true;
                      //   });
                      //   await Provider.of<AuthProvider>(context, listen: false)
                      //       .setRememberMe(true);
                      //   await Provider.of<AuthProvider>(context, listen: false)
                      //       .facebookAuthProvider();
                      //   setState(() {
                      //     isLoadingProgress = false;
                      //   });
                      // } catch (error) {
                      //   await _showLocationPopUp();
                      // }
                      //  Navigator.of(context).pushNamed(PhoneNumberScreenRoute);
                    },
                    icon: Icon(
                      FontAwesomeIcons.facebookSquare,
                      size: sy(15),
                      color: Colors.blue,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        sy(30),
                      ),
                    ),
                    label: Text(
                      "Facebook",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: sy(9),
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
              const Spacer(),
              SizedBox(
                width: sx(210),
                height: sy(35),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  elevation: 0,
                  color: const Color.fromRGBO(242,243,245,1),
                  padding: EdgeInsets.only(
                    top: sy(10),
                    bottom: sy(10),
                    left: sx(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/googleicon.png',
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: sy(5),
                        ),
                        child: Text(
                          "  Google",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: sy(9),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      sy(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // _showLocationPopUp() async {
  //   setState(() {
  //     isLoadingProgress = false;
  //   });
  //   Location location = new Location();
  //   var _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted != PermissionStatus.granted) {
  //     return LocationRestrictedScreen();
  //     // showDialog(
  //     //     context: context,
  //     //     builder: (_) {
  //     //       return LocationRestricted();
  //     //     });
  //   }
  // }
}
