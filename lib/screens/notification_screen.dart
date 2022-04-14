import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>>? notificationlist = [
    {
      "id": "1",
      "title": "Alison",
      "subtitle": "Lorem ipsum is simply dummy text text dummy text ",
      "count": "1",
      "img": "assets/images/dummy1.jpg"
    },
    {
      "id": "2",
      "title": "Alison",
      "subtitle": "Lorem ipsum is simply dummy text text dummy text ",
      "count": "2",
      "img": "assets/images/1.jpg"
    },
    {
      "id": "3",
      "title": "Alison",
      "subtitle": "Lorem ipsum is simply dummy text text dummy text ",
      "count": "3",
      "img": "assets/images/01.jpg"
    },
    {
      "id": "4",
      "title": "Alison",
      "subtitle": "Lorem ipsum is simply dummy text text dummy text ",
      "count": "7",
      "img": "assets/images/4.jpg"
    },
    {
      "id": "5",
      "title": "Alison",
      "subtitle": "Lorem ipsum is simply dummy text text dummy text ",
      "count": "8",
      "img": "assets/images/5.jpg"
    },
    {
      "id": "6",
      "title": "Alison",
      "subtitle": "Lorem ipsum is simply dummy text text dummy text ",
      "count": "5",
      "img": "assets/images/6.jpg"
    },
    {
      "id": "7",
      "title": "Alison",
      "subtitle": "Lorem ipsum is simply dummy text text dummy text ",
      "count": "2",
      "img": "assets/images/2.jpg"
    },
    {
      "id": "8",
      "title": "Alison",
      "subtitle": "Lorem ipsum is simply dummy text text dummy text ",
      "count": "3",
      "img": "assets/images/1.jpg"
    },
    {
      "id": "9",
      "title": "Alison",
      "subtitle": "Lorem ipsum is simply dummy text text dummy text ",
      "count": "2",
      "img": "assets/images/4.jpg"
    },
    {
      "id": "10",
      "title": "Alison",
      "subtitle": "Lorem ipsum is simply dummy text text dummy text ",
      "count": "1",
      "img": "assets/images/6.jpg"
    },
  ];
  String tagId = ' ';
  void active(
    dynamic val,
  ) {
    setState(() {
      tagId = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('work in progress')),
    );
    // Scaffold(
    //   backgroundColor: Colors.black,
    //   body: Stack(
    //     children: [
    //       Container(
    //         height: 120.h,
    //         width: double.infinity,
    //         decoration: const BoxDecoration(
    //           gradient: LinearGradient(
    //             begin: Alignment.topLeft,
    //             end: Alignment(
    //                 1.5, 0.0), // 10% of the width, so there are ten blinds.
    //             colors: <Color>[
    //               Color.fromRGBO(255, 102, 0, 1),
    //               Color.fromRGBO(255, 80, 0, 1),
    //             ], // red to yellow
    //             tileMode:
    //                 TileMode.clamp, // repeats the gradient over the canvas
    //           ),
    //         ),
    //         child: Padding(
    //           padding: EdgeInsets.all(18.0.h),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(
    //                 "Notifications",
    //                 style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 20.sp,
    //                     fontWeight: FontWeight.w600),
    //               ),
    //               // Icon(
    //               //   Icons.search,
    //               //   color: Colors.white,
    //               //   size: 25.h,
    //               // )
    //             ],
    //           ),
    //         ),
    //       ),
    //       Container(
    //         margin: EdgeInsets.only(top: 100.h, bottom: 60.h),
    //         decoration: const BoxDecoration(
    //             color: Colors.black,
    //             borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(20),
    //                 topRight: Radius.circular(20))),
    //         child: ListView.builder(
    //             padding: const EdgeInsets.only(top: 25),
    //             itemCount: notificationlist!.length,
    //             itemBuilder: (ctx, i) {
    //               return NotificationItemList(
    //                 data: notificationlist![i],
    //                 tag: notificationlist![i]['id'],
    //                 action: active,
    //                 active: tagId == notificationlist![i]['id'] ? true : false,
    //               );
    //             }),
    //       )
    //     ],
    //   ),
    // );
  }
}
