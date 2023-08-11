import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobistory/src/domain/model/event.dart';
import 'package:mobistory/src/utils/extensions.dart';

class EventListItem extends HookWidget {
  final Event event;
  final Function(Event) onItemClick;
  final Function(Event)? onFavoriteClick;

  const EventListItem({super.key,
    required this.event,
    required this.onItemClick,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme
          .of(context)
          .colorScheme
          .surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () => onItemClick(event),
          child: Column(
            children: [
              _buildEventTitle(),
              _buildEventDescription(context),
              const SizedBox(height: 12),
              _buildEventAliases(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            event.labelEN!.capitalize(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (onFavoriteClick != null)
          IconButton(
            onPressed: () => onFavoriteClick!(event),
            icon: Icon(
              event.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: const Color(0xFF006AF6),
              size: 24,
            )
          ),
      ],
    );
  }

  Widget _buildEventDescription(BuildContext context) {
    return Text(
      event.descriptionEN!.capitalize(),
      style: TextStyle(
        fontSize: 14,
        color: Theme
            .of(context)
            .colorScheme
            .onSurface,
      ),
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildEventAliases() {
    return Row(
        children: const [
          ChipView(data: 'Popularity'),
          SizedBox(width: 8),
          ChipView(data: 'Wikipedia'),
        ]
    );
  }
}

class ChipView extends HookWidget {
  final String data;

  const ChipView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF006AF6).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF006AF6),
        ),
      ),
    );
  }
}

/*for (final alias in event.aliases!)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: ChipView(data: alias),
            ),
        ],*/