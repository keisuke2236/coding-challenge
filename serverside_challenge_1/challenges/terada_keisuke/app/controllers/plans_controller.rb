class PlansController < ApplicationController
  def index
    ampere = params[:ampere].to_i
    usage = params[:usage].to_f

    # YAMLファイルの名前を正しく修正
    plans_data = YAML.load_file(Rails.root.join('config', 'plans.yml'))

    results = []
    plans_data.each do |company_key, company_data|
      # planやstandardなどのキーでデータを取得
      plan_keys = ['plan', 'standard', 'consumption']
      plan_keys.each do |plan_key|
        if company_data[plan_key]
          plan = Plan.new(company_data[plan_key])
          price = plan.calculate(ampere, usage)
          results << {
            provider_name: company_data['name'],
            plan_name: company_data[plan_key]['name'],
            price: price
          }
        end
      end
    end

    render json: results
  end
end
