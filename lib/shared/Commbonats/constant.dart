import 'package:flutter/material.dart';
import 'package:newsapp/models/webview/webview.dart';
Widget buildCardNews(article ,context) {
  return InkWell(
    onTap: (){
      navigatorTo(context, WebViewScreen(url: article['url'], ));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(15),
                image:DecorationImage(
                  image: NetworkImage('${article['urlToImage']?? 'No data read'}'),
                  fit: BoxFit.cover,

                )
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(" ${article['title']?? 'No data read'}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,

                      style:Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Expanded(
                    child: Text("${article['publishedAt']?? 'No data read'}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,

                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
void navigatorTo(ctx , widget){
  Navigator.push(ctx, MaterialPageRoute(builder: (ctx)=>widget));
}

