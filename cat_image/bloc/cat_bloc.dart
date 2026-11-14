import 'package:bloc/bloc.dart';
import 'package:flutter_project_4/data/reposiroty/animal_cat_repository.dart';
import 'package:meta/meta.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final AnimalCatRepository repository = AnimalCatRepository();
  CatBloc() : super(CatInitial()) {
    on<CatEvent>((event, emit) async {
      try{
        emit(LoadingCat());
        final String img = await repository.getCatImage();
        emit(LoadedCat(img: img));
      }
      catch (e){
        emit(ErrorCat());
      }
    });
  }
}
