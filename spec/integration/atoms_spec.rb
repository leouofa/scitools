RSpec.describe "`scitools atoms` command", type: :cli do
  it "executes `scitools help atoms` command successfully" do
    output = `scitools help atoms`
    expected_output = <<-OUT
Usage:
  scitools atoms

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
