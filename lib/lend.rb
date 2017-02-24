class Loan
  @@loans = []
  define_method(:initialize)do |name, amount, month|
    @name = name
    @amount = amount
    @month = month
    @id = @@loans.length().+(1)
  end

  define_method(:name)do
    @name
  end

  define_method(:amount)do
    @amount
  end

  define_method(:month)do
    @month
  end

  define_method(:id)do
    @id
  end

  define_singleton_method(:all)do
      @@loans
  end

  define_method(:save) do
    @@loans.push(self)
  end

  define_singleton_method(:clear) do
    @@loans = []
  end

  define_method(:pay_day) do
    y = (Time.now().year).to_s
    m = (3.+(Time.now().month)).to_s
    d = (Time.now().day).to_s
    i= "-"

    mat_day = "#{y}#{i}#{m}#{i}#{d}"
    return mat_day
  end

  define_method(:borrow) do
    amnt = @month.*(1.1.*(@amount))
    return amnt
  end

  define_singleton_method(:find) do |identification|
     found_loan_det = nil
     @@loans.each() do |loan|
       if loan.id().eql?(identification.to_i())
         found_loan_det = loan
       end
     end
     found_loan_det
   end
end
