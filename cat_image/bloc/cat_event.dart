part of 'cat_bloc.dart';

@immutable
sealed class CatEvent {}

class LoadCatImageEvent extends CatEvent{}
