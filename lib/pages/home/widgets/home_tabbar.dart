import 'package:flutter/material.dart';

import '../../../core/colors.dart';

homeTabBar(TabController tabController, BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: TabBar(
      controller: tabController,
      labelColor: darkContainerColor,
      indicatorWeight: 5,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle:  Theme.of(context).textTheme.bodyLarge,
      unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
      tabs: const [
        Text(
          "chats",
        ),
        Text(
          "stories",
        ),
        Text(
          "calls",
        ),
      ],
    ),
  );
}
