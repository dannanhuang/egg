# 🧠 用户购物偏好分类（深度学习） Eglish follows

## 📌 项目简介
本项目基于消费者行为数据，利用人工神经网络（ANN）对用户的购物偏好进行分类预测。通过数据预处理、特征工程以及深度学习模型训练，分析用户更倾向于：

- 线下购物（Store）
- 线上购物（Online）
- 混合购物（Hybrid）

项目不仅完成分类任务，还进一步进行了模型对比、交叉验证以及公平性分析，全面评估模型表现。

## 📊 数据来源
- 数据集：online vs store shopping dataset  
- 数据类型：结构化数据  
- 样本内容：用户人口统计信息与消费行为  
- 目标变量：`shopping_preference`

主要特征包括：
- 性别（gender）
- 年龄（age）
- 城市等级（city_tier）
- 月收入（monthly_income）
- 其他消费行为变量

## 🎯 项目目标
- 分析用户购物行为特征  
- 构建深度学习分类模型（ANN）  
- 处理类别不平衡问题  
- 比较不同激活函数（ReLU / ELU / Swish）  
- 使用交叉验证评估模型稳定性  
- 分析模型在不同群体中的公平性  

## ⚙️ 方法与步骤
1. 数据清洗与预处理（缺失值处理、编码）
2. 特征工程（One-Hot编码、标准化）
3. 数据集划分（训练集 / 验证集 / 测试集）
4. 构建ANN模型（Dense + Dropout + BatchNorm）
5. 使用Early Stopping与学习率调整优化训练
6. 比较不同激活函数效果
7. 进行5折交叉验证
8. 模型公平性分析（按性别、年龄、收入等分组）

## 🤖 模型说明
- 模型类型：多层前馈神经网络（ANN）
- 优化器：Adam
- 损失函数：Sparse Categorical Crossentropy
- 输出层：Softmax（多分类）

正则化技术：
- Dropout
- L2 Regularization
- Batch Normalization

---

## 📈 结果与评估
- 模型准确率（Accuracy）最高约：**86%+**
- 5折交叉验证平均准确率：**约96%**
- Macro F1 Score：用于评估类别不平衡问题

激活函数表现：
- ReLU 表现最佳
- Swish 次之
- ELU 稍低

## ⚖️ 公平性分析
从以下维度评估模型公平性：
- 性别（Gender）
- 年龄（Age Group）
- 城市等级（City Tier）
- 收入水平（Income）

指标包括：
- Accuracy
- Precision
- Recall
- F1 Score
- Error Rate


## ✅ English Version 

# 🧠 Customer Shopping Preference Classification (Deep Learning)

## 📌 Project Overview
This project uses consumer behavior data to build a deep learning model (ANN) for predicting customers' shopping preferences. The model classifies users into:

- Store
- Online
- Hybrid

In addition to classification, the project includes model comparison, cross-validation, and fairness analysis to evaluate performance comprehensively.

---

## 📊 Data Source
- Dataset: online vs store shopping dataset  
- Data type: Structured data  
- Target variable: `shopping_preference`

Main features include:
- Gender
- Age
- City Tier
- Monthly Income
- Other behavioral features

---

## 🎯 Objectives
- Analyze customer shopping behavior  
- Build an ANN classification model  
- Handle class imbalance  
- Compare activation functions (ReLU / ELU / Swish)  
- Perform cross-validation  
- Conduct fairness analysis  

---

## ⚙️ Methodology
1. Data cleaning and preprocessing  
2. Feature engineering (One-Hot encoding, scaling)  
3. Train/validation/test split  
4. ANN model construction  
5. Model optimization (EarlyStopping, LR scheduling)  
6. Activation function comparison  
7. 5-Fold cross-validation  
8. Fairness analysis  

---

## 🤖 Model Description
- Model: Artificial Neural Network (ANN)  
- Optimizer: Adam  
- Loss: Sparse Categorical Crossentropy  
- Output: Softmax (multi-class classification)

Regularization:
- Dropout  
- L2 Regularization  
- Batch Normalization  

---

## 📈 Results
- Best accuracy: **~86%+**
- 5-Fold average accuracy: **~96%**
- Macro F1 Score used for balanced evaluation

Activation function comparison:
- ReLU performed best  
- Swish second  
- ELU slightly lower  

---

## ⚖️ Fairness Analysis
Evaluated across:
- Gender  
- Age group  
- City tier  
- Income group  

Metrics:
- Accuracy  
- Precision  
- Recall  
- F1 Score  
- Error Rate  

---

## 📁 Project Structure
```text
customer-shopping-project/
├── data/
│   └── online vs store shopping dataset.csv
├── code/
│   └── customer Cluster in deep learning.ipynb
└── README.md
