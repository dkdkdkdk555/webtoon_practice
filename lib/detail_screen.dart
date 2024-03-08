import 'package:flutter/material.dart';
import 'package:webtoon_practice/models/webtoon_detail_model.dart';
import 'package:webtoon_practice/models/webtoon_episode_model.dart';
import 'package:webtoon_practice/service/api_service.dart';
import 'package:webtoon_practice/widget/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, id, thumb;

  const DetailScreen({super.key, required this.title, required this.id, required this.thumb});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  late Future<WebtoonDetailModel> detail;
  late Future<List<EpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    detail = ApiService.getWebtoonDetail(widget.id);
    episodes = ApiService.getWebEpishodes(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 27,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 325,
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
                    child: Image.network(widget.thumb),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              child: FutureBuilder(
                future: detail, 
                builder: (context, snapshot){
                  var webtoonDetail = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        webtoonDetail.about,
                      ),
                      const SizedBox(height: 15,),
                      Text(
                        '${webtoonDetail.genre} / ${webtoonDetail.age}'
                      ),
                    ],
                  );
                }
              ),
            ),

            FutureBuilder(
              future: episodes,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      for(var episode in snapshot.data!)
                      Column(
                        children: [
                          EpisodeWidget(episode: episode,)
                        ],
                      ),
                                             
                    ]
                  );
                }
                return Container();
              }
            ),
          ],
        ),
      ),
    );

  }
}