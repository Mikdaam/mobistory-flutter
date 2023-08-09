import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobistory/src/presentation/cubits/event_details/event_details_cubit.dart';
import 'package:mobistory/src/presentation/cubits/events/events_cubit.dart';
import 'package:mobistory/src/presentation/cubits/favorite_events/favorite_events_cubit.dart';

class EventDetailsScreen extends HookWidget {
  final int eventId;
  const EventDetailsScreen({
    Key? key,
    @PathParam() required this.eventId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<EventDetailsCubit>().getEventDetails(eventId);
      return () {};
    }, []);

    return Scaffold(
      body: BlocBuilder<EventDetailsCubit, EventDetailsState>(
        builder: (context, state) {
          if (state is EventDetailsStateLoading) {
            return _buildLoading();
          } else if (state is EventDetailsStateSuccess) {
            return _buildSuccess(context, state);
          } else if (state is EventDetailsStateFailed) {
            return _buildFailed(state);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildSuccess(BuildContext context, EventDetailsStateSuccess state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(context, state),
          _buildContent(state),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, EventDetailsStateSuccess state) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    icon: const Icon(Icons.arrow_back)
                ),
                Expanded(
                  child: Text(
                    state.eventDetails!.event.label ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<FavoritesCubit>().toggleFavorite(state.eventDetails!.event);
                    context.read<EventsCubit>().loadEvents();
                  },
                  icon: Icon(
                    state.eventDetails!.event.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: const Color(0xFF006AF6),
                  ),
                ),
              ],
            ),
            if (state.eventDetails?.event.image != null)
              Container(
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: state.eventDetails!.event.image!.endsWith(".svg")
                    ? SvgPicture.network(
                        state.eventDetails!.event.image!,
                        fit: BoxFit.fitWidth,
                        height: 200,
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                      )
                    : Image.network(
                        state.eventDetails!.event.image!,
                        fit: BoxFit.fitWidth,
                        height: 200,
                      ),
              ),
            const SizedBox(height: 16),
            Text(
              state.eventDetails?.event.pointInTime.toString() ?? '',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              state.eventDetails?.event.description ?? '',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(EventDetailsStateSuccess state) {
    List<WikipediaSection> sections =
        parseSections(state.eventDetails?.wikipediaContent ?? '');
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section.title.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  section.content,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        });
  }

  Widget _buildFailed(EventDetailsStateFailed state) {
    return Center(
      child: Text(state.error.toString()),
    );
  }

  List<WikipediaSection> parseSections(String content) {
    List<WikipediaSection> sections = [];
    RegExp regex = RegExp("\n== (.*?) ==\n");
    Iterable<Match> matches = regex.allMatches(content);
    int previousIndex = 0;

    // Add the first section
    String firstSectionText =
        content.substring(previousIndex, matches.first.start);
    sections.add(WikipediaSection("", firstSectionText.trim()));

    for (Match match in matches) {
      String sectionTitle = match.group(1)!;
      String sectionText = content.substring(previousIndex, match.start);

      sections.add(WikipediaSection(sectionTitle, sectionText.trim()));
      previousIndex = match.end;
    }

    return sections;
  }
}

class WikipediaSection {
  String title;
  String content;

  WikipediaSection(this.title, this.content);
}
