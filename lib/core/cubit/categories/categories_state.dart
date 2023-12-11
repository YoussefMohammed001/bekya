part of 'categories_cubit.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}
class GetCatLoading extends CategoriesState {}
class GetCatSuccess extends CategoriesState {}
class GetCatFailure extends CategoriesState {}
