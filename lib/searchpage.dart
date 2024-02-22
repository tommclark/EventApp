
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a57e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "AppBar",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff000000),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xff212435),
            size: 24,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
               padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Align(
                alignment: Alignment(-0.5, 0.0),
                child: Text(
                  "Use filters/search options below",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color(0xff7b7b7b),
                        border: Border.all(color: Color(0xff000000), width: 1),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: "Option 1",
                          items: ["Option 1"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                            }).toList(),
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          onChanged: (value) {},
                          elevation: 8,
                          isExpanded: true,
                        ),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color(0xff7b7b7b),
                        border: Border.all(color: Color(0xff000000), width: 1),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: "Option 1",
                          items: ["Option 1"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          onChanged: (value) {},
                          elevation: 8,
                          isExpanded: true,
                        ),
                      )),
                       Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color(0xff7b7b7b),
                        border: Border.all(color: Color(0xff000000), width: 1),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: "Option 1",
                          items: ["Option 1"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          onChanged: (value) {},
                          elevation: 8,
                          isExpanded: true,
                        ),
                      )),
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: TextField(
                controller: TextEditingController(),
                obscureText: false,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                  decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: Color(0xff000000), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: Color(0xff000000), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: Color(0xff000000), width: 1),
                  ),
                  hintText: "Search...",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xb9000000),
                  ),
                  filled: true,
                  fillColor: Color(0xfff2f2f3),
                  isDense: false,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  prefixIcon:
                      Icon(Icons.search, color: Color(0xff212435), size: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
