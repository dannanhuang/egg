# 📚 两阶段教学分配优化模型 English follows

## 📌 项目简介
本项目构建了一个基于随机优化的两阶段教学分配模型，用于解决在课程需求不确定情况下的教学安排问题。模型通过线性整数规划方法，在满足教师工作量约束和课程需求的前提下，优化教学资源配置。

模型分为两个阶段：
- 第一阶段：在需求不确定前制定基础教学安排
- 第二阶段：在需求实现后，通过临时教师（adjunct）进行补充调整

该模型兼顾成本控制与教师偏好，是一个适用于课程安排问题的简化随机规划框架。

---

## 📊 数据来源
- 数据文件：教学案例数据（Excel）
- 数据类型：结构化数据
- 内容包括：
  - 课程信息（课程学分、最小/最大班级数）
  - 教师信息（最小/最大教学负担）
  - 教师课程偏好评分
  - 随机场景需求数据（Monte Carlo生成）

---

## 🎯 项目目标
- 构建两阶段随机优化模型
- 在不确定需求下优化课程分配方案
- 最小化教学成本（含临时教师成本）
- 考虑教师偏好，提高分配合理性
- 使用Monte Carlo模拟未来需求场景

---

## ⚙️ 方法与步骤
1. 数据读取与参数设定  
2. 定义集合（课程、教师、场景）  
3. 构建决策变量（整数规划）  
4. 建立目标函数（成本 + 偏好惩罚）  
5. 添加约束条件：
   - 最小课程需求覆盖
   - 教师工作量约束
   - 场景需求约束
6. 使用 PuLP 求解优化模型  
7. 输出最优分配方案  

---

## 🤖 模型说明

### 第一阶段变量
- `y_cf`：教师 f 教授课程 c 的班级数量  
- `a_c`：课程 c 分配给兼职教师的班级数量  

### 第二阶段变量
- `u_cs`：在场景 s 下额外增加的兼职班级数  

所有变量均为**非负整数**

---

## 📈 目标函数
模型目标是最小化以下三部分：

- 第一阶段兼职教师成本  
- 教师偏好惩罚（不喜欢/无资格课程）  
- 第二阶段补救成本  

公式形式（简化理解）：
- 成本 + 不满意度 + 应急调整成本

该设计使模型在经济性与公平性之间取得平衡。 
---

## 🔒 约束条件

### 1️⃣ 最小课程需求约束
确保每门课程至少开设最低班级数

### 2️⃣ 教师工作量约束
每位教师教学负担在合理区间内

### 3️⃣ 场景需求约束
在不同需求场景下满足实际课程需求

### 4️⃣ 整数约束
所有变量为整数（实际教学要求）

---

## 🎲 不确定性建模
使用 Monte Carlo 方法生成需求场景：

- 每门课程需求在最小与最大之间随机生成  
- 使用 100 个场景  
- 使用固定随机种子保证结果可复现  

适用于缺乏历史分布数据的情况 

---


---

# ✅ English Version README

```markdown
# 📚 Two-Stage Teaching Assignment Optimization Model

## 📌 Project Overview
This project develops a two-stage stochastic optimization model for teaching assignment under uncertain course demand. The model is formulated as an integer linear programming problem and solved using PuLP.

It consists of two stages:
- Stage 1: Create a baseline teaching plan before demand is realized
- Stage 2: Adjust using adjunct instructors after demand uncertainty is resolved

The model balances cost efficiency and faculty preference, providing a practical framework for course scheduling. 

---

## 📊 Data Source
- Dataset: teaching case data (Excel)
- Data type: structured data

Includes:
- Course information (credits, min/max groups)
- Faculty constraints (min/max teaching load)
- Faculty preference scores
- Scenario-based demand (Monte Carlo simulation)

---

## 🎯 Objectives
- Build a two-stage stochastic optimization model  
- Optimize teaching assignment under uncertainty  
- Minimize cost (including adjunct usage)  
- Incorporate faculty preferences  
- Simulate demand scenarios  

---

## ⚙️ Methodology
1. Data loading and preprocessing  
2. Define sets (courses, faculty, scenarios)  
3. Define decision variables  
4. Construct objective function  
5. Add constraints:
   - Minimum demand coverage  
   - Faculty workload bounds  
   - Scenario demand constraints  
6. Solve using PuLP  
7. Analyze optimal solution  

---

## 🤖 Model Description

### First-stage variables
- `y_cf`: number of groups of course c assigned to faculty f  
- `a_c`: number of groups assigned to adjuncts  

### Second-stage variables
- `u_cs`: additional adjunct groups under scenario s  

All variables are **non-negative integers**. 

---

## 📈 Objective Function
Minimize total cost composed of:
- First-stage adjunct cost  
- Faculty preference penalty  
- Expected second-stage recourse cost  

This ensures a balance between efficiency and satisfaction. 

---

## 🔒 Constraints
- Minimum course demand coverage  
- Faculty workload bounds  
- Scenario demand satisfaction  
- Integer constraints  

These constraints ensure feasibility and realism. 
---

## 🎲 Uncertainty Modeling
Demand is generated using Monte Carlo simulation:

- Discrete uniform distribution between min and max groups  
- Typically 100 scenarios  
- Fixed random seed for reproducibility  

Suitable when no historical distribution is available. 

---


## 📁 项目结构 Project Structure
```text
teaching-assignment-project/
├── data/
│   └── data_for_the_case.xlsx
├── code/
│   └── two_stage_teaching_model_pulp.ipynb
├── PDF/
│   └── two_stage_teaching_assignment_model.pdf
└── README.md
