import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:newsapp/data/models/article.model.dart';

const _cellBorderRadius = 5.0;
const _imageHeigth = 105.0;

class ArticleCell extends StatelessWidget {
  final Article article;
  final Function onPress;

  const ArticleCell({
    Key key,
    @required this.article,
    @required this.onPress,
  })  : assert(article != null),
        assert(onPress != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(_cellBorderRadius),
            boxShadow: [
              BoxShadow(
                color: Color(0xCFC2C4Cb),
                blurRadius: 5.0,
                spreadRadius: 2.0,
                offset: Offset(0, 5),
              )
            ]),
        child: Column(
          children: <Widget>[
            _buildImage(),
            _buildInfoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (article.imageUrl == null) {
      return Placeholder(fallbackHeight: _imageHeigth);
    }

    return ClipRRect(
      borderRadius: new BorderRadius.circular(_cellBorderRadius),
      child: Image.network(
        article.imageUrl,
        height: _imageHeigth,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            article.source,
            style: TextStyle(
              color: Color(0xFFD66215),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 5),
          Text(
            article.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF363434),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6),
          Text(
            Jiffy(article.publishedAt).fromNow(),
            style: TextStyle(
              color: Color(0xFFA5A5A4),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
