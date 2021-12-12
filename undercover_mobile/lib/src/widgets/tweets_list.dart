import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../blocs/artists/my_artists_bloc.dart';
import '../repositories/artists_repository.dart';
import '../services/artists_service.dart';
import 'list_view.dart';
import 'tweet_card.dart';

class TweetsList extends StatefulWidget {
  const TweetsList({Key? key}) : super(key: key);

  @override
  State<TweetsList> createState() => _TweetsListState();
}

class _TweetsListState extends State<TweetsList> {
  late final MyArtistsBloc bloc;

  @override
  void initState() {
    super.initState();
    final ArtistService _artistService = ArtistService();
    final ArtistRepository _artistRepository = ArtistRepository(_artistService);

    bloc = MyArtistsBloc(_artistRepository)..add(LoadArtistTweets());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MyArtistsBloc, MyArtistsBlocState>(
          bloc: bloc,
          builder: (context, status) {
            if (status is LoadingTweets) {
              return const CircularProgressIndicator();
            } else if (status is TweetsLoaded) {
              final tweetsWidgets = List.generate(
                status.tweets.data.length,
                (index) => TweetCard(
                  createdDate: status.tweets.data[index].createdAt,
                  likeCount: status.tweets.data[index].publicMetrics.likeCount,
                  message: status.tweets.data[index].text,
                  replyCount:
                      status.tweets.data[index].publicMetrics.replyCount,
                  retweetCount:
                      status.tweets.data[index].publicMetrics.retweetCount,
                ),
              );

              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: platformIsNotWeb() ? 10 : 25),
                child: UndercoverListView(
                  listOfWidgets: tweetsWidgets,
                  numOfWidgetsOnTablet: 4,
                  numOfWidgetsOnDesktop: 6,
                  numOfWidgetsOnWideScreen: 8,
                  itemHeight: 140,
                  itemWidth: 150,
                  padding: 10,
                  leftPaddingOnPhone: 25,
                ),
              );
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}
