require_relative "../main.rb"

module RestApiTemplate
  module Controllers
    class Model1Controller < RestApiTemplate::Main
      get '/' do
        model1 = RestApiTemplate::Model::Model1.order(name: :asc).limit(15)

        if params[:term].present?
          model1 = relation.where("name like ?",  params[:term].downcase.parameterize + "%")
        end

        [200, {"Content-Type" => "application/json"}, model1.to_json]
      end
    end
  end
end
