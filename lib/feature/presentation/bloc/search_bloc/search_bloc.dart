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
    final prevState = state;
    if (prevState is! FoodSearchLoaded) {
      log('illegal ${state.runtimeType} for ${event.runtimeType}');
      return;
    }
    final foundFoods = prevState.foods.where((food) {
      final nameSplits = food.title.toLowerCase().split(' ');
      final searchSplits = event.foodTitle.toLowerCase().split(' ')
        ..removeWhere((searchSplit) => searchSplit.isEmpty);
      final checks = <bool>[];
      for (final nameSplit in nameSplits) {
        bool passed = false;
        for (final searchSplit in searchSplits) {
          if (nameSplit.contains(searchSplit)) {
            passed = true;
          }
        }
        checks.add(passed);
      }
      List<bool> isFounds = [];
      isFounds = checks.where((check) => check).toList();
      return isFounds.length >= searchSplits.length;
    }).toList();
    emit(prevState.copyWith(foundFoods: foundFoods, search: event.foodTitle));

    // final failureOrFood =
    //     await searchFood(SearchFoodParams(title: event.foodTitle));
    log('FoodTitle: ${event.foodTitle}');
    // log('FailureOrFood: $failureOrFood');

    // failureOrFood.fold(
    //     (failure) => _onStateFailure(emit, failure as String),
    //     (food) => _onGetFoodSuccessful(emit, food));
  }
  // void _onStateFailure(Emitter emit, String failure) async{
  //   emit(FoodSearchError(message: failure));
  // }
  // void _onGetFoodSuccessful( Emitter emit, List<FoodEntity> food) async{

  //   emit(FoodSearchLoaded(foods: food));

  // }
}
