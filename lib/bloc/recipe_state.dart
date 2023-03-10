part of 'recipe_bloc.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeFailed extends RecipeState {
  final String e;
  const RecipeFailed(this.e);

  @override
  List<Object> get props => [e];
}

class RecipeSuccess extends RecipeState {
  final List<RecipeModel> listRecipe;
  const RecipeSuccess(this.listRecipe);

  @override
  List<Object> get props => [listRecipe];
}
