# **Flutter \- Tech Assignment (Round 2\) – Trading App**

## **📌 Objective**

Build a **Flutter trading demo application** that mimics **real-time market price fluctuations** using **dummy data only (no APIs)** while strictly following **Clean Architecture principles**, **BLoC state management**, and **best Flutter coding practices**.

This assignment is designed to evaluate **architecture discipline, code quality, scalability, and frontend logic**.

---

## **🧱 Architecture Requirements (STRICT)**

The project **must strictly follow Clean Architecture** with proper separation of concerns.

## **🔁 State Management (STRICT)**

* **Flutter BLoC only**  
* No Provider, Riverpod, GetX, setState for logic, etc.

---

## **💉 Dependency Injection (MANDATORY)**

* Proper **Dependency Injection** setup  
* All dependencies must be injected (BLoCs, UseCases, Repositories)  
* No direct instantiation inside widgets

## **♻️ Reusability (VERY IMPORTANT)**

### **Must include:**

* Reusable widgets (buttons, cards, price row, chart placeholders, etc.)  
* Reusable classes (formatters, helpers, constants, themes)  
* Centralized styling (colors, text styles)  
* No repeated UI or logic code

## **📱 UI Requirements**

* Use the provided **Figma design:**  
  [https://www.figma.com/design/lIOeUKiXaYIQeDCUXb1Hfa/Flutter-Task?node-id=0-1\&p=f\&t=BcdnkiwaOMMf8q1F-0](https://www.figma.com/design/lIOeUKiXaYIQeDCUXb1Hfa/Flutter-Task?node-id=0-1&p=f&t=BcdnkiwaOMMf8q1F-0)

* UI must **match the design closely**  
* Fully **responsive**  
  * Works on small & large screens  
  * Proper spacing and scaling

* Clean widget tree (no deeply nested mess)

## **📈 Trading Logic (Frontend Only – No API)**

### **Core Requirement:**

Simulate **real-time fluctuating prices** similar to a trading app.

### **Rules:**

* ❌ No API calls  
* ✅ Pure frontend logic

### **Expected Behavior:**

* Prices update automatically every few seconds  
* Values fluctuate logically  
  * Random increase/decrease  
  * Small percentage changes  
* Show:  
  * Price  
  * Percentage change  
  * Up/down indicators (color/icons)  
* State updates must be handled via **BLoC**

## **✅ Evaluation Criteria**

Candidates will be evaluated on:

* Clean Architecture correctness  
* BLoC implementation quality  
* Dependency Injection usage  
* Reusability & scalability  
* UI accuracy vs Figma  
* Responsive layout handling  
* Logical real-time data simulation

## **⏱️ Time Expectation**

**24–48 hours** (quality over speed)

## **📦 Submission Guidelines**

* GitHub repository link  
* Clear README explaining:  
  * Architecture decisions  
  * State management flow  
  * Dummy trading logic approach  
* App must run without errors

  **SILVEROCK TECHNOLOGY L.L.C**
