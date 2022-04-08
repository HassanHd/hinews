import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news/Services/Fun.dart';
import 'package:news/Services/api.dart';
import 'package:news/view/widgetes/CategoriesButton.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Choose News Categories",
                style: TextStyle(color: textColor, fontSize: fontxlarg),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 14,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoriesButton(
                    colorButton: red,
                    textCategories: "General",
                  ),
                  CategoriesButton(
                    colorButton: blue,
                    textCategories: "Science",
                  ),
                  CategoriesButton(
                    colorButton: orangeLight,
                    textCategories: "Health",
                  ),
                  CategoriesButton(
                    colorButton: green,
                    textCategories: "Business",
                  ),
                  CategoriesButton(
                    colorButton: orangeDark,
                    textCategories: "Sports",
                  ),
                  CategoriesButton(
                    colorButton: blue,
                    textCategories: "Technology",
                  ),
                  CategoriesButton(
                    colorButton: yellow,
                    textCategories: "Entertainment",
                  ),
                  CategoriesButton(
                    colorButton: red,
                    textCategories: "General",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Best News",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w800,
                    fontSize: fonttitel),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: API.fetchArticles(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                     Fun.openLink("${snapshot.data[index].url}");
                        },
                        child: Card(

                          color: white,
                          elevation: 5,
                          shadowColor: textColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            children: [
                             Container(
                                height:200 ,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    topLeft: Radius.circular(25),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        (snapshot.data[index].urlToImage==null)?"https://bitsofco.de/content/images/2018/12/Screenshot-2018-12-16-at-21.06.29.png":"${snapshot.data[index].urlToImage}"
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topCenter,
                                width: MediaQuery.of(context).size.width*0.90,
                                child: Text(
                                  "${snapshot.data[index].title}",
                                  textAlign: TextAlign.center,style: TextStyle(color: textColor,fontWeight: FontWeight.w800),
                                ),
                              ),
                              Container(
                                height: 40,
                                child: Row(

                                  children: [
                                    IconButton(
                                        onPressed: () {
                                       Fun.ShareLink("${snapshot.data[index].url}");
                                        },
                                        icon: Icon(Icons.share)),
                                    IconButton(
                                        onPressed: () {
                                          Fun.copyLink("${snapshot.data[index].url}").then((value){
                                            final snackBar = SnackBar(content: Text('Copy........'));
                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          });
                                        },
                                        icon: Icon(Icons.copy_rounded)),

                                  ],
                                ),

                              )

                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: orangeLight,
                    ),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
