require_relative '../config/environment'


describe "User, .username_exists" do
    
    let (:checker) {CommandLineInterface.new}
    let (:person) {User.find_or_create_by(name: "germ")}

      it "knows that an user account exists" do
        allow_any_instance_of(Object).to receive(:gets).and_return("germ\n")
        expect(User.username_exists("germ")).to be(true)
      end
    end

    describe "CommandLineInterface, #daily_timeslots" do

        let (:sundays) {Timeslot.all.find_all do |time_slot| time_slot.day == 0 end}

          it "timeslot.sunday returns an array of timeslot objects where the day = 0" do
            expect(Timeslot.sunday).to eq(sundays)
          end

          let(:tuesdays) {Timeslot.all.find_all do |time_slot| time_slot.day == 2 end}
            it "timeslot.tuesday returns an array of timeslot objects where the day = 2" do
            expect(Timeslot.tuesday).to eq(tuesdays)
          end

          let(:daily) {false}
          let (:checker) {CommandLineInterface.new}
          it "Returns false when the argument is not a day of the week" do
            expect(checker.daily_timeslots("blah blah")).to eq(daily)
          end

          let(:fridays) {Timeslot.all.find_all do |time_slot| time_slot.day == 5 end}
          it "Returns array of correct timeslot objects when a day is paseed in" do
          expect(checker.daily_timeslots("friday")).to eq(fridays)
          end

        end

        describe "CommandLineInterface, #hourly_timeslots" do
            let (:checker) {CommandLineInterface.new}
            let (:eight) {Timeslot.all.find_all {|indiv_ts| indiv_ts.start_time == 2000}}
            it "returns all the show objects that have a start time at 8" do
              expect(checker.hourly_timeslots(1)).to eq(eight)
            end
      
            let(:nine) {Timeslot.all.find_all {|indiv_ts| indiv_ts.start_time == 2100}}
            it "returns all the show objects that have a start time at 9" do
              expect(checker.hourly_timeslots(2)).to eq(nine)
            end
          end