require('sinatra')
  require('sinatra/reloader')
  require('./lib/lend')
  require('./lib/user')
  also_reload('lib/**/*.rb')

  get('/') do
    erb(:index)
  end

  get('/users/new') do
    erb(:new_account)
  end

  get('/users') do
     @users = Account.all()
     erb(:users)
  end

  post('/users') do
    @name = params.fetch('name')
    Account.new(@name).save()
    erb(:submission)
  end

  get('/users/:id') do
    @user = Account.find(params.fetch('id').to_i())
    erb(:user)
  end

  get('/users/:id/request/new') do
      @user = Account.find(params.fetch('id').to_i())
      erb(:req_loan_form)
  end

  get('/users/:id/offer/new') do
      @user = Account.find(params.fetch('id').to_i())
      erb(:lend_form)
  end

  get('/loan_detail') do
    @name = params.fetch("person")
     @amount = params.fetch("amnt").to_i
     @month = params.fetch("months")
     loaning= Loan.new(@name,@amount,@month)
     loaning.save()
     @user = Account.find(params.fetch('user_id').to_i())
    # @user.add_loans(loaning)
    # @int = @user.borrow()
     erb(:accounts)
  end

  get('/my-account/:id') do
    @loans = Loan.find(params.fetch("id"))
    erb(:loan_detail)
  end
