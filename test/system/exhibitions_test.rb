require "application_system_test_case"

class ExhibitionsTest < ApplicationSystemTestCase
  setup do
    @exhibition = exhibitions(:one)
  end

  test "visiting the index" do
    visit exhibitions_url
    assert_selector "h1", text: "Exhibitions"
  end

  test "should create exhibition" do
    visit exhibitions_url
    click_on "New exhibition"

    fill_in "Description", with: @exhibition.description
    fill_in "Picture", with: @exhibition.picture
    fill_in "Title", with: @exhibition.title
    click_on "Create Exhibition"

    assert_text "Exhibition was successfully created"
    click_on "Back"
  end

  test "should update Exhibition" do
    visit exhibition_url(@exhibition)
    click_on "Edit this exhibition", match: :first

    fill_in "Description", with: @exhibition.description
    fill_in "Picture", with: @exhibition.picture
    fill_in "Title", with: @exhibition.title
    click_on "Update Exhibition"

    assert_text "Exhibition was successfully updated"
    click_on "Back"
  end

  test "should destroy Exhibition" do
    visit exhibition_url(@exhibition)
    click_on "Destroy this exhibition", match: :first

    assert_text "Exhibition was successfully destroyed"
  end
end
