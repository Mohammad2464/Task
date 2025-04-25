import 'package:flutter/material.dart';
import 'package:test_task/resources/app_colors.dart';
import 'package:test_task/resources/app_strings.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Title
              const Text(
                "Mitt Konto",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 24),
              // Profile Section
              Container(
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 15,
                  ),
                  child: Row(
                    children: [
                      // Avatar
                      Container(
                        width: 62,
                        height: 62,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white, // Placeholder for avatar
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Name and Email
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Nisar",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            "nisar@gmail.com",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                          ),
                                Text(
                            "03177170058",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ListTile(
                leading: Image.asset('${AppStrings.imagePath}setting.png',height: 18),
                title: const Text(
                  "Kontoninställningar",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.black),
                ),
                onTap: () {
                },
              ),
              ListTile(
                leading: Image.asset('${AppStrings.imagePath}files.png',height: 18),
                title: const Text(
                  "Mina betalmetoder",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.black),
                ),
                onTap: () {
                },
              ),
              ListTile(
                leading: Image.asset('${AppStrings.imagePath}support.png',height: 18),
                title: const Text(
                  "Support",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.black),
                ),
                onTap: () {
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
