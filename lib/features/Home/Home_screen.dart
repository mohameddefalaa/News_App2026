import 'package:flutter/material.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HomeController()..init();
      },
      child: Consumer<HomeController>(
        builder: (BuildContext context, value, Widget? child) {
          return Scaffold(
            body: value.isEveryThingLoading
                ? const Center(child: CircularProgressIndicator())
                : value.errormessage != null &&
                      value
                          .errormessage!
                          .isNotEmpty // ← check null first
                ? Center(
                    child: Text(
                      value.errormessage!,
                      style: const TextStyle(fontSize: 20),
                    ),
                  )
                : value
                      .topHEadArticleList
                      .isEmpty // ← guard empty list
                ? const Center(child: Text("No articles found"))
                : ListView.builder(
                    itemCount: value.topHEadArticleList.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(value.topHEadArticleList[index].title),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
