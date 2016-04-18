require_relative "../main.rb"
require_relative "../version.rb"

module TestApi
  module Controllers
    class HealthCheckController < TestApi::Main
      get '/' do
        sql = "( (select id from leads_2 lead inner join k_email em on em.entity_id = lead.id and em.value = 'lead@lead.com.br') union all (select id from leads_2 lead inner join k_opportunity ko on ko.entity_id = lead.id and ko.value = 'not_opportunity') union all (select id from leads_2 lead inner join ( select relation.entity_id from r_pgv_date relation where relation.value >= '2015-07-30' ) tbl_aggr_1 on tbl_aggr_1.entity_id = lead.id ) union all (select id from leads_2 lead inner join ( select relation.entity_id from r_cnv_identifier relation where relation.value = 'webinar-gestao_leads' ) tbl_aggr_1 on tbl_aggr_1.entity_id = lead.id ) union all (select id from leads_2 lead inner join k_job_title ko on ko.entity_id = lead.id and to_tsquery('portuguese', 'diretor') @@ to_tsvector('portuguese', ko.value) ) ) limit 20"
        ActiveRecord::Base.connection.execute(sql)
      end

      get '/status' do
        status = Hash.new
        status["api_name"] = "Test Api"
        status["version"] = TestApi::VERSION
        status["environment"] = ENV["RACK_ENV"]

        json status
      end
    end
  end
end
