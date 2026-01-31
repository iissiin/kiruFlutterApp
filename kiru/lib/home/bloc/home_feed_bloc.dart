import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/home/data/feed_data_repository.dart';
import 'package:kiru/models/app_image.dart';
import 'package:kiru/models/feed_tab.dart';

abstract class HomeFeedEvent {}

class HomeFeedFetchDataEvent extends HomeFeedEvent {
  final FeedTab tab;
  HomeFeedFetchDataEvent(this.tab);
}

class HomeFeedChangeTabEvent extends HomeFeedEvent {
  final FeedTab tab;
  HomeFeedChangeTabEvent(this.tab);
}

abstract class HomeFeedState {
  final FeedTab currentTab;
  HomeFeedState(this.currentTab);
}

class HomeFeedLoadingState extends HomeFeedState {
  HomeFeedLoadingState(super.tab);
}

class HomeFeedLoadedState extends HomeFeedState {
  final List<AppImageModel> images;

  HomeFeedLoadedState({required this.images, required FeedTab tab})
    : super(tab);
}

class HomeFeedErrorState extends HomeFeedState {
  final String message;

  HomeFeedErrorState({required this.message, required FeedTab tab})
    : super(tab);
}

class HomeFeedBloc extends Bloc<HomeFeedEvent, HomeFeedState> {
  final FeedDataRepository feedDataRepository;

  HomeFeedBloc(this.feedDataRepository)
    : super(HomeFeedLoadingState(FeedTab.recommendations)) {
    on<HomeFeedFetchDataEvent>(_onFetchData);
    on<HomeFeedChangeTabEvent>(_onChangeTab);
  }

  FutureOr<void> _onFetchData(
    HomeFeedFetchDataEvent event,
    Emitter<HomeFeedState> emit,
  ) async {
    emit(HomeFeedLoadingState(event.tab));
    try {
      final response = await feedDataRepository.fetchData(event.tab);
      emit(HomeFeedLoadedState(images: response, tab: event.tab));
    } catch (e) {
      emit(HomeFeedErrorState(message: e.toString(), tab: event.tab));
    }
  }

  FutureOr<void> _onChangeTab(
    HomeFeedChangeTabEvent event,
    Emitter<HomeFeedState> emit,
  ) async {
    emit(HomeFeedLoadingState(event.tab));

    try {
      final response = await feedDataRepository.fetchData(event.tab);
      emit(HomeFeedLoadedState(images: response, tab: event.tab));
    } catch (e) {
      emit(HomeFeedErrorState(message: e.toString(), tab: event.tab));
    }
  }
}
