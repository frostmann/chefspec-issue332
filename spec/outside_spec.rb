require 'chefspec'

RSpec.configure do |config|
  config.cookbook_path = 'cookbooks'
end

describe 'outside' do

  it 'renders outside template inside an inside template' do
    runner = ChefSpec::Runner.new 
    runner.converge("recipe[outside]")

    expect(runner).to render_file('/tmp/inside.txt').with_content('I AM FROM OUTSIDE')
  end

end
