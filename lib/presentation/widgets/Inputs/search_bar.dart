import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: .4),
          borderRadius: BorderRadius.circular(25),
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 50,
          width: 370,
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: .4),
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "search...",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                  
                    },
                    child: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                   
                    },
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
