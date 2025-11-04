# 📱 Shake to Get a Quote

> **A Flutter app that delivers motivation with a shake!**  
> Shake your phone to instantly reveal a random motivational quote — powered by Flutter and native Android sensors.

---

## 🧠 User Story

> **As a student who loves motivation**, I want my phone to show a random motivational quote whenever I shake it —  
> so I can get an instant dose of inspiration during study sessions without touching the screen!

---

## 🚀 Overview

**Shake to Get a Quote** demonstrates seamless communication between **Flutter** and **native Android (Kotlin)** code using **Platform Channels**.  
It combines elegant Flutter UI with real device sensors for an interactive, real-world experience.

When the phone detects a shake:
- Kotlin captures accelerometer data using the Android **SensorManager**.
- It sends the shake event to Flutter via **EventChannel**.
- Flutter responds by displaying a **motivational quote** with smooth animation or toast notification.

---

## ✨ Features

### 🧭 Native Android Integration
- Detects device shakes using `SensorManager` and `SensorEventListener` (Kotlin).
- Implements a **simple yet effective** shake detection algorithm.
- Communicates shake events to Flutter in real time via **EventChannel**.

### 💬 Flutter UI
- Receives events and displays random **motivational quotes**.
- Animated transitions and engaging visuals.
- Lightweight, responsive, and **cross-platform ready**.

### 🔌 Platform Channels
- **EventChannel**: Sends continuous shake events from Kotlin → Flutter.
- **MethodChannel** *(optional)*: Used to initialize or control native listeners (e.g., start/stop detection).

---


---

## 🛠️ Tech Stack

| Layer | Technology | Description |
|-------|-------------|-------------|
| **UI** | Flutter | Beautiful, reactive UI |
| **Native** | Kotlin | Access to Android hardware sensors |
| **Bridge** | Platform Channels | Communication between Flutter & Android |
| **Sensors** | SensorManager | Detects accelerometer motion |

---

## 🧪 How It Works

1. **Shake Detection:**  
   The Android side listens to accelerometer data using `SensorManager`.  
   If acceleration exceeds a threshold → triggers `onShakeDetected`.

2. **Event Transmission:**  
   Kotlin sends a message to Flutter using an `EventChannel`.

3. **Flutter Reaction:**  
   Flutter receives the event and randomly selects a motivational quote to display.

4. **UI Feedback:**  
   The quote appears with a friendly **animation** or **toast**, making the experience delightful.

---


---

## 📱 Demo Idea

- Shake the phone → ✨ A random quote appears instantly  
- Add haptic feedback or sound to make it more engaging  
- Try integrating confetti or animated backgrounds for extra fun 🎉

---

## 💡 Possible Enhancements

- 🎨 Add gradient backgrounds or theme switching  
- 🔊 Play a short “ding” sound when a shake is detected  
- 📖 Add a quote history or favorite feature  
- 🌐 Fetch quotes from a remote API for fresh content  
- 📲 Extend to iOS using `CoreMotion` for sensor detection

---

## 🧰 Setup & Run

# Clone this repository
```bash
git clone https://github.com/your-username/shake-to-get-quote.git
```

# Navigate to the project
```bash
cd shake-to-get-quote
```

# Get dependencies
```bash
flutter pub get
```

# Run the app
```bash
flutter run
```

---

## 👨‍💻 Author  

## **Israa Essa**  
💼 Mobile Application Developer

🌐 Portfolio: [https://www.linkedin.com/in/israa-essa-3b5644384]  

💻 GitHub: [Israa050]  

---


# 🪄 License

This project is licensed under the MIT License — free to use, modify, and share.



