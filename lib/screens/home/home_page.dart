import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/components/loading_page.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/list_levels.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
import 'package:cipher_affair/screens/home/home_page_functions.dart';
import 'package:cipher_affair/screens/home/level.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final AudioPlayer player = AudioPlayer();
  late AppLifecycleState? state;
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    player.setAsset('assets/music/music.mp3');
    player.play();
    player.setLoopMode(LoopMode.all);
    state = SchedulerBinding.instance.lifecycleState;
    _listener =
        AppLifecycleListener(onInactive: pauseMusic, onResume: playMusic);
  }

  Future<void> pauseMusic() async {
    await player.pause();
  }

  Future<void> playMusic() async {
    await player.play();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HomePageFunction().returnPlayer(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return BlocProvider(
                create: (context) => AuthCubit(),
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: primary_3,
                    body: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/backgrounds/home_page_1.jpeg'),
                              fit: BoxFit.cover,
                              opacity: 0.2)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SpacingConsts().mediumHeightBetweenFields(context),
                            const AutoSizeText(
                              'Cipher Scape',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 55.0,
                                  fontFamily: 'Legio',
                                  color: Colors.amber),
                            ),
                            SpacingConsts().mediumHeightBetweenFields(context),
                            Wrap(
                              runSpacing:
                                  MediaQuery.of(context).size.height * 0.03,
                              children: levels.take(3).map((level) {
                                return levelGrid(
                                    level, context, snapshot.data!.levels!);
                              }).toList(),
                            ),
                            SpacingConsts().mediumHeightBetweenFields(context),
                            CustomButton(
                              buttonText: 'Logout',
                              buttonHeight: 0.05,
                              buttonWidth: 0.7,
                              onPressed: () {
                                setState(() {
                                  context.read<AuthCubit>().signOut();
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const LoadingPage();
            }
          }

          return Container();
        }));
  }

  Widget levelGrid(
      Level level, BuildContext context, List<String> levelsCompleted) {
    return InkWell(
      onTap: () {
        if (level.level == 1) {
          Navigator.pushReplacementNamed(context, '/level1');
        }

        if (levelsCompleted.contains((level.level - 1).toString())) {
          String route = '/level${level.level}';
          Navigator.pushReplacementNamed(context, route);
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.white, width: 2),
            image: DecorationImage(
                image: level.image != null
                    ? AssetImage(level.image!)
                    : const AssetImage(''),
                fit: BoxFit.cover,
                opacity: level.level != 1 &&
                        levels.isNotEmpty &&
                        !levelsCompleted.contains((level.level - 1).toString())
                    ? 0.2
                    : 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.6,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.amber.withOpacity(level.level != 1 &&
                        levels.isNotEmpty &&
                        !levelsCompleted.contains((level.level - 1).toString())
                    ? 0.2
                    : 1),
              ),
              child: Center(
                  child: AutoSizeText(
                'Level ${level.level} : ${level.title}',
                style: const TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontFamily: 'Kod',
                    fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }
}
