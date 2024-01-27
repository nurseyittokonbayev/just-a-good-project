part of 'photos_bloc.dart';

class PhotosState extends Equatable {
  PhotosState({this.userModel, this.photosModel});

  final List<UserModels>? userModel;
  final List<PhotosModels>? photosModel;

  @override
  List<Object?> get props => [userModel, photosModel];

  PhotosState copyWith({
    List<UserModels>? userModel,
    List<PhotosModels>? photosModel,
  }) {
    return PhotosState(
      userModel: userModel ?? this.userModel,
      photosModel: photosModel ?? this.photosModel,
    );
  }
}
