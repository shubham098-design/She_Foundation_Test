import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Intern Dashboard"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Dashboard"),
              Tab(text: "Leaderboard"),
              Tab(text: "Announcements"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DashboardTab(),
            LeaderboardTab(),
            AnnouncementsTab(),
          ],
        ),
      ),
    );
  }
}

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Intern Name: Shubham Dhaniyan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text("Referral Code: shubham2025", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Total Donations Raised", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  SizedBox(height: 10),
                  Text("₹5,000", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Rewards/Unlockables", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              rewardCard("Bronze Badge", Icons.emoji_events, Colors.brown),
              rewardCard("Silver Badge", Icons.emoji_events, Colors.grey),
              rewardCard("Gold Badge", Icons.emoji_events, Colors.amber),
            ],
          )
        ],
      ),
    );
  }

  Widget rewardCard(String title, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 110,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class LeaderboardTab extends StatelessWidget {
  const LeaderboardTab({super.key});

  final List<Map<String, dynamic>> mockLeaders = const [
    {"name": "Aarav", "score": 8000},
    {"name": "Riya", "score": 7200},
    {"name": "Kabir", "score": 6500},
    {"name": "Anaya", "score": 6000},
    {"name": "Vivaan", "score": 5800},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mockLeaders.length,
      itemBuilder: (context, index) {
        final leader = mockLeaders[index];
        return ListTile(
          leading: CircleAvatar(child: Text("#${index + 1}")),
          title: Text(leader["name"]),
          trailing: Text("₹${leader["score"]}"),
        );
      },
    );
  }
}

class AnnouncementsTab extends StatelessWidget {
  const AnnouncementsTab({super.key});

  final List<String> announcements = const [
    "🎉 Congratulations on reaching ₹5,000!",
    "📢 New badge unlocked!",
    "🕒 Next leaderboard refresh on Friday.",
    "💡 Tip: Share your referral code more!",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: announcements.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.announcement_outlined),
        title: Text(announcements[index]),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}