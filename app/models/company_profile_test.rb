require 'test_helper'

class CompanyProfileTest < ActiveSupport::TestCase
  test ".fetch_company_profile" do
    Office.fetch_company_profile
  end
end