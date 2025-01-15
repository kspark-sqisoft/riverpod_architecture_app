import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_architecture_app/features/post/presentation/post_edit_controller.dart';

import '../data/post_repository.dart';
import '../domain/post.dart';

class PostEditScreen extends ConsumerStatefulWidget {
  const PostEditScreen({super.key, required this.postId});
  final int postId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostEditScreenState();
}

class _PostEditScreenState extends ConsumerState<PostEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final postAsync = ref.watch(fetchPostProvider(widget.postId));
        return postAsync.when(
          data: (post) => PostEditForm(post: post),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text(e.toString())),
        );
      },
    );
  }
}

class PostEditForm extends ConsumerStatefulWidget {
  const PostEditForm({super.key, required this.post});
  final Post post;

  @override
  ConsumerState<PostEditForm> createState() => _PostEditFormState();
}

class _PostEditFormState extends ConsumerState<PostEditForm> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.post.title;
    _bodyController.text = widget.post.body;
  }

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postEditControllerProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Builder(builder: (context) {
        return Builder(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _titleController,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _bodyController,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 8,
                decoration: const InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: state.isLoading
                    ? null
                    : () => ref
                        .read(postEditControllerProvider.notifier)
                        .updatePost(
                          previousPost: widget.post,
                          title: _titleController.text,
                          body: _bodyController.text,
                          onSuccess: context.pop,
                        ),
                child: const Text('Submit'),
              )
            ],
          );
        });
      }),
    );
  }
}
