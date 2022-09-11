import 'package:flutter/material.dart';


class PrincipalButtonPushRemove extends StatefulWidget {
  final borderColor;
  final Color fillColor;
  final Color textColor;
  final String text;

  // final Object? args;
  final route;
  final Color? animatedColor;

  const PrincipalButtonPushRemove({
    Key? key,
    this.borderColor = Colors.black,
    this.fillColor = Colors.black,
    required this.text,
    this.route,
    // this.args,
    this.textColor = Colors.white,
    this.animatedColor = Colors.black,
  }) : super(key: key);

  @override
  State<PrincipalButtonPushRemove> createState() => _PrincipalButtonPushRemoveState();
}

class _PrincipalButtonPushRemoveState extends State<PrincipalButtonPushRemove> {
  bool pressAttention = false;

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(seconds: 1),
        width: MediaQuery.of(context).size.width,
        height: 55.0,
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5),
        child:
        ElevatedButton(
            child: Text(
              widget.text,
              style: TextStyle(
                  fontSize: 22,
                  color: widget.textColor,
                  fontWeight: FontWeight.w500),
            ),
            onPressed: () {

              Navigator.of(context).pushNamedAndRemoveUntil(widget.route, (Route<dynamic> route) => false);

            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(
                  pressAttention ? widget.animatedColor : widget.fillColor,
                  // widget.fillColor
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(
                            color: widget.borderColor,
                            width: 1.5
                        ))))));
  }
}


