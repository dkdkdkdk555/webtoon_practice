import 'package:flutter/material.dart';
import 'package:webtoon_practice/detail_screen.dart';

class WebtoonWidget extends StatelessWidget {
  final String title, thumb, id;

  const WebtoonWidget({super.key, required this.title, required this.thumb, required this.id});

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => 
            DetailScreen(title: title, id: id, thumb: thumb),
            fullscreenDialog: true,
            ));
      },
      child: Column(
              children: [
                Container(
                  width: 315,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(10, 0),
                        color: Colors.black.withOpacity(0.5)
                      )
                    ]
                  ),
                  child: Image.network(
                    thumb,
                    headers: const{
                      // 'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                      // 'Referer': 'https://comic.naver.com',
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                Text(title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
    );
  }
}