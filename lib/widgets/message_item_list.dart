import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../services/navigation_service.dart';
import '../utils/service_locator.dart';

// ignore: must_be_immutable
class MessageItemList extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;

  final String? tag;
  ValueChanged<dynamic>? action;
  MessageItemList({
    Key? key,
    this.action,
    this.data,
    this.tag,
  }) : super(key: key);

  @override
  _MessageItemListState createState() => _MessageItemListState();
}

class _MessageItemListState extends State<MessageItemList> {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('h:mm a').format(DateTime.now());
  var navigationService = locator<NavigationService>();

  void handletap() {
    widget.action!(widget.tag! == 'id');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handletap,
      child: Dismissible(
        direction: DismissDirection.endToStart,
        key: UniqueKey(),
        confirmDismiss: (DismissDirection direction) async {
          return await showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.white,
                    // contentPadding: EdgeInsets.fromLTRB(
                    //   14.0,
                    //   20.0,
                    //   14.0,
                    //   10.0,
                    // ),
                    content: Container(
                      height: 200.h,
                      // width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.close,
                                  size: 22.h,
                                ),
                              )
                            ],
                          ),
                          Image.asset("assets/images/Delete-popup.png",
                              scale: 3),
                          SizedBox(height: 10.h),
                          Text(
                            'Are You Sure\nYou Want To Delete?',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    textStyle: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        fontWeight: FontWeight.w600),
                                    fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.30,
                                      MediaQuery.of(context).size.height *
                                          0.055,
                                    ),
                                    primary: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 10),
                                    child: Text(
                                      "No",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   widget.data.removeAt();
                                    // });
                                    Navigator.of(context).pop(true);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    elevation: 0,
                                    textStyle: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        fontWeight: FontWeight.w600),
                                    fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.30,
                                      MediaQuery.of(context).size.height *
                                          0.055,
                                    ),
                                    primary: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.only(
                                      left: 5.w,
                                      right: 10.w,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    height: MediaQuery.of(context).size.height *
                                        0.055,
                                    child: Center(
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ));
        },
        background: buildSwipeActionRight(),
        secondaryBackground: buildSwipeActionRight(),
        child: InkWell(
          onTap: () {
            // navigationService.navigateTo(ChatScreenRoute);
          },
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 15.0.h, right: 12.0.h, top: 4.0.h),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.5, color: Colors.grey.shade400))),
                padding: EdgeInsets.only(top: 6, bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 22.h,
                              backgroundImage:
                                  AssetImage("${widget.data['img']}"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30.h, left: 34.h),
                              child: CircleAvatar(
                                  radius: 6.h,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 5.h,
                                    backgroundColor:
                                        const Color.fromRGBO(158, 210, 13, 1),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 190,
                              child: Text(widget.data['subtitle'],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: const Color.fromRGBO(
                                          142, 154, 175, 1),
                                      height: 2.h)),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          formattedDate.toLowerCase(),
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: const Color.fromRGBO(142, 154, 175, 1)),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.h),
                          child: CircleAvatar(
                            radius: 8.h,
                            backgroundImage: const AssetImage(
                                "assets/images/Message-Number.png"),
                            child: Text(
                              widget.data['count'],
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: const Color.fromRGBO(20, 20, 22, 1),
        child: Image.asset("assets/images/Delete-popup.png", scale: 4),
      );
}
