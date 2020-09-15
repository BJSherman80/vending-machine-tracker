require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  describe 'they see the snack and the price' do
    it "can see average price" do
        owner = Owner.create(name: "Sam's Snacks")
        dons  = owner.machines.create(location: "Don's Mixed Drinks")
        soda_1 = Snack.create!(name: "Root Beer", price: 9.00)
        soda_2 = Snack.create!(name: "Cola", price: 3.00)
        soda_3 = Snack.create!(name: "Cream Soda", price: 6.00)
        MachineSnack.create!(snack: soda_1, machine: dons)
        MachineSnack.create!(snack: soda_2, machine: dons)
        MachineSnack.create!(snack: soda_3, machine: dons)
    visit "/machines/#{dons.id}"

    expect(page).to have_content("Average Price:#{dons.average_price}")
    end
  end
  end
