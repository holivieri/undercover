import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';
import '../blocs/concerts/concerts_bloc.dart';
import '../models/concert_model.dart';
import '../repositories/concerts_repository.dart';
import '../services/concerts_service.dart';
import '../utils/colors.dart';
import '../utils/font.dart';
import '../widgets/back_button.dart';

class ConcertDetailsPage extends StatefulWidget {
  @override
  State<ConcertDetailsPage> createState() => _ConcertDetailsPageState();
}

class _ConcertDetailsPageState extends State<ConcertDetailsPage> {
  final String? _concertId = Get.arguments;
  late final ConcertsBloc concertBloc;

  @override
  void initState() {
    super.initState();
    final ConcertsService service = ConcertsService();
    final ConcertsRepository repository = ConcertsRepository(service);

    concertBloc = ConcertsBloc(repository)
      ..add(
        LoadConcert(_concertId!),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConcertsBloc, ConcertsState>(
      bloc: concertBloc,
      builder: (context, state) {
        if (state is LoadingConcert) {
          return const CircularProgressIndicator();
        } else if (state is ConcertLoaded) {
          return Scaffold(
            appBar: AppBar(
              leading: const BackArrowButton(),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            extendBodyBehindAppBar: true,
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration:
                  const BoxDecoration(gradient: themeBackgroundGradient),
              child: mainBody(state.concert),
            ),
          );
        } else {
          return Text(S.of(context).errorConcertNotFound);
        }
      },
    );
  }

  Widget mainBody(Concert concert) {
    return SingleChildScrollView(
      child: Column(
        children: [
          getConcertCoverPicture(concert),
          const SizedBox(height: 20),
          getConcertDetails(concert),
        ],
      ),
    );
  }

  Widget getConcertCoverPicture(Concert concert) {
    return Container(
      width: double.infinity,
      height: 400,
      child: Image.network(concert.artist!.pictureUrl!),
    );
  }

  Widget getConcertDetails(Concert concert) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.lightBlue[50]!.withOpacity(0.5),
      ),
      width: 250,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              concert.artist!.name,
              style: subtitleStyle,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.follow_the_signs),
                Text(
                    '${concert.date.day}/${concert.date.month}/${concert.date.year}'),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.houseUser),
                Text(concert.place.name),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.locationArrow),
                Text(concert.place.city),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
