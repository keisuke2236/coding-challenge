class Plan
  def initialize(plan_data)
    @base_price_data = plan_data['base_price']
    @step_data = plan_data['step']
  end

  def calculate(ampere, usage)
    base_price = get_base_price(ampere)
    variable_price = calculate_variable_price(usage)
    base_price + variable_price
  end

  private

  def get_base_price(ampere)
    @base_price_data[ampere.to_s] || 0.0
  end

  def calculate_variable_price(usage)
    total_price = 0.0
    remaining_usage = usage.to_f

    @step_data.each do |_, step_data|
      range = eval(step_data['range'])
      price_per_kwh = step_data['price'].to_f

      # 範囲内の使用量を計算
      usage_in_range = [remaining_usage, range.max].min - range.min + 1

      # 範囲外の場合は、次の範囲へ
      next if usage_in_range <= 0

      # 料金を加算
      total_price += usage_in_range * price_per_kwh

      # 残りの使用量を更新
      remaining_usage -= usage_in_range

      # 全ての使用量を計算済みの場合、ループを終了
      break if remaining_usage <= 0
    end

    total_price
  end
end
