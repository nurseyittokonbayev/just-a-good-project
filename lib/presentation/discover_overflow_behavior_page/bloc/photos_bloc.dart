import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';
import 'package:photo/data/apiClient/api_client.dart';
import 'package:photo/data/models/photo_models.dart';
import '../models/photos_models.dart';
part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc(this.apiService) : super(PhotosState()) {
    on<PhotosInitialEvent>(_handleInitialEvent);
  }

  final ApiService apiService;

  Future<void> _handleInitialEvent(
    PhotosEvent event,
    Emitter<PhotosState> emit,
  ) async {
    if (event is PhotosInitialEvent) {
      await _getPhotos(emit);
      await _getUsers(emit);
    }
  }

  Future<void> _getPhotos(Emitter<PhotosState> emit) async {
    final photos = await apiService.getPhotos();
    if (photos != null) {
      emit(state.copyWith(photosModel: photos));
    } else {
      emit(state.copyWith(photosModel: []));
    }
  }

  Future<void> _getUsers(Emitter<PhotosState> emit) async {
    final user = await apiService.getUsers();
    if (user != null) {
      emit(state.copyWith(userModel: user));
    } else {
      emit(state.copyWith(photosModel: []));
    }
  }
}
