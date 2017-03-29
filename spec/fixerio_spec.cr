require "./spec_helper"

describe Fixerio do
  describe "latest" do
    it "should use the correct base currency" do
      WebMock.wrap do
        stub = WebMock.stub(:get, "https://api.fixer.io/latest?base=#{Fixerio::Currency::USD}")
          .to_return(body: %({"base": "", "date":"", "rates": {}}))

        Fixerio.latest(Fixerio::Currency::USD)

        stub.calls.should eq(1)
      end
    end

    it "should correctly list currencies to include" do
      list = [Fixerio::Currency::GBP, Fixerio::Currency::AUD, Fixerio::Currency::CAD]

      WebMock.wrap do
        stub = WebMock.stub(:get, "https://api.fixer.io/latest?base=#{Fixerio::Currency::USD}&symbols=#{list.join(",")}")
          .to_return(body: %({"base": "", "date":"", "rates": {}}))

        Fixerio.latest(Fixerio::Currency::USD, list)

        stub.calls.should eq(1)
      end
    end

    it "should raise exception when non-200 status returned" do
      status = 500

      expect_raises(Exception, "Received #{status} status.") do
        WebMock.wrap do
          stub = WebMock.stub(:get, "https://api.fixer.io/latest?base=#{Fixerio::Currency::USD}")
            .to_return(status: status)

          Fixerio.latest(Fixerio::Currency::USD)

          stub.calls.should eq(1)
        end
      end
    end
  end

  describe "historical" do
    it "should use the correct date format and base currency" do
      date = Time.new(2016, 2, 15)

      WebMock.wrap do
        stub = WebMock.stub(:get, "https://api.fixer.io/#{date.to_s("%Y-%m-%d")}?base=#{Fixerio::Currency::USD}")
          .to_return(body: %({"base": "", "date":"", "rates": {}}))

        Fixerio.historical(date, Fixerio::Currency::USD)

        stub.calls.should eq(1)
      end
    end

    it "should correctly list currencies to include" do
      date = Time.new(2016, 2, 15)
      list = [Fixerio::Currency::GBP, Fixerio::Currency::AUD, Fixerio::Currency::CAD]

      WebMock.wrap do
        stub = WebMock.stub(:get, "https://api.fixer.io/#{date.to_s("%Y-%m-%d")}?base=#{Fixerio::Currency::USD}&symbols=#{list.join(",")}")
          .to_return(body: %({"base": "", "date":"", "rates": {}}))

        Fixerio.historical(date, Fixerio::Currency::USD, list)

        stub.calls.should eq(1)
      end
    end

    it "should raise exception when non-200 status returned" do
      status = 500
      date = Time.new(2016, 2, 15)

      expect_raises(Exception, "Received #{status} status.") do
        WebMock.wrap do
          stub = WebMock.stub(:get, "https://api.fixer.io/#{date.to_s("%Y-%m-%d")}?base=#{Fixerio::Currency::USD}")
            .to_return(status: status)

          Fixerio.historical(date, Fixerio::Currency::USD)

          stub.calls.should eq(1)
        end
      end
    end
  end
  
end
