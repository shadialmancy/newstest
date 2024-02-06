import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_2/controller/article_state.dart';
import 'package:flutter_application_2/model/article_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleModel searchModel1 = ArticleModel(articles: []);
  ArticleModel searchModel2 = ArticleModel(articles: []);

  ArticleCubit() : super(ArticleInitial());

  searchResult(String value) async {
    try {
      emit(ArticleLoading());
      Dio dio = Dio();
      var response = await dio.get(
          "https://newsapi.org/v2/everything?q=$value&from=2024-02-05&to=2024-02-05&sortBy=popularity&apiKey=02ba270d45854f48ab8c125025e5f94b");
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        searchModel1 = ArticleModel.fromJson(response.data);
        log(searchModel1.articles!.length.toString());
        emit(ArticleResult());
      } else {
        emit(ArticleFailed());
      }
    } catch (e) {
      log(e.toString());
      emit(ArticleError());
    }
  }

  search2Result(String value) async {
    try {
      emit(ArticleLoading());
      Dio dio = Dio();
      var response = await dio.get(
          "https://newsapi.org/v2/everything?q=$value&from=2024-02-05&to=2024-02-05&sortBy=popularity&apiKey=02ba270d45854f48ab8c125025e5f94b");
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        searchModel2 = ArticleModel.fromJson(response.data);
        log("messig" + searchModel1.articles!.length.toString());
        emit(ArticleResult());
      } else {
        emit(ArticleFailed2());
      }
    } catch (e) {
      log(e.toString());
      emit(ArticleError2());
    }
  }
}
