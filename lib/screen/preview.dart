import 'package:flutter/material.dart';
import 'package:ifi_app/common/app_common.dart';

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
                    '$label: ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    value,
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
                        '$label: ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Text(
                      value,
                      style: const TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
          child: const Text(
            'Back',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
