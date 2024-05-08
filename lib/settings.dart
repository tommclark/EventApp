import 'package:setap/account.dart';
import 'security.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff331f46),
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffc58fff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xffffffff),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 18),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 16,
                width: 16,
              ),
              Text(
                "General Settings",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xffffffff),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Account()));
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: ListTile(
                    tileColor: Color(0x00ffffff),
                    title: Text(
                      "Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    dense: true,
                    contentPadding: EdgeInsets.all(0),
                    selected: false,
                    selectedTileColor: Color(0x42000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    leading:
                        Icon(Icons.person, color: Color(0xffc58fff), size: 24),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Color(0xff808080), size: 18),
                  ),
                ),
              ),
           
            GestureDetector(
              onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Security()));
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: ListTile(
                  tileColor: Color(0x00ffffff),
                  title: Text(
                    "Privacy & Security",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                  selected: false,
                  selectedTileColor: Color(0x42000000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  leading:
                      Icon(Icons.lock, color: Color(0xffc58fff), size: 24),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Color(0xff808080), size: 18),
                ),
              ),
            ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text(
                  "Support",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: ListTile(
                  tileColor: Color(0x00ffffff),
                  title: Text(
                    "Help",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                  selected: false,
                  selectedTileColor: Color(0x42000000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  leading: Icon(Icons.add_comment_outlined,
                      color: Color(0xffc58fff), size: 24),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Color(0xff808080), size: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: ListTile(
                  tileColor: Color(0x00ffffff),
                  title: Text(
                    "Contact Us",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                  selected: false,
                  selectedTileColor: Color(0x42000000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  leading: Icon(Icons.call,
                      color: Color(0xffc58fff), size: 24),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Color(0xff808080), size: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: ListTile(
                  tileColor: Color(0x00ffffff),
                  title: Text(
                    "About Us",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                  selected: false,
                  selectedTileColor: Color(0x42000000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  leading: Icon(Icons.info_outline,
                      color: Color(0xffc58fff), size: 24),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Color(0xff808080), size: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}