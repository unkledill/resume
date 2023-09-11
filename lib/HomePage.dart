import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fullName = 'Malik Buraimoh';
  String profession = 'Mobile App Developer';
  String slackUsername = 'UnkleDill';
  String githubHandle = 'UnkleDill';
  String bio =
      'I am a passionate and dedicated mobile app developer with a strong interest in creating exceptional mobile applications. With a focus on Flutter, I have honed my skills to deliver high-quality and user-friendly solutions. My experience includes developing and maintaining mobile apps, collaborating with cross-functional teams, and staying up-to-date with the latest industry trends. I am committed to producing innovative and efficient solutions that enhance the user experience and drive business success.';

  TextEditingController fullNameController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController slackUsernameController = TextEditingController();
  TextEditingController githubHandleController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    fullNameController.text = fullName;
    professionController.text = profession;
    slackUsernameController.text = slackUsername;
    githubHandleController.text = githubHandle;
    bioController.text = bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isEditing
            ? const Text(
          'Edit CV',
          style: TextStyle(fontSize: 28.0),
        )
            : const Text(''),
        toolbarHeight: 90.0,
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              setState(() {
                if (isEditing) {
                  // Save changes to the data model.
                  fullName = fullNameController.text;
                  profession = professionController.text;
                  slackUsername = slackUsernameController.text;
                  githubHandle = githubHandleController.text;
                  bio = bioController.text;
                }
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: isEditing ? _buildEditCVPage() : _buildViewCVPage(),
    );
  }

  Widget _buildViewCVPage() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(fullName,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
        Text(profession,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.deepOrangeAccent)),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Slack username',
                    style: TextStyle(color: Colors.black54)),
                Text(slackUsername,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20.0,
                    )),
              ],
            ),
            const SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Github username',
                    style: TextStyle(color: Colors.black54)),
                Text(githubHandle,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20.0,
                    )),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Summary',
                style: TextStyle(color: Colors.black54, fontSize: 20.0)),
            Text(bio,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18.0,
                )),
          ],
        ),
      ],
    );
  }

  Widget _buildEditCVPage() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ListTile(
          subtitle: TextField(
            controller: fullNameController,
            decoration:
            const InputDecoration(labelText: 'Enter your full name'),
          ),
        ),
        const SizedBox(height: 16.0),
        ListTile(
          subtitle: TextField(
            controller: professionController,
            decoration:
            const InputDecoration(labelText: 'Enter your profession'),
          ),
        ),
        const SizedBox(height: 16.0),
        ListTile(
          subtitle: TextField(
            controller: slackUsernameController,
            decoration:
            const InputDecoration(labelText: 'Enter your Slack username'),
          ),
        ),
        const SizedBox(height: 16.0),
        ListTile(
          subtitle: TextField(
            controller: githubHandleController,
            decoration:
            const InputDecoration(labelText: 'Enter your GitHub handle'),
          ),
        ),
        const SizedBox(height: 16.0),
        ListTile(
          subtitle: TextFormField(
            maxLines: null,
            controller: bioController,
            decoration: const InputDecoration(
              filled: true,
              border: InputBorder.none,
              labelText: 'Enter your bio',
            ),
          ),
        ),
      ],
    );
  }
}
