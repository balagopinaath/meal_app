import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({required this.onSelectScreen, super.key});
  final void Function(String identifer) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Theme.of(context).colorScheme.primary,
                  size: 48,
                ),
                const Gap(18),
                Text('Cooking Up!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('meals');
            },
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
            title: Text('Meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24)),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('filters');
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
            title: Text('Filter',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
