import 'package:flutter/material.dart';
import 'package:revision/src/core/constants/extensions.dart';
import 'text_widget.dart';

class CustomErrorWidget extends StatefulWidget {
  final double? height;
  final double? width;
  final String message;
  const CustomErrorWidget(
      {required this.message, this.height, this.width, super.key});

  @override
  State<CustomErrorWidget> createState() => _CustomErrorWidgetState();
}

class _CustomErrorWidgetState extends State<CustomErrorWidget> {
  bool conect = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SizedBox(
          width: widget.width ?? MediaQuery.of(context).size.width,
          height: widget.height ?? MediaQuery.of(context).size.height,
          child: conect
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        widget.message,
                        style: context.titleLarge,
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink(),),
    );
  }
}
