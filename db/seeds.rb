require 'pry-byebug'

ActiveRecord::Base.connection.execute(" INSERT INTO model2s (name) VALUES
('Test1'),
('Test2'),
('Test3'),
('Test4'),
('Test5'),
('Test6'),
('Test7')");

ActiveRecord::Base.connection.execute(" INSERT INTO model1s (name, id_model2) VALUES
('Test Model 1', 1),
('Test Model 2', 1),
('Test Model 3', 2),
('Test Model 4', 2),
('Test Model 5', 3),
('Test Model 6', 3),
('Test Model 7', 4),
('Test Model 8', 4),
('Test Model 9', 4),
('Test Model 10', 5),
('Test Model 11', 5),
('Test Model 12', 5)");
