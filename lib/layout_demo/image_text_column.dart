import 'package:flutter/material.dart';

import 'pet_card.dart';

class ImageTextColumn extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PetCard"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return PetCard();
  }
}