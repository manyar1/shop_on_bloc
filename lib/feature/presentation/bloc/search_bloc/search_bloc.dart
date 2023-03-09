import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_on_block/feature/domain/entities/food_entity.dart";
import "package:shop_on_block/feature/domain/usecases/search_food.dart";


part 'search_event.dart';
part 'search_state.dart';


class SearchFoodBloc extends Bloc<SearchFoodEvent, SearchFoodState>{
  final SearchFood searchFood;
  SearchFoodBloc({required this.searchFood}) : super(FoodEmpty()){
    _setupEvents();
   
  }
  void _setupEvents(){
       on<SearchFoodEvent>(_onSearchFood, transformer: droppable());
  }
}
void _onSearchFood(SearchFoodEvent event, Emitter emit){
      
}


// if(event is SearchFood){
//         emit( FoodSearchLoading());
//               // final failureOrFood = await searchFood(SearchFoodParams(title: event.foodQuery));
//       }
