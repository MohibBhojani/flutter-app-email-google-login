import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // var navigationService = locator<NavigationService>();
  List images = [
    {"image": "assets/images/1.jpg"},
    {"image": "assets/images/2.jpg"},
    {"image": "assets/images/3.jpg"},
    {"image": "assets/images/4.jpg"},
    {"image": "assets/images/5.jpg"},
    {"image": "assets/images/6.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('work in progress')),
    );
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: MediaQuery.of(context).size.width,
    //         maxHeight: MediaQuery.of(context).size.height),
    //     designSize: const Size(360, 690),
    //     orientation: Orientation.portrait);
    // return Scaffold(
    //   backgroundColor: Colors.black,
    //   appBar: AppBar(
    //     backgroundColor: Colors.black,
    //     elevation: 0,
    //     automaticallyImplyLeading: false,
    //     actions: [
    //       IconButton(
    //           onPressed: () {
    //             // navigationService.navigateTo(EditProfileScreenRoute);
    //           },
    //           icon: Icon(
    //             Icons.more_vert,
    //             size: 30.h,
    //             color: Colors.grey,
    //           ))
    //     ],
    //     title: Text(
    //       "Profile",
    //       style: TextStyle(
    //           fontWeight: FontWeight.bold,
    //           fontSize: 20.sp,
    //           color: Colors.white),
    //     ),
    //   ),
    //   body: SingleChildScrollView(
    //       child: Container(
    //     padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 5.h),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         CircleAvatar(
    //           radius: 50.r,
    //           backgroundColor: Colors.transparent,
    //           backgroundImage: const AssetImage(
    //             "assets/images/1.jpg",
    //           ),
    //         ),
    //         SizedBox(
    //           height: 10.h,
    //         ),
    //         Text(
    //           "jacob Cameron, 28",
    //           style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 18.sp,
    //               color: Colors.white),
    //         ),
    //         SizedBox(
    //           height: 2.h,
    //         ),
    //         Text(
    //           "Oxnard, California",
    //           style: TextStyle(fontSize: 14.sp, color: Colors.grey),
    //         ),
    //         SizedBox(
    //           height: 20.h,
    //         ),
    //         SizedBox(
    //           width: MediaQuery.of(context).size.width / 1.1,
    //           child: Text(
    //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
    //             textAlign: TextAlign.center,
    //             style:
    //                 TextStyle(fontSize: 12.sp, color: Colors.grey, height: 1.4),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 20.h,
    //         ),
    //         Container(
    //           padding: EdgeInsets.fromLTRB(13.w, 2.h, 13.w, 2.h),
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(10),
    //               color: Colors.grey.shade200),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               Row(
    //                 children: [
    //                   Icon(Icons.favorite,
    //                       color: Colors.greenAccent, size: 20.h),
    //                   SizedBox(
    //                     width: 8.w,
    //                   ),
    //                   Text(
    //                     "415",
    //                     style: TextStyle(
    //                         fontSize: 16.sp,
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //               Image.asset(
    //                 'assets/images/line.png',
    //                 scale: 4,
    //               ),
    //               Row(
    //                 children: [
    //                   Icon(Icons.star, color: Colors.blue, size: 20.h),
    //                   SizedBox(
    //                     width: 8.w,
    //                   ),
    //                   Text(
    //                     "605",
    //                     style: TextStyle(
    //                         fontSize: 16.sp,
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //         SizedBox(
    //           height: 40.h,
    //         ),
    //         InkWell(
    //           onTap: () {
    //             // navigationService.navigateTo(PackagesScreenRoute);
    //           },
    //           child: Container(
    //             padding: EdgeInsets.fromLTRB(20.w, 10.h, 10.w, 10.h),
    //             height: 90.h,
    //             decoration: BoxDecoration(
    //                 gradient: const LinearGradient(
    //                   begin: Alignment.topLeft,
    //                   end: Alignment.bottomRight,
    //                   colors: [
    //                     Color.fromRGBO(255, 102, 0, 1),
    //                     Color.fromRGBO(255, 76, 1, 1),
    //                   ],
    //                 ),
    //                 borderRadius: BorderRadius.circular(10)),
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 FaIcon(
    //                   FontAwesomeIcons.crown,
    //                   color: Colors.white,
    //                   size: 25.h,
    //                 ),
    //                 SizedBox(
    //                   width: 15.w,
    //                 ),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Text(
    //                       "Go To Premium",
    //                       style: TextStyle(
    //                           fontSize: 16.sp,
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                     SizedBox(
    //                       height: 6.h,
    //                     ),
    //                     SizedBox(
    //                       width: MediaQuery.of(context).size.width / 1.7,
    //                       child: Text(
    //                         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    //                         style: TextStyle(
    //                           fontSize: 12.sp,
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 30.h,
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               "Insta Gallery",
    //               textAlign: TextAlign.start,
    //               style: TextStyle(
    //                   fontSize: 16.sp,
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold),
    //             ),
    //             Text(
    //               "View All",
    //               textAlign: TextAlign.start,
    //               style: TextStyle(
    //                 fontSize: 14.sp,
    //                 color: Colors.grey,
    //               ),
    //             ),
    //           ],
    //         ),
    //         GridView.count(
    //           padding: EdgeInsets.fromLTRB(0.w, 15.h, 0.w, 20.h),
    //           physics: const NeverScrollableScrollPhysics(),
    //           childAspectRatio: 0.5 / 0.5,
    //           crossAxisCount: 3,
    //           crossAxisSpacing: 10.0,
    //           mainAxisSpacing: 10.0,
    //           shrinkWrap: true,
    //           children: List.generate(
    //             images.length,
    //             (index) {
    //               return SizedBox(
    //                 height: 100.h,
    //                 child: Image.asset(
    //                   images[index]["image"],
    //                   fit: BoxFit.fitHeight,
    //                 ),
    //               );
    //             },
    //           ),
    //         ),
    //         SizedBox(
    //           height: 70.h,
    //         ),
    //       ],
    //     ),
    //   )),
    // );
  }
}
