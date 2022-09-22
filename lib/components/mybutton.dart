import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPress ;
  final String title ;
  final Color color ;
   MyButton({Key? key, this.color = const Color(0xffa5a5a5),
   this.title="", required this.onPress
   }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 70,

            decoration: BoxDecoration(
                shape: BoxShape.circle,
              color: color
            ),
            child: Center(child: Text(title,style: TextStyle(fontSize: 30,color: Colors.white),)),
          ),
        ),
      ),
    );
  }
}

