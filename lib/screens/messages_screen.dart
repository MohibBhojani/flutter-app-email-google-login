import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
   const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<Map<String, dynamic>> messageItem = [
    {"img": "assets/images/1.jpg"},
    {"img": "assets/images/1.jpg"},
    {"img": "assets/images/4.jpg"},
    {"img": "assets/images/5.jpg"},
    {"img": "assets/images/6.jpg"},
    {"img": "assets/images/2.jpg"},
    {"img": "assets/images/01.jpg"},
    {"img": "assets/images/2.jpg"},
  ];

  List<Map<String, dynamic>>? messagelist = [
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
    return Container(child: const Center(child: Text('work in progress')),);
    
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
    //             end: Alignment(1.5, 0.0),
    //             colors: <Color>[
    //               Color.fromRGBO(255, 102, 0, 1),
    //               Color.fromRGBO(255, 80, 0, 1),
    //             ], // red to yellow
    //             tileMode: TileMode.clamp,
    //           ),
    //         ),
    //         child: Padding(
    //           padding: EdgeInsets.all(18.0.h),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(
    //                 "Messages",
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 20.sp,
    //                   fontWeight: FontWeight.w600,
    //                 ),
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
    //       Column(
    //         children: [
    //           Container(
    //             margin: EdgeInsets.only(
    //               top: 100.h,
    //             ),
    //             decoration: BoxDecoration(
    //               color: Colors.black,
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(20.h),
    //                 topRight: Radius.circular(20.h),
    //               ),
    //             ),
    //             child: Padding(
    //               padding:
    //                   EdgeInsets.only(left: 10.0.h, right: 10.0.h, top: 14.0.h),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     "  New Matches",
    //                     style: TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 15.sp,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                   Container(
    //                       height: 90.h,
    //                       decoration: const BoxDecoration(boxShadow: [
    //                         // BoxShadow(
    //                         //   color: Colors.grey.shade700,
    //                         //   blurRadius: 5,
    //                         //   spreadRadius: -7,
    //                         //   offset: Offset(0, 11),
    //                         // )
    //                       ]),
    //                       child: Container(
    //                         decoration: const BoxDecoration(
    //                           color: Colors.black,
    //                         ),
    //                         child: ListView.builder(
    //                             padding: const EdgeInsets.only(),
    //                             scrollDirection: Axis.horizontal,
    //                             itemCount: messageItem.length,
    //                             itemBuilder: (ctx, i) {
    //                               return MessageItem(
    //                                 data: messageItem[i],
    //                               );
    //                             }),
    //                       ))
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       Container(
    //         margin: EdgeInsets.only(top: 220.h, bottom: 60.h),
    //         child: ListView.builder(
    //             padding: EdgeInsets.zero,
    //             shrinkWrap: true,
    //             itemCount: messagelist!.length,
    //             itemBuilder: (ctx, i) {
    //               return MessageItemList(
    //                 data: messagelist![i],
    //                 tag: messagelist![i]['id'],
    //                 action: active,
    //                 // active: tagId == messagelist![i]['id'] ? true : false,
    //               );
    //             }),
    //       )
    //     ],
    //   ),
    // );
  }
}
