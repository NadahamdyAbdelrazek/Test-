import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revision/src/core/constants/color_manager.dart';
import 'package:revision/src/core/constants/extensions.dart';
import 'package:revision/src/core/constants/string_manager.dart';
import 'package:revision/src/core/widgets/app_bar_widget.dart';
import 'package:revision/src/core/widgets/text_widget.dart';

import '../../../../../core/widgets/custoum_error_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: StringManager.hello,
        backgroundColor: ColorManager.backgroundColor,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.requestState.isLoading) {
            return LoadingWidget();
          }

          if (state.requestState.isError) {
            return  CustomErrorWidget(message: "Something Erorr",);
          }

          if (state.homeEntity == null || state.homeEntity!.isEmpty) {
            return const Center(child: TextWidget('No Data Found'));
          }


          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.homeEntity!.length,
                  itemBuilder: (context, index) {
                    final item = state.homeEntity![index];
                    return Container(
                      margin: context.paddingSymmetric(horizontal: 16, vertical: 8),
                      padding: context.paddingAll(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),

                      child: ListTile(
                        title: TextWidget(item.title??"",style: context.bodyMedium.bold.colorExt(ColorManager.black),),
                        subtitle: TextWidget(item.body??"",style: context.bodyMedium.colorExt(ColorManager.black.withValues(alpha: 0.4))),

                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}