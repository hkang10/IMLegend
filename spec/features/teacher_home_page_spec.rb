require "rails_helper"

feature "teacher's own home page" do
  describe "when teacher navigates to their home page" do

    xscenario "the teacher sees their team name" do
    end

    xscenario "the teacher sees their team captain" do
    end

    xscenario "the teacher sees their own name" do
    end

    xscenario "the teacher sees a list of students on team" do
    end

    xscenario "the teacher sees an add students button" do
    end

    xscenario "the teacher sees a 'make new captain' button next to each student's name" do
    end

    describe "when the teacher clicks 'make new captain' button" do

      it "removes the incumbent captain from captain section" do
      end

      it "moves selected student to captain section" do
      end
    end

    describe "when the teacher clicks 'remove captain' button" do
      it "removes the incumbent captain from captain section" do
      end

      it "leaves the captain section empty" do
      end
    end
  end
end
