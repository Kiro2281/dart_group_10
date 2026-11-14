part of 'cat_bloc.dart';

@immutable
sealed class CatState {}

final class CatInitial extends CatState {}

final class LoadingCat extends CatState {}

final class LoadedCat extends CatState {
  new({required this.img});

  final String img;
}

final class ErrorCat extends CatState {}
