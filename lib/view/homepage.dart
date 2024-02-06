import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/article_cubit.dart';
import 'package:flutter_application_2/controller/article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search1Controller = TextEditingController();
  TextEditingController search2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: search1Controller,
                ),
                TextField(
                  controller: search2Controller,
                ),
                ListView.separated(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                              "author : ${context.read<ArticleCubit>().searchModel1.articles![index].author}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "description : ${context.read<ArticleCubit>().searchModel1.articles![index].description}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "publishedAt : ${context.read<ArticleCubit>().searchModel1.articles![index].publishedAt}"),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.black,
                      );
                    },
                    itemCount: context
                        .read<ArticleCubit>()
                        .searchModel1
                        .articles!
                        .length)
              ],
            ),
          ),
        );
      },
    );
  }
}
