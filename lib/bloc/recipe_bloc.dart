import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_ecipe/model/recipe_model.dart';
import 'package:simple_ecipe/service/recipe_service.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial()) {
    on<RecipeEvent>((event, emit) async {
      try {
        emit(RecipeLoading());

        final recipeList = await RecipeService().getRecipe();
        emit(RecipeSuccess(recipeList));
      } catch (e) {
        print(e);
        emit(RecipeFailed(e.toString()));
      }
    });
  }
}
