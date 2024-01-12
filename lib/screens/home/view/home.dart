import 'package:flutter/material.dart';
import 'package:news_app/all_package.dart';
import 'package:news_app/screens/home/view/savedlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController homeTabbar;
  List<String> selectedChips = [];

  @override
  void initState() {
    super.initState();
    homeTabbar = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          HomeStrings.todayNews,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: const Icon(Icons.newspaper_outlined),
        actions: [
          TextButton(
            onPressed: () {
              Get.to(() => const SavedListPage());
            },
            child: const Text('Saved\t\t\t'),
          )
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: homeTabbar,
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle:
                const TextStyle(color: Colors.black, fontSize: 15),
            labelStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.all(7),
            indicator: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Colors.redAccent, Colors.orangeAccent]),
                borderRadius: BorderRadius.circular(50),
                color: Colors.redAccent),
            indicatorWeight: 1,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Sports'),
              Tab(text: 'Business'),
              Tab(text: 'Politics'),
              Tab(text: 'WorldNews'),
            ],
          ),
          Expanded(
            child: TabBarView(controller: homeTabbar, children: const [
              NewsListPage(
                category: 'all',
              ),
              NewsListPage(
                category: 'sports',
              ),
              NewsListPage(
                category: 'business',
              ),
              NewsListPage(
                category: 'politics',
              ),
              NewsListPage(
                category: 'worldnews',
              ),
            ]),
          )
        ],
      ),
    );
  }
}
