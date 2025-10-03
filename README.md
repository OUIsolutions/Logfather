# Logfather
![VibeScript Logo](https://img.shields.io/badge/VibeScript-0.1.0-blue?style=for-the-badge&logo=lua)
[![GitHub Release](https://img.shields.io/badge/GitHub-Release-blue?style=for-the-badge)](https://github.com/OUIsolutions/Logfather/releases)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](https://github.com/OUIsolutions/Logfather/blob/main/LICENSE)
![Status](https://img.shields.io/badge/Status-Stable-brightgreen?style=for-the-badge)
![Platforms](https://img.shields.io/badge/Platforms-VibeScript-lightgrey?style=for-the-badge)

---

### Overview

Logfather is a powerful Telegram notification tool for VibeScript that allows you to send messages to Telegram chats directly from the command line. It provides a simple profile-based system for managing multiple Telegram bot configurations:

1. **Install VibeScript runtime**
2. **Configure Logfather with your Telegram bot credentials**
3. **Send notifications from anywhere**

This tool is designed for developers who want to:
- Send notifications from scripts and automation workflows
- Monitor application status via Telegram
- Receive alerts and logs in real-time
- Integrate Telegram notifications into CI/CD pipelines

### Key Features

- **Profile Management** - Store multiple Telegram bot configurations with profiles.
- **Simple Message Sending** - Send text messages directly from command line.
- **File-based Messages** - Send message content from text files.
- **Multiple Profiles** - Manage different bots and chats with ease.
- **Easy Configuration** - Set up bot tokens and chat IDs with simple commands.

## Installation

### Step 1: Install VibeScript

Choose the appropriate installation method for your operating system:

#### Option A: Pre-compiled Binary (Linux only)
```bash
curl -L https://github.com/OUIsolutions/VibeScript/releases/download/0.32.0/vibescript.out -o vibescript.out && chmod +x vibescript.out && sudo mv vibescript.out /usr/local/bin/vibescript
```

#### Option B: Compile from Source (Linux and macOS)
```bash
curl -L https://github.com/OUIsolutions/VibeScript/releases/download/0.35.0/amalgamation.c -o vibescript.c && gcc vibescript.c -o vibescript.out && sudo mv vibescript.out /usr/local/bin/vibescript
```

### Step 2: Install Logfather
```bash
vibescript add_script --file https://github.com/OUIsolutions/Logfather/releases/download/0.1.0/logfather.lua logfather
```

## Usage

Logfather uses a profile-based system to manage your Telegram bot configurations. First, set up a profile with your bot credentials, then send messages using that profile.

### Setting Up a Profile

Configure a new profile with your Telegram bot token and chat ID:

```bash
vibescript logfather set_profile --profile <profile> --token <TOKEN> --chat_id <CHAT_ID>
```

### Command Line Options

#### Set Profile Command
- `--profile` or `-p`: The name of the profile to create or update.
- `--token` or `-t`: Your Telegram bot token (obtain from @BotFather).
- `--chat_id` or `-c`: The chat ID where messages will be sent.

#### Send Message Command
- `--profile` or `-p`: The profile name to use for sending.
- `--message` or `-m`: The message text to send.
- `--message_file` or `-mf`: Path to a text file containing the message.

### Example Usage

#### List all configured profiles
```bash
vibescript logfather list_profiles
```

#### Set up a profile for your development bot
```bash
vibescript logfather set_profile --profile devops --token "123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11" --chat_id "123456789"
```

#### Send a simple message
```bash
vibescript logfather send_message --profile devops --message "Deployment completed successfully!"
```

#### Send a message from a file
```bash
vibescript logfather send_message --profile devops --message_file "./logs/error.txt"
```

#### Using short flags
```bash
vibescript logfather send -p devops -m "Build #42 started"
```

### Getting Your Telegram Credentials

1. **Create a Bot**: Talk to [@BotFather](https://t.me/botfather) on Telegram and use `/newbot` to create a bot. You'll receive a bot token.
2. **Get Chat ID**: 
   - Add your bot to a chat or start a conversation with it
   - Send a message to the bot
   - Visit: `https://api.telegram.org/bot<YOUR_TOKEN>/getUpdates`
   - Look for the `"chat":{"id":` field in the response

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.