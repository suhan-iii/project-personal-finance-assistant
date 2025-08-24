# FinGenie 💰✨
**AI-powered personal finance assistant** built with **FlutterFlow/Flutter**, **Firebase (Auth, Firestore, Cloud Functions)**, and the **OpenAI GPT API**.  
Track expenses, visualize spending, set budgets, and get personalized, privacy-aware insights from an in-app AI coach.

> Status: **In Progress (v0.1)** — core features working: Auth, expense CRUD, charts, AI advice via Cloud Functions.

---

## 📌 Table of Contents
- [Features](#-features)
- [Architecture](#-architecture)
- [Tech Stack](#-tech-stack)
- [Screenshots](#-screenshots)
- [Project Structure](#-project-structure)
- [Prerequisites](#-prerequisites)
- [Setup & Installation (Step-by-Step)](#-setup--installation-step-by-step)
- [How It Works](#-how-it-works)
- [Environment & Secrets](#-environment--secrets)
- [Troubleshooting](#-troubleshooting)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [License](#-license)

---

## ✨ Features
- 🔑 **Secure Auth**: Email/Password or Google via **Firebase Authentication**  
- 📊 **Expense Tracking**: Add, edit, delete expenses with **Firestore** (real-time sync)  
- 🧭 **Budgets & Categories**: Monthly limit and category-wise breakdown  
- 📈 **Dashboard**: Beautiful charts (category share, monthly trends)  
- 🤖 **AI Coach**: **OpenAI GPT** via **Firebase Cloud Functions** for:
  - Spending summaries (monthly/weekly)
  - Personalized budget tips
  - Category-specific savings suggestions
- 🌐 **Cross-Platform**: Android + Web (iOS if configured)
- 🔐 **Security-first**: API keys stored only on server (Cloud Functions), Firestore protected with rules  

---

## 🏗 Architecture
```mermaid
flowchart TD
  A[Flutter/FlutterFlow App] -->|Auth| B[Firebase Auth]
  A -->|CRUD| C[Firestore]
  A -->|Callable| D[Cloud Functions]
  D -->|OpenAI API Key (server-side only)| E[OpenAI GPT]
  C --> A
🛠 Tech Stack
Frontend: FlutterFlow (exports to Flutter) / Flutter

State/Data: Firebase Auth, Cloud Firestore

AI: OpenAI GPT (via Firebase Cloud Functions)

Cloud: Firebase Cloud Functions, Firebase Hosting (Web)

Charts: fl_chart / FlutterFlow chart widgets

📷 Screenshots
Add screenshots here once UI is finalized

📂 Project Structure
bash
Copy
Edit
finGenie/
├─ lib/
│  ├─ main.dart
│  ├─ firebase_options.dart
│  ├─ models/
│  ├─ services/
│  ├─ ui/
│  └─ utils/
├─ functions/           # Firebase Cloud Functions (OpenAI integration)
│  ├─ src/index.ts
│  ├─ package.json
│  └─ tsconfig.json
├─ android/ ...
├─ web/ ...
├─ pubspec.yaml
├─ firebase.json
├─ firestore.rules
└─ README.md
⚙️ Prerequisites
Flutter SDK (3.22+)

Dart SDK

Node.js (18+)

Firebase CLI

bash
Copy
Edit
npm i -g firebase-tools
firebase login
Android Studio / Xcode

OpenAI API key

🔧 Setup & Installation (Step-by-Step)
1. Create Firebase Project
bash
Copy
Edit
firebase init
Enable Auth (Email/Google)

Enable Cloud Firestore (Production)

2. Configure Flutter
bash
Copy
Edit
dart pub global activate flutterfire_cli
flutterfire configure
Add dependencies in pubspec.yaml:

yaml
Copy
Edit
dependencies:
  firebase_core: ^3.6.0
  firebase_auth: ^5.3.1
  cloud_firestore: ^5.4.4
  cloud_functions: ^5.1.4
  fl_chart: ^0.68.0
3. Firestore Model
markdown
Copy
Edit
users/{uid}/expenses/{expenseId}
  - amount: number
  - category: string
  - note: string
  - date: timestamp
4. Firestore Security Rules
text
Copy
Edit
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
Deploy:

bash
Copy
Edit
firebase deploy --only firestore:rules
5. Cloud Functions (AI Integration)
bash
Copy
Edit
cd functions
npm init -y
npm i firebase-functions firebase-admin openai
npm i -D typescript ts-node @types/node
Example functions/src/index.ts:

ts
Copy
Edit
import * as admin from "firebase-admin";
import { onCall } from "firebase-functions/v2/https";
import OpenAI from "openai";

admin.initializeApp();
const openai = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });

export const getBudgetAdvice = onCall(async (req) => {
  const { monthBudget, expenses } = req.data;
  const prompt = `Analyze spending... Budget ₹${monthBudget}`;
  const res = await openai.chat.completions.create({
    model: "gpt-4o-mini",
    messages: [{ role: "user", content: prompt }],
  });
  return { advice: res.choices[0].message?.content };
});
Set key:

bash
Copy
Edit
firebase functions:config:set openai.key="sk-your-api-key"
firebase deploy --only functions
6. Run the App
bash
Copy
Edit
flutter pub get
flutter run
7. Deploy to Web
bash
Copy
Edit
flutter build web
firebase init hosting
firebase deploy --only hosting
🔍 How It Works
User logs in → Firebase Auth

Expenses saved in Firestore

User requests insights → Calls Cloud Function

Function → OpenAI GPT → Returns budget tips

🔑 Environment & Secrets
OpenAI key is stored in Cloud Functions config

Do not store keys in client

🐞 Troubleshooting
Auth error → Enable provider in Firebase console

Firestore denied → Deploy rules

Function not found → Check deployed region (asia-south1 by default)

🛤 Roadmap
🎯 Version 0.1 (MVP – Minimum Viable Product)
 Firebase Authentication (Email/Password login)

 Firestore setup with users/{uid}/expenses

 Add, edit, and delete expenses

 Basic dashboard with charts (fl_chart)

 AI integration (OpenAI GPT via Firebase Cloud Functions) for budget advice

 Deploy Android APK

 Deploy Web version on Firebase Hosting

🚀 Version 0.2 (Core Features Expansion)
 Income tracking (separate collection: users/{uid}/income)

 Monthly savings goal setting

 Budget vs. actual comparison in dashboard

 Improved AI prompts for personalized tips

 Category-level summaries (Food, Travel, Rent, etc.)

📈 Version 0.3 (Productivity & Usability)
 Export expense reports to PDF/CSV

 Offline-first mode (local cache + sync with Firestore)

 Notifications/reminders for recurring expenses

 Dark/Light mode toggle

 App icon and branding

🌐 Version 1.0 (Launch-Ready)
 Multi-language support (English, Hindi, Korean, etc.)

 Multi-currency support (₹, $, €)

 Deploy iOS version (App Store)

 Deploy Android version (Play Store)

 Basic CI/CD setup (auto build & deploy with GitHub Actions)

🔮 Future Enhancements (Post v1.0)
 Premium features (subscription-based)

 AI-powered savings planner (weekly/monthly challenges)

 OCR for receipt scanning

 Voice assistant for expense entry

 Integration with bank APIs for automatic expense import

