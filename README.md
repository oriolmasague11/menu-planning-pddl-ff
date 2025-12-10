# 🥘 Weekly Menu Planning with PDDL & Fast Forward

This project implements a planning domain in **PDDL** to automatically generate weekly menus (Monday–Friday) using the **Fast Forward (FF)** planner.  
It was developed as part of the *Artificial Intelligence* course at UPC.

The system produces weekly menus that satisfy constraints such as dish compatibility, dish repetition, type restrictions, mandatory dishes, calorie bounds, and menu cost optimization (depending on the executed extension).

The planner used is **Fast Forward (FF) v2.3** and **Metric-FF** for fluents and optimization.

---

## 📌 Features & Levels Implemented

The project is structured according to the required levels of the practice:

### **Base Level**
- Generates a weekly menu with compatible first and second courses.

### **Extension 1**
- Ensures that no dish is repeated during the week.

### **Extension 2**
- Adds constraints disallowing consecutive days with first courses (or second courses) of the same type.

### **Extension 3**
- Allows forcing specific dishes to appear on specific days (e.g., paella on Thursday).

### **Extension 4**
- Enforces caloric constraints per day:  
  **Minimum 1000 kcal – Maximum 1500 kcal** (requires *Metric-FF*).

### **Extension 5**
- Minimizes the total weekly cost (requires *Metric-FF*).

---

## ▶️ How to Run

To execute any level, navigate to the corresponding folder (Base, Extension1, Extension2, Extension3, …) and open a terminal **from inside that folder**.

### **Run Base, Extension 1, Extension 2, Extension 3**
Use Fast Forward (FF) normally:

```./ff -o dominio.pddl -f problema.pddl```

### **Run Extension 4 & Extension 5 (requires Metric-FF)**

Use the optimization flag (`-O`) to enable fluent reasoning and cost minimization:

```./ff -O -o dominio.pddl -f problema.pddl```

---

## 📄 Contents

- `dominio.pddl` – Domain specification including predicates, actions, types, and (when required) fluents for caloric and cost reasoning.
- `problema*.pddl` – Multiple problem instances used to test each level (Base, Extension 1–5).  
  Each file defines the objects, initial state, and goals for generating the weekly menu.
- Planner execution traces demonstrating the solutions obtained for every level.
- (Optional) Random test-case generator if implemented, used to automatically produce non-trivial problem files.

---

## 🎯 Learning Objectives
This project applies classical AI planning concepts using **PDDL** and the **Fast Forward (FF)** planner.  
The practice reinforces:

- Modeling domains and problems in PDDL.  
- Designing operators that satisfy increasingly restrictive constraints.  
- Using both FF and Metric-FF for planning with numeric fluents and optimization.  
- Building representative test cases to validate the model’s correctness and robustness.

---

## 📬 Authors
Developed by **Oriol Masague Sans** as part of the *Artificial Intelligence* course (UPC).

---

## 📘 License
This project is intended for academic and educational use only.
