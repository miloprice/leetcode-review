# @param {Integer[]} prices
# @return {Integer}
# Faster than 32.65% of submissions
def max_profit(prices)
    best_sale = 0
    min_price = prices[0]
    prices.each do |price|
        min_price = price if price < min_price
        curr_sale = price - min_price
        best_sale = curr_sale if curr_sale > best_sale
    end
    best_sale
end
