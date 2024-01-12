import 'package:flutter/material.dart';
import 'package:news_app/all_package.dart';
import 'package:news_app/screens/home/view/newspage.dart';

class NewsListPage extends StatefulWidget {
  final String category;
  const NewsListPage({super.key, required this.category});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeController.alldataFetch(category: widget.category);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (context) {
        return Scaffold(
          body: homeController.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    itemCount: (homeController.news?.articles ?? []).length,
                    itemBuilder: (context, index) {
                      Article article =
                          (homeController.news?.articles ?? [])[index];
                      // print('ARTICLE: ${article}');
                      // return ListTile(
                      //   title: Text(article.title),
                      //   leading: Image.network(
                      //     article.urlToImage,
                      //     height: 50,
                      //     width: 50,
                      //     errorBuilder: (context, error, stackTrace) => SizedBox.square(
                      //       dimension: 50,
                      //       child: Icon(
                      //         Icons.image,
                      //       ),
                      //     ),
                      //   ),
                      // );
                      return InkWell(
                        onTap: () {
                          Get.to(() => NewsPage(article: article));
                        },
                        child: SizedBox(
                          height: 0.45.sh,
                          width: 0.8.sw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                article.urlToImage,
                                height: 0.3.sh,
                                width: 0.8.sw,
                                errorBuilder: (context, error, stackTrace) =>
                                    SizedBox(
                                  height: 0.3.sh,
                                  width: 0.8.sw,
                                  child: const Icon(
                                    Icons.image,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  height: 0.1.sh,
                                  child: Text(
                                    article.title,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "- " + article.author,
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
