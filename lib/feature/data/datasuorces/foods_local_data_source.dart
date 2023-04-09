import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';

abstract class FoodsLocalDataSource {
  Future<List<FoodEntity>> getCachedNews();
  Future<void> setNewsToCache(List<FoodEntity> foods);
}

class FoodsLocalDataSourceImpl implements FoodsLocalDataSource {
  final SharedPreferences sharedPreferences;

  FoodsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<List<FoodEntity>> getCachedNews() async {
    final cachedFoodList = sharedPreferences.getStringList('CACHED_FOODS_LIST');
    log(cachedFoodList.toString());
    if (cachedFoodList == null || cachedFoodList.isEmpty) return Future.value([]);
    
    return Future.value(cachedFoodList.map((jsonNews) => FoodEntity.fromJson(json.decode(jsonNews))).toList());
  }

  @override
  Future<void> setNewsToCache(List<FoodEntity> foods) async {
    final cachedFoodList = foods.map((foods) => json.encode(foods.toJson())).toList();
  log('1111');
    await sharedPreferences.setStringList('CACHED_FOODS_LIST', cachedFoodList);
    log('News to write Cache: ${cachedFoodList.length}');
  }
}
