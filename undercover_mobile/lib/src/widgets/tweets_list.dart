import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../blocs/artists/my_artists_bloc.dart';
import '../repositories/artists_repository.dart';
import '../services/artists_service.dart';
import 'list_view.dart';
import 'tweet_card.dart';

class TweetsList extends StatefulWidget {
  const TweetsList({
    required this.twitterAccount,
    Key? key,
  }) : super(key: key);
  final String twitterAccount;

  @override
  State<TweetsList> createState() => _TweetsListState();
}

class _TweetsListState extends State<TweetsList> {
  _TweetsListState();

  late final MyArtistsBloc bloc;

  @override
  void initState() {
    super.initState();
    final ArtistService _artistService = ArtistService();
    final ArtistRepository _artistRepository = ArtistRepository(_artistService);

    bloc = MyArtistsBloc(_artistRepository)
      ..add(LoadArtistTweets(widget.twitterAccount));
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
                status.tweets.length,
                (index) => TweetCard(
                  createdDate: status.tweets[index]!.createdAt,
                  likeCount: status.tweets[index]!.favoriteCount,
                  message: status.tweets[index]!.text,
                  replyCount: 0,
                  retweetCount: status.tweets[index]!.retweetCount,
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
