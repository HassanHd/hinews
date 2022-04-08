import 'package:news/modeles/articles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class API {
 static String APIKEY = "e2e73cedbcdd4f95a6394eea00ff1ec9";

 static Future<List<ArticlesModel>> fetchArticles() async {
    List<ArticlesModel> list = [];

    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&apiKey=$APIKEY");
    print("url===> $url");
var respons=await http.get(url);
var responsbody=jsonDecode(respons.body)["articles"];
    print("responsbody===> $responsbody");
for(var i in responsbody){
  ArticlesModel x=ArticlesModel(title:i ["title"], description: i["description"], url: i["url"], urlToImage:i["urlToImage"]);
  list.add(x);
}
    return list;
  }
 static Future<List<ArticlesModel>> fetchCategoryArticles(String category) async {
   List<ArticlesModel> list = [];

   var url = Uri.parse(
       "https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$APIKEY");
   print("url===> $url");
   var respons=await http.get(url);
   var responsbody=jsonDecode(respons.body)["articles"];
   print("responsbody===> $responsbody");
   for(var i in responsbody){
     ArticlesModel x=ArticlesModel(title:i ["title"], description: i["description"], url: i["url"], urlToImage:i["urlToImage"]);
     list.add(x);

   }
   return list;
 }
}
