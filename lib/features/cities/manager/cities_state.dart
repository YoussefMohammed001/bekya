part of 'cities_cubit.dart';

@immutable
abstract class CitiesState {}

class CitiesInitial extends CitiesState {}
class CitiesLoading extends CitiesState {}
class CitiesSuccess extends CitiesState {}
class CitiesFailure extends CitiesState {}
