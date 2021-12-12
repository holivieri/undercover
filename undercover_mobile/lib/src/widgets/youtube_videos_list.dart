import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../blocs/artists/my_artists_bloc.dart';
import '../repositories/artists_repository.dart';
import '../services/artists_service.dart';
import 'list_view.dart';
import 'video_card.dart';

class YoutubeVideosList extends StatefulWidget {
  const YoutubeVideosList({Key? key}) : super(key: key);

  @override
  State<YoutubeVideosList> createState() => _YoutubeVideosListState();
}

class _YoutubeVideosListState extends State<YoutubeVideosList> {
  late final MyArtistsBloc bloc;

  @override
  void initState() {
    super.initState();
    final ArtistService _artistService = ArtistService();
    final ArtistRepository _artistRepository = ArtistRepository(_artistService);

    bloc = MyArtistsBloc(_artistRepository)..add(LoadArtistYoutubeVideos());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MyArtistsBloc, MyArtistsBlocState>(
          bloc: bloc,
          builder: (context, status) {
            if (status is LoadingYoutubeVideos) {
              return const CircularProgressIndicator();
            } else if (status is YoutubeVideosLoaded) {
              final videosWidgets = List.generate(
                status.videos.items.length,
                (index) => VideoCard(
                  videoInfo: status.videos.items[index],
                ),
              );

              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: platformIsNotWeb() ? 10 : 25),
                child: UndercoverListView(
                  listOfWidgets: videosWidgets,
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
