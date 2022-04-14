import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageItem extends StatefulWidget {
  final data;
   const MessageItem({Key? key, this.data}) : super(key: key);

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10.w, top: 18.h, left: 10.h),
                child: CircleAvatar(
                  radius: 24.h,
                  backgroundImage: AssetImage(widget.data['img']),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 26.h, left: 47.h),
                  child: CircleAvatar(
                    radius: 6.h,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 5.h,
                      backgroundColor: const Color.fromRGBO(158, 210, 13, 1),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
