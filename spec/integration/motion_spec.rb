RSpec.describe "`scitools motion` command", type: :cli do
  it "executes `scitools help motion` command successfully" do
    output = `scitools help motion`
    expected_output = <<-OUT
Usage:
  scitools motion

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
