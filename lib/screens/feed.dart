import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_app/services/navigation_service.dart';
import '../locator.dart';
import './navigation/animation1.dart';
import '../constant/size.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../constant/route_paths.dart' as routes;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String image = images[0];
    final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: SizeConfig.blockSizeHorizontal * 20,
            padding: EdgeInsets.only(
                top: SizeConfig.blockSizeHorizontal * 5,
                right: SizeConfig.blockSizeVertical * 2,
                left: SizeConfig.blockSizeVertical * 2,
                bottom: SizeConfig.blockSizeHorizontal * 2),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200]),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontSize: SizeConfig.defaultFontSize,
                            color: Colors.grey),
                        hintText: "Search",
                      ),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeVertical * 3),
                GestureDetector(
                  onTap: () {
                  _navigationService.navigateTo(routes.FrindeList);
                  },
                  child: Icon(
                    Icons.message,
                    color: Colors.grey[800],
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          "Stories",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.defaultFontSize * 1.5,
                              letterSpacing: 1.2),
                        ),
                        Text("See Archive"),
                      ],
                    ),
                    SizedBox(height: SizeConfig.blockSizeHorizontal * 3),
                    Container(
                      height: 225,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          makeStory(
                              storyImage: image,
                              userImage: image,
                              userName: 'Aatik '),
                          makeStory(
                              storyImage: image,
                              userImage: image,
                              userName: 'Aiony Haust'),
                          makeStory(
                              storyImage: image,
                              userImage: image,
                              userName: 'Averie Woodard'),
                          makeStory(
                              storyImage: image,
                              userImage: image,
                              userName: 'Azamat Zhanisov'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    makeFeed(
                        userName: 'Aiony Haustssssssssssssssssssss',
                        userImage: image,
                        feedTime: '1 hr ago',
                        feedText:
                            'All the Lorem Ipsum generators on the Internet tend to repeat predefined.',
                        feedImage: image),
                    makeFeed(
                        userName: 'Azamat Zhanisov',
                        userImage: image,
                        feedTime: '3 mins ago',
                        feedText:
                            "All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
                        feedImage: ''),
                    makeFeed(
                        userName: 'Azamat Zhanisov',
                        userImage: image,
                        feedTime: '3 mins ago',
                        feedText:
                            "All the Lorem IpsssssssssssssssssssssssssssssssssssumIpssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssumIpssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssumIpssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssumIpssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssumIpssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssum generators on the Internet tend to repeat predefined.",
                        feedImage: image),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget makeStory({storyImage, userImage, userName}) {
    return AspectRatio(
      aspectRatio: 2 / 3.5,
      child: Container(
        margin: EdgeInsets.only(right: SizeConfig.blockSizeVertical * 1.1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: CachedNetworkImageProvider(storyImage), fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.25),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(userImage),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  userName,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget makeFeed({userName, userImage, feedTime, feedText, feedImage}) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(userImage),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 50,
                        child: Text(
                          userName,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      AutoSizeText(
                        feedTime,
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: Colors.grey[600],
                ),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            feedText,
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
                height: 1.5,
                letterSpacing: .7),
          ),
          SizedBox(
            height: 20,
          ),
          feedImage != ''
              ? Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(feedImage),
                          fit: BoxFit.cover)),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  makeLike(),
                  Transform.translate(
                      offset: Offset(
                          Localizations.localeOf(context).languageCode == 'ar'
                              ? 5
                              : -5,
                          0),
                      child: makeLove()),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "2.5K",
                    style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  )
                ],
              ),
              Text(
                "400 Comments",
                style: TextStyle(fontSize: 13, color: Colors.grey[800]),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              makeLikeButton(isActive: true),
              makeCommentButton(),
              makeShareButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget makeLike() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
      ),
    );
  }

  Widget makeLove() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Icon(Icons.favorite, size: 12, color: Colors.white),
      ),
    );
  }

  Widget makeLikeButton({isActive}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.thumb_up,
              color: isActive ? Colors.blue : Colors.grey,
              size: 18,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Like",
              style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget makeCommentButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.chat, color: Colors.grey, size: 18),
            SizedBox(
              width: 5,
            ),
            Text(
              "Comment",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget makeShareButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.share, color: Colors.grey, size: 18),
            SizedBox(
              width: 5,
            ),
            Text(
              "Share",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
