import 'package:flutter/material.dart';
import 'package:mvvm_architecture/data/response/status.dart';
import 'package:mvvm_architecture/utils/Routes/routesname.dart';
import 'package:mvvm_architecture/utils/Routes/utils.dart';
import 'package:mvvm_architecture/view_model/home_view_model.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeviewmodel = HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeviewmodel.FetchMovielist();
  }

  @override
  Widget build(BuildContext context) {
    final userpreference = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: const Center(child: Text('Movies List')),
          actions: [
            InkWell(
              onTap: () {
                userpreference.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Center(child: Text('Logout')),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: ChangeNotifierProvider(
          create: (BuildContext context) => homeviewmodel,
          child: Consumer<HomeViewModel>(
            builder: (context, value, _) {
              switch (value.movieslist.status) {
                case Status.LOADING:
                  return Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(
                      child: Text(value.movieslist.message.toString()));
                case Status.COMPLETE:
                  return ListView.builder(
                      itemCount: value.movieslist.data!.movies!.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          leading: Image.network(
                            value.movieslist.data!.movies![index].posterurl
                                .toString(),
                            errorBuilder: (context, error, stack) {
                              return const Icon(
                                Icons.error,
                                color: Colors.red,
                              );
                            },
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                          title: Text(value
                              .movieslist.data!.movies![index].title
                              .toString()),
                          subtitle: Text(value
                              .movieslist.data!.movies![index].year
                              .toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(utils
                                  .averageRating(value
                                      .movieslist.data!.movies![index].ratings!)
                                  .toStringAsFixed(1)),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ));
                      });
                default:
                  return Text("Error");
              }
              // return Container();
            },
          ),
        ));
  }
}
