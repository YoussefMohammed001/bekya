part of 'user_ads_cubit.dart';

@immutable
abstract class UserAdsState {}

class UserAdsInitial extends UserAdsState {}
class UserAdsLoading extends UserAdsState {}
class UserAdsSuccess extends UserAdsState {}
class UserAdsFailure extends UserAdsState {}
