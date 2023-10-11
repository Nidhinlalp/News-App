// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:news_app/core/resources/data_state.dart';

import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/reomte_article_state.dart';

part 'reomte_article_event.dart';

class ReomteArticleBloc extends Bloc<ReomteArticleEvent, ReomteArticleState> {
  final GetArticleUseCase _articleUseCase;
  ReomteArticleBloc(
    this._articleUseCase,
  ) : super(const RemoteArticlesLoding()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<ReomteArticleState> emit) async {
    final dataState = await _articleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message.toString());
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
