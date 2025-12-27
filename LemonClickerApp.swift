import SwiftUI

@main
struct LemonClickerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var lemonCount: Int = 0
    @State private var perSecond: Int = 0
    @State private var multiplier: Double = 1.0
    @State private var clickValue: Int = 1
    
    // Upgrades
    @State private var cursorOwned: Int = 0
    @State private var farmerOwned: Int = 0
    @State private var farmOwned: Int = 0
    @State private var orchardOwned: Int = 0
    @State private var factoryOwned: Int = 0
    @State private var multiplierOwned: Int = 0
    
    // Prestige
    @State private var prestigePoints: Int = 0
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 0.95, blue: 0.8), Color(red: 1.0, green: 0.9, blue: 0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 5) {
                    Text("🍋 Lemon Clicker")
                        .font(.system(size: 32, weight: .bold))
                    Text("Click the lemon to earn points!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                
                // Stats
                HStack(spacing: 20) {
                    StatBox(label: "Lemons", value: "\(lemonCount)")
                    StatBox(label: "Per Sec", value: "\(perSecond)")
                    StatBox(label: "Multiplier", value: String(format: "%.1fx", multiplier))
                }
                .padding()
                
                // Lemon Button
                Button(action: clickLemon) {
                    Text("🍋")
                        .font(.system(size: 80))
                }
                .frame(width: 150, height: 150)
                .background(Color.yellow.opacity(0.8))
                .cornerRadius(75)
                .shadow(radius: 10)
                
                // Shop
                VStack(alignment: .leading, spacing: 10) {
                    Text("🏪 Shop")
                        .font(.headline)
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            UpgradeButton(name: "🖱️ Cursor", cost: 10, owned: cursorOwned, canAfford: lemonCount >= 10) {
                                if lemonCount >= 10 {
                                    lemonCount -= 10
                                    cursorOwned += 1
                                    clickValue += 1
                                }
                            }
                            
                            UpgradeButton(name: "👨‍🌾 Farmer", cost: 50, owned: farmerOwned, canAfford: lemonCount >= 50) {
                                if lemonCount >= 50 {
                                    lemonCount -= 50
                                    farmerOwned += 1
                                    perSecond += 1
                                }
                            }
                            
                            UpgradeButton(name: "🌾 Farm", cost: 500, owned: farmOwned, canAfford: lemonCount >= 500) {
                                if lemonCount >= 500 {
                                    lemonCount -= 500
                                    farmOwned += 1
                                    perSecond += 5
                                }
                            }
                        }
                    }
                    .frame(maxHeight: 200)
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                
                Spacer()
                
                // Prestige Button
                Button(action: prestige) {
                    Text("✨ Prestige (\(prestigePoints) points)")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(8)
                }
                
                Button(action: resetGame) {
                    Text("Reset Game")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.6))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .onReceive(timer) { _ in
            lemonCount += Int(Double(perSecond) * multiplier)
        }
    }
    
    func clickLemon() {
        lemonCount += clickValue
    }
    
    func prestige() {
        prestigePoints += max(1, lemonCount / 100)
        resetGame()
    }
    
    func resetGame() {
        lemonCount = 0
        perSecond = 0
        clickValue = 1
        cursorOwned = 0
        farmerOwned = 0
        farmOwned = 0
        orchardOwned = 0
        factoryOwned = 0
        multiplierOwned = 0
    }
}

struct StatBox: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(8)
    }
}

struct UpgradeButton: View {
    let name: String
    let cost: Int
    let owned: Int
    let canAfford: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .font(.headline)
                    Text("Owned: \(owned)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                Text("\(cost) 🍋")
                    .font(.headline)
            }
            .padding()
            .background(canAfford ? Color.green.opacity(0.2) : Color.gray.opacity(0.2))
            .cornerRadius(8)
        }
        .disabled(!canAfford)
    }
}

#Preview {
    ContentView()
}
