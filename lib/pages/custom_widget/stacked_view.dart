
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackedView extends StatefulWidget {
  const StackedView(
      {required this.child,
        this.upperColor = Colors.orange,
        this.lowerColor = Colors.black,
        required this.width,
        required this.height,
        this.borderColor = Colors.black});
  final Widget child;
  final Color upperColor;
  final Color lowerColor;
  final double width;
  final double height;
  final Color borderColor;
  @override
  _StackedViewState createState() => _StackedViewState();
}

class _StackedViewState extends State<StackedView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: const Offset(4.0, 4.0),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.lowerColor,
            ),
          ),
        ),
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: widget.upperColor,
              border: Border.all(color: widget.borderColor)),
          child: widget.child,
        ),
      ],
    );
  }
}