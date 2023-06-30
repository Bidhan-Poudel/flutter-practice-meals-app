import 'package:flutter/material.dart';
import 'package:todo_app/widgets/switch_list.dart';
// import 'package:todo_app/screens/tabs.dart';
// import 'package:todo_app/widgets/main_drawer.dart';
import 'package:todo_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key,});


    

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final activeFilters=ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if(identifier=='meals'){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const TabsScreen()),);
      //   }
      // }),
      body:Column(
          children: [
            CustomSwitchListTile(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals..',
            ),
            CustomSwitchListTile(
              value: activeFilters[Filter.lastoseFree]!,
              onChanged: (isChecked) {
               ref.read(filtersProvider.notifier).setFilter(Filter.lastoseFree, isChecked);
              },
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
            ),
            CustomSwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked) {
                  ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
            ),
            CustomSwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) {
               ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
            ),
          ],
        ),
      );
  }
}
