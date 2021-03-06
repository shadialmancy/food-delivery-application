import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ramayo_client_app/src/pages/controllers/Active_Target_Controller.dart';

class AddCardPage extends StatefulWidget {
  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  AddCardController _controller = new AddCardController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.west,
          color: Colors.black,
          size: 30.0,
        ),
        elevation: 0,
        title: const Text(
          'Agregar tarjeta',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          //height: double.infinity,
          width: double.infinity,
          child: _form(),
        ),
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Card number',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              height: 40.0,
              color: Colors.grey[200],
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: TextFormField(
                controller: _controller.numberCardController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(5.0),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.credit_card,
                    color: Colors.red,
                    size: 30.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Exp. date',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Container(
                        height: 40.0,
                        width: 150,
                        margin: const EdgeInsets.only(right: 50),
                        color: Colors.grey[200],
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: TextFormField(
                          controller: _controller.expDateController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 6.0),
                            border: InputBorder.none,
                            hintText: 'mm/yy',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CVV',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Container(
                        height: 40.0,
                        width: 172.0,
                        color: Colors.grey[200],
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: TextFormField(
                          controller: _controller.cvvController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 6.0),
                            border: InputBorder.none,
                            hintText: '123',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Postal Code',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              height: 40.0,
              color: Colors.grey[200],
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: TextFormField(
                controller: _controller.codigoPostalController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 8.0),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            _buttonSave(),
          ],
        ),
      ),
    );
  }

  Padding _buttonSave() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, top: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          animationDuration: const Duration(milliseconds: 500),
          elevation: 2,
          minimumSize: const Size(double.infinity, 40.0),
          onSurface: Colors.white,
          enableFeedback: true,
        ),
        onPressed: _controller.goToLocationPage,
        child: const Text('Guardar'),
      ),
    );
  }
}
