FactoryBot.define do
  factory :buy_address do
      zip_code             {'123-4567'}
      shipping_area_id     {2}
      city                 {'東京都'}
      address              {'1-1'}
      building_name        {''}
      phone_number         {'09012345678'}

      association :user
      association :item
      
  end
end
