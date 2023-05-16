import 'package:flutter/material.dart';

class MonoalphabeticCipherPage extends StatefulWidget {
  const MonoalphabeticCipherPage({Key? key}) : super(key: key);

  @override
  _MonoalphabeticCipherPageState createState() =>
      _MonoalphabeticCipherPageState();
}

class _MonoalphabeticCipherPageState extends State<MonoalphabeticCipherPage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _encryptedText = '';

  void _encryptText() {
    final monoalphabeticCipher = MonoalphabeticCipher();
    final encryptedText =
        monoalphabeticCipher.encrypt(_textEditingController.text);
    setState(() {
      _encryptedText = encryptedText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monoalphabetic Cipher'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter the plaintext:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter plaintext',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _encryptText,
              child: const Text('Encrypt'),
            ),
            const SizedBox(height: 16),
            if (_encryptedText.isNotEmpty) ...[
              const Text(
                'Encrypted text:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SelectableText(
                  _encryptedText,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class MonoalphabeticCipher {
  final Map<String, String> _encryptionKey = {
    'a': 'm',
    'b': 'n',
    'c': 'o',
    'd': 'p',
    'e': 'q',
    'f': 'r',
    'g': 's',
    'h': 't',
    'i': 'u',
    'j': 'v',
    'k': 'w',
    'l': 'x',
    'm': 'y',
    'n': 'z',
    'o': 'a',
    'p': 'b',
    'q': 'c',
    'r': 'd',
    's': 'e',
    't': 'f',
    'u': 'g',
    'v': 'h',
    'w': 'i',
    'x': 'j',
    'y': 'k',
    'z': 'l',
  };

  String encrypt(String plaintext) {
    final encryptedChars =
        plaintext.split('').map((char) => _encryptionKey[char] ?? char);
    return encryptedChars.join('');
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Monoalphabetic Cipher',
      home: MonoalphabeticCipherPage(),
    ),
  );
}
// import 'package:flutter/material.dart';
//
// class CaesarCipherPage extends StatefulWidget {
//   @override
//   _CaesarCipherPageState createState() => _CaesarCipherPageState();
// }
//
// class _CaesarCipherPageState extends State<CaesarCipherPage> {
//   final TextEditingController _plaintextController = TextEditingController();
//   String _encryptedText = '';
//
//   void _encryptText() {
//     final int shift = 3; // The shift value used in the Caesar Cipher
//     final String plaintext = _plaintextController.text;
//     final String encryptedText = _caesarCipherEncrypt(plaintext, shift);
//     setState(() {
//       _encryptedText = encryptedText;
//     });
//   }
//
//   String _caesarCipherEncrypt(String plaintext, int shift) {
//     String encryptedText = '';
//     for (int i = 0; i < plaintext.length; i++) {
//       final int charCode = plaintext.codeUnitAt(i);
//       if (charCode >= 65 && charCode <= 90) {
//         // Uppercase letters
//         encryptedText += String.fromCharCode((charCode - 65 + shift) % 26 + 65);
//       } else if (charCode >= 97 && charCode <= 122) {
//         // Lowercase letters
//         encryptedText += String.fromCharCode((charCode - 97 + shift) % 26 + 97);
//       } else {
//         // Non-letter characters
//         encryptedText += plaintext[i];
//       }
//     }
//     return encryptedText;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Caesar Cipher Encryption'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: _plaintextController,
//                 decoration: InputDecoration(
//                   labelText: 'Enter plaintext',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _encryptText,
//                 child: Text('Encrypt'),
//               ),
//               SizedBox(height: 16.0),
//               if (_encryptedText.isNotEmpty)
//                 Text(
//                   'Encrypted Text: $_encryptedText',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(
//     MaterialApp(
//       title: 'CaesarCipher',
//       home: CaesarCipherPage(),
//     ),
//   );
// }
