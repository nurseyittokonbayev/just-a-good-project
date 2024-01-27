import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo/data/apiClient/api_client.dart';
import 'package:photo/data/models/photo_models.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.apiService) : super(SearchInitial()) {
    on<SearchEvent>(_getPhotos);
  }
  final ApiService apiService;

  Future<void> _getPhotos(
    SearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    try {
      final photos = await apiService.getPhotos();
      if (photos != null) {
        emit(SearchSuccess(photos: photos));
      } else {
        emit(SearchError(message: 'Комментарии пуст'));
      }
    } catch (e) {
      emit(SearchError(message: 'Не удалось получить комментарии: $e'));
    }
  }
}
