import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:shop_on_block/ui/widget/home_page_widgets/search_result.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate() : super(searchFieldLabel: 'Поиск еды...');

  final _suggestions = ['Доннер - кебаб', 'Картошка фри'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      onPressed: () => close(context, null)
      , icon:  const Icon(Icons.arrow_back_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<SearchFoodBloc>(context, listen: false).add(FoodSearch(query));
    log('Inside custom search delegate and search query is $query');
    return BlocBuilder<SearchFoodBloc, SearchFoodState>(builder: (context, state){
      if(state is FoodSearchLoading){
        return _loadingindicator();
      }
      else if (state is FoodSearchLoaded){
        final food = state.foods;
        log('-------$food');
        if(food.isEmpty){
          return _showErrorText('Не найдено такой еды');
        }
        return ListView.builder(
          itemCount: food.isNotEmpty ? food.length:0,
          itemBuilder: (context, int index){
            FoodEntity result = food[index];
            return SearchResult(foodResult: result);
          });
      }
      else if(state is FoodSearchError){
        return _showErrorText(state.message);
      }
      else{
        return const Center(
          child: Icon(Icons.now_wallpaper),
        );
      }
    } 
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty){
      return Container();
    }
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index){
      
      return Text(
        _suggestions[index],
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),

      );
    }, separatorBuilder: (context, index){
      return const Divider();
    }, itemCount: _suggestions.length);
  }
}

Widget _showErrorText(String errorMessage){
  return Container(
    color: Colors.black,
    child: Center(child: Text(
      errorMessage, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    )),
  );
}
Widget _loadingindicator() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
