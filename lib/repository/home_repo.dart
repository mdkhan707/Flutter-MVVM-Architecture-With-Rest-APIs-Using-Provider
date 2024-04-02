import 'package:mvvm_architecture/data/network/baseapisevice.dart';
import 'package:mvvm_architecture/data/network/networkapiservice.dart';
import 'package:mvvm_architecture/models/movies_model.dart';
import 'package:mvvm_architecture/resources/app_url.dart';

class HomeRepo {
  BaseApiServise apiServices = NetworkApiService();

  Future<MovieListModel> FetchMovieslistApi() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(AppUrl.movieurl);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
