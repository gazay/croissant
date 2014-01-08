require 'test_helper'

class AsciiRenderTest < ActionDispatch::IntegrationTest
  test 'ascii request render ascii html page' do
    get home_path(format: :ascii)

    assert_match 'ascii-page', response.body
  end

  test 'html request works too' do
    get home_path

    assert_match 'HELLO!', response.body
  end
end
