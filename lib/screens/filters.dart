import 'package:flutter/material.dart';
import 'package:todo_app/widgets/switch_list.dart';
// import 'package:todo_app/screens/tabs.dart';
// import 'package:todo_app/widgets/main_drawer.dart';


enum Filter{
  glutenFree,
  lastoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key,required this.currentFilters});

  final Map<Filter,bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;


  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet= widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet= widget.currentFilters[Filter.lastoseFree]!;
    _vegetarianFilterSet= widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet= widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
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
      body: WillPopScope(
        onWillPop: ()async{
          Navigator.of(context).pop({
            Filter.glutenFree:_glutenFreeFilterSet,
            Filter.lastoseFree:_lactoseFreeFilterSet,
            Filter.vegetarian:_vegetarianFilterSet,
            Filter.vegan:_veganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            CustomSwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals..',
            ),
            CustomSwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
            ),
            CustomSwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
            ),
            CustomSwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
            ),
          ],
        ),
      ),
    );
  }
}
