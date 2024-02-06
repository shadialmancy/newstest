import 'package:flutter_application_2/controller/article_state.dart';
import 'package:flutter_application_2/model/article_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleModel searchModel1 = ArticleModel();
  ArticleModel searchModel2 = ArticleModel();

  ArticleCubit() : super(ArticleInitial()) {}
}
