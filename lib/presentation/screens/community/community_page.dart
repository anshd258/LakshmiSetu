import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class AnimatedDiscordPage extends StatefulWidget {
  static const route = "/discord";

  @override
  State<AnimatedDiscordPage> createState() => _AnimatedDiscordPageState();
}

class _AnimatedDiscordPageState extends State<AnimatedDiscordPage> {
  bool isLeftPanelExpanded = false;
  bool isChatVisible = false;
  int? selectedTileIndex;

  List<Map<String, dynamic>> tiles = [
    {
      "title": "Neighbourhood Circle",
      "subtitle": "Local savings group",
      "icon": Icons.people_outline,
      "description":
          "Connect with nearby members for daily savings and support",
      "chatMessages": [
        {"username": "JohnDoe", "message": "How is everyone doing today?"},
        {
          "username": "JaneSmith",
          "message": "Don't forget our meeting at 5 PM!"
        }
      ]
    },
    {
      "title": "Money Mentors",
      "subtitle": "Expert guidance",
      "icon": Icons.school,
      "description": "Learn from experienced financial advisors and coaches",
      "chatMessages": [
        {
          "username": "FinanceGuru",
          "message": "Let's discuss investment strategies."
        },
        {
          "username": "InvestorJane",
          "message": "I'm interested in learning about mutual funds."
        }
      ]
    },
    {
      "title": "Women Leaders",
      "subtitle": "Empowerment network",
      "icon": Icons.diversity_3,
      "description": "Community of women entrepreneurs and leaders",
      "chatMessages": [
        {
          "username": "LeaderLily",
          "message": "Excited about the upcoming workshop!"
        },
        {
          "username": "BossBabe",
          "message": "Who else is attending the conference?"
        }
      ]
    },
    {
      "title": "Rural Business",
      "subtitle": "Enterprise support",
      "icon": Icons.store_outlined,
      "description": "Resources for rural businesses and startups",
      "chatMessages": [
        {"username": "FarmKing", "message": "Any tips on managing livestock?"},
        {
          "username": "AgriQueen",
          "message": "Looking for buyers for fresh produce."
        }
      ]
    },
    {
      "title": "Skill Share",
      "subtitle": "Learn & earn",
      "icon": Icons.lightbulb_outline,
      "description": "Share skills and discover earning opportunities",
      "chatMessages": [
        {
          "username": "SkillMaster",
          "message": "Offering a free workshop on carpentry this weekend."
        },
        {
          "username": "LearnerLaura",
          "message": "I would love to join. Please share the details."
        }
      ]
    },
    {
      "title": "Market Connect",
      "subtitle": "Trade network",
      "icon": Icons.shopping_basket_outlined,
      "description": "Connect with buyers and sellers in your region",
      "chatMessages": [
        {
          "username": "MarketMan",
          "message": "Fresh fruits available at discounted rates!"
        },
        {
          "username": "ShopQueen",
          "message": "Looking for suppliers of organic vegetables."
        }
      ]
    },
    {
      "title": "Agri Finance",
      "subtitle": "Farming support",
      "icon": Icons.grass,
      "description": "Financial planning for agricultural activities",
      "chatMessages": [
        {
          "username": "FarmPlanner",
          "message": "Discussing crop rotation strategies."
        },
        {
          "username": "GreenThumb",
          "message": "Any advice on sustainable farming?"
        }
      ]
    },
    {
      "title": "Digital Skills",
      "subtitle": "Tech learning",
      "icon": Icons.devices,
      "description": "Learn essential digital and mobile banking skills",
      "chatMessages": [
        {"username": "TechSavvy", "message": "How to set up mobile banking?"},
        {
          "username": "CoderKid",
          "message": "I'm hosting a session on coding basics."
        }
      ]
    },
    {
      "title": "Help Desk",
      "subtitle": "24/7 support",
      "icon": Icons.support_agent,
      "description": "Get help with accounts and transactions",
      "chatMessages": [
        {
          "username": "SupportSam",
          "message": "Need help with account recovery? I'm here."
        },
        {
          "username": "FriendlyAgent",
          "message": "We're available 24/7 for your queries."
        }
      ]
    },
    {
      "title": "Goal Setters",
      "subtitle": "Savings goals",
      "icon": Icons.track_changes,
      "description": "Set and achieve your financial goals together",
      "chatMessages": [
        {
          "username": "GoalGetter",
          "message": "Sharing tips on saving more effectively."
        },
        {
          "username": "DreamChaser",
          "message": "I just hit my savings goal! Feeling proud."
        }
      ]
    }
  ];

  void toggleLeftPanel() {
    setState(() {
      isLeftPanelExpanded = !isLeftPanelExpanded;
    });
  }

  void selectTile(int index) {
    setState(() {
      selectedTileIndex = index;
      isChatVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Animated Left Panel
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: isLeftPanelExpanded ? 280 : 75,
              color: const Color(0xFF2F3136),
              child: GestureDetector(
                onTap: toggleLeftPanel,
                child: Column(
                  children: [
                    // Server Header
                    Container(
                      height: 75,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2F3136),
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: isLeftPanelExpanded
                              ? const Text(
                                  'Community Server',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )
                              : const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 24,
                                ),
                        ),
                      ),
                    ),
                    // Animated Tiles
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isLeftPanelExpanded
                            ? GridView.builder(
                                padding: const EdgeInsets.all(16),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 0.8,
                                ),
                                itemCount: tiles.length,
                                itemBuilder: (context, index) {
                                  return DiscordPastelTile(
                                    index: index,
                                    callback: (index) {
                                      setState(() {
                                        isLeftPanelExpanded = false;
                                      });
                                      selectTile(index);
                                    },
                                    title: tiles[index]['title']!.toString(),
                                    subtitle:
                                        tiles[index]['subtitle']!.toString(),
                                    icon: tiles[index]['icon'] as IconData,
                                    isSelected: selectedTileIndex == index,
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount: tiles.length,
                                itemBuilder: (context, index) {
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    height:
                                        selectedTileIndex == index ? 75 : 50,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    child: Material(
                                      color: _generatePastelColor(index),
                                      borderRadius: BorderRadius.circular(25),
                                      child: InkWell(
                                        onTap: () => selectTile(index),
                                        borderRadius: BorderRadius.circular(25),
                                        child: Center(
                                          child: Icon(
                                            tiles[index]['icon'] as IconData,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Animated Chat Interface
            GestureDetector(
              onTap: () {
                setState(() {
                  isLeftPanelExpanded = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: isChatVisible
                    ? (MediaQuery.of(context).size.width -
                        (isLeftPanelExpanded ? 280 : 75))
                    : 0,
                child: ChatInterface(
                  visible: isChatVisible,
                  selectedTile: selectedTileIndex != null
                      ? tiles[selectedTileIndex!]
                      : null,
                  chatMessages: selectedTileIndex != null
                      ? tiles[selectedTileIndex!]["chatMessages"]
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color _generatePastelColor(int index, {bool isDark = false}) {
  final hue = (index * 137.508) % 360;
  final saturation = 0.65;
  final lightness = isDark ? 0.70 : 0.85;

  final h = hue / 360;
  final s = saturation;
  final l = lightness;

  double _hue2rgb(double p, double q, double t) {
    if (t < 0) t += 1;
    if (t > 1) t -= 1;
    if (t < 1 / 6) return p + (q - p) * 6 * t;
    if (t < 1 / 2) return q;
    if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
    return p;
  }

  final q = l < 0.5 ? l * (1 + s) : l + s - l * s;
  final p = 2 * l - q;

  final r = _hue2rgb(p, q, h + 1 / 3);
  final g = _hue2rgb(p, q, h);
  final b = _hue2rgb(p, q, h - 1 / 3);

  return Color.fromRGBO(
    (r * 255).round(),
    (g * 255).round(),
    (b * 255).round(),
    1,
  );
}

class DiscordPastelTile extends StatefulWidget {
  final int index;
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final void Function(int index) callback;

  const DiscordPastelTile({
    Key? key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.callback,
    required this.icon,
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<DiscordPastelTile> createState() => _DiscordPastelTileState();
}

class _DiscordPastelTileState extends State<DiscordPastelTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lightColor = _generatePastelColor(widget.index);
    final darkColor = _generatePastelColor(widget.index, isDark: true);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.identity()..scale(widget.isSelected ? 0.95 : 1.0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final yOffset = _animation.value * 2.0;
          final shadowOpacity = 1.0 - _animation.value;

          return GestureDetector(
            onTapDown: (_) {
              widget.callback(widget.index);
              _controller.forward();
            },
            onTapUp: (_) => _controller.reverse(),
            onTapCancel: () => _controller.reverse(),
            child: Transform.translate(
              offset: Offset(0, yOffset),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: darkColor,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: darkColor.withOpacity(shadowOpacity * 0.5),
                      offset: Offset(0, 4 * (1 - _animation.value)),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(widget.icon, size: 32),
                    const SizedBox(height: 8),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.75),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChatInterface extends StatefulWidget {
  final bool visible;
  final Map<String, dynamic>? selectedTile;
  final List<Map<String, dynamic>>? chatMessages;

  const ChatInterface({
    Key? key,
    required this.visible,
    required this.chatMessages,
    this.selectedTile,
  }) : super(key: key);

  @override
  State<ChatInterface> createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  final TextEditingController _ctr = TextEditingController();
  void onsubmit() {
    Map<String, String> value = {'username': "laxmi", "message": _ctr.text};
    widget.chatMessages!.add(value);
    _ctr.clear();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.visible) return const SizedBox.shrink();

    return Container(
      color: const Color(0xFF36393F),
      child: Column(
        children: [
          // Chat Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF36393F),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(widget.selectedTile?['icon'] ?? Icons.tag,
                    color: Colors.white60),
                const SizedBox(width: 8),
                Text(
                  widget.selectedTile?['title'] ?? 'general',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          // Chat Messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.chatMessages?.length ?? 0,
              itemBuilder: (context, index) {
                return ChatMessage(
                  username: widget.chatMessages![index]["username"],
                  message: widget.chatMessages![index]["message"],
                  colorIndex: index,
                );
              },
            ),
          ),
          // Message Input
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF40444B),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.white60),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _ctr,
                    style: const TextStyle(color: Colors.white),
                    onSubmitted: (v) {
                      onsubmit();
                    },
                    decoration: InputDecoration(
                      hintText:
                          'Message #${widget.selectedTile?['title'] ?? 'general'}',
                      hintStyle: TextStyle(color: Colors.white60),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.emoji_emotions, color: Colors.white60),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String username;
  final String message;
  final int colorIndex;

  const ChatMessage({
    Key? key,
    required this.username,
    required this.message,
    required this.colorIndex,
  }) : super(key: key);

  Color _generateGradientColor(int index) {
    final List<Color> colors = [
      Colors.blue,
      Colors.purple,
      Colors.pink,
      Colors.orange,
      Colors.green,
      Colors.teal,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: _generateGradientColor(colorIndex),
            child: Text(
              username[0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      _generateGradientColor(colorIndex),
                      _generateGradientColor(colorIndex + 1),
                    ],
                  ).createShader(bounds),
                  child: Text(
                    username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
