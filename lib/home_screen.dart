import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:webtoon_practice/models/webtoon_model.dart';
import 'package:webtoon_practice/service/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<WebtoonModel>> webtoons;

  @override
  void initState() {
    super.initState();
    webtoons = ApiService.getWebtoonInfo();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Good morning!',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade800,
                      height: 0,
                    ),
                  ),
                  Text("Here are today's comics!",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.grey.shade600,
                      height: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ),
         Flexible(
            flex: 2,
            child: FutureBuilder(
              future: webtoons, 
              builder: (context, snapshot) { // Widget을 리턴하는 함수
                if(snapshot.hasData){
                  return Column(
                    children: [
                     const SizedBox(height: 50,),
                     makeList(snapshot),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            )
          )
        ],
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      var webtoon = snapshot.data![index];
                      return 
                      // return Row(
                      //   children: [
                      //     Container(
                      //       width: 250,
                      //       clipBehavior: Clip.hardEdge,
                      //       decoration: const BoxDecoration(
                              
                      //       ),
                      //       child: Image.network(webtoon.thumb),
                      //     ),
                      //     Text(webtoon.title)
                      //   ],
                      // );
                    }, 
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 40,
                    ), 
                    itemCount: snapshot.data!.length,
                   );
  }
}