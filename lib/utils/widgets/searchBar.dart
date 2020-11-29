 import 'package:flutter/material.dart';

Padding searchBar(String title) {
    return Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            keyboardType: TextInputType.text,
            
            textCapitalization: TextCapitalization.words,

            // style: style,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 2,
                  style: BorderStyle.none,
                ),
              ),
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: title,
              labelText: 'Search',
            ),
            onChanged: (value) {},
          ),
        );
  }