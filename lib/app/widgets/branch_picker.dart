import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/data/models/branch.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

class BranchPicker extends StatefulWidget {
  const BranchPicker({
    Key? key,
    required this.branches,
    required this.onSelectBranch,
  }) : super(key: key);

  final List<Branch> branches;
  final void Function(Branch? branch) onSelectBranch;

  @override
  State<BranchPicker> createState() => _BranchPickerState();
}

class _BranchPickerState extends State<BranchPicker> {
  String selectedText = "Pilih Cabang";

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(Insets.small),
      child: InkWell(
        onTap: () async {
          final result = await showModalBottomSheet<Branch?>(
            context: context,
            builder: (context) => BottomSheet(
              enableDrag: true,
              clipBehavior: Clip.hardEdge,
              onClosing: () {},
              builder: (context) => Container(
                padding: const EdgeInsets.symmetric(
                  vertical: Insets.medium,
                  horizontal: Insets.small,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        "Semua Cabang (${widget.branches.length})",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      onTap: () {
                        setState(() {
                          selectedText = "Semua Cabang";
                        });
                        final result =
                            Branch(name: "Semua Cabang", address: "");
                        Navigator.pop(context, result);
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.branches.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            widget.branches[index].name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          subtitle: Text(
                            widget.branches[index].address,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: const Icon(Icons.store),
                          onTap: () {
                            final selectedBranch = widget.branches[index];
                            setState(() {
                              selectedText = selectedBranch.name;
                            });
                            Navigator.pop(context, selectedBranch);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

          widget.onSelectBranch(result);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Insets.small,
            vertical: Insets.small,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cabang",
                  ),
                  const SizedBox(width: 3),
                  Text(
                    selectedText,
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const Icon(Icons.arrow_drop_down_rounded, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
