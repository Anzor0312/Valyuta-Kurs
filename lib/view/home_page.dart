import 'package:cryuptoapp/cubit/home_states.dart';
import 'package:cryuptoapp/view/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Cryupto App"),
              ),
              body: Builder(
                builder: (context) {
                  if (state is HomeLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomeErrorState) {
                    return Center(child: Text(state.error));
                  } else if (state is HomeCompleteState) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      InfoPage(data: state.users[index]),
                                ));
                          },
                          title: Text(state.users[index].title.toString()),
                        );
                      },
                      itemCount: state.users.length,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            );
          },
        ));
  }
}
