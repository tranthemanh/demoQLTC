package com.example.case_qltc.service.money_earn;

import com.example.case_qltc.model.MoneyEarn;
import com.example.case_qltc.model.MoneySpend;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MoneyEarnDAO {
    public static Connection getConnection() {
        Connection connection = null;
        String url = "jdbc:mysql://localhost:3306/financial_management";
        String user = "root";
        String password = "012345";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        }catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            connection = DriverManager.getConnection(url,user,password);
            System.out.println("Ket noi thanh cong");
        }catch (SQLException e) {
            System.out.println("Loi ket noi");
        }
        return connection;
    }

    public void createMonnyEarn(MoneyEarn moneyEarn) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false); // Bắt đầu một giao dịch

            // Thêm bản ghi vào bảng money_spend
            String insertSQL = "INSERT INTO money_earn(date, amount, note, categoryEarn_id, wallet_id) VALUES (?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.setDate(1, Date.valueOf(moneyEarn.getDate()));
            preparedStatement.setInt(2, moneyEarn.getAmount());
            preparedStatement.setString(3, moneyEarn.getNote());
            preparedStatement.setInt(4, moneyEarn.getCategoryId());
            preparedStatement.setInt(5, moneyEarn.getWalletId());
            preparedStatement.executeUpdate();

            // Trừ số tiền từ ví
            String updateWalletSQL = "UPDATE wallet SET amount = amount + ? WHERE id = ?";
            try (PreparedStatement updateWalletStmt = connection.prepareStatement(updateWalletSQL)) {
                updateWalletStmt.setInt(1, moneyEarn.getAmount());
                updateWalletStmt.setInt(2, moneyEarn.getWalletId());
                updateWalletStmt.executeUpdate();
            }

            connection.commit(); // Xác nhận giao dịch
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback(); // Hoàn tác giao dịch nếu có lỗi
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
            }
            throw new RuntimeException(e);
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    public List<MoneyEarn> getEarningsByDateRange(LocalDate startDate, LocalDate endDate) {
        List<MoneyEarn> earnings = new ArrayList<>();
        String query = "SELECT me.id, me.date, me.amount, me.note, ce.name AS category_name, w.walletName AS wallet_name " +
                "FROM money_earn me " +
                "JOIN category_earn ce ON me.categoryEarn_id = ce.id " +
                "JOIN wallet w ON me.wallet_id = w.id " +
                "WHERE me.date BETWEEN ? AND ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setDate(1, Date.valueOf(startDate));
            preparedStatement.setDate(2, Date.valueOf(endDate));
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                MoneyEarn earning = new MoneyEarn();
                earning.setId(resultSet.getInt("id"));
                earning.setDate(resultSet.getDate("date").toLocalDate());
                earning.setAmount(resultSet.getInt("amount"));
                earning.setNote(resultSet.getString("note"));
                earning.setCategoryName(resultSet.getString("category_name"));
                earning.setWalletName(resultSet.getString("wallet_name"));
                earnings.add(earning);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return earnings;
    }

}
