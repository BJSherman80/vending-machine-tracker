require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'instance methods' do
      describe 'Snack instance methods' do
        it "#average_price" do
          owner = Owner.create(name: "Sam's Snacks")
          dons  = owner.machines.create(location: "Don's Mixed Drinks")
          soda_1 = Snack.create!(name: "Root Beer", price: 9.00)
          soda_2 = Snack.create!(name: "Cola", price: 3.00)
          soda_3 = Snack.create!(name: "Cream Soda", price: 6.00)
          MachineSnack.create!(snack: soda_1, machine: dons)
          MachineSnack.create!(snack: soda_2, machine: dons)
          MachineSnack.create!(snack: soda_3, machine: dons)
        expect(dons.average_price).to eq(6)
    end
  end
 end
end
