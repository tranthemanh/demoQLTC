package com.example.case_qltc.controller.money_earn;

import com.example.case_qltc.model.Category;
import com.example.case_qltc.model.MoneyEarn;
import com.example.case_qltc.model.MoneySpend;
import com.example.case_qltc.model.Wallet;
import com.example.case_qltc.service.category.CategoryEarnDao;
import com.example.case_qltc.service.category.CategorySpendDAO;
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

@WebServlet(name = "moneyEarnController", value = "/moneyearn")
public class MoneyEarnController extends HttpServlet {
    private static MoneyEarnDAO moneyEarnDAO = new MoneyEarnDAO();
    private static CategoryEarnDao categoryEarnDao = new CategoryEarnDao();
    private static WalletDAO walletDAO = new WalletDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categorie = categoryEarnDao.getAllCategory();
        List<Wallet> wallets = walletDAO.showAll();
        request.setAttribute("categorie", categorie);
        request.setAttribute("wallet", wallets);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/moneyearn/earn.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String note = request.getParameter("note");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int walletId = Integer.parseInt(request.getParameter("walletId"));
        MoneyEarn moneyEarn = new MoneyEarn(date, amount, note, categoryId, walletId);
        moneyEarnDAO.createMonnyEarn(moneyEarn);
        response.sendRedirect(request.getContextPath() + "/moneyearn");
    }
}
