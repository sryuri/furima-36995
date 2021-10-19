FactoryBot.define do
  factory :item do
    name              {"hoge"}
    text              {"text"}
    category_id       {1}
    condition_id      {1}
    shipping_cost_id  {1}
    shipping_area_id  {1}
    shipping_day_id   {1}
    price             {1000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
