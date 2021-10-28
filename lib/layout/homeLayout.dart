import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/models/search/search_screen.dart';
import 'package:newsapp/shared/Commbonats/constant.dart';
import 'package:newsapp/shared/appCubit.dart';
import 'package:newsapp/shared/appStates.dart';
class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (BuildContext context ,  AppStates states){

      },
      builder: (BuildContext context ,  AppStates states){
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "${cubit.title[cubit.currentIndex]}",
            ),
            actions: [
              IconButton(onPressed: (){
                navigatorTo(context , SearchScreen());
              }
              , icon:Icon( Icons.search ,size: 30,)),
              IconButton(onPressed: (){
                cubit.changeAppMode(context);
              }
                  , icon:Icon( Icons.brightness_4 ,size: 30,))
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar:BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.change(index);
            },

          ) ,
        );
      },

    );
  }
}
