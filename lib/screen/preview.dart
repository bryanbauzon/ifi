import 'package:flutter/material.dart';
import 'package:ifi_app/common/app_common.dart';
import 'package:intl/intl.dart';

class Preview extends StatefulWidget {
  const Preview({
    super.key,
    required this.title,
    required this.entrance,
    required this.fReading,
    required this.sReading,
    required this.offertory,
    required this.communion,
    required this.closingHym,
  });
  final String title;
  final String entrance;
  final String fReading;
  final String sReading;
  final String offertory;
  final String communion;
  final String closingHym;

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  Widget labelValue(String label, String value) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: label != AppCommons.fields[5]
            ? Row(
                children: [
                  Text(
                    formatValue('$label: ', false),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    formatValue(value, false),
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              )
            : Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        formatValue('$label: ', false),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Text(
                      formatValue(value, true),
                      style: const TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
      );

  String formatValue(String value, bool showBullet) {
    String val = value;
    if (val.contains(',')) {
      val = value.replaceAll(',', '\n•');
    }
    if (showBullet) {
      val = '• $val';
    }
    return val.toUpperCase();
  }

  String getCurrDate() {
    DateTime now = DateTime.now();
    // return DateTime(now.year, now.month, now.day);
    return DateFormat.yMMMMd('en_US').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [
                      Text(
                        formatValue(widget.title, false),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      ),
                      //
                      Text(
                        getCurrDate(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.redAccent),
                      )
                    ],
                  )),
              labelValue(AppCommons.fields[1], widget.entrance),
              labelValue(AppCommons.fields[2], widget.fReading),
              labelValue(AppCommons.fields[3], widget.sReading),
              labelValue(AppCommons.fields[4], widget.offertory),
              labelValue(AppCommons.fields[5], widget.communion),
              labelValue(AppCommons.fields[6], widget.closingHym),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
