defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    # Please implement the daily_rate/1 function
    (8*hourly_rate)/1
  end

  def apply_discount(before_discount, discount) do
    # Please implement the apply_discount/2 function
    before_discount - (before_discount * (discount/100))
  end

  def monthly_rate(hourly_rate, discount) do
    # Please implement the monthly_rate/2 function
    monthly_rate = hourly_rate*8*22
    ceil(monthly_rate - (monthly_rate * discount/100))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
    hourly_discount = hourly_rate - (hourly_rate * discount/100)
    total = budget / (hourly_discount*8)
    Float.floor(total, 1)
  end
end
