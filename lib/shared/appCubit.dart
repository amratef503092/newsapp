import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/models/Sitting/Settings.dart';
import 'package:newsapp/models/business/business.dart';
import 'package:newsapp/models/science/science.dart';
import 'package:newsapp/models/sports/sports.dart';
import 'package:newsapp/network/dio_helper.dart';
import 'package:newsapp/shared/appStates.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialStates());
  static AppCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0;

  List<dynamic> business = [];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "business"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: "sports"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: "science"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "Settings"
    ),
  ];

  List<Widget> screens = [Business(), Sports(), Science(),Settings()];
  List title  = ["business" , "sports" , "science" , "Settings"];
  bool isDark = false;
  void changeAppMode(context){
    if(isDark == false){
      isDark = true;
      AdaptiveTheme.of(context).setLight();
    }else{
      isDark = false;
      AdaptiveTheme.of(context).setDark();
    }
    emit(ChangeThemeMode());
  }
  void change(int value){

    currentIndex = value;
    if(value == 1 ){
      getSport();
    }
    if(value == 2){
      getScience();
    }
    emit(ChangeBottomsStates());
  }

  void getBusiness(){
    emit(LoadingState());

    DioHelper.getData(url: 'v2/top-headlines',
        query: {
          "country" :"eg",
          "category" :"business",
          'apiKey' : '692ccd18c2004330869f5167a5c4ec71'
        }).then((value) {
      business = value.data['articles'];
      emit(GetBusinessStateSuccessful());

      print(value.data.toString());
      emit(GetBusinessStateSuccessful());

    }).catchError((onError){
      emit(GetBusinessStateError(onError));
      print(onError.toString());
    });
  }
  List<dynamic> sport = [];

  void getSport(){
    emit(LoadingState());

   if(sport.length == 0){
     DioHelper.getData(url: 'v2/top-headlines',
         query: {
           "country" :"eg",
           "category" :"sport",
           'apiKey' : '692ccd18c2004330869f5167a5c4ec71'
         }).then((value) {
       sport = value.data['articles'];
       emit(GetSportStateSuccessful());

       print(value.data.toString());
       emit(GetSportStateSuccessful());

     }).catchError((onError){
       emit(GetSportStateError(onError));
       print(onError.toString());
     });
   }else{       emit(GetSportStateSuccessful());


   }
  }
  List<dynamic> science = [];

  void getScience(){
    emit(LoadingState());

   if(science.length ==0){
     DioHelper.getData(url: 'v2/top-headlines',
         query: {
           "country" :"eg",
           "category" :"science",
           'apiKey' : '692ccd18c2004330869f5167a5c4ec71'
         }).then((value) {
       science = value.data['articles'];
       emit(GetScienceStateSuccessful());

       print(value.data.toString());
       emit(GetScienceStateSuccessful());

     }).catchError((onError){
       emit(GetScienceStateError(onError));
       print(onError.toString());
     });
   }else{
     emit(GetScienceStateSuccessful());

   }
  }
  List<dynamic> search = [];
//https://newsapi.org/v2/everything?q=tesla&apiKey=692ccd18c2004330869f5167a5c4ec71
  void getSearch(String value) {
    emit(LoadingState());

    DioHelper.getData(url: 'v2/everything',
        query: {
          "q": "$value",
          'apiKey': '692ccd18c2004330869f5167a5c4ec71'
        }).then((value) {
      search = value.data['articles'];
      emit(GetSearchSuccessful());

      print(value.data.toString());
      emit(GetSportStateSuccessful());
    }).catchError((onError) {
      emit(GetSearchError(onError));
      print(onError.toString());
    });
  }

}


