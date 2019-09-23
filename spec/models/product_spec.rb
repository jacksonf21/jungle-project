require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    subject {
      described_class.new(
        id: 1, name: 'fish feet', category: Category.new, quantity: 10, price: 39.99        
      )
    }

    it 'is valid with data attributes' do
      expect(subject).to be_valid
    end
      
    it 'it is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid      
    end

    it 'it is not valid without price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid      
    end
    
    it 'it is not valid without quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid      
    end

    it 'it is not valid without category' do
      subject.category = nil
      expect(subject).to_not be_valid      
    end

  end
  
end
