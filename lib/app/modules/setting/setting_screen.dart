import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/app/widgets/screen_wrapper.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      children: [
        _BuildStoreConfigCard(
          storeName: "Jhon Laundry",
          address: "Masarang Tondano",
          onPressed: () => Navigator.pushNamed(context, Routes.settingStore),
        ),
        const SizedBox(height: Insets.small),
        _BuildAccountConfigCard(
          name: "Jhon Masengky",
          role: "Owner",
          onPressed: () => Navigator.pushNamed(context, Routes.settingAccount),
        ),
        const SizedBox(height: Insets.small),
        const _BuildSegmentListItem(),
      ],
    );
  }
}

class _BuildStoreConfigCard extends StatelessWidget {
  const _BuildStoreConfigCard({
    Key? key,
    required this.storeName,
    required this.address,
    required this.onPressed,
  }) : super(key: key);

  final String storeName;
  final String address;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.onSecondaryContainer,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Insets.small,
            vertical: Insets.medium * .75,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      storeName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white),
                    ),
                    Text(
                      address,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildAccountConfigCard extends StatelessWidget {
  const _BuildAccountConfigCard({
    Key? key,
    required this.name,
    required this.role,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final String role;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Insets.small,
            vertical: Insets.medium * .75,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor:
                    Theme.of(context).colorScheme.onSecondaryContainer,
                child: Text(
                  name.toInitials,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: Insets.small),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(),
                    ),
                    Text(
                      role,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildSegmentListItem extends StatelessWidget {
  const _BuildSegmentListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildListTile(
          context,
          title: "Pengaturan Printer",
          subTitle: "Pastikan printer sudah sesuaikan",
          iconData: Icons.print_rounded,
          onPressed: () => Navigator.pushNamed(context, Routes.settingPrinter),
        ),
        _buildListTile(
          context,
          title: "Pengaturan Cabang",
          subTitle: "Atur semua hal-hal tentang cabang dalam bisnis ini",
          iconData: Icons.store_rounded,
          onPressed: () => Navigator.pushNamed(context, Routes.settingBranch),
        ),
        _buildListTile(
          context,
          title: "Pengaturan Member",
          subTitle: "Kelola pencatatan member untuk data yang akurat",
          iconData: Icons.groups_outlined,
          onPressed: () => Navigator.pushNamed(context, Routes.settingMember),
        ),
        _buildListTile(
          context,
          title: "Pengaturan Karyawan",
          subTitle: "Atur lini pekerja untuk hasil yang optimal",
          iconData: Icons.supervisor_account_rounded,
          onPressed: () => Navigator.pushNamed(context, Routes.settingCrew),
        ),
        const Divider(),
        ListTile(
          title: Text(
            "Sign out",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 14,
            ),
          ),
          leading: Icon(
            Icons.account_circle_rounded,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
          horizontalTitleGap: 5,
          onTap: () async {
            final res = await showDialog<bool>(
              context: context,
              builder: (context) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: Insets.medium,
                    right: Insets.medium,
                    top: Insets.medium,
                    bottom: Insets.small,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Keluar dari aplikasi?",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FilledButton(
                            child: const Text("Ya"),
                            onPressed: () => Navigator.pop(context, true),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
            print(res ?? false);
          },
          dense: true,
        )
      ],
    );
  }

  _buildListTile(
    BuildContext context, {
    required String title,
    required String subTitle,
    required IconData iconData,
    required void Function() onPressed,
  }) =>
      ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
        leading: Icon(
          iconData,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
        horizontalTitleGap: 5,
        onTap: onPressed,
        dense: true,
      );
}
