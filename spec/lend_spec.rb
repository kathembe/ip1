require('rspec')
  require('lend')

  describe('Loan') do
    before() do
      Loan.clear()
    end

    describe("#name") do
      it("returns the name") do
        new_loan = Loan.new("Kim", 500, 3)
        expect(new_loan.name()).to(eq("Kim"))
      end
    end

    describe("#amount") do
      it("returns the amount property of the object Loan") do
        new_loan = Loan.new("Kim", 500, 3)
        expect(new_loan.amount()).to(eq(500))
      end
    end

    describe("#month") do
      it("returns the month to pay") do
        new_loan = Loan.new("Kim", 500, 3)
        expect(new_loan.month()).to(eq(3))
      end
    end

    describe(".all") do
      it("is empty at first") do
        expect(Loan.all()).to(eq([]))
      end
    end

    describe(".save") do
      it("it adds a loan to the array of saved loans") do
        test_loan = Loan.new("Kim", 500, 3)
        test_loan.save()
        expect(Loan.all()).to(eq([test_loan]))
      end
    end

    describe(".clear") do
      it("empties out all saved loans") do
        Loan.new("Kim", 500, 3).save()
        Loan.clear()
        expect(Loan.all()).to(eq([]))
      end
    end

    describe("#id") do
      it("returns the id of the loan") do
        test_loan = Loan.new("Kim", 500, 3)
        test_loan.save()
        expect(test_loan.id()).to(eq(1))
      end
    end

    describe("#pay_day") do
      it("returns the day the loan should be paid")do
        test_loan = Loan.new("Kim", 500, 3)
        expect(test_loan.pay_day()).to(eq("2017-5-23"))
      end
    end

    describe("#borrow") do
      it("returns the total amount due when the feed with principle") do
        debit_loan = Loan.new("Kim", 500, 3)
        expect(debit_loan.borrow()).to(eq(1650))
      end
    end

    describe(".find") do
    it("returns a Loan by its id number") do
      loaning= Loan.new("marty",5000,4)
      loaning.save()
      loaning1= Loan.new("Randy",3000,3)
      loaning.save()
      expect(Loan.find(loaning.id())).to(eq(loaning))
    end
   end
  end
#
# describe('String#amnt_due') do
#   it('returns a rate 110% the amount borrowed') do
#     expect(("100").amnt_due()).to(eq(110))
#   end
# end
#
# describe(Loan) do
#   describe("#principle") do
#     it("returns the principle property of the object Loan") do
#       new_loan = Loan.new(3, 500)
#       expect(new_loan.principle()).to(eq(500))
#     end
#   end
#
#   describe("#duration") do
#     it("returns the duration property of the object Loan") do
#       new_loan = Loan.new(3, 500)
#       expect(new_loan.duration()).to(eq(3))
#     end
#   end
#
#   describe("#id") do
#       it("returns the id of the loan") do
#         test_loan = Loan.new(3, 2000)
#         test_loan.save()
#         expect(test_loan.id()).to(eq(1))
#       end
#     end
#
#     describe(".find") do
#       it("returns a loan by its id number") do
#         test_loan = Loan.new(3, 2000)
#         test_loan.save()
#         test_loan2 = Loan.new(3, 1999)
#         test_loan2.save()
#         expect(Loan.find(test_loan.id())).to(eq(test_loan))
#       end
#     end
#
#     describe(".all") do
#         it("is empty at first") do
#           expect(Loan.all()).to(eq([]))
#         end
#       end
#
#   describe("#save") do
#     it("it adds a loan to the array of saved loans") do
#       test_loan = Loan.new(3, 500)
#       test_loan.save()
#       expect(Loan.all()).to(eq([test_loan]))
#     end
#   end
#
#   describe(".clear") do
#     it("empties out all saved loans") do
#       Loan.new(3, 500).save()
#       Loan.clear()
#       expect(Loan.all()).to(eq([]))
#     end
#   end
#
#   describe("#pay_day") do
#     it("returns the day the loan should be paid")do
#       test_loan = Loan.new(3, 500)
#       expect(test_loan.pay_day()).to(eq("2017-5-19"))
#     end
#   end
#
#   describe("#borrow") do
#     it("returns the total amount due when the feed with principle") do
#       debit_loan = Loan.new(2, 2000)
#       expect(debit_loan.borrow()).to(eq(4400))
#     end
#   end
# end
