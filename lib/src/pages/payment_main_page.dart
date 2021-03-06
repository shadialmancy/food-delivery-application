import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ramayo_client_app/src/pages/controllers/pago_controller.dart';

class PaymentMainPage extends StatefulWidget {
  PaymentMainPage({Key? key}) : super(key: key);

  @override
  _PaymentMainPageState createState() => _PaymentMainPageState();
}

class _PaymentMainPageState extends State<PaymentMainPage> {
  List<int> card = [1, 2, 4, 5];

  Page2Controller _controller = new Page2Controller();

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
            onPressed: _controller.goBack,
            icon: const Icon(FontAwesomeIcons.arrowLeft),
            color: Colors.black),
        title: const Padding(
          padding: const EdgeInsets.only(left: 100),
          child: const Text(
            'Payment',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListView.builder(
                itemCount: card.length,
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      _Paymentcard(card[i]),
                      const Divider(
                        height: 1,
                        indent: 75,
                        thickness: 1,
                      ),
                    ],
                  );
                }),
          ),
          const Divider(
            height: 1,
            indent: 75,
            thickness: 1,
          ),
          _cash(),
          const Divider(
            height: 1,
            indent: 75,
            thickness: 1,
          ),
          Expanded(flex: 2, child: _addCard()),
        ],
      ),
    );
  }

  Widget _Paymentcard(card) {
    return ListTile(
      leading: Icon(FontAwesomeIcons.creditCard, color: Colors.blue[900]),
      title: const Text(
        'xxxx - 9999',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(FontAwesomeIcons.chevronRight, color: Colors.black),
    );
  }

  Widget _cash() {
    return ListTile(
      leading:
          Icon(FontAwesomeIcons.moneyBillAlt, color: Colors.greenAccent[400]),
      title: const Text(
        'Cash',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(FontAwesomeIcons.chevronRight, color: Colors.black),
    );
  }

  Widget _addCard() {
    return const ListTile(
      leading: Icon(FontAwesomeIcons.plus, color: Colors.black),
      title: const Text(
        'Add Payment Method',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
