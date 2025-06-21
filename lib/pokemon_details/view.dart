import 'package:basic_pokemon_card_list/models/pokemon_resp_model.dart';
import 'package:basic_pokemon_card_list/utils/extensions_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../commons/widgets/custom_network_images.dart';
import '../commons/widgets/custom_texts.dart';
import 'provider.dart';

class PokemonDetailsPage extends StatelessWidget {

  final PokemonData pokemonData;

  const PokemonDetailsPage({
    required this.pokemonData,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PokemonDetailsProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<PokemonDetailsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('${pokemonData.name}'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(tag: '${pokemonData.images?.large}',
              child: CustomCacheNetworkImage(imageUrl: pokemonData.images?.large ?? '')),
              SizedBox(height: 20,),
              HeaderText(name: pokemonData.name ?? ''),
              BodyText(name: 'HP: ${pokemonData.hp}'),
              BodyText(name: 'Supertype: ${pokemonData.supertype}'),
              BodyText(name: 'Subtype: ${pokemonData.subtypes?.listToString()}'),
              SizedBox(height: 20,),
              HeaderText(name: 'Set: ${pokemonData.set?.name ?? ''} (${pokemonData.set?.releaseDate})'),
              SizedBox(
                  height: 60,
                  child: CustomCacheNetworkImage(imageUrl: pokemonData.set?.images?.symbol ?? '')),
              BodyText(name: 'Series: ${pokemonData.set?.series}'),
              SizedBox(height: 20,),
              HeaderText(name: 'Attacks:'),
              SizedBox(height: 10,),
              ...pokemonData.attacks!.map((e) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderText(name: e.name ?? ''),
                    SizedBox(height: 5,),
                    BodyText(name: 'Cost: ${e.cost?.listToString()}'),
                    BodyText(name: 'Damage: ${e.damage}'),
                    BodyText(name: 'Effect: ${e.text}'),
                  ],
                );
              }),
              SizedBox(height: 20,),
              BodyText(name: 'Weakness: ${pokemonData.weaknesses?.map((e){
                return '${e.type}(${e.value})';
              }).toList().listToString()}'),
              BodyText(name: 'Resistance: ${pokemonData.resistances?.map((e){
                return '${e.type}(${e.value})';
              }).toList().listToString()}'),
              BodyText(name: 'Retreat Cost: ${pokemonData.retreatCost?.listToString()}'),
              SizedBox(height: 20,),
              BodyText(name: 'Artist: ${pokemonData.artist}'),
              BodyText(name: 'Rarity: ${pokemonData.rarity}'),
              BodyText(name: 'Flavor Text: ${pokemonData.flavorText}'),
              SizedBox(height: 20,),
              HeaderText(name: 'Prices (TCGPlayer)'),
              BodyText(name: 'Low: \$${pokemonData.tcgplayer?.prices?.holofoil?.low ?? '0'}'),
              BodyText(name: 'Mid: \$${pokemonData.tcgplayer?.prices?.holofoil?.mid ?? '0'}'),
              BodyText(name: 'High: \$${pokemonData.tcgplayer?.prices?.holofoil?.high ?? '0'}'),
              SizedBox(height: 20,),
              HeaderText(name: 'Prices (CardMarket)'),
              BodyText(name: 'Average Sell Price: \$ ${pokemonData.cardmarket?.prices?['averageSellPrice'] ?? '0'}'),
              BodyText(name: 'Trend Price: \$ ${pokemonData.cardmarket?.prices?['trendPrice'] ?? '0'}')
            ],
          ),
        ),
      ),
    ); 
  }


}


