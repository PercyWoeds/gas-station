Gasoline.destroy_all
Tank.destroy_all
Operator.destroy_all

gas1 = Gasoline.create!({ grade: 1, name: 'А-95 UA', price: 16.69 })
gas2 = Gasoline.create!({ grade: 2, name: 'А-95 SUPER', price: 17.29 })
gas3 = Gasoline.create!({ grade: 3, name: 'А-95 VENTUS', price: 17.79 })
gas4 = Gasoline.create!({ grade: 4, name: 'А-95 E40', price: 14.69 })
gas5 = Gasoline.create!({ grade: 5, name: 'DT VENTUS Diesel ', price: 17.79 })
gas6 = Gasoline.create!({ grade: 6, name: 'А-92', price: 16.49 })
gas7 = Gasoline.create!({ grade: 7, name: 'ДП', price: 16.49 })

Tank.create!([{
  number: 1,
  volume: 25,
  filled: 10000,
  gasoline_id: gas7.id
},
{
  number: 2,
  volume: 30,
  filled: 20000,
  gasoline_id: gas7.id
},
{
  number: 3,
  volume: 40,
  filled: 30000,
  gasoline_id: gas1.id
},
{
  number: 4,
  volume: 50,
  filled: 35000,
  gasoline_id: gas2.id
},
{
  number: 5,
  volume: 60,
  filled: 40000,
  gasoline_id: gas3.id
},
{
  number: 6,
  volume: 75,
  filled: 50000,
  gasoline_id: gas4.id
},
{
  number: 7,
  volume: 40,
  filled: 1000,
  gasoline_id: gas5.id
},
{
  number: 8,
  volume: 50,
  filled: 18000,
  gasoline_id: gas6.id
}])

Operator.create!([{
  email: 'operator1@test.com',
  password: 'password',
  password_confirmation: 'password'
},{
  email: 'operator2@test.com',
  password: 'password',
  password_confirmation: 'password'
}])
