import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import '../ui.dart';

@RoutePage()
class SongPlayPage extends StatefulWidget {
  const SongPlayPage({super.key, required this.song});
  final SongEntity song;

  @override
  State<SongPlayPage> createState() => _SongPlayPageState();
}

class _SongPlayPageState extends BasePageState<SongPlayPage, SongPlayBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(SongPlayerLoadSong(songUrl: widget.song.songUrl));
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text(
          widget.song.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.03),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
          ),
        ),
        action: IconButton(
          onPressed: () {},
          highlightColor: Colors.transparent,
          icon: const Icon(
            Icons.more_vert,
            size: 30,
          ),
        ),
      ),
      body: BlocBuilder<SongPlayBloc, SongPlayState>(
        builder: (context, state) {
          if (state.isSongPlay == LoadSong.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Column(
              children: [
                SongInforWidget(
                  song: widget.song,
                ),
                const SizedBox(
                  height: 50,
                ),
                SongPlayerWidget(
                  song: widget.song,
                  max: state.songDuration.inSeconds.toDouble(),
                  value: state.songPosition.inSeconds.toDouble(),
                  onChanged: (value) {
                    context.read<SongPlayBloc>().add(
                          SongPlayerProgress(
                            position: Duration(
                              seconds: value,
                            ),
                          ),
                        );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                MusicControlWidget(
                  isPlaying: state.isPlaying,
                  onPressed: () {
                    context
                        .read<SongPlayBloc>()
                        .add(const SongPlayerPlayPause());
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
