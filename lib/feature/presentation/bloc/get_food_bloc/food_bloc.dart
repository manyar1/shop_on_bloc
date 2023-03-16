import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_on_block/feature/domain/entities/food_entity.dart";
import "package:shop_on_block/feature/domain/usecases/get_all_food.dart";

part 'food_event.dart';
part 'food_state.dart';

class GetFoodBlock extends Bloc<GetFoodEvent, GetFoodState>{
  final GetAllFood getAllFood;
  GetFoodBlock({required this.getAllFood}): super(GetFoodEmpty()){
    _setupEvents();
  }
  void _setupEvents() {
    on<FoodEvent>(_onGetFood, transformer: droppable());
  }
  void _onGetFood(FoodEvent event, Emitter emit)async{
    final prevState = state; 
    if(prevState is GetFoodLoading) return;
    var oldFood = <FoodEntity>[];
    if(prevState is GetFoodLoaded){
      oldFood = prevState.foodsList;
    }
    emit(GetFoodLoading(oldFood));
  }
}