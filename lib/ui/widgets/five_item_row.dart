import 'package:dogventurehq/ui/screens/ledger_details/sheet_item.dart';
import 'package:flutter/material.dart';

class FiveItemRow extends StatelessWidget {
  final bool bgClrFlag;
  final String slNo;
  final String date;
  final String id;
  final String amount;
  final VoidCallback actionFn;
  const FiveItemRow({
    super.key,
    required this.bgClrFlag,
    required this.slNo,
    required this.date,
    required this.id,
    required this.amount,
    required this.actionFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SheetItem(
          txt: slNo,
          bgClr: bgClrFlag ? null : Colors.grey.shade200,
        ),
        SheetItem(
          txt: date,
          bgClr: bgClrFlag ? null : Colors.grey.shade200,
          maxLine: 2,
        ),
        SheetItem(
          txt: id,
          bgClr: bgClrFlag ? null : Colors.grey.shade200,
        ),
        SheetItem(
          txt: amount,
          bgClr: bgClrFlag ? null : Colors.grey.shade200,
        ),
        SheetItem(
          onTapFn: actionFn,
          txt: 'View Details',
          txtClr: Colors.blue,
          bgClr: bgClrFlag ? null : Colors.grey.shade200,
        ),
      ],
    );
  }
}
