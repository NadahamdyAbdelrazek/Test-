

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:revision/src/core/constants/extensions.dart';
import 'package:revision/src/core/widgets/text_widget.dart';

import '../constants/asset_manager.dart';
import '../constants/color_manager.dart';
import '../constants/enums.dart';
import '../constants/string_manager.dart';
import 'button_widget.dart';

class HandlingDataWidget extends StatelessWidget {
  const HandlingDataWidget({
    super.key,
    required this.reqState,
    // this.childLoading,
    this.childEmpty,
    required this.title,
    required this.subTitle,
    this.onTap,
    this.isBlock,
    this.buttonTitle,
    this.titleStyle,
    this.subTitleStyle,
    this.isLoadingCenter,
    this.needLoadingWidget = true,
    required this.child,
  });

  final RequestState reqState;
  final Widget child;
  // final Widget? childLoading;
  final Widget? childEmpty;
  final String? isBlock;
  final String? buttonTitle;
  final String title, subTitle;
  final VoidCallback? onTap;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final bool? needLoadingWidget;
  final bool? isLoadingCenter;
  @override
  Widget build(BuildContext context) {
    if (reqState.isLoading) {
      return (needLoadingWidget == false)
          ? child
          : LoadingView(
              titleStyle: titleStyle,
              isLoadingCenter: isLoadingCenter,
              subTitleStyle: subTitleStyle,
            );
    } else if (reqState.isError) {
      return ErrorView(
        onTap: onTap,
        isBlock: isBlock,
        subTitleStyle: subTitleStyle,
        titleStyle: titleStyle,
      );
    } else if (reqState.isOffline) {
      return childEmpty ??
          _EmptyView(
            title: title,
            subTitle: subTitle,
            onTap: onTap,
            subTitleStyle: subTitleStyle,
            titleStyle: titleStyle,
            buttonTitle: buttonTitle,
          );
    } else {
      return child;
    }
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key, this.titleStyle, this.subTitleStyle,this.isLoadingCenter});

  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final bool? isLoadingCenter;
  @override
  Widget build(BuildContext context) {
    return  isLoadingCenter??false? SizedBox(
      height: 320.h,
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: ColorManager.black,
        size: 35.h,
      ),
    ): Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: ColorManager.black,
        size: 35.h,
      ),
    );

  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    this.onTap,
    this.isBlock,
    this.subTitleStyle,
    this.titleStyle,
  });
  final VoidCallback? onTap;
  final String? isBlock;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;

  @override
  Widget build(BuildContext context) {
    return ErrorOrEmptyWidget(
      image: AssetsManager.error,
      title: StringManager.someWrong,
      message: isBlock ?? StringManager.someThingWrong,
      onTap: onTap,
      titleStyle: titleStyle,
      subTitleStyle: subTitleStyle,
    );
  }
}


class _EmptyView extends StatelessWidget {
  const _EmptyView({
    this.onTap,
    required this.title,
    this.titleStyle,
    this.subTitleStyle,
    this.buttonTitle,
    required this.subTitle,
  });
  final String title, subTitle;
  final String? buttonTitle;
  final VoidCallback? onTap;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;

  @override
  Widget build(BuildContext context) {
    return ErrorOrEmptyWidget(
      image: AssetsManager.empty,
      title: title,
      message: subTitle,
      onTap: onTap,
      titleStyle: titleStyle,
      subTitleStyle: subTitleStyle,
      buttonTitle: buttonTitle,
    );
  }
}

class ErrorOrEmptyWidget extends StatelessWidget {
  const ErrorOrEmptyWidget({
    super.key,
    required this.image,
    required this.title,
    required this.message,
    this.onTap,
    this.size,
    this.titleStyle,
    this.subTitleStyle,
    this.buttonTitle, this.buttonColor,
  });

  final String image;
  final String? buttonTitle;
  final String title;
  final String message;
  final VoidCallback? onTap;
  final double? size;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingOnly(start: 10, end: 10),
      child: Align(
        alignment: AlignmentDirectional.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image.isNotEmpty)
            Padding(
              padding: context.paddingOnly(
                  end: image == AssetsManager.loading ? 15 : 0),
              child: Image.asset(
                image,
                height: size?.h ?? 90.h,
                width: size?.w ?? 90.w,
                // fit: BoxFit.cover,
              ),
            ),
            10.hBox,
            TextWidget(
              title,
              textAlign: TextAlign.center,
              style: titleStyle ?? context.bodyLarge.w600.colorExt(ColorManager.black),
            ),
            5.hBox,
            TextWidget(
              message,
              textAlign: TextAlign.center,
              style: subTitleStyle ??
                  context.bodyMedium.copyWith(
                    color: ColorManager.greyColor,
                    height: 1.30,
                  ),
            ),
            if (onTap != null) ...[
              50.hBox,
              Padding(
                padding: context.paddingSymmetric(horizontal: 30),
                child: ButtonWidget(
                  title: buttonTitle ?? StringManager.refresh,
                  backgroundColor:buttonColor?? ColorManager.transparent,
                  titleColor: titleStyle != null
                      ? ColorManager.white
                      : ColorManager.greyColor,
                  borderColor: titleStyle != null
                      ? ColorManager.transparent
                      : ColorManager.white,
                  fontWeight: FontWeight.w400,
                  onPressed: onTap ?? () {},
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
