import 'package:flutter/material.dart';
import 'package:revision/src/core/constants/extensions.dart';
import 'package:revision/src/core/widgets/text_widget.dart';

import '../../../../../core/constants/color_manager.dart';
import '../../../../../core/constants/string_manager.dart';
import '../../../../../core/widgets/app_bar_widget.dart';
import '../../../domain/entities/home_entity.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as HomeEntity;

    return Scaffold(
      appBar: AppBarWidget(
        title: StringManager.details,
        backgroundColor: ColorManager.backgroundColor,
      ),
      body: Padding(
        padding: context.paddingAll(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              StringManager.title,
              style: context.bodyMedium.bold.colorExt(ColorManager.black),
            ),
            Divider(),
            8.hBox,
            TextWidget(item.title ?? " "),
            30.hBox,
            TextWidget(
              StringManager.body,
              style: context.bodyMedium.bold.colorExt(ColorManager.black),
            ),
            Divider(),

            8.hBox,
            TextWidget(item.body ?? " "),
          ],
        ),
      ),
    );
  }
}
