import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final Function onSearchChanged;
  final bool focused;
  final focusNode;
  final Function onClear;
  final double width;
  final bool readOnly;
  final bool autoFocus;
  SearchFieldComponent({
    this.width,
    this.readOnly = false,
    this.controller,
    this.onSearchChanged,
    this.focused = false,
    this.onClear,
    this.focusNode,
    this.autoFocus = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: width ?? double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CupertinoTextField(
          readOnly: readOnly,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          focusNode: focusNode,
          onChanged: (String value) {
            onSearchChanged(value);
          },
          controller: controller,
          placeholderStyle: TextStyle(
            color: Color(0xff96979C),
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
          prefix: Padding(
              padding: EdgeInsets.fromLTRB(10, 12, 7, 12), child: SizedBox()),
          // suffix: GestureDetector(
          //   behavior: HitTestBehavior.opaque,
          //   onTap: onClear,
          //   child: focused
          //       ? Padding(
          //           padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          //           child: SvgPicture.asset(
          //             'assets/icons/clear.svg',
          //             height: 10,
          //             width: 10,
          //             fit: BoxFit.none,
          //           ),
          //         )
          //       : Container(),
          // ),
          autofocus: autoFocus,
          placeholder: 'Izlash',
          decoration: BoxDecoration(
            color: Color(0xff8E8E93).withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
