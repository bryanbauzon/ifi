import 'package:flutter/material.dart';
import 'package:ifi_app/common/app_common.dart';
import 'package:intl/intl.dart';

class CustomWidgets {
  static String getCurrDate() {
    DateTime now = DateTime.now();
    // return DateTime(now.year, now.month, now.day);
    return DateFormat.yMMMMd('en_US').format(now);
  }

  static Widget appBar(BuildContext context) => SafeArea(
          child: Container(
        decoration: const BoxDecoration(color: Colors.red),
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppCommons.appName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              getCurrDate(),
              style: const TextStyle(color: Colors.white),
            )
          ],
        )),
      ));

  static Widget customTextFormField(
      String fieldName, TextEditingController controller) {
    return SizedBox(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              fieldName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          maxLines: (fieldName == 'Communion' ? 4 : 1),
          keyboardType: (fieldName != 'Communion'
              ? TextInputType.text
              : TextInputType.multiline),
          decoration: InputDecoration(
            hintText: fieldName,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required.';
            }
            return null;
          },
        )
      ],
    ));
  }
}
