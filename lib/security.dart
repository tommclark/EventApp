import 'dart:html';
import 'settings.dart';
import 'package:flutter/material.dart';

class Security extends StatelessWidget {
  const Security({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff331f46),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffc58fff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Privacy & Security",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xffffffff),
          ),
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
            size: 18,
          ),
        )
      ),
        body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
              color: Color(0xff331f46),
              shadowColor: Color(0xffd5d2d2),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Permissions",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: SwitchListTile(
                        value: true,
                        title: Text(
                          "Location services",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        onChanged: (value) {},
                        tileColor: Color(0x00ffffff),
                        activeColor: Color(0xff3a57e8),
                        activeTrackColor: Color(0x3f3a57e8),
                        controlAffinity: ListTileControlAffinity.trailing,
                        dense: false,
                        inactiveThumbColor: Color(0xff9e9e9e),
                        inactiveTrackColor: Color(0xffe0e0e0),
                        contentPadding: EdgeInsets.all(0),
                        selected: false,
                        selectedTileColor: Color(0x42000000),
                      ),
                    ),
                    Divider(
                      color: Color(0xff808080),
                      height: 16,
                      thickness: 0.3,
                      indent: 0,
                      endIndent: 0,
                    ),
                    SwitchListTile(
                      value: true,
                      title: Text(
                        "Photos",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      onChanged: (value) {},
                      tileColor: Color(0x00ffffff),
                      activeColor: Color(0xff3a57e8),
                      activeTrackColor: Color(0x3f3a57e8),
                      controlAffinity: ListTileControlAffinity.trailing,
                      dense: false,
                      inactiveThumbColor: Color(0xff9e9e9e),
                      inactiveTrackColor: Color(0xffe0e0e0),
                      contentPadding: EdgeInsets.all(0),
                      selected: false,
                      selectedTileColor: Color(0x42000000),
                    ),
                    Divider(
                      color: Color(0xff808080),
                      height: 16,
                      thickness: 0.3,
                      indent: 0,
                      endIndent: 0,
                    ),
                    SwitchListTile(
                      value: true,
                      title: Text(
                        "Notifications",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      onChanged: (value) {},
                      tileColor: Color(0x00ffffff),
                      activeColor: Color(0xff3a57e8),
                      activeTrackColor: Color(0x3f3a57e8),
                      controlAffinity: ListTileControlAffinity.trailing,
                      dense: false,
                      inactiveThumbColor: Color(0xff9e9e9e),
                      inactiveTrackColor: Color(0xffe0e0e0),
                      contentPadding: EdgeInsets.all(0),
                      selected: false,
                      selectedTileColor: Color(0x42000000),
                    ),
                     Divider(
                      color: Color(0xff808080),
                      height: 16,
                      thickness: 0.3,
                      indent: 0,
                      endIndent: 0,
                    ),
                    SwitchListTile(
                      value: true,
                      title: Text(
                        "Calendar",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      onChanged: (value) {},
                      tileColor: Color(0x00ffffff),
                      activeColor: Color(0xff3a57e8),
                      activeTrackColor: Color(0x3f3a57e8),
                      controlAffinity: ListTileControlAffinity.trailing,
                      dense: false,
                      inactiveThumbColor: Color(0xff9e9e9e),
                      inactiveTrackColor: Color(0xffe0e0e0),
                      contentPadding: EdgeInsets.all(0),
                      selected: false,
                      selectedTileColor: Color(0x42000000),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
              width: 16,
            ),
            Card(
              margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
              color: Color(0xff331f46),
              shadowColor: Color(0xffd5d2d2),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Notification Settings",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xffffffff),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: SwitchListTile(
                        value: true,
                        title: Text(
                          "Push Notification",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xffffffff),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        subtitle: Text(
                          "Receive weekly push notification",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            color: Color(0xffffffff),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        onChanged: (value) {},
                        tileColor: Color(0x00ffffff),
                        activeColor: Color(0xff3a57e8),
                        activeTrackColor: Color(0x3f3a57e8),
                        controlAffinity: ListTileControlAffinity.trailing,
                        dense: false,
                        inactiveThumbColor: Color(0xff9e9e9e),
                        inactiveTrackColor: Color(0xffe0e0e0),
                        contentPadding: EdgeInsets.all(0),
                        selected: false,
                        selectedTileColor: Color(0x42000000),
                      ),
                    ),
                    Divider(
                      color: Color(0xff808080),
                      height: 16,
                      thickness: 0.3,
                      indent: 0,
                      endIndent: 0,
                    ),
                    SwitchListTile(
                      value: true,
                      title: Text(
                        "SMS Notification",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xffffffff),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      subtitle: Text(
                        "Receive SMS notification",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          color: Color(0xffffffff),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      onChanged: (value) {},
                      tileColor: Color(0x00ffffff),
                      activeColor: Color(0xff3a57e8),
                      activeTrackColor: Color(0x3f3a57e8),
                      controlAffinity: ListTileControlAffinity.trailing,
                      dense: false,
                      inactiveThumbColor: Color(0xff9e9e9e),
                      inactiveTrackColor: Color(0xffe0e0e0),
                      contentPadding: EdgeInsets.all(0),
                      selected: false,
                      selectedTileColor: Color(0x42000000),
                    ),
                    Divider(
                      color: Color(0xff808080),
                      height: 16,
                      thickness: 0.3,
                      indent: 0,
                      endIndent: 0,
                    ),
                    SwitchListTile(
                      value: false,
                      title: Text(
                        "Email Notification",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xffffffff),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      subtitle: Text(
                        "Receive email notification",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          color: Color(0xffffffff),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      onChanged: (value) {},
                      tileColor: Color(0x00ffffff),
                      activeColor: Color(0xff3a57e8),
                      activeTrackColor: Color(0x3f3a57e8),
                      controlAffinity: ListTileControlAffinity.trailing,
                      dense: false,
                      inactiveThumbColor: Color(0xff9e9e9e),
                      inactiveTrackColor: Color(0xffe0e0e0),
                      contentPadding: EdgeInsets.all(0),
                      selected: false,
                      selectedTileColor: Color(0x42000000),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
