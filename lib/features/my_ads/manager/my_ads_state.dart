part of 'my_ads_cubit.dart';

@immutable
abstract class MyAdsState {}

class MyAdsInitial extends MyAdsState {}
class MyAdsLoading extends MyAdsState {}
class MyAdsSuccess extends MyAdsState {}
class MyAdsFailure extends MyAdsState {}
