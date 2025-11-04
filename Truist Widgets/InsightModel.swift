//
//  InsightModel.swift
//  DECA2025
//
//  Created by Harri SN on 2/23/25.
//

import Foundation

struct Insight: Identifiable, Hashable {
    var id = UUID()
    var insight: String
}

let insightData: [Insight] = [
    Insight(insight: "View your current balance across all accounts in real-time, making it easy to track your funds at a glance."),
    Insight(insight: "Quickly see recent transactions, highlighting major purchases, transfers, or payments."),
    Insight(insight: "Stay on top of your finances by categorizing spending and setting monthly limits to help you avoid overspending."),
    Insight(insight: "Understand where your money goes by seeing monthly spending patterns broken down by categories like groceries, dining, and entertainment."),
    Insight(insight: "Get notified of low balances, large transactions, or unusual account activity to keep your financial security in check."),
    Insight(insight: "Track your credit score and see personalized tips for improving it, helping you stay on top of your financial health."),
    Insight(insight: "Set reminders for upcoming bill payments to avoid late fees and ensure your payments are always on time."),
    Insight(insight: "Set savings goals (e.g., emergency fund, vacation, or home purchase) and track your progress toward meeting them."),
    Insight(insight: "Visualize your incoming and outgoing transactions, and see how your cash flow trends month over month."),
    Insight(insight: "Receive advice based on your spending habits and financial goals, helping you make smarter decisions."),
    Insight(insight: "Get quick access to your investment portfolio’s performance, trends, and recommendations."),
    Insight(insight: "Track your debt payments and explore options for refinancing or consolidating loans to save on interest."),
    Insight(insight: "Set up automatic transfers to your savings account, helping you build your savings without thinking about it."),
    Insight(insight: "Easily transfer money between accounts or deposit checks by simply snapping a photo of them."),
    Insight(insight: "See an overview of your financial schedule, including due dates for bills, loan payments, and upcoming recurring expenses.")

]
