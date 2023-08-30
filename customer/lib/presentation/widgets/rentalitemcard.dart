import 'package:customer/presentation/widgets/squicircle.dart';
import 'package:flutter/material.dart';

class RentalItemCard extends StatefulWidget {
  const RentalItemCard(
      {super.key,
      required this.name,
      required this.price,
      this.onClick, required this.images});
  final String name;
  final List<String> images;
  final int price;
  final VoidCallback? onClick;
  @override
  State<RentalItemCard> createState() => _RentalItemCardState();
}

class _RentalItemCardState extends State<RentalItemCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SquicircleContainer(
                width: 100,
                height: 100,
                child: Image.network(widget.images[0], fit: BoxFit.cover,),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Rs. ${widget.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 13, right: 8),
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 40.0,
                    color: Colors.blue,
                  ),
                  onPressed: widget.onClick,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
