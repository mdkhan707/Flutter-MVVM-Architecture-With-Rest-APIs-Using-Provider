import 'package:flutter/material.dart';
import 'package:mvvm_architecture/data/response/api_response.dart';
import 'package:mvvm_architecture/models/movies_model.dart';
import 'package:mvvm_architecture/repository/home_repo.dart';

class HomeViewModel with ChangeNotifier {
  final repo = HomeRepo();
  ApiReponse<MovieListModel> movieslist = ApiReponse.loading();

  setMovielist(ApiReponse<MovieListModel> response) {
    movieslist = response;
    notifyListeners();
  }

  Future<void> FetchMovielist() async {
    setMovielist(ApiReponse.loading());
    repo.FetchMovieslistApi().then((value) {
      setMovielist(ApiReponse.completed(value));
    }).onError((error, stackTrace) {
      setMovielist(ApiReponse.error(error.toString()));
    });
  }
}
