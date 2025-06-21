import 'package:basic_pokemon_card_list/commons/widgets/custom_network_images.dart';
import 'package:basic_pokemon_card_list/models/pokemon_resp_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pokemon_details/view.dart';
import 'provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<HomeProvider>(
          builder: (context, provider, child) {
            return provider.isSearch
                ? TextField(
                    controller: provider.searchCtrl,
                    onChanged: (val) {
                      if (val.isEmpty) {
                        provider.setSearch(false);
                      }
                    },
                    onSubmitted: (val) async {
                      await provider.getSearchPokemonList(val);
                    },
                    decoration: InputDecoration(hintText: 'Enter set name'),
                  )
                : Text('Home Page');
          },
        ),
        actions: [
          Consumer<HomeProvider>(
            builder: (context, provider, child) {
              return IconButton(
                  onPressed: () {
                    provider.setSearch(true);
                  },
                  icon: Icon(Icons.search));
            },
          )
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return provider.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : provider.pokemonList.isEmpty
                  ? Center(
                      child: Text(
                        'No Pokemon Found...',
                        style: TextStyle(fontSize: 30, color: Colors.grey),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(10),
                      child: GridView.count(
                        key: PageStorageKey('pokemonGridKey'),
                        controller: provider.scrollController,
                        shrinkWrap: true,
                        childAspectRatio: 9 / 9,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: provider.pokemonList
                            .map((e) => CustomTile(
                                  data: e,
                                ))
                            .toList(),
                      ),
                    );
        },
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final PokemonData data;

  const CustomTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PokemonDetailsPage(
                      pokemonData: data,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.yellow,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                color: Colors.grey,
                blurRadius: 2.0,
              ),
            ]),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: Hero(
                tag: '${data.images?.large}',
                child: CustomCacheNetworkImage(imageUrl: data.images?.large ?? ''),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                child: Text(
              '${data.name}',
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ),
      ),
    );
  }
}
