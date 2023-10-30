import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/provider.dart';
import '../core/constants/enums.dart';
import 'toolbar_item.dart';

class Toolbar extends HookConsumerWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '${ref.watch(uncompletedTodosCount)} items left',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const ToolbarItem(
          tooltipMessage: 'All todos',
          buttonText: 'All',
          value: TodoListFilter.all,
        ),
        const ToolbarItem(
          tooltipMessage: 'Only uncompleted todos',
          buttonText: 'Active',
          value: TodoListFilter.active,
        ),
        const ToolbarItem(
          tooltipMessage: 'Only completed todos',
          buttonText: 'Completed',
          value: TodoListFilter.completed,
        ),
      ],
    );
  }
}
