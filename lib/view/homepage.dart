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
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: search1Controller,
                  onSubmitted: (value) async {
                    if (value.isNotEmpty) {
                      await context
                          .read<ArticleCubit>()
                          .searchResult(search1Controller.text);
                    }
                  },
                ),
                TextField(
                  controller: search2Controller,
                  onSubmitted: (value) async {
                    if (value.isNotEmpty) {
                      await context
                          .read<ArticleCubit>()
                          .search2Result(search2Controller.text);
                    }
                  },
                ),
                state is ArticleError || state is ArticleFailed
                    ? const Text("Error try again later")
                    : state is ArticleResult
                        ? ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return context
                                      .read<ArticleCubit>()
                                      .searchModel1
                                      .articles!
                                      .isNotEmpty
                                  ? Column(
                                      children: [
                                        Text(
                                            "author : ${context.read<ArticleCubit>().searchModel1.articles![index].author}"),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "description : ${context.read<ArticleCubit>().searchModel1.articles![index].description}"),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "publishedAt : ${context.read<ArticleCubit>().searchModel1.articles![index].publishedAt}"),
                                      ],
                                    )
                                  : const Text("Result is empty");
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                color: Colors.black,
                              );
                            },
                            itemCount: context
                                    .read<ArticleCubit>()
                                    .searchModel1
                                    .articles!
                                    .isNotEmpty
                                ? context
                                    .read<ArticleCubit>()
                                    .searchModel1
                                    .articles!
                                    .length
                                : 1)
                        : state is ArticleLoading
                            ? const CircularProgressIndicator()
                            : const Text("Result is empty"),
                state is ArticleError2 || state is ArticleFailed2
                    ? const Text("Error try again later")
                    : state is ArticleResult
                        ? ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return context
                                      .read<ArticleCubit>()
                                      .searchModel2
                                      .articles!
                                      .isNotEmpty
                                  ? Column(
                                      children: [
                                        Text(
                                            "author : ${context.read<ArticleCubit>().searchModel2.articles![index].author}"),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "description : ${context.read<ArticleCubit>().searchModel2.articles![index].description}"),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "publishedAt : ${context.read<ArticleCubit>().searchModel2.articles![index].publishedAt}"),
                                      ],
                                    )
                                  : const Text("Result is empty");
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                color: Colors.black,
                              );
                            },
                            itemCount: context
                                    .read<ArticleCubit>()
                                    .searchModel2
                                    .articles!
                                    .isNotEmpty
                                ? context
                                    .read<ArticleCubit>()
                                    .searchModel2
                                    .articles!
                                    .length
                                : 1)
                        : state is ArticleLoading
                            ? const CircularProgressIndicator()
                            : const Text("Result is empty")
              ],
            ),
          ),
        );
      },
    );
  }
}
