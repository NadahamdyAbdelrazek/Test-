import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revision/src/core/constants/extensions.dart';
import 'package:revision/src/core/routes/routes_manager.dart';
import '../../../../../../core/constants/color_manager.dart';
import '../../../../../../core/constants/string_manager.dart';
import '../../../../../../core/services/dependency_injection_service.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../../../../../core/widgets/loading_widget.dart';
import '../../../../../../core/widgets/text_input_widget.dart';
import '../../../../../../core/widgets/text_widget.dart';
import '../../bloc/login_bloc.dart';

class FormAuthBody extends StatelessWidget {
  const FormAuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.requestState.isLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const LoadingWidget(),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: state.formKey,

          child: Padding(
            padding: context.paddingAll(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Center(
                  child: TextWidget(
                    StringManager.signIn,
                    style: context.bodyMedium.bold.colorExt(ColorManager.white),
                  ),
                ),
                10.hBox,
                TextWidget(
                  StringManager.email,
                  style: context.bodyMedium.bold.colorExt(ColorManager.white),
                ),
                10.hBox,

                TextInputWidget(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  title: StringManager.email,
                  StringManager.enterEmail,
                  controller: state.phoneControllerNew,
                  suffixIconConstraints: const BoxConstraints(
                    minWidth: 20,
                    maxWidth: 20,
                    minHeight: 20,
                    maxHeight: 20,
                  ),
                  suffixColor: ColorManager.greyColor,
                  contentPadding: context.paddingSymmetric(horizontal: 10),
                  onChanged: (value) {},
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringManager.requiredField;
                    }

                    final emailRegex = RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$");
                    if (!emailRegex.hasMatch(value)) {
                      return 'Email address is incorrect';
                    }

                    return null;
                  },
                  onPressed: () {},
                ),
                30.hBox,
                TextWidget(
                  StringManager.password,
                  style: context.bodyMedium.bold.colorExt(ColorManager.white),
                ),
                10.hBox,

                TextInputWidget(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  title: StringManager.enterPassword,
                  StringManager.enterPassword,
                  controller: state.passwordController,
                  suffixIcon: state.suffixIcon,
                  suffixIconConstraints: const BoxConstraints(
                    minWidth: 20,
                    maxWidth: 20,
                    minHeight: 20,
                    maxHeight: 20,
                  ),
                  suffixColor: ColorManager.greyColor,
                  isPassword: state.isPassword,
                  contentPadding: context.paddingSymmetric(horizontal: 10),
                  onChanged: (value) {},
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringManager.requiredField;
                    }
                    return null;
                  },
                  onPressed: () {},
                ),
                10.hBox,

                Align(
                  alignment: Alignment.bottomRight,
                  child: TextWidget(
                    StringManager.forgetPassword,
                    style: context.bodyMedium.bold.colorExt(ColorManager.white),
                  ),
                ),
                90.hBox,
               ButtonWidget(
                  onPressed: () {
                    if (state.formKey.currentState!.validate()) {
                      di<LoginBloc>().add(
                        LoginSubmittedEvent(
                          onSuccess: () {
                            Navigator.pushNamed(context, Routes.home);
                          },
                        ),
                      );
                    }
                  },
                  title: StringManager.login,
                  titleColor: ColorManager.backgroundColor,
                )

              ],
            ),
          ),
        );
      },
    );
  }
}
