import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:custody_rx/bloc/news_bloc/news_event.dart';
import 'package:custody_rx/bloc/news_bloc/news_state.dart';
import 'package:custody_rx/models/news/news_list_main.dart';
import 'package:custody_rx/repository/news_repo_impl.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  //News repo instance
  final _newsRepo = NewsRepoImp();

  NewsBloc() : super(NewsInitial()) {
    on<NewsFetchDataEvent>(_fetchNewsList);
  }

  FutureOr<void> _fetchNewsList(NewsEvent event, Emitter<NewsState> emit) async {
    // if(event is NewsFetchDataEvent) {
    //   emit(NewsPageLoading());
    //   await _newsRepo
    //       .getNewsData(event.countryCode, event.newsType)
    //       .onError((error, stackTrace) => emit(NewsPageError(error.toString())))
    //       .then((value) {
    //     NewsListMain newsListMain = NewsListMain.fromJson(value);
    //     if (newsListMain.status == "ok") {
    //       emit(NewsPageLoaded(newsListMain));
    //     } else {
    //       emit(NewsPageError(newsListMain.message));
    //     }
    //   });
    // }
  }
}