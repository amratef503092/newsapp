import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/Commbonats/constant.dart';
import 'package:newsapp/shared/Commbonats/formField.dart';
import 'package:newsapp/shared/appCubit.dart';
import 'package:newsapp/shared/appStates.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var list = AppCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                buildFormField(onTap: (){

                }, functionValidate: (String value){
                  if(value.isEmpty){
                    return "Form is Empty";
                  }else{
                    return null;
                  }

                },
                    controller: searchController,
                    icon: Icons.search,
                    inputType: TextInputType.text,
                    label:"Search",
                    changed : (value){
                  AppCubit.get(context).getSearch(value);
                    }

                ),
                Expanded(
                  child: state is! LoadingState ? ListView.separated(physics: BouncingScrollPhysics(),itemBuilder: (ctx , index){
        return buildCardNews(list[index] , context);
        }, separatorBuilder: (ctx , index){
        return Container(
        color: Colors.grey,
        height: 4,
        );
        }, itemCount: list.length) :Center(child: CircularProgressIndicator())

      ,
                )
              ],
            ),
          ),
        );
      },

    );
  }
}
