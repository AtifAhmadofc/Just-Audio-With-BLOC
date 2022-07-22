import 'package:flutter/material.dart';
import 'package:just_audio_with_block/Bloc/radio_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

class Radio_Controls extends StatefulWidget {
  AudioPlayer player;
  List<String> radioUrlList;
   Radio_Controls({required this.player,required this.radioUrlList,Key? key}) : super(key: key);

  @override
  _Radio_ControlsState createState() => _Radio_ControlsState();
}

class _Radio_ControlsState extends State<Radio_Controls> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RadioBloc, RadioState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state.isLoading!) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 64.0,
            height: 64.0,
            child: const CircularProgressIndicator(),
          );
        } else if (state.isPlaying!) {
          return Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_outlined),
                iconSize: 64.0,
                onPressed: (){
                  BlocProvider.of<RadioBloc>(context).add(RadioPlay(player: widget.player));
                },
              ),

              IconButton(
                icon: const Icon(Icons.play_arrow),
                iconSize: 64.0,
                onPressed: (){
                  BlocProvider.of<RadioBloc>(context).add(RadioPlay(player: widget.player));
                },
              ),

              IconButton(
                icon: const Icon(Icons.play_arrow),
                iconSize: 64.0,
                onPressed: (){
                  BlocProvider.of<RadioBloc>(context).add(RadioPlay(player: widget.player));
                },
              ),
            ],
          );
        } else if (state.isLoading!) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 64.0,
            onPressed: (){
              BlocProvider.of<RadioBloc>(context).add(RadioPause(player: widget.player));
            },
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 64.0,
            onPressed: () {}
          );
        }
      },
    );
  }
}
