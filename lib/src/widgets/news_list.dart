import 'package:flutter/material.dart';
import 'package:news_app/src/helpers/colors.dart';
import 'package:news_app/src/models/news_response.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsList extends StatelessWidget {
  final List<Article> notice;

  const NewsList({Key? key, required this.notice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notice.length,
      itemBuilder: (BuildContext context, int index) {
        return _News(
          index: index,
          news: notice[index],
        );
      },
    );
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;

  const _News({Key? key, required this.news, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _cardTopBar(news: news, index: index),
          _CardTitle(news: news),
          _CardImage(
            news: news,
          ),
          _CardBody(
            news: news,
          ),
          _ButtonGo(
            news: news,
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: cWhiteSmoke,
            thickness: 5,
          )
        ],
      ),
    );
  }
}

class _cardTopBar extends StatelessWidget {
  final Article news;
  final int index;

  const _cardTopBar({Key? key, required this.news, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}. ${news.source?.name}',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article news;
  const _CardTitle({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        news.title!,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article news;
  const _CardImage({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
        child: Container(
            child: (news.urlToImage != null)
                ? FadeInImage(
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image(
                        image: AssetImage('assets/img/no-image.png'),
                      );
                    },
                    placeholder: AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(news.urlToImage!),
                  )
                : Image(
                    image: AssetImage('assets/img/no-image.png'),
                  )),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  final Article news;
  const _CardBody({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = news.publishedAt!;
    String convertedDateTime = "${date.day}-${date.month}-${date.year} ";
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            convertedDateTime.toString(),
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          (news.description != null) ? news.description! : 'no description',
          style: TextStyle(fontSize: 16),
        ),
      ]),
    );
  }
}

class _ButtonGo extends StatelessWidget {
  final Article news;

  const _ButtonGo({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = news.url!;
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () => _launchURL(url),
            fillColor: cGreenColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              child: Icon(
                Icons.web_sharp,
                color: cChineseWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se puede abrir la pagina $url';
  }
}
