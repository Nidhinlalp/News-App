part of 'reomte_article_bloc.dart';

abstract class ReomteArticleEvent {
  const ReomteArticleEvent();
}

class GetArticles extends ReomteArticleEvent {
  const GetArticles();
}
