import 'package:flutter/material.dart';
import 'package:news_app/all_package.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  final Article article;
  const NewsPage({super.key, required this.article});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              homeController.saveArticle(widget.article);
            },
            icon: Icon(Icons.bookmark),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 0.8.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  widget.article.urlToImage,
                  height: 0.3.sh,
                  width: 0.8.sw,
                  errorBuilder: (context, error, stackTrace) => SizedBox(
                    height: 0.3.sh,
                    width: 0.8.sw,
                    child: const Icon(
                      Icons.image,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    widget.article.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(child: Text(widget.article.description)),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse(widget.article.url),
                          mode: LaunchMode.inAppWebView);
                    },
                    child: Text(
                      "View Full Story",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
