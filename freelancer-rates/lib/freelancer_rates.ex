defmodule FreelancerRates do
  @daily_rate 8.0
  @total_month_days 22

  def daily_rate(hourly_rate), do: hourly_rate * @daily_rate

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * (discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    (daily_rate(hourly_rate) * @total_month_days)
    |> apply_discount(discount)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate(hourly_rate)
    |> apply_discount(discount)
    |> then(&Float.floor(budget / &1, 1))
  end
end
