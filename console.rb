require ('pry')
require_relative('models/house_lab.rb')


# House.delete_all()

house1 = House.new(
  {
"address" => "100 King Square Gardens",
"value"  => 10000,
"num_bedrooms" => 8,
"year" => "2010"
  }
)

house2 = House.new(
  {
"address" => "200 Queen Round Gardens",
"value"  => 20000,
"num_bedrooms" => 4,
"year" => "2020"
  }
)

house1.save()
house2.save()

house1.year = "2011"
house1.update()

# house1.delete()




binding.pry
nil
