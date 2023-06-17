import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:mobapps/Dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metode Pembayaran',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final name = TextEditingController();
  final card = TextEditingController();
  final total = TextEditingController();

  get actions => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 60,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp),
          label: const Text(''),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        title: Text("Pembayaran"),
        backgroundColor: Color.fromARGB(255, 228, 3, 3),
      ),
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Total Pembayaran',
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 31, 32, 31)),
            ),
          ),
          ListTile(
            title: Text(
              'Rp35.000',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 8, 156, 40)),
            ),
          ),
          ListTile(
            title: Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 33, 35, 36)),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 119, 7, 100),
              backgroundImage: AssetImage('assets/ovo.jpg'),
              radius: 20,
            ),
            title: Text(
              'OVO',
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 31, 32, 31)),
            ),
            onTap: () {
              showDetailsDialog(
                context,
                'OVO',
              );
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 6, 87, 180),
              backgroundImage: AssetImage('assets/dana.jpg'),
              radius: 20,
            ),
            title: Text(
              'Dana',
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 31, 32, 31)),
            ),
            onTap: () {
              showDetailsDialog(context, 'Dana');
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 6, 87, 180),
              backgroundImage: AssetImage('assets/gopay.jpg'),
              radius: 20,
            ),
            title: Text(
              'Go-Pay',
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 31, 32, 31)),
            ),
            onTap: () {
              showDetailsDialog(context, 'Go-Pay');
            },
          ),
          SizedBox(height: 10),
          ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 247, 247, 247),
                backgroundImage: AssetImage('assets/cash.png'),
                radius: 20,
              ),
              title: Text(
                'Tunai',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              onTap: () {
                showTunaiDialog(context, 'tunai');
              }),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 247, 247, 247),
              backgroundImage: AssetImage('assets/bank.png'),
              radius: 20,
            ),
            title: Text(
              'Transfer bank',
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 31, 32, 31)),
            ),
            onTap: () {
              processPayment();
            },
          ),
        ],
      ),
    );
  }

  void showDetailsDialog(BuildContext context, String appType) {
    final _formkey = GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Pembayaran'),
              content: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '$appType\n',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    TextSpan(
                      text: '\n Apakah anda yakin ingin melakukan pembayaran?',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 228, 3, 3),
                    ),
                    child: Text('Lanjut'),
                    onPressed: () {
                      final _formkey = GlobalKey<FormState>();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        '\n Masukkan nomor ponsel akun $appType anda',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            key: _formkey,
                            actions: <Widget>[
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'masukkan nomor akun anda!';
                                  }
                                  return null;
                                },
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0))),
                              ),
                              new Padding(
                                  padding: new EdgeInsets.only(bottom: 20.0)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 228, 3, 3),
                                ),
                                child: Text('Bayar'),
                                onPressed: () {
                                  CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.success,
                                    title: 'Berhasil',
                                    text: "pembayaran sukses!",
                                    confirmBtnText: 'Ok',
                                    confirmBtnColor:
                                        Color.fromARGB(255, 228, 3, 3),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    })
              ]);
        });
  }
}

void showTunaiDialog(BuildContext context, String appType) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Pembayaran'),
            content: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '$appType\n',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  TextSpan(
                    text: '\n Apakah anda yakin ingin melakukan pembayaran?',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 228, 3, 3),
                  ),
                  child: Text('Lanjut'),
                  onPressed: () {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: 'Berhasil',
                      text: " metode pembayaran dipilih!",
                      confirmBtnText: 'Ok',
                      confirmBtnColor: Color.fromARGB(255, 228, 3, 3),
                    );
                  })
            ]);
      });
}

void processPayment() {
  final name = TextEditingController();
  final card = TextEditingController();
  final total = TextEditingController();

  TextFormField(
    controller: name,
    decoration: InputDecoration(labelText: 'Nama pemilik kartu'),
  );
  TextFormField(
    controller: card,
    decoration: InputDecoration(labelText: 'Nomor kartu'),
  );
  TextFormField(
    controller: total,
    decoration: InputDecoration(labelText: 'Total bayar'),
  );

  ElevatedButton(onPressed: () {}, child: Text('Bayar'));
}
