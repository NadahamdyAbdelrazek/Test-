
import 'package:flutter/cupertino.dart';
import 'package:revision/src/core/constants/extensions.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.style,
    this.padding,
  });

  final String text;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;
  final TextOverflow? overflow;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = (style ?? context.bodyMedium).copyWith(
      fontFamily: 'NotoSans',
      fontFamilyFallback: const [
        'SegoeUI',
        'sans-serif',
      ],
    );

    return Padding(
      padding: padding ?? context.paddingZero(),
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: defaultStyle,
      ),
    );
  }
}
