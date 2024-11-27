import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;
  final bool? bold;
  final int? lines;
  final TextAlign? align;
  final bool? addShadow;

  const AppText(
      {super.key,
      this.text,
      this.color,
      this.size,
      this.bold,
      this.lines,
      this.addShadow,
      this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: align ?? TextAlign.center,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: size ?? 10,
            fontWeight: bold == true ? FontWeight.w800 : FontWeight.w400,
            color: color ?? Colors.white,
            shadows: addShadow == true
                ? [
                    Shadow(
                      blurRadius: 7.0,
                      color: Colors.black.withOpacity(.5),
                      offset: const Offset(0, 0),
                    ),
                  ]
                : [],
          ),
    );
  }
}
