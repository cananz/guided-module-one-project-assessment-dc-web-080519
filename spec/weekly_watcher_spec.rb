require_relative '../config/environment'

describe "CommandLineInterface, #greet" do
    
    let (:checker) {CommandLineInterface.new}
    let (:person) {User.find_or_create_by(name: "germ")}
    
 

      it "returns the users input as their username" do
        allow_any_instance_of(Object).to receive(:gets).and_return("germ\n")
        expect(checker.returning_user).to eq(person)
      end
    end

