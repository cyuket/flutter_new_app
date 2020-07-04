import 'package:flutter/material.dart';

class ArticleList {
  final List<ArticleModel> articleList;
  ArticleList({this.articleList});

  factory ArticleList.fromData(List data) {
    var list = data;
    List<ArticleModel> newList =
        list.map((i) => ArticleModel.fromData(i)).toList();
    return ArticleList(articleList: newList);
  }
}

class ArticleModel {
  final String title;
  final String author;
  final String content;
  final String publisedAt;
  final String imageUrl;

  ArticleModel({
    this.author,
    this.content,
    this.imageUrl,
    this.publisedAt,
    this.title,
  });

  factory ArticleModel.fromData(Map<String, dynamic> data) {
    return ArticleModel(
      title: data["title"],
      author: data["author"],
      content: data["content"],
      publisedAt: data["publishedAt"],
      imageUrl: data["urlToImage"],
    );
  }
}
