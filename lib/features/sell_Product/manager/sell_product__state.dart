part of 'sell_product__cubit.dart';

abstract class SellProductState {}

class SellProductInitial extends SellProductState {}
class SellProductLoading extends SellProductState {}
class SellProductSuccess extends SellProductState {}
class SellProductFailure extends SellProductState {}
