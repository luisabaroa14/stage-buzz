import 'package:app/core/utils/constants/colors.dart';
import 'package:app/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  static const route = '/contact';

  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message sent successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      // Clear form
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            const Text(
              'Get in Touch',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'We\'d love to hear from you. Send us a message and we\'ll respond as soon as possible.',
              style: TextStyle(
                fontSize: 18,
                color: isDarkTheme ? Colors.grey[300] : Colors.grey[600],
                fontFamily: 'Raleway',
              ),
            ),
            const SizedBox(height: 40),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Contact Information
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildContactItem(
                        Icons.location_on,
                        'Address',
                        '123 Music Street\nLos Angeles, CA 90210\nUnited States',
                        isDarkTheme,
                      ),
                      const SizedBox(height: 20),
                      _buildContactItem(
                        Icons.phone,
                        'Phone',
                        '+1 (555) 123-4567',
                        isDarkTheme,
                      ),
                      const SizedBox(height: 20),
                      _buildContactItem(
                        Icons.email,
                        'Email',
                        'info@stagebuzz.com',
                        isDarkTheme,
                      ),
                      const SizedBox(height: 20),
                      _buildContactItem(
                        Icons.access_time,
                        'Business Hours',
                        'Monday - Friday: 9:00 AM - 6:00 PM\nSaturday: 10:00 AM - 4:00 PM\nSunday: Closed',
                        isDarkTheme,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 40),

                // Contact Form
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: isDarkTheme ? Colors.grey[850] : Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Send us a Message',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway',
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildTextFormField(
                            controller: _nameController,
                            labelText: 'Full Name',
                            icon: Icons.person,
                            isDarkTheme: isDarkTheme,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextFormField(
                            controller: _emailController,
                            labelText: 'Email Address',
                            icon: Icons.email,
                            isDarkTheme: isDarkTheme,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextFormField(
                            controller: _subjectController,
                            labelText: 'Subject',
                            icon: Icons.subject,
                            isDarkTheme: isDarkTheme,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a subject';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextFormField(
                            controller: _messageController,
                            labelText: 'Message',
                            icon: Icons.message,
                            isDarkTheme: isDarkTheme,
                            maxLines: 5,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your message';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primary, // Accent color
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Send Message',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(
      IconData icon, String title, String content, bool isDarkTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: accentColor,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  color: isDarkTheme ? Colors.grey[300] : Colors.grey[600],
                  fontFamily: 'Raleway',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required bool isDarkTheme,
    required String? Function(String?) validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(
        color: isDarkTheme ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: isDarkTheme ? Colors.grey[400] : Colors.grey[600],
        ),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkTheme ? Colors.grey[600]! : Colors.grey[400]!,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: accentColor),
        ),
        prefixIcon: Icon(
          icon,
          color: isDarkTheme ? Colors.grey[400] : Colors.grey[600],
        ),
        alignLabelWithHint: maxLines > 1,
      ),
      validator: validator,
    );
  }
}
