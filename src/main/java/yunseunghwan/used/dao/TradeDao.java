package yunseunghwan.used.dao;

import java.util.List;

import yunseunghwan.used.domain.Trade;

public interface TradeDao {
	List<Trade> selectTrades(String tradeCode);
	List<Trade> selectAdminTrades();
	Trade selectTrade(Trade trade);
	Trade selectTrade(int tradeNum);
	void insertTrade(Trade trade);
	void updateTrade(Trade trade);
	void updateResTrade(Trade trade);
	void updateFinishTrade(Trade trade);
	void deleteTrade(int tradeNum);
}
