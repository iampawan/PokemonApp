import 'package:flutter_web/material.dart';
import 'pokemon.dart';

class DataSearch extends SearchDelegate<String> {
  final List<Pokemon> search;
  final ValueChanged<Pokemon> onSelected;
  DataSearch(this.search, this.onSelected);

  @override
  List<Widget> buildActions(BuildContext context) {
    // ACTION FOR APP BAR
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result base and the selection
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone search something
    final suggestionList = query.isEmpty
        ? this.search
        : this.search.where((p) => p.name.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          this.onSelected(suggestionList[index]);
          //showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].name.substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].name.substring(query.length),
                  style: TextStyle(color: Colors.grey)),
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
