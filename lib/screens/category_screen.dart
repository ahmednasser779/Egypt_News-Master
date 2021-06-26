import 'package:flutter/material.dart';
import 'package:newscloud/models/article.dart';
import 'package:newscloud/screens/web_view.dart';
import 'package:newscloud/services/news_api.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  CategoryScreen({this.category});

  @override
  Widget build(BuildContext context) {
    NewsApi _newsApi = NewsApi();
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Article>>(
        future: _newsApi.fetchArticlesByCategory(category),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Article> articles = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return WebView(url: articles[index].articleUrl??'');
                      }));
                    },
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          Image(image: NetworkImage(articles[index].imageUrl??'')),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              articles[index].title??'',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              articles[index].description??'',
                              style: TextStyle(fontSize: 14),
                              textDirection: TextDirection.rtl,
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
            },
            itemCount: articles.length,
          );
        },
      ),
    );
  }
}
