import 'package:flutter/material.dart';
import 'package:pet_finder_app/features/home/data/model/cat_breed.dart';
import 'package:pet_finder_app/features/home/ui/widgets/breed_list_veiw_item.dart';

class BreedListView extends StatelessWidget {
  final List<CatBreed> breeds;
  const BreedListView({super.key, required this.breeds});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: breeds.length,
      itemBuilder: (context, index) {
        final breed = breeds[index];
        return BreedListViewItem(breed: breed);
      },
    );
  }
}
