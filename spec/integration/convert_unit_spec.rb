RSpec.describe "`scitools convert_unit` command", type: :cli do
  it "executes `scitools help convert_unit` command successfully" do
    output = `scitools help convert_unit`
    expected_output = <<-OUT
Usage:
  scitools convert_unit NUMBER FROM_UNIT TO_UNIT

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
