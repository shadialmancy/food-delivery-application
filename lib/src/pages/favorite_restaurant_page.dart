import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ramayo_client_app/src/pages/controllers/favorite_restaurant_controller.dart';

class FavoriteRestaurantPage extends StatefulWidget {
  FavoriteRestaurantPage({Key? key}) : super(key: key);

  @override
  _FavoriteRestaurantPageState createState() => _FavoriteRestaurantPageState();
}

class _FavoriteRestaurantPageState extends State<FavoriteRestaurantPage> {
  double precio = 11.9;

  FavoriteRestaurantController _controller = new FavoriteRestaurantController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: _controller.goback,
            icon: const Icon(FontAwesomeIcons.arrowLeft),
            color: Colors.black),
        title: const Padding(
          padding: const EdgeInsets.only(left: 72),
          child: const Text(
            'Your favorites',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (_, int index) {
              return Column(
                children: <Widget>[
                  _container(),
                  const Divider(
                    height: 1,
                    indent: 130,
                    thickness: 1,
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget _container() {
    return GestureDetector(
      onTap: () {
        print('The pepe');
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 85,
        child: Center(
          child: _Restaurantcard(),
        ),
      ),
    );
  }

  Widget _Restaurantcard() {
    return Container(
      height: 130,
      width: 400,
      child: Row(
        children: <Widget>[
          Container(
            height: 80,
            margin: const EdgeInsets.only(right: 10),
            child: Image.network(
              'https://static.displate.com/857x1200/displate/2018-11-30/c3ec1197d3ad652433bbebf9dec1a7af_9793d944a67664785f7eaf6d30033180.jpg',
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 5),
                const Text('The Colonel Burgers',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 7),
                Text(
                  'Order from a local restaurant',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ]),
        ],
      ),
    );
  }
}
