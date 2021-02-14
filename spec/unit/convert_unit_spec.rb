require 'scitools/commands/convert_unit'

RSpec.describe Scitools::Commands::ConvertUnit do
  it "executes `convert_unit` command successfully" do
    output = StringIO.new
    number = nil
    from_unit = nil
    to_unit = nil
    options = {}
    command = Scitools::Commands::ConvertUnit.new(number, from_unit, to_unit, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
