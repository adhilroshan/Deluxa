import 'package:tmdb_api/tmdb_api.dart';
import '../auth/auth.dart';

class ApiConnect {
  Future<void> main(List<String> args) async {
    //api with out console logs
    final tmdb = TMDB(ApiKeys(myApiKey, myRAT));
    print(await tmdb.v3.movies.getPouplar());

    //api with showing all console logs
    final tmdbWithLogs = TMDB(
      ApiKeys(myApiKey, myRAT),
      logConfig: ConfigLogger.showAll(),
    );
    print(await tmdbWithLogs.v3.movies.getPouplar());

    //api with showing all console logs
    final tmdbWithCustomLogs = TMDB(
      ApiKeys(myApiKey, myRAT),
      logConfig: ConfigLogger(
        //must be true than only all other logs will be shown
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    print(await tmdbWithCustomLogs.v3.movies.getPouplar());
  }
}
