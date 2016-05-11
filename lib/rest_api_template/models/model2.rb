module RestApiTemplate
  module Model
    class Model1 < ActiveRecord::Base
      belongs_to :model2, foreign_key: "id_model2"

      validates :name, :model2, presence: true
    end
  end
end
