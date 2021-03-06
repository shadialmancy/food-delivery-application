import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ramayo_client_app/src/pages/controllers/items_Controller.dart';

class ItemsPage extends StatefulWidget {
  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage>
    with SingleTickerProviderStateMixin {
  ItemsController _controller = new ItemsController();
  bool check = false;
  late AnimationController _animation;
  bool _open = false;
  List<String> lista = ['choose your meat', 'choose your drink'];
  List<String> lista2 = ['Choose 1', 'select until 4'];

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 50),
    );
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cheeseburger',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
          onPressed: _controller.goBack,
        ),
      ),
      body: ListView(
        children: <Widget>[
          _Headboard(),
          nameAndDescription(),
          Column(
            children: List.generate(2, (index) {
              return _items(lista[index], lista2[index]);
            }),
          ),
        ],
      ),
    );
  }

  Widget _Headboard() {
    return Container(
        width: double.infinity,
        height: 160,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                'https://static.displate.com/857x1200/displate/2018-11-30/c3ec1197d3ad652433bbebf9dec1a7af_9793d944a67664785f7eaf6d30033180.jpg'),
          ),
        ));
  }

  Widget nameAndDescription() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Cheeseburger',
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            'Charcoal Lebanese Burger Restaurant shahskdbskdbkbfkdbc fdshsbc sdh csdbchds bchdb vhsbdvshvbhbsa',
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _items(String title, String descripcion) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          height: 50,
          width: double.infinity,
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  Text(descripcion,
                      style: TextStyle(color: Colors.grey[800], fontSize: 14)),
                ],
              ),
              GestureDetector(
                onTap: () {
                  _open ? _animation.forward() : _animation.reverse();

                  setState(() {
                    _open = !_open;
                  });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: AnimatedIcon(
                        icon: AnimatedIcons.close_menu,
                        progress: _animation,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_open)
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                if (_open) ...[
                  CheckboxListTile(
                      secondary: const Text('+15.00'),
                      title: const Text('Beef'),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: check,
                      onChanged: (value) {
                        setState(() {
                          check = value!;
                        });
                      }),
                  CheckboxListTile(
                      secondary: const Text('+15.00'),
                      title: const Text('Beef'),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: check,
                      onChanged: (value) {
                        setState(() {
                          check = value!;
                        });
                      }),
                  CheckboxListTile(
                      secondary: const Text('+15.00'),
                      title: const Text('Beef'),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: check,
                      onChanged: (value) {
                        setState(() {
                          check = value!;
                        });
                      }),
                  CheckboxListTile(
                      secondary: const Text('+15.00'),
                      title: const Text('Beef'),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: check,
                      onChanged: (value) {
                        setState(() {
                          check = value!;
                        });
                      }),
                ]
              ],
            ),
          ),
      ],
    );
  }
}

 /*
 
 AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            width: double.infinity,
            height: _open ? 250 : 0,
            color: Colors.white,
            child: Column(
              children: <Widget>[

                if(_open)
                ...[
                  const ListTile(
                    trailing: Text('15.00'),
                    title: Text('Res'),
                    leading: Text('elele'),
                  ),
                  const ListTile(
                    trailing: Text('15.00'),
                    title: Text('Res'),
                    leading: Text('elele'),
                  ),
                  const ListTile(
                    trailing: Text('15.00'),
                    title: Text('Res'),
                    leading: Text('elele'),
                  ),
                ]
              ],
            ),
          ),
 
  */