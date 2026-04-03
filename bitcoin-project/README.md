# 比特币价格时间序列分析与预测  English follows

## 📌 项目简介
本项目基于比特币（Bitcoin）美元价格的时间序列数据，对其价格走势进行建模与预测。通过统计分析与时间序列方法，探索比特币价格的变化规律，并评估不同模型的预测性能。

## 📅 数据来源
- 数据来源：Yahoo Finance
- 数据频率：日度数据
- 时间范围：2020-01-01 至 2025-12-31
- 变量：收盘价（Close Price）

## 🎯 项目目标
- 分析比特币价格的时间序列特征
- 检验时间序列的平稳性并确定差分阶数
- 构建 ARIMA 模型进行预测
- 评估模型预测效果（MAE、RMSE）
- 与 Holt-Winters 模型进行对比分析

## ⚙️ 方法与步骤
1. 数据获取与预处理  
2. 时间序列可视化分析  
3. 平稳性检验（ADF检验）  
4. 差分处理与模型识别  
5. 构建 ARIMA 模型  
6. 参数显著性检验  
7. 价格预测  
8. 模型评估（MAE、RMSE）  
9. 与 Holt-Winters 模型对比（加性与乘性）  

## 📊 使用模型
- ARIMA（自回归积分滑动平均模型）
- Holt-Winters（指数平滑方法）

## 💻 使用工具
- R 
- 时间序列分析相关库（如 statsmodels、forecast 等）

## 📁 项目结构
bitcoin-time-series-project/
├── code/
│   └── bitcoin_analysis.R
└── README.md


# English Version: Bitcoin Price Time Series Analysis and Forecasting

## 📌 Project Overview
This project analyzes and forecasts Bitcoin (BTC) prices using time series methods. By applying statistical modeling techniques, the project explores the underlying patterns of Bitcoin price movements and evaluates the performance of different forecasting models.

## 📅 Data Source
- Source: Yahoo Finance  
- Frequency: Daily data  
- Time Period: 2020-01-01 to 2025-12-31  
- Variable: Closing Price  

## 🎯 Objectives
- Analyze the time series characteristics of Bitcoin prices  
- Test stationarity and determine the order of integration  
- Build ARIMA models for forecasting  
- Evaluate model performance using MAE and RMSE  
- Compare ARIMA with Holt-Winters models  

## ⚙️ Methodology
1. Data collection and preprocessing  
2. Time series visualization  
3. Stationarity testing (ADF test)  
4. Differencing and model identification  
5. ARIMA model fitting  
6. Parameter significance testing  
7. Forecasting future prices  
8. Model evaluation (MAE, RMSE)  
9. Comparison with Holt-Winters models (additive & multiplicative)  

## 📊 Models Used
- ARIMA (AutoRegressive Integrated Moving Average)  
- Holt-Winters Exponential Smoothing  

## 💻 Tools
- R  
- Libraries such as `statsmodels`, `forecast`, etc.  

## 📁 Project Structure
bitcoin-time-series-project/
├── code/
│   └── bitcoin_analysis.R
└── README.md
