import 'package:flutter/material.dart';
import 'package:webtoon_practice/models/webtoon_episode_model.dart';

class EpisodeWidget extends StatelessWidget {
  const EpisodeWidget({super.key,
    required this.episode
  });

  final EpisodeModel episode;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 55,
            vertical: 5
          ),
          child: Container(
            height: 60,
            decoration : BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10
                  ),
                  child: Text(
                    episode.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    right: 10
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
  }
}