# 🍋 Lemon Clicker

A fun and addictive idle clicker game built with SwiftUI for iOS. Click the lemon to earn points, buy upgrades, and unlock prestige features!

## Features

- **Simple Clicking Mechanic**: Tap the lemon to earn points
- **Shop System**: Purchase upgrades to increase your income
  - 🖱️ Better Cursor: +1 lemon per click
  - 👨‍🌾 Farmer: +1 lemon per second
  - 🌾 Lemon Farm: +5 lemons per second
  - 🌳 Lemon Orchard: +25 lemons per second
  - 🏭 Lemon Factory: +100 lemons per second
  - ⚡ Lemon Boost: x2 production multiplier (stacks)
- **Prestige System**: Reset your progress to earn permanent bonuses
- **Beautiful UI**: Modern SwiftUI design with smooth animations
- **Idle Progression**: Earn lemons even when the app is closed

## Building the Project

### Prerequisites

- Xcode 14.0 or later
- iOS 15.0 or later
- Apple Developer Account (for code signing)

### Local Build

1. Clone the repository:
   ```bash
   git clone https://github.com/cybercreators/Lemon-Clicker.git
   cd lemon-clicker
   ```

2. Open the Xcode project:
   ```bash
   open LemonClicker.xcodeproj
   ```

3. Select your target device or simulator

4. Press `Cmd + R` to build and run

### Building with Codemagic

This project is configured for CI/CD with Codemagic. The `codemagic.yaml` file includes two workflows:

#### 1. App Store Build (`ios-build-and-publish`)
Builds the app for App Store distribution and packages it as an `.ipa` file.

**Steps:**
- Installs dependencies
- Sets up code signing
- Builds the `.app` file
- Packages it into a signed `.ipa`
- Publishes to App Store Connect (TestFlight)

#### 2. Ad-Hoc Build (`ios-build-adhoc`)
Builds the app for ad-hoc distribution (testing on specific devices).

**Steps:**
- Sets up code signing
- Builds and packages as an ad-hoc `.ipa`

### Setting Up Codemagic

1. **Connect Your Repository**:
   - Go to [Codemagic Dashboard](https://codemagic.io)
   - Click "Add application"
   - Select your GitHub repository

2. **Configure Code Signing**:
   - Go to **App Settings > Distribution > iOS Code Signing**
   - Upload your `.p12` certificate (with private key)
   - Upload your `.mobileprovision` provisioning profile
   - Reference names will be used in the build process

3. **Add Environment Variables**:
   - Go to **App Settings > Environment Variables**
   - Add `APP_STORE_CONNECT_PRIVATE_KEY` (your App Store Connect API key)
   - Add `DEVELOPER_EMAIL` (your email for build notifications)
   - Add `SLACK_CHANNEL` (optional, for Slack notifications)

4. **Update Bundle Identifier**:
   - In `codemagic.yaml`, replace `com.example.lemonclicker` with your actual bundle ID
   - Update `XCODE_PROJECT` and `XCODE_SCHEME` if needed

5. **Start a Build**:
   - Push changes to your repository
   - Codemagic will automatically trigger the build workflow
   - Monitor progress in the Codemagic dashboard

## Project Structure

```
lemon-clicker/
├── LemonClickerApp.swift       # Main app entry point
├── Info.plist                   # iOS app configuration
├── codemagic.yaml              # CI/CD configuration
├── README.md                    # This file
└── index.html                  # Web version (optional)
```

## Game Mechanics

### Clicking
- Each click earns lemons based on your current click power
- Click power increases with the "Better Cursor" upgrade

### Passive Income
- Farmers, Farms, Orchards, and Factories generate lemons per second
- Production rate increases with each upgrade purchased
- Multiplier upgrades stack to increase all production

### Prestige System
- Earn prestige points by resetting your progress
- Points are calculated as: `lemonCount / 100`
- Prestige points provide permanent bonuses (future feature)

## Future Enhancements

- Prestige level bonuses (production multiplier based on prestige points)
- Achievements and badges
- Daily rewards
- Leaderboards
- Sound effects and haptic feedback
- Dark mode support
- Cloud save synchronization

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues.

## License

This project is open source and available under the MIT License.

## Support

For issues or questions, please open an issue on GitHub or contact the development team.

---

**Enjoy the game! 🍋**
