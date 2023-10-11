import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/enities/article.dart';

abstract class ReomteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioError? error;

  const ReomteArticleState({this.articles, this.error});
  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticlesLoding extends ReomteArticleState {
  const RemoteArticlesLoding();
}

class RemoteArticleDone extends ReomteArticleState {
  const RemoteArticleDone(List<ArticleEntity> article)
      : super(articles: article);
}

class RemoteArticleError extends ReomteArticleState {
  const RemoteArticleError(DioError error) : super(error: error);
}
