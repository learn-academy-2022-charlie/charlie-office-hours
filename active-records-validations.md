## Validations Challenges

### Create a Rails application called company_contacts. The app will have a PostgreSQL database.
- Create a new Rails app in the appropriate folder: $ rails new company_contacts -d postgresql -T
- $ cd company_contacts
- Create a database: $ rails db:create
- Add the dependencies for RSpec:
- $ bundle add rspec-rails
- $ rails generate rspec:install
- Generate the model with appropriate columns and data types
- $ rails db:migrate
- Begin the rails server: $ rails server
- In a browser navigate to: http://localhost:3000

### Generate a model called Account that has a username, a password, and an email.
- $ rails g model Account username:string password:string email:string
- $ rails db:migrate

## Developer Stories
All stories should have accompanying model specs.

### As a developer, I need username, password, and email to be required.
- in spec/models/account_spec.rb
```ruby
RSpec.describe Account, type: :model do
  it 'is not valid without a username' do
    shoutout = Account.create password: 'password', email: 'email@email.now'
    expect(shoutout.errors[:username]).to_not be_empty
  end
end
```
- See test fail: $ rspec spec/models/account_spec.rb
- In app/models/account.rb, add a validation to check for the presence of the name attribute
```ruby
validates :username, presence: true
```
- See test pass: $ rspec spec/models/account_spec.rb
- Repeat this process to ensure no fields are allowed to be empty

### As a developer, I need every username to be at least 5 characters long.
```ruby
# test
  it 'is not valid if username is less than 5 characters' do
    shoutout = Account.create username: 'User', password: 'password', email: 'email@email.now'
    expect(shoutout.errors[:username]).to_not be_empty
  end
# validation
  validates :username, length: { minimum: 5 }
```

### As a developer, I need each username to be unique.
```ruby
# test
  it 'does not allow duplicate usernames' do
    Account.create username: 'TheUser', password: 'password', email: 'email@email.now'
    shoutout = Account.create username: 'TheUser', password: 'password', email: 'email@email.now'
    expect(shoutout.errors[:username]).to_not be_empty
  end
# validation
  validates :username, uniqueness: true
```

### As a developer, I need each password to be at least 6 characters long.
```ruby
# test
  it 'is not valid if password is less than 6 characters' do
    shoutout = Account.create username: 'MyUser', password: 'pass', email: 'email@email.now'
    expect(shoutout.errors[:password]).to_not be_empty
  end
# validation
  validates :password, length: { minimum: 6 }
```

## As a developer, I need each password to be unique.
```ruby
#  Possible way is to modify the existing test and validation for password
# test modified for password
it 'is not valid if password is less than 6 characters and not unique' do
    Account.create username: 'MyUsers', password: 'passed', email: 'email@email.now'    
    shoutout = Account.create username: 'MyUsed', password: 'passed', email: 'email@email.now'
    expect(shoutout.errors[:password]).to_not be_empty
# validation modified for password
  validates :password, length: { minimum: 6 }, uniqueness: true

# However the test is more robust testing each feature separately. Validations can be placed on the same line
```

### As a developer, I want my Account model to have many associated Addresses.
### As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
- Create model with a foreign key:
- $ rails g model Address street_number:integer street_name:string city:string state:string zip:integer account_id:integer
- Create associations in the model classes:
```ruby
# in app/models/account.rb
has_many :addresses
# in app/models/address.rb
belongs_to :account
```
- $ rails db:migrate
```ruby
# Need to do more research, this idea is not working...
# Thinking I need to have to variables store different Account entries
# Then create an address entry for one variable
# have expect show there would be an error for the variable that did not receive an address entry
# test
  # it 'is not valid without an account' do
  #   next_shout = Account.create username: 'AddUser', password: 'passedWord', email: 'email@email.now'
  #   more_shout = Account.create username: 'MoreUser', password: 'WordPass', email: 'email@email.now'
  #   more_shout.addresses.create street_number: 123, street_name: 'My St', city: 'My City', state: 'MS', zip: 45678
  #   expect(next_shout.errors[:addresses]).to_not be_empty
  # end
  # Researched found a solution in stack overflow
  # it { expect(Account.reflect_on_association(:addresses).macro).to eq(:has_many) }
  # Reflection allows you to interrogate Active Record classes and objects about their associations. Macro refers to has_many

  it "should have many addresses" do
    this_account = Account.reflect_on_association(:addresses)
    expect(this_account.macro).to eq(:has_many)
  end
# no additional validation necessary since association is already established

```

### As a developer, I want to validate the presence of all fields on Address.
```ruby
  it 'is not valid without a street_number' do
    more_shout = Account.create username: 'MoreUser', password: 'WordPass', email: 'email@email.now'
    more_shout.addresses.create street_name: 'My St', city: 'My City', state: 'MS', zip: 45678
    p 'addresses ', more_shout.addresses[0]
    expect(more_shout.addresses[0].errors[:street_number]).to_not be_empty
  end
  it 'is not valid without a street_name' do
    more_shout = Account.create username: 'MoreUser', password: 'WordPass', email: 'email@email.now'
    more_shout.addresses.create street_number: 123, city: 'My City', state: 'MS', zip: 45678
    expect(more_shout.addresses[0].errors[:street_name]).to_not be_empty
  end
  it 'is not valid without a city' do
    more_shout = Account.create username: 'MoreUser', password: 'WordPass', email: 'email@email.now'
    more_shout.addresses.create street_number: 123, street_name: 'My St', state: 'MS', zip: 45678
    expect(more_shout.addresses[0].errors[:city]).to_not be_empty
  end
  it 'is not valid without a state' do
    more_shout = Account.create username: 'MoreUser', password: 'WordPass', email: 'email@email.now'
    more_shout.addresses.create street_number: 123, street_name: 'My St', city: 'My City', zip: 45678
    expect(more_shout.addresses[0].errors[:state]).to_not be_empty
  end
  it 'is not valid without a zip' do
    more_shout = Account.create username: 'MoreUser', password: 'WordPass', email: 'email@email.now'
    more_shout.addresses.create street_number: 123, street_name: 'My St', city: 'My City', state: 'MS'
    expect(more_shout.addresses[0].errors[:zip]).to_not be_empty
  end
```

## Stretch Challenges

### As a developer, I need each Account password to have at least one number.
  - HINT: Read about [ custom validations ](https://guides.rubyonrails.org/active_record_validations.html#performing-custom-validations) in the Active Record validation docs.
 - Here is a site I used [ Active Record Validations ](https://betterprogramming.pub/how-to-implement-custom-activerecord-validations-235543f5dd8c)

```ruby

# Custom Validation Steps
# test 
  it 'is not valid if password does not contain an integer' do
    shoutout = Account.create username: 'AnotherUser', password: 'passedIt', email: 'email@emails.now'
    expect(shoutout.errors[:password]).to_not be_empty
  end

# Create the file app/models/concerns/password_validator.rb and define custom validator class inside.
class PasswordValidator < ActiveModel::Validator
  def validate(record)
    unless record.password =~ /\d/ 
      record.errors.add(:password, "must include a number")
    end
  end
end

# validation on account.rb
  validates_with PasswordValidator

# another technique is not to create a separate class and just create the following validation
#   validates :password, format: {with: /[0-9]/}
```

### As a developer, I want to validate that Address street_number, street_name, zip are unique for within an account.
  - HINT: Read about [ :scope ](https://guides.rubyonrails.org/active_record_validations.html#uniqueness) in the Active Record validation docs.
```ruby
# test
  it 'does not allow duplicate street number, street name, and zip in an account' do
    more_shout = Account.create username: 'MoreUser', password: 'W0rdPass', email: 'email@email.now'
    more_shout.addresses.create street_number: 123, street_name: 'My St', city: 'My City', state: 'MS', zip: 45678
    more_shout.addresses.create street_number: 123, street_name: 'My St', city: 'My City', state: 'MS', zip: 45678
    expect(more_shout.addresses[1].errors[:zip]).to_not be_empty
  end  

  # validation
  validates :street_number, :street_name, :zip, presence: true, uniqueness: { scope: :account_id }
```

### As a developer, I want to validate that the Address street_number and zip are numbers.
  - HINT: Read about [ numericality ](https://edgeguides.rubyonrails.org/active_record_validations.html#numericality) in the Active Record validation docs.
```ruby
# test
it 'only allows integers as the street number' do
    more_shout = Account.create username: 'MoreUser', password: 'W0rdPass', email: 'email@email.now'
    more_shout.addresses.create street_number: "l23", street_name: 'My St', city: 'My City', state: 'MS', zip: 45678
    expect(more_shout.addresses[0].errors[:street_number]).to_not be_empty
  end  
  it 'only allows integers as the zipcode' do
    more_shout = Account.create username: 'MoreUser', password: 'W0rdPass', email: 'email@email.now'
    more_shout.addresses.create street_number: 123, street_name: 'My St', city: 'My City', state: 'MS', zip: '4S678'
    expect(more_shout.addresses[0].errors[:zip]).to_not be_empty
  end  

# validation
  # this technique uses a built-in method that will produce an error message ---> "must be an integer" 
  # validates :street_number, :zip, numericality: { only_integer: true }
  validates :street_number, :zip, numericality: true
  ```

### As a developer, I want to see a custom error message that says "Please, input numbers only" if street_number or zip code are not numbers.
  - HINT: Read about [ message ](https://edgeguides.rubyonrails.org/active_record_validations.html#message) in the  validation docs.
```ruby
# update each numericality test with an additional expect statement
    expect(more_shout.addresses[0].errors[:street_number]).to eq(["Please, input numbers only"])

    expect(more_shout.addresses[0].errors[:zip]).to eq(["Please, input numbers only"])

# update validation with a message code block
  validates :street_number, :zip, numericality: { message: "Please, input numbers only" }
```
