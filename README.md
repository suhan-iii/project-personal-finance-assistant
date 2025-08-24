# 💰 FinGenie

FinGenie is a **cross-platform personal finance management application** built with **FlutterFlow** and **Firebase**, integrated with **OpenAI GPT API** to provide **AI-powered financial insights**.  
It helps users **track expenses, visualize spending habits, and receive personalized budgeting advice** in real time.

---

## 🚀 Features

- 🔐 **Secure Authentication** — Firebase Authentication for email/password & social logins.  
- 📊 **Expense Tracking** — Add, edit, and categorize expenses with instant cloud sync via Firestore.  
- 📈 **Real-time Dashboard** — Responsive UI with charts for daily, weekly, and monthly spending trends.  
- 🤖 **AI-Powered Chatbot** — Integrated OpenAI GPT API via Firebase Cloud Functions to provide:
  - Personalized budgeting recommendations  
  - Expense summaries  
  - Smart saving tips  
- ☁️ **Cloud Sync** — All data stored in Firestore for real-time access across devices.  
- 🌐 **Cross-Platform** — Works seamlessly on **Android** and **Web** (FlutterFlow export).  
- 🔒 **Security** — Firestore security rules and safe API key handling implemented.  

---
## 📚 Resources (Components & Tools Used)

- 🖼️ [FlutterFlow (Low-code builder)](https://flutterflow.io)  
- 📱 [Flutter Framework](https://flutter.dev/docs)  
- 📦 [Dart Programming Language](https://dart.dev/guides)  
- 🔥 [Firebase](https://firebase.google.com/docs)  
- 📂 [Firebase Firestore](https://firebase.google.com/docs/firestore)  
- 🔑 [Firebase Authentication](https://firebase.google.com/docs/auth)  
- ⚡ [Firebase Cloud Functions](https://firebase.google.com/docs/functions)  
- 🤖 [OpenAI GPT API](https://platform.openai.com/docs)  
- 🛠️ [Node.js](https://nodejs.org/en/docs)  
- 💻 [Git & GitHub](https://docs.github.com)  

## 🛠️ Tech Stack

- **Frontend:** FlutterFlow, Flutter  
- **Backend:** Firebase Cloud Functions (Node.js)  
- **Database:** Firebase Firestore  
- **Auth:** Firebase Authentication  
- **AI Integration:** OpenAI GPT API  
- **Hosting:** Firebase Hosting (Web), Play Store (Android)  

---

## ⚙️ Setup & Installation

```bash
# 1️⃣ Clone the Repository
git clone https://github.com/your-username/FinGenie.git
cd FinGenie

# 2️⃣ Install Dependencies
flutter pub get

# 3️⃣ Setup Firebase
# - Create a Firebase project in https://console.firebase.google.com/
# - Enable Authentication (Email/Password & Google Sign-In if needed)
# - Setup Firestore Database (in test mode for development)
# - Download google-services.json (Android) / GoogleService-Info.plist (iOS)
#   and place them in the project.

# 4️⃣ Configure Firebase Functions
cd functions
npm install

# Add your OpenAI API Key in Firebase Functions environment
firebase functions:config:set openai.key="YOUR_API_KEY"

# 5️⃣ Deploy Functions
firebase deploy --only functions

# 6️⃣ Run App
flutter run
▶️ Working
1️⃣ User signs up/logs in via Firebase Authentication.  

2️⃣ User adds expenses — expenses are stored in Firestore in real time.  

3️⃣ Dashboard updates instantly — FlutterFlow renders charts and category breakdowns.  

4️⃣ AI Assistant (via OpenAI GPT) analyzes spending and provides:  
   - Summaries of monthly/daily spending  
   - Suggestions for budgeting improvements  
   - Personalized financial tips  

5️⃣ Cross-platform sync — same data is accessible on Android and Web.
📱 Usage
# 1️⃣ Sign up / Log in securely with Firebase Authentication
# 2️⃣ Add expenses with categories, amounts, and notes
# 3️⃣ View dashboard with charts and category-wise spending
# 4️⃣ Chat with AI Assistant to get:
#     - Budgeting advice
#     - Expense summaries
#     - Smart financial tips
📂 Project Structure
FinGenie/
│
├── lib/                # Flutter code (UI + State management)
├── functions/          # Firebase Cloud Functions for GPT API
├── assets/             # App icons, images
├── pubspec.yaml        # Flutter dependencies
└── README.md           # Project documentation
🔮 Roadmap
[ ] Currency Conversion Support
    ➝ Allow users to track expenses in different currencies and auto-convert 
      them to a preferred currency using live exchange rates.

[ ] Export Reports (PDF/CSV)
    ➝ Enable users to download expense history and budget reports for offline 
      storage or sharing with accountants.

[ ] Shared Expense Groups
    ➝ Add group expense management for families, friends, or teams. 
      Useful for splitting bills, tracking shared budgets, or event planning.

[ ] Bank API Integration
    ➝ Automate expense tracking by securely integrating with banking APIs. 
      Expenses would be fetched and categorized automatically.

[ ] Offline Mode
    ➝ Support offline data entry and automatic sync with Firestore when 
      the device reconnects to the internet.

[ ] Push Notifications
    ➝ Send reminders for bill payments, budget limit alerts, and spending trends.

