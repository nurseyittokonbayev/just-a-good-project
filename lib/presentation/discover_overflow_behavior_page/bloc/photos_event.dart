part of 'photos_bloc.dart';

@immutable
abstract class PhotosEvent extends Equatable {}

class PhotosInitialEvent extends PhotosEvent {
  @override
  List<Object?> get props => [];
}
