import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/network/dio_helper.dart';
import 'package:newsapp/shared/Commbonats/constant.dart';
import 'package:newsapp/shared/appCubit.dart';
import 'package:newsapp/shared/appStates.dart';
import 'package:newsapp/shared/shared_preferences.dart';

import 'layout/homeLayout.dart';
import 'shared/blocObServer/blocObServer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  CacheHelper.init();

  runApp(Myapp());
}
class Myapp extends StatelessWidget {
   bool? isMode = CacheHelper.getData(key: 'isDark') ==null? false :CacheHelper.getData(key: 'isDark');

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:  (context) => AppCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()..getBusiness(),
        )
      ],
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return AdaptiveTheme(
              light: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  appBarTheme:AppBarTheme(
                      backgroundColor: Colors.white,
                      centerTitle: true,
                      elevation: 0,
                      iconTheme: IconThemeData(
                          color: Colors.black
                      ),

                      backwardsCompatibility: false,
                      systemOverlayStyle : SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          statusBarIconBrightness: Brightness.dark

                      ),
                      titleTextStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold

                      )
                  ),
                  textTheme:TextTheme(
                      bodyText1: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )
                  ) ,
                  scaffoldBackgroundColor: Colors.white,

                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: Colors.white,
                      selectedItemColor: Colors.deepOrange,
                      unselectedItemColor: Colors.grey

                  )
              ),
              dark: ThemeData(
                  scaffoldBackgroundColor : HexColor("#15202B"),
                  primarySwatch: Colors.deepOrange,
                  appBarTheme:AppBarTheme(
                      titleSpacing: 20,
                      backgroundColor: HexColor("#15202B"),
                      elevation: 2,

                      backwardsCompatibility: false,
                      systemOverlayStyle : SystemUiOverlayStyle(
                          statusBarColor: HexColor("#15202B"),
                          statusBarIconBrightness: Brightness.light

                      ),
                      titleTextStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                      iconTheme: IconThemeData(
                          color: Colors.white
                      )
                  ),
                  textTheme:TextTheme(
                      bodyText1: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )
                  ) ,

                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: HexColor("#15202B"),
                      selectedItemColor:Colors.blue,
                      unselectedItemColor: Colors.white

                  )
              ),
              initial: AppCubit.get(context).isDark? AdaptiveThemeMode.dark :AdaptiveThemeMode.light  ,
              builder: (theme, darkTheme) => MaterialApp(

                theme: theme,
                darkTheme: darkTheme,

                debugShowCheckedModeBanner: false,
                home: HomeLayout(),
              ),



          );
        },

      ),
    );
  }
}
