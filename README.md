# Simple banking app

## How to set it up?
Clone this repo and run
```
cd /project_path
bundle install
run irb pry or any REPL
require './lib/account.rb'
```
You are ready to go.

## What it does?
This app allows you to create an account which store the balance, allow you to pay in or withdraw money from it, and will keep your transaction history.

## How do I use it
Firstly create an account
```ruby
my_account = Account.new
```
Then put some money on it, and you will see the current balance.
```ruby
my_account.pay_in(500)
 => 500
```
If you you need You can always check the balance by calling
```ruby
my_account.balance
 => 500
```
You can withdraw them as well
```ruby
my_account.withdraw(300)
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
date || credit || debit || balance
24/05/2018 ||  || 300.00 || 200.00
24/05/2018 || 500.00 ||  || 500.00
=> nil
 ```

 ## Credits
If you have some feedback do not hesitate to contact me at ppilecki@icloud.com. If you like my outstanding work and have a juicy job offer I may think of it so do not hesitate too. It might be your lucky email:)
