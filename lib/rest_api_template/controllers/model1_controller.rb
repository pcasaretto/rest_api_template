require_relative "../main.rb"

module RestApiTemplate
  module Controllers
    class Model1Controller < RestApiTemplate::Main
      get '/' do
        relation = RestApiTemplate::Model::Model1.order(name: :asc).limit(15)

        if params[:term].present?
          relation = relation.where("name like ?",  params[:term].downcase.parameterize + "%")
        end

        [200, {"Content-Type" => "application/json"}, relation.to_json]
      end
    end
  end
end
