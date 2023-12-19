import 'package:flutter/material.dart';
import 'package:ifi_app/common/app_common.dart';

class CustomWidgets {
  static Widget appBar(BuildContext context) => SafeArea(
          child: Container(
        decoration: const BoxDecoration(color: Colors.red),
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: const Center(
            child: Text(
          AppCommons.appName,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
