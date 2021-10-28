abstract class AppStates{
}
class InitialStates extends AppStates{}
class ChangeBottomsStates extends AppStates{}
class GetBusinessStateSuccessful extends AppStates{}
class GetBusinessStateError extends AppStates{
  final  String error;

  GetBusinessStateError(this.error);

}
class GetSportStateSuccessful extends AppStates{}
class GetSportStateError extends AppStates{
  final  String error;

  GetSportStateError(this.error);

}
class GetScienceStateSuccessful extends AppStates{}
class GetScienceStateError extends AppStates{
  final  String error;

  GetScienceStateError(this.error);

}
class LoadingState extends AppStates{}
class ChangeThemeMode extends AppStates{}
class GetSearchSuccessful extends AppStates{}
class GetSearchError extends AppStates{
  final  String error;

  GetSearchError(this.error);

}