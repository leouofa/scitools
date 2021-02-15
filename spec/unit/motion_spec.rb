require 'scitools/commands/motion'

RSpec.describe Scitools::Commands::Motion do
  it "executes `motion` command successfully" do
    output = StringIO.new
    options = {}
    command = Scitools::Commands::Motion.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
