import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_on_block/feature/domain/entities/food_entity.dart";
import "package:shop_on_block/feature/domain/usecases/search_food.dart";

part 'search_event.dart';
part 'search_state.dart';


class SearchFoodBloc extends Bloc<SearchFoodEvent, SearchFoodState>{
  final SearchFood searchFood;
  SearchFoodBloc(this.searchFood) : super(FoodEmpty()){
    on<SearchFoodEvent>((event, emit) async {
      if(event is SearchFood){
        emit( FoodSearchLoading());
              // final failureOrFood = await searchFood(SearchFoodParams(title: event.foodQuery));
      }

    });
  }
}
