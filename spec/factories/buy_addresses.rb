FactoryBot.define do
  factory :buy_address do
      zip_code             {'123-4567'}
      shipping_area_id     {2}
      city                 {'品川区'}
      address              {'1-1'}
      building_name        {'ビル'}
      phone_number         {'09012345678'}
      token                {"tok_abcdefghijk00000000000000000"}

      
  end
end
