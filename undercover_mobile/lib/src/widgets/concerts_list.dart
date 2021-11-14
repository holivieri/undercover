import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../blocs/concerts/concerts_bloc.dart';
import 'rounded_rectangle_card.dart';

class ConcertsList extends StatelessWidget {
  const ConcertsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ConcertsBloc, ConcertsState>(
          builder: (context, status) {
            if (status is LoadingNextConcerts) {
              return const CircularProgressIndicator();
            } else if (status is NextConcertsLoaded) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: platformIsNotWeb() ? 10 : 25),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: List.generate(
                    status.concerts.length,
                    (index) => RoundedRectangleCard(
                      backgroundImageUrl:
                          status.concerts[index].artist.pictureUrl,
                      title: status.concerts[index].date.toLocal().toString(),
                    ),
                  ),
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
