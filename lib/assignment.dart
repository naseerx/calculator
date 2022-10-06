import 'package:flutter/material.dart';

class CaesarCipher extends StatefulWidget {
  const CaesarCipher({Key? key}) : super(key: key);

  @override
  _CaesarCipherState createState() => _CaesarCipherState();
}

class _CaesarCipherState extends State<CaesarCipher> {
  var wordController = TextEditingController();
  var keyController = TextEditingController();
  String _result = "";

  @override
  void dispose() {
    wordController.dispose();
    keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Caesar Cipher assignment',
          style: TextStyle(fontSize: 24.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                height: size.height * 0.18,
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow, width: 2),
                    borderRadius: BorderRadius.circular(13)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Name :',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'robo',
                            ),
                          ),
                          Text(
                            'Subject :',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'robo',
                            ),
                          ),
                          Text(
                            'Class  :',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'robo',
                            ),
                          ),
                          Text(
                            'Roll No  :',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'robo',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Muhammad Naseer',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'robo',
                            ),
                          ),
                          Text(
                            'Security Engineering',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'robo',
                            ),
                          ),
                          Text(
                            'BSIT(A) ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'robo',
                            ),
                          ),
                          Text(
                            '10',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'robo',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: wordController,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Input your text',
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Input your key',
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
                controller: keyController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.28, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Encrypt',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        _process(true);
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.28, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Decrypt',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _result = wordController.text;
                      });
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.28, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _delete,
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                'Output :',
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 7,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.green)),
                child: Card(
                  child: Center(
                    child: SelectableText(
                      _result,
                      style: const TextStyle(fontSize: 23.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _process(bool _isEncrypt) {
    String _text = wordController.text;
    int key = 0;
    String _temp = "";

    try {
      key = int.parse(keyController.text);
    } catch (e) {
      _showAlert("Invalid Key");
    }

    for (int i = 0; i < _text.length; i++) {
      int ch = _text.codeUnitAt(i);
      int offset;
      String h;
      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      } else if (ch == ' '.codeUnitAt(0)) {
        _temp += " ";
        continue;
      } else {
        _showAlert("Invalid Text");
        _temp = "";
        break;
      }

      int c;
      if (_isEncrypt) {
        c = (ch + key - offset) % 26;
      } else {
        c = (ch - key - offset) % 26;
      }
      h = String.fromCharCode(c + offset);
      _temp += h;
    }

    setState(() {
      _result = _temp;
    });
  }

  void _delete() {
    wordController.clear();
    keyController.clear();
    setState(() {
      _result = "";
    });
  }

  Future<void> _showAlert(String _alert) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Something is Wrong'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(_alert),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
