require 'chefspec'

RSpec.configure do |config|
  config.cookbook_path = 'cookbooks'
end

describe 'outside' do

  it 'renders template with partial from inside' do
    runner = ChefSpec::Runner.new 
    runner.converge("recipe[outside]")

    expect(runner).to render_file('/tmp/partial_from_inside.txt').with_content('Template from inside')
    expect(runner).to render_file('/tmp/partial_from_inside.txt').with_content('Partial: This is from inside')
  end

  it 'renders template with partial from outside' do
    runner = ChefSpec::Runner.new 
    runner.converge("recipe[outside]")

    expect(runner).to render_file('/tmp/partial_from_outside.txt').with_content('Template from inside')
    expect(runner).to render_file('/tmp/partial_from_outside.txt').with_content('Partial: This is from outside')
  end

end
