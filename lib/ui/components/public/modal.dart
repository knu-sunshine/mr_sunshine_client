import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_sunshine_client/constants/colors.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';
import 'package:mr_sunshine_client/ui/components/public/inputs.dart';
import 'package:mr_sunshine_client/ui/components/public/texts.dart';

class AddRoomModal extends StatefulWidget {
  final String title;
  final String subscription;
  final List<String> fields;

  const AddRoomModal({
    super.key,
    required this.title,
    required this.subscription,
    required this.fields,
  });

  @override
  State<AddRoomModal> createState() => _AddRoomModalState();
}

class _AddRoomModalState extends State<AddRoomModal> {
  List<String> values = [];
  @override
  void initState() {
    for (var i = 0; i < widget.fields.length; i++) {
      values.add("");
    }
    super.initState();
  }

  void setRoomName(String val, int idx) {
    setState(() {
      values[idx] = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
        child: Container(
          width: 310.w,
          height: 266.h,
          color: AppColor.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  SizedBox(
                    width: 265.w,
                    height: 41.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        modalTitle(widget.title),
                        cancelButton(),
                      ],
                    ),
                  ),
                  Container(
                    width: 265.w,
                    height: 20.h,
                    alignment: Alignment.centerLeft,
                    child: modalDescription(widget.subscription),
                  ),
                  SizedBox(
                    height: 29.h,
                  ),
                ] +
                widget.fields.fold<List<Widget>>([], (prev, e) {
                  return [
                    ...prev,
                    modalInputBox(e, (val) {
                      setRoomName(val, widget.fields.indexOf(e));
                    }),
                    SizedBox(
                      height: 39.h,
                    ),
                  ];
                }) +
                [
                  confirmButton(() {
                    print(values);
                  }),
                ],
          ),
        ),
      ),
    );
  }
}
