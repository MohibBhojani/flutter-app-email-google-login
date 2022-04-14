import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class NotificationItemList extends StatefulWidget {
  final data;
  final active;
  final String? tag;
  ValueChanged<dynamic>? action;
  NotificationItemList({Key? key, 
    this.action,
    this.active,
    this.data,
    this.tag,
  }) : super(key: key);

  @override
  _NotificationItemListState createState() => _NotificationItemListState();
}

class _NotificationItemListState extends State<NotificationItemList> {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('h:mm a').format(DateTime.now());

  void handletap() {
    widget.action!(widget.tag! == 'id');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.only(left: 15.0.h, right: 12.0.h, top: 4.0.h),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.grey.shade400))),
          padding: EdgeInsets.only(top: 6, bottom: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22.h,
                    backgroundImage: AssetImage("${widget.data['img']}"),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          widget.data['title'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 190,
                        child: Text(widget.data['subtitle'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: const Color.fromRGBO(142, 154, 175, 1),
                                height: 2.h)),
                      )
                    ],
                  ),
                ],
              ),
              Text(
                formattedDate.toLowerCase(),
                style: TextStyle(
                    fontSize: 10.sp, color: const Color.fromRGBO(142, 154, 175, 1)),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildSwipeActionRight() => Container(
  //       alignment: Alignment.centerRight,
  //       padding: EdgeInsets.symmetric(horizontal: 20),
  //       color: Colors.red,
  //       child: Icon(Icons.delete, color: Colors.white, size: 32),
  //     );
}
