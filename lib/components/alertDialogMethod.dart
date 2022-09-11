import 'package:flutter/material.dart';
import 'package:scrapingflutternodejs/components/principalButton.dart';


Future alertDialogText( context, title, content, textbutton, route ) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return
          AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              SizedBox(
                width: size.width,
                height: 80.0,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: PrincipalButtonPushRemove( text: textbutton, route: route ),
                  ),
                ),
              ),
            ],
          );
      });
}