import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apidash/providers/providers.dart';
import 'package:apidash/consts.dart';
import 'details_card/details_card.dart';
import 'url_card.dart';

class RequestEditorPane extends ConsumerStatefulWidget {
  const RequestEditorPane({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<RequestEditorPane> createState() => _RequestEditorPaneState();
}

class _RequestEditorPaneState extends ConsumerState<RequestEditorPane> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activeId = ref.watch(activeIdStateProvider);
    if (activeId == null) {
      return const RequestEditorPaneHome();
    } else {
      return Padding(
        padding: kP8,
        child: Column(
          children: const [
            EditorPaneRequestURLCard(),
            kVSpacer10,
            Expanded(
              child: EditorPaneRequestDetailsCard(),
            ),
          ],
        ),
      );
    }
  }
}

class RequestEditorPaneHome extends StatelessWidget {
  const RequestEditorPaneHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Welcome to API Dash!",
              style: Theme.of(context).textTheme.headlineLarge),
          Text("Click on the +New button to create a new request draft",
              style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
