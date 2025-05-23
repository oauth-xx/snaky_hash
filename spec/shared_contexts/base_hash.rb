# frozen_string_literal: true

# A shared context that provides a base hash with various key formats for testing
#
# @example Using the shared context
#   RSpec.describe MyClass do
#     include_context "base hash"
#     it "has data" do
#       expect(base_hash["varOne"]).to eq(1)
#     end
#   end
RSpec.shared_context "base hash" do
  let(:base_hash) do
    bh = {
      "varOne" => 1,
      "two" => 2,
      :three => 3,
      :varFour => 4,
      "fiveHumpHumps" => 5,
      :nested => {
        "NestedOne" => "One",
        :two => "two",
        "nested_three" => "three",
      },
      "nestedTwo" => {
        "nested_two" => 22,
        :nestedThree => 23,
      },
      :nestedThree => [
        {nestedFour: 4},
        {"nestedFour" => 4},
      ],
      "spaced Key" => "When would this happen?",
      "trailing spaces " => "better safe than sorry",
      "extra   spaces" => "hopefully this never happens",
    }
    # Hashie v5 is the oldest version of hashie that works with non-symbolizable keys
    bh[4] = "not symbolizable" if defined?(Hashie::VERSION) && Gem::Version.new(Hashie::VERSION) >= Gem::Version.new("5.0.0")
    bh
  end
end
