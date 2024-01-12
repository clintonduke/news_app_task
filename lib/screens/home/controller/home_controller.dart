import 'package:news_app/all_package.dart';

class HomeController extends GetxController {
  News? news;
  List<Article> saved = [];
  bool loading = false;

  void updateLoading(bool val) {
    loading = val;
    update();
  }

  void alldataFetch({required String category}) async {
    updateLoading(true);

    Response res = await dioClient.dio.get('everything', queryParameters: {
      "apiKey": "f6c21e18107a4e7b8224a8e405b5d30b",
      "q": category,
      "sortBy": "popularity",
    });

    news = News.fromJson(res.data);

    updateLoading(false);
  }

  void saveArticle(Article article) async {
    // updateLoading(true);

    Map<String, dynamic>? data = await constants.jsonStore.getItem('saved');

    if (data != null) {
      data['saved'].add(article);
    } else {
      data = {};
      data.addEntries([
        MapEntry('saved', [article])
      ]);
    }

    await constants.jsonStore.setItem('saved', data);

    // updateLoading(false);
  }

  void getSaved() async {
    updateLoading(true);

    Map<String, dynamic>? data = await constants.jsonStore.getItem('saved');

    if (data != null) {
      saved = (data['saved'] as List<dynamic>)
          .map((a) => Article.fromJson(a))
          .toList();
    }

    updateLoading(false);
  }
}
