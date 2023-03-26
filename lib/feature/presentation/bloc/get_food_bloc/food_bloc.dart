import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/core/error/failure.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/usecases/get_all_food.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<GetFoodEvent, GetFoodState> {
  final GetAllFoodUseCase getAllFood;
  FoodBloc(this.getAllFood) : super(GetFoodEmpty()) {
    _setupEvents();
  }
  void _setupEvents() {
    on<GetFoodEvent>(_onGetFood, transformer: droppable());
  }

  Future<void> _onGetFood(FoodEvent event, Emitter emit) async {
    final response = await getAllFood(const PageFoodParams());
    await response.fold((failure) => _onStateFailure(emit, failure),
        (foods) => _onGetFoodSuccessful(emit, foods));
  }

  Future<void> _onStateFailure(Emitter emit, Failure failure) async {
    emit(FoodError(failure: failure));
  }

  Future<void> _onGetFoodSuccessful(
      Emitter emit, List<FoodEntity> foods) async {
    emit(GetFoodLoaded(foods));
  }
}
