import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/enities/article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/reomte_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/reomte_article_state.dart';
import 'package:news_app/features/daily_news/presentation/widgets/article_titel.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
        actions: [
          IconButton.outlined(
            onPressed: () => _onShowSavedArticlesViewTapped(context),
            icon: const Icon(Icons.bookmark),
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<ReomteArticleBloc, ReomteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoding) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RemoteArticleError) {
          return const Center(child: Icon(Icons.error));
        }
        if (state is RemoteArticleDone) {
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles![index],
                onArticlePressed: (article) =>
                    _onArticlePressed(context, article),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
