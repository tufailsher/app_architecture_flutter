import 'package:custody_rx/models/news/news_list_main.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NewsState {}
//This is innitial state of bloc
class NewsInitial extends NewsState {}
//This is the loading state of bloc
class NewsPageLoading extends NewsState {}
//This is the success state of bloc
class NewsPageLoaded extends NewsState {
  late final NewsListMain data;
  NewsPageLoaded(this.data);
}
//This is the error state of bloc
class NewsPageError extends NewsState {
  late final String errorMessage;
  NewsPageError(this.errorMessage);
}


