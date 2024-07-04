import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ChatItemMe extends StatelessWidget {
  Map message;
  ChatItemMe({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        message['type'] == "image"
            ? Container(
                height: 200.h,
                width: 200.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(message['text']),
                        fit: BoxFit.cover)),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 2,
                      right: 5,
                      child: Text(
                        message["time"],
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ))
            : Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      message["text"],
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      message["time"],
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
        SizedBox(height: 10.h)
      ],
    );
  }
}
