package com.example.case_qltc.service.money_spend;

import com.example.case_qltc.model.MoneySpend;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MoneySpendDAO {
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

    public void createMonnySpend(MoneySpend moneySpend) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false); // Bắt đầu một giao dịch

            // Thêm bản ghi vào bảng money_spend
            String insertSQL = "INSERT INTO money_spend(date, amount, note, categorySpend_id, wallet_id) VALUES (?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.setDate(1, Date.valueOf(moneySpend.getDate()));
            preparedStatement.setInt(2, moneySpend.getAmount());
            preparedStatement.setString(3, moneySpend.getNote());
            preparedStatement.setInt(4, moneySpend.getCategoryId());
            preparedStatement.setInt(5, moneySpend.getWalletId());
            preparedStatement.executeUpdate();

            // Trừ số tiền từ ví
            String updateWalletSQL = "UPDATE wallet SET amount = amount - ? WHERE id = ?";
            try (PreparedStatement updateWalletStmt = connection.prepareStatement(updateWalletSQL)) {
                updateWalletStmt.setInt(1, moneySpend.getAmount());
                updateWalletStmt.setInt(2, moneySpend.getWalletId());
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
    public List<MoneySpend> getSpendingsByDateRange(LocalDate startDate, LocalDate endDate) {
        List<MoneySpend> spendings = new ArrayList<>();
        String query = "SELECT s.id, s.date, s.amount, s.note, c.name AS category_name, w.walletName AS wallet_name " +
                        "FROM money_spend s " +
                        "JOIN category_spend c ON s.categorySpend_id = c.id " +
                        "JOIN wallet w ON s.wallet_id = w.id " +
                        "WHERE s.date BETWEEN ? AND ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setDate(1, Date.valueOf(startDate));
            preparedStatement.setDate(2, Date.valueOf(endDate));
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                MoneySpend spending = new MoneySpend();
                spending.setId(resultSet.getInt("id"));
                spending.setDate(resultSet.getDate("date").toLocalDate());
                spending.setAmount(resultSet.getInt("amount"));
                spending.setNote(resultSet.getString("note"));
                spending.setCategoryName(resultSet.getString("category_name"));
                spending.setWalletName(resultSet.getString("wallet_name"));
                spendings.add(spending);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return spendings;
    }
}
