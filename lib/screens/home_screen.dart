import 'package:flutter/material.dart';
import 'package:newscloud/models/article.dart';
import 'package:newscloud/models/category_model.dart';
import 'package:newscloud/screens/category_screen.dart';
import 'package:newscloud/screens/web_view.dart';
import 'package:newscloud/services/category_services.dart';
import 'package:newscloud/services/news_api.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsApi _newsApi = NewsApi();
    CategoryServices _categoryServices = CategoryServices();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Egypt',
              style: TextStyle(color: Colors.black),
            ),
            Text('News', style: TextStyle(color: Colors.amber))
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<Article>>(
        future: _newsApi.fetchArticles(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Article> articles = snapshot.data;
          List<CategoryModel> categories = _categoryServices.getCategories();
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return CategoryScreen(
                                category: categories[index].categoryName);
                          }));
                        },
                        child: Container(
                          width: 250,
                          child: Card(
                            elevation: 3,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image(
                                  image: AssetImage(categories[index].imageUrl),
                                  fit: BoxFit.fill,
                                ),
                                Opacity(
                                  opacity: 0.6,
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                ),
                                Center(
                                    child: Text(
                                  categories[index].arabicName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: categories.length,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return WebView(url: articles[index].articleUrl??'');
                            }));
                          },
                          child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                Image(
                                    image:
                                        NetworkImage(articles[index].imageUrl??'')),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    articles[index].title??'',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
