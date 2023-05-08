import 'package:flutter/material.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

// todo -> build UI
class ChatPage extends StatefulWidget {
  final Account account;
  const ChatPage({Key? key, required this.account}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: LoadingIndicator(
        isLoading: _loading,
        loadingAnimIsAsset: true,
        lottieAnimResource: Assets.animLoading,
        child: EmptyContentPlaceholder(
            icon: TablerIcons.message_2,
            title: context.localizer.underMaintenanceHeader,
            subtitle: context.localizer.underMaintenanceSubhead),
      ),
    );
  }
}
