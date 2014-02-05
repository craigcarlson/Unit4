
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Petsshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, Petss, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/names/rails4 for more Pets information.
#---
#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Petsshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, Petss, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/names/rails4 for more Pets information.
#---
require 'test_helper'

class PetTest < ActiveSupport::TestCase
  test "pet attributes must not be empty" do
    pet = Pet.new
    assert pet.invalid?
    assert pet.errors[:name].any?
    assert pet.errors[:description].any?
    assert pet.errors[:age].any?
    assert pet.errors[:image_url].any?
  end

  test "pet age must be positive" do
    pet = Pet.new(:name       => "My Pets name",
                          :description => "yyy",
                          :image_url   => "zzz.jpg")
    pet.age = -1
    assert pet.invalid?
    assert_equal "must be greater than or equal to 0.01", 
      pet.errors[:age].join('; ')

    pet.age = 0
    assert pet.invalid?
    assert_equal "must be greater than or equal to 0.01", 
      pet.errors[:age].join('; ')

    pet.age = 1
    assert pet.valid?
  end

  def new_pet(image_url)
    Pet.new(:name       => "My Pets name",
                :description => "yyy",
                :age       => 1,
                :image_url   => image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      assert new_pet(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_pet(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "pet is not valid without a unique name" do
    pet = Pet.new(:name       => pets(:ruby).name,
                          :description => "yyy", 
                          :age       => 1, 
                          :image_url   => "fred.gif")

    assert !pet.save
    assert_equal "has already been taken", pet.errors[:name].join('; ')
  end

  test "pet is not valid without a unique name - i18n" do
    pet = Pet.new(:name       => pets(:ruby).name,
                          :description => "yyy", 
                          :age       => 1, 
                          :image_url   => "fred.gif")

    assert !pet.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'),
                 pet.errors[:name].join('; ')
  end
  
end

