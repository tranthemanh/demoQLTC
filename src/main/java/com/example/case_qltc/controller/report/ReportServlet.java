package com.example.case_qltc.controller.report;

import com.example.case_qltc.model.MoneyEarn;
import com.example.case_qltc.model.MoneySpend;
import com.example.case_qltc.model.Wallet;
import com.example.case_qltc.service.money_earn.MoneyEarnDAO;
import com.example.case_qltc.service.money_spend.MoneySpendDAO;
import com.example.case_qltc.service.wallet.WalletDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "ReportServlet", urlPatterns = {"/report"})
public class ReportServlet extends HttpServlet {
    private MoneySpendDAO moneySpendDAO = new MoneySpendDAO();
    private MoneyEarnDAO moneyEarnDAO = new MoneyEarnDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/report/report.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));

        List<MoneySpend> spendings = moneySpendDAO.getSpendingsByDateRange(startDate, endDate);
        List<MoneyEarn> earnings = moneyEarnDAO.getEarningsByDateRange(startDate, endDate);

        int totalSpending = spendings.stream().mapToInt(MoneySpend::getAmount).sum();
        int totalEarning = earnings.stream().mapToInt(MoneyEarn::getAmount).sum();

        request.setAttribute("spendings", spendings);
        request.setAttribute("earnings", earnings);
        request.setAttribute("totalSpending", totalSpending);
        request.setAttribute("totalEarning", totalEarning);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/report/report.jsp");
        requestDispatcher.forward(request, response);
    }
}
