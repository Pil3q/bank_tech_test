### Simple banking app

## How to set it up?
Clone this repo and run
```
bundle install
cd /project_path
irb or pry
require './lib/account.rb'
require './lib/statement_printer.rb'
```
You are ready to go.

## What it does?
This app allows you to create an account which store the balance, allow you to pay in or withdraw money from it, and will keep your transaction history.

## How do I use it
Firstly create an account
```ruby
my_account = Account.new
```
Then put some money on it :)
```ruby
my_account.pay_in(500)
 => [{:amount=>500, :date=>"2018-05-23", :type=>:credit, :balance=>500}]
```
If you check the balance now you will see them:)
```ruby
my_account.balance
 => 500
```
You can withdraw them as well
```ruby
my_account.withdraw(300)
 => [{:amount=>500, :date=>"2018-05-23", :type=>:credit, :balance=>500}, {:amount=>300, :date=>"2018-05-23", :type=>:debit, :balance=>200}]
my_account.balance
 => 200
 ```
 Remember - you do not have overdraft!
 ```ruby
 my_account.withdraw(300)
 Traceback (most recent call last):
        3: from /Users/patryk/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):6
        1: from /Users/patryk/Projects/bank_tech_test/lib/account.rb:15:in `withdraw'
RuntimeError (You are broke, maybe a loan?)
```
You can also print the statement
```ruby
Statement.print(my_account)
Type: credit, amount: £500 at 2018-05-23, balance £500
Type: debit, amount: £300 at 2018-05-23, balance £200
 => [{:amount=>500, :date=>"2018-05-23", :type=>:credit, :balance=>500}, {:amount=>300, :date=>"2018-05-23", :type=>:debit, :balance=>200}]
 ```

 ## Credits
 This app was created by genius software developer Patryk Pilecki. Do not hesitate to contact him via ppilecki@icloud.com
