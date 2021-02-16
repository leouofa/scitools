require 'scitools/commands/atoms'

RSpec.describe Scitools::Commands::Atoms do
  it "executes `atoms` command successfully" do
    output = StringIO.new
    options = {}
    command = Scitools::Commands::Atoms.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
