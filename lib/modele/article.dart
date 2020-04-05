class Article {
  final String title;
  final String description;
  final String urlToImage;
  final String price;

  Article({this.title, this.description,this.urlToImage,this.price});

  factory Article.fromArray(List<dynamic> articlesArray)=> Article(
      title: articlesArray[0],
      description: articlesArray[1],
      urlToImage: articlesArray[2],
      price: articlesArray[3]
  );
}