// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:swingles_flutter/bloc/signup_signin_bloc.dart';

// import '../../providers/auth_provider.dart';
// import '../../services/navigation_service.dart';
// import '../../utils/routes.dart';
// import '../../utils/service_locator.dart';

// class EmailVerificationScreen extends StatefulWidget {
//   @override
//   _EmailVerificationScreenState createState() =>
//       _EmailVerificationScreenState();
// }

// class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
//   var email;
//   var navigationService = locator<NavigationService>();

//   @override
//   void initState() {
//     // var userData = Provider.of<AuthProvider>(
//     //   context, listen: false).user;
//     // setState(() {
//     //   email = userData!.email;
//     // });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: () async => false,
//         child: Scaffold(
//           // backgroundColor: Colors.greenAccent,
//           body: Stack(
//               // fit: StackFit.expand,
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/images/Splash-BG.jpg'),
//                         fit: BoxFit.cover),
//                   ),
//                 ),
//                 Center(
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         CircleAvatar(
//                           radius: 45,
//                           backgroundColor: Colors.white,
//                           child: Icon(
//                             Icons.check,
//                             size: 60,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(bottom: 25),
//                         ),
//                         BlocBuilder<SignupSigninBloc, SignupSigninState>(
//                           builder: (context, state) {
//                             if(state is EmailNotVerified)
//                             {
//                                return Container(
//                               alignment: Alignment.center,
//                               width: 300,
//                               child: Text(
//                                 'A Verification Link has been sent to ${state.email}. Kindly verify your email and login to continue.',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontFamily: 'Greyfel',
//                                   fontSize: 14,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             );
//                             }
//                             else {
//                               return Container(
//                               alignment: Alignment.center,
//                               width: 300,
//                               child: Text(
//                                 'A Verification Link has been sent. Kindly verify your email and login to continue.',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontFamily: 'Greyfel',
//                                   fontSize: 14,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             );
//                             }
                           
//                           },
//                         ),
//                         SizedBox(height: 30),
//                         GestureDetector(
//                           onTap: () async {
//                             // await Provider.of<AuthProvider>(context,
//                             //         listen: false)
//                             //     .resendVerificationEmail();
//                             BlocProvider.of<SignupSigninBloc>(context).add(ResendEmailEvent());
//                           },
//                           child: Text(
//                             'RESEND LINK',
//                             style: TextStyle(
//                               fontFamily: 'Greyfel',
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                               decoration: TextDecoration.underline,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ]),
//                 ),

//                 Positioned(
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 40),
//                     child: Align(
//                       alignment: FractionalOffset.bottomCenter,
//                       child: SizedBox(
//                         width: 280,
//                         height: 40,
//                         child: RaisedButton(
//                           highlightElevation: 10.0,
//                           elevation: 8.0,
//                           highlightColor: Colors.white,
//                           color: Colors.white,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 11.0),
//                             child: Text(
//                               "LOGIN NOW",
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontFamily: "Greyfel",
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             navigationService.navigateTo(LoginScreenRoute);
//                           },
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30)),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // ),
//                 // ),
//               ]),
//         ));
//   }
// }
