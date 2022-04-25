require 'rails_helper'

RSpec.describe 'hospital show page' do

  # User Story 2, Hospital Show Page
  # ​
  # As a visitor
  # When I visit a hospital's show page
  # I see the hospital's name
  # And I see the number of doctors that work at this hospital
  # And I see a unique list of universities that this hospital's doctors attended

  it 'displays all of the hospital information' do
    hospital = Hospital.create!(name: 'UC Denver')
    hospital_2 = Hospital.create!(name: 'SLC')
    doctor_1 = hospital.doctors.create!(name: 'Chris', specialty: 'ER', university: 'UT')
    doctor_2 = hospital.doctors.create!(name: 'Sophie', specialty: 'PCP', university: 'Harvard')
    doctor_3 = hospital.doctors.create!(name: 'Sam', specialty: 'PCP', university: 'Harvard')
    doctor_4 = hospital.doctors.create!(name: 'Jason', specialty: 'PCP', university: 'Stanford')
    doctor_5 = hospital.doctors.create!(name: 'Juan', specialty: 'PCP', university: 'Stanford')
    doctor_6 = hospital_2.doctors.create!(name: 'Dave', specialty: 'PCP', university: 'Cornell')

    visit "/hospitals/#{hospital.id}"

    expect(page).to have_content('UC Denver')
    expect(page).to have_content('Number of doctors: 5')
    expect(page).to have_content('Harvard', count: 1)
    expect(page).to have_content('Stanford', count: 1)
    expect(page).to have_content('UT', count: 1)

    expect(page).to_not have_content('SLC')
    expect(page).to_not have_content('Cornell')

  end

end
