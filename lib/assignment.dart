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
                            'Information Security',
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
                        encryptByPlayfairCipher(
                            wordController.text, keyController.text);
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

void generateKeyTable(String key, int ks, var keyT) {
  int i, j, k;

// a 26 character hashmap
// to store count of the alphabet
  var dicty = List<int>.filled(26, 0);
  for (i = 0; i < ks; i++) {
    if (key[i] != 'j') dicty[key.codeUnitAt(i) - 'a'.codeUnitAt(0)] = 2;
  }

  dicty['j'.codeUnitAt(0) - 'a'.codeUnitAt(0)] = 1;

  i = 0;
  j = 0;

  for (k = 0; k < ks; k++) {
    if (dicty[key.codeUnitAt(k) - 'a'.codeUnitAt(0)] == 2) {
      dicty[key.codeUnitAt(k) - 'a'.codeUnitAt(0)] -= 1;
      keyT[i][j] = key[k];
      j++;
      if (j == 5) {
        i++;
        j = 0;
      }
    }
  }

  for (k = 0; k < 26; k++) {
    if (dicty[k] == 0) {
      keyT[i][j] = String.fromCharCode(k + 'a'.codeUnitAt(0));
      j++;
      if (j == 5) {
        i++;
        j = 0;
      }
    }
  }
}

void search(var keyT, String a, String b, var arr) {
  int i, j;

  if (a == 'j')
    a = 'i';
  else if (b == 'j') b = 'i';

  for (i = 0; i < 5; i++) {
    for (j = 0; j < 5; j++) {
      if (keyT[i][j] == a) {
        arr[0] = i;
        arr[1] = j;
      } else if (keyT[i][j] == b) {
        arr[2] = i;
        arr[3] = j;
      }
    }
  }
}

String prepare(String str, int ptrs) {
  if (ptrs % 2 != 0) str = str + 'z';
  return str;
}

String encrypt(String str, var keyT, int ps) {
  int i;
  var a = List<int>.filled(4, 0);

  for (i = 0; i < ps; i += 2) {
    search(keyT, str[i], str[i + 1], a);

    if (a[0] == a[2]) {
      str = str.substring(0, i) +
          keyT[a[0]][(a[1] + 1) % 5] +
          str.substring(i + 1);
      str = str.substring(0, i + 1) +
          keyT[a[0]][(a[3] + 1) % 5] +
          str.substring(i + 2);
    } else if (a[1] == a[3]) {
      str = str.substring(0, i) +
          keyT[(a[0] + 1) % 5][a[1]] +
          str.substring(i + 1);
      str = str.substring(0, i + 1) +
          keyT[(a[2] + 1) % 5][a[1]] +
          str.substring(i + 2);
    } else {
      str = str.substring(0, i) + keyT[a[0]][a[3]] + str.substring(i + 1);
      str = str.substring(0, i + 1) + keyT[a[2]][a[1]] + str.substring(i + 2);
    }
  }
  return str;
}

String encryptByPlayfairCipher(String str, String key) {
  int ps, ks;
  var keyT = List.generate(5, (i) => List.filled(5, ""), growable: false);

// Key
  ks = key.length;
  key = key.replaceAll(' ', '');
  key = key.toLowerCase();

// Plaintext
  ps = str.length;
  str = str.replaceAll(' ', '');
  str = str.toLowerCase();

  str = prepare(str, ps);

  generateKeyTable(key, ks, keyT);

  str = encrypt(str, keyT, ps);
  return str;
}

int main() {
  String str, key;

// Key to be encrypted
  key = "Monarchy";
  print("Key text: $key");

// Plaintext to be encrypted
  str = "instruments";
  print("Plain text: $str");

// encrypt using Playfair Cipher
  str = encryptByPlayfairCipher(str, key);

  print("Cipher text: $str");

  return 0;
}

// s.replaceAll(new RegExp(r'[^\w\s]+'),'')
void generateKeyTable1(String key, int ks, var keyT) {
  int i, j, k;

// a 26 character hashmap
// to store count of the alphabet
  var dicty = List<int>.filled(26, 0);

  for (i = 0; i < ks; i++) {
    if (key[i] != 'j') dicty[key.codeUnitAt(i) - 'a'.codeUnitAt(0)] = 2;
  }
  dicty['j'.codeUnitAt(0) - 'a'.codeUnitAt(0)] = 1;

  i = 0;
  j = 0;
  for (k = 0; k < ks; k++) {
    if (dicty[key.codeUnitAt(k) - 'a'.codeUnitAt(0)] == 2) {
      dicty[key.codeUnitAt(k) - 'a'.codeUnitAt(0)] -= 1;
      keyT[i][j] = key[k];
      j++;
      if (j == 5) {
        i++;
        j = 0;
      }
    }
  }
  for (k = 0; k < 26; k++) {
    if (dicty[k] == 0) {
      keyT[i][j] = String.fromCharCode(k + 'a'.codeUnitAt(0));
      j++;
      if (j == 5) {
        i++;
        j = 0;
      }
    }
  }
}

void search1(var keyT, String a, String b, var arr) {
  int i, j;

  if (a == 'j')
    a = 'i';
  else if (b == 'j') b = 'i';

  for (i = 0; i < 5; i++) {
    for (j = 0; j < 5; j++) {
      if (keyT[i][j] == a) {
        arr[0] = i;
        arr[1] = j;
      } else if (keyT[i][j] == b) {
        arr[2] = i;
        arr[3] = j;
      }
    }
  }
}

int mod5(int a) {
  if (a < 0) a += 5;
  return (a % 5);
}

String decrypt(String str, var keyT, int ps) {
  int i;
  var a = List<int>.filled(4, 0);
  for (i = 0; i < ps; i += 2) {
    search1(keyT, str[i], str[i + 1], a);
    if (a[0] == a[2]) {
      str = str.substring(0, i) +
          keyT[a[0]][mod5(a[1] - 1)] +
          str.substring(i + 1);
      str = str.substring(0, i + 1) +
          keyT[a[0]][mod5(a[3] - 1)] +
          str.substring(i + 2);
    } else if (a[1] == a[3]) {
      str = str.substring(0, i) +
          keyT[mod5(a[0] - 1)][a[1]] +
          str.substring(i + 1);
      str = str.substring(0, i + 1) +
          keyT[mod5(a[2] - 1)][a[1]] +
          str.substring(i + 2);
    } else {
      str = str.substring(0, i) + keyT[a[0]][a[3]] + str.substring(i + 1);
      str = str.substring(0, i + 1) + keyT[a[2]][a[1]] + str.substring(i + 2);
    }
  }
  return str;
}

String decryptByPlayfairCipher(String str, String key) {
  int ps, ks;
  var keyT = List.generate(5, (i) => List.filled(5, ""), growable: false);

// Key
  ks = key.length;
  key = key.replaceAll(' ', '');
  key = key.replaceAll(new RegExp(r'[^\w\s]+'), '');
  key = key.toLowerCase();

// ciphertext
  ps = str.length;
  str = str.replaceAll(' ', '');
  str = str.replaceAll(new RegExp(r'[^\w\s]+'), '');
  str = str.toLowerCase();

  generateKeyTable(key, ks, keyT);

  str = decrypt(str, keyT, ps);
  return str;
}

int main1() {
  String str, key;

// Key to be encrypted
  key = "Monarchy";
  print("Key text: $key");

// Ciphertext to be decrypted
  str = "gatlmzclrqtx";
  print("Plain text: $str");

// encrypt using Playfair Cipher
  str = decryptByPlayfairCipher(str, key);

  print("Deciphered text: $str");

  return 0;
}
