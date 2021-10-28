import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/network/dio_helper.dart';
import 'package:newsapp/shared/Commbonats/constant.dart';
import 'package:newsapp/shared/appCubit.dart';
import 'package:newsapp/shared/appStates.dart';

class Business extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var list = AppCubit.get(context).business;
        return state is! LoadingState ? ListView.separated(physics: BouncingScrollPhysics(),itemBuilder: (ctx , index){
          return buildCardNews(list[index] , context);
        }, separatorBuilder: (ctx , index){
          return Container(
            color: Colors.grey,
            height: 4,
          );
        }, itemCount: list.length) :Center(child: CircularProgressIndicator());
      },
    );
  }
}
