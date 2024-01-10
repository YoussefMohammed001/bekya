part of 'product_details_cubit.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}
class ProductDetailsLoading extends ProductDetailsState {}
class ProductDetailsSuccess extends ProductDetailsState {}
class ProductDetailsFailure extends ProductDetailsState {}
