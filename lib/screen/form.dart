import 'package:flutter/material.dart';
import 'package:ifi_app/common/app_common.dart';
import 'package:ifi_app/screen/preview.dart';

import '../widgets/custom_widgets.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController enCtrl = TextEditingController();
  TextEditingController fCtrl = TextEditingController();
  TextEditingController sCtrl = TextEditingController();
  TextEditingController oCtrl = TextEditingController();

  TextEditingController cCtrl = TextEditingController();
  TextEditingController clCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          reverse: false,
          child: Column(
            children: [
              CustomWidgets.appBar(context),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 50, bottom: 50),
                  child: Column(
                    children: [
                      CustomWidgets.customTextFormField(
                          AppCommons.fields[0], titleCtrl),
                      CustomWidgets.customTextFormField(
                          AppCommons.fields[1], enCtrl),
                      CustomWidgets.customTextFormField(
                          AppCommons.fields[2], fCtrl),
                      CustomWidgets.customTextFormField(
                          AppCommons.fields[3], sCtrl),
                      CustomWidgets.customTextFormField(
                          AppCommons.fields[4], oCtrl),
                      CustomWidgets.customTextFormField(
                          AppCommons.fields[5], cCtrl),
                      CustomWidgets.customTextFormField(
                          AppCommons.fields[6], clCtrl),
                    ],
                  ),
                ),
              )
            ],
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          child: const Text(
            'Preview',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Preview(
                          title: titleCtrl.text,
                          entrance: enCtrl.text,
                          fReading: fCtrl.text,
                          sReading: sCtrl.text,
                          offertory: oCtrl.text,
                          communion: cCtrl.text,
                          closingHym: clCtrl.text)));
            }
          },
        ),
      ),
    );
  }
}
