import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rosetta/features/features.dart';

/// Toolbar widget for undo/redo operations
class UndoRedoToolbarWidget extends StatelessWidget {
  const UndoRedoToolbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationEditorBloc, TranslationEditorState>(
      buildWhen: (previous, current) {
        // Only rebuild when undo/redo availability changes
        if (current is TranslationEditorLoadedState &&
            previous is TranslationEditorLoadedState) {
          return current.canUndo != previous.canUndo ||
              current.canRedo != previous.canRedo;
        }
        return current is TranslationEditorLoadedState;
      },
      builder: (context, state) {
        if (state is! TranslationEditorLoadedState) {
          return const SizedBox.shrink();
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: state.canUndo
                  ? () => context.read<TranslationEditorBloc>().add(
                      const UndoEvent(),
                    )
                  : null,
              icon: const Icon(Icons.undo),
              tooltip: 'Undo (Ctrl+Z)',
            ),
            IconButton(
              onPressed: state.canRedo
                  ? () => context.read<TranslationEditorBloc>().add(
                      const RedoEvent(),
                    )
                  : null,
              icon: const Icon(Icons.redo),
              tooltip: 'Redo (Ctrl+Y)',
            ),
          ],
        );
      },
    );
  }
}
