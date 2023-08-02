import 'package:counter/cubit/count_block.dart';
import 'package:counter/cubit/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Counter());
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int teamAPoint = 0;

   int teamBPoint = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff2699e0),
          title: const Text('Counter'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/modern basket ball floAT.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 500,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Team A',
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            width: 170,
                            child: FittedBox(
                              child: Text(
                                '${BlocProvider.of<CounterCubit>(context).teamAPoints}',
                                style: const TextStyle(
                                  fontSize: 150,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .teamIncrease('A', 1);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff2699e0),
                                minimumSize: const Size(120, 50)),
                            child: const Text(
                              'Add 1 point',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .teamIncrease('A', 2);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff2699e0),
                                minimumSize: const Size(120, 50)),
                            child: const Text(
                              'Add 2 point',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .teamIncrease('A', 3);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff2699e0),
                                minimumSize: const Size(120, 50)),
                            child: const Text(
                              'Add 3 point',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 500,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 1.5,
                      indent: 50,
                      endIndent: 50,
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Team B',
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            width: 170,
                            child: FittedBox(
                              child: Text(
                                '${BlocProvider.of<CounterCubit>(context).teamBPoints}',
                                style: const TextStyle(
                                  fontSize: 150,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .teamIncrease('', 1);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffec3f63),
                                minimumSize: const Size(120, 50)),
                            child: const Text(
                              'Add 1 point',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .teamIncrease('', 2);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffec3f63),
                                minimumSize: const Size(120, 50)),
                            child: const Text(
                              'Add 2 point',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .teamIncrease('', 3);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffec3f63),
                                minimumSize: const Size(120, 50)),
                            child: const Text(
                              'Add 3 point',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    minimumSize: const Size(120, 50)),
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is CounterAStateChange) {
        teamAPoint = BlocProvider.of<CounterCubit>(context).teamAPoints;
      } else if (state is CounterBStateChange) {
        teamBPoint = BlocProvider.of<CounterCubit>(context).teamBPoints;
      }
    });
  }
}
