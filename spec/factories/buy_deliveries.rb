FactoryBot.define do
  factory :buy_delivery do
    postno      {'123-4567'} 
    area_id     {'2'}
    cities      {'山形市'}  
    address     {'1-2'}
    building    {'アーバン山形'} 
    tel         {'09011112222'} 
    token       {'tok_abcdefghijk00000000000000000'}  
  end
end
