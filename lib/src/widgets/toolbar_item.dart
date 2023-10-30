
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/constants/enums.dart';
import '../core/constants/keys.dart';
import '../core/utils/helper.dart';
import '../providers/provider.dart';

class ToolbarItem extends HookConsumerWidget {
  final String tooltipMessage;
  final String buttonText;
  final TodoListFilter value;

  const ToolbarItem({
    super.key,
    required this.tooltipMessage,
    required this.buttonText,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoListFilter);

    return Tooltip(
      key: allFilterKey,
      message: tooltipMessage,
      child: TextButton(
        onPressed: () => ref.read(todoListFilter.notifier).state = value,
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          foregroundColor: MaterialStateProperty.all(
            textColorFor(value, filter),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
