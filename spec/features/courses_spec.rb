require 'rails_helper'

describe 'User can use the courses page succesfully (CRUD)' do

  before :each do
    User.create(user_name: "JoeStudent", password: "pass", about: "I am Joe and I am a student." )
    Course.create(title: "Math 101", day_night: true)
    visit '/login'

    fill_in "Username:", with: "JoeStudent"
    fill_in "Password:", with: "pass"
    click_button "Login"
  end


  scenario 'User creates a new course' do

    click_on "New Course"

    fill_in "Title", with: "Spanish 101"
    page.select("Night", :from => "Day or Night?")

    click_on "Create Course"

    expect(page).to have_content("Course has been successfully created.")
    expect(page).to have_content("Spanish 101")
    expect(page).to have_selector("td", :text => "Night")

  end

  scenario 'User updates a course via courses index page' do

    click_on "Edit"

    fill_in "Title:", with: "Math 201"
    page.select("Night", :from => "Day or Night?")

    click_on "Update Course"

    expect(page).to have_content("Course was successfully updated.")
    expect(page).to have_content("Math 201")
    expect(page).to have_selector("td", :text => "Night")
    expect(page).to_not have_content("Math 101")

  end

  scenario 'User updates a course via course show page' do

    click_on "Math 101"

    expect(page).to have_content("Math 101's Page")
    expect(page).to have_content("Day or Night? Day")

    click_on "Edit"

    fill_in "Title:", with: "Math 201"
    page.select("Night", :from => "Day or Night?")

    click_on "Update Course"

    expect(page).to have_content("Course was successfully updated.")
    expect(page).to have_content("Math 201")
    expect(page).to have_selector("td", :text => "Night")
    expect(page).to_not have_content("Math 101")

  end

  scenario 'User deletes a course via courses index page' do

    click_on "Delete"

    expect(page).to have_content("Course was successfully deleted.")
    expect(page).to_not have_content("Math 101")

  end

  scenario 'User deletes a course via course edit page' do

    click_on "Edit"

    click_on "Delete"

    expect(page).to have_content("Course was successfully deleted.")
    expect(page).to_not have_content("Math 101")

  end


  scenario 'User creates a new course with blank title field' do

    click_on "New Course"

    click_on "Create Course"

    expect(page).to have_content("Title can't be blank")

  end

  scenario 'User edits an existing course and saves with blank title field' do

    click_on "Edit"

    fill_in "Title:", with: ""

    click_on "Update Course"

    expect(page).to have_content("Title can't be blank")

  end

end
