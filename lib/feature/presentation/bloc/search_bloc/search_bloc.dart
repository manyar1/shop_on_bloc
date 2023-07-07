import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/usecases/search_food.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchFoodBloc extends Bloc<SearchFoodEvent, SearchFoodState> {
  final SearchFoodUseCase searchFood;
  SearchFoodBloc(this.searchFood) : super(FoodEmpty()) {
    _setupEvents();
  }
  void _setupEvents() {
    on<FoodSearch>(_onSearchFood, transformer: droppable());
  }

  Future<void> _onSearchFood(FoodSearch event, Emitter emit) async {
    emit(FoodSearchLoading());
    final failureOrFood = await searchFood(SearchFoodParams(title: event.foodTitle));
    log(failureOrFood.toString());
    failureOrFood.fold(
        (failure) => emit(const FoodSearchError(message: 'Ошибка')), (food) => emit(FoodSearchLoaded(foods: food)));
  }
}
