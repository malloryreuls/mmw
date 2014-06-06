 require 'spec_helper'

 describe Search, :type => :model do
 	before {@search = Search.create!(query: "DMX", created_at: "Wed, 01 Jan 2014 00:00:00 PST -08:00", updated_at: "Sat, 01 Feb 2014 00:00:00 PST -08:00")}
 	subject {@search}

 	it { should validate_presence_of(:query).with_message("Must enter a search query")}

  it "is validate with a query created at and updated at param" do
    expect(@search).to be_valid
  end

 	it "should return the wikipedia description for DMX" do
    expect(@search.query).to eq"DMX"
  end
  it "should return the time and date query was made" do
    expect(@search.created_at).to eq"Wed, 01 Jan 2014 00:00:00 PST -08:00"
  end
  it "should return the updated time and date query was made" do
    expect(@search.updated_at).to eq"Sat, 01 Feb 2014 00:00:00 PST -08:00"
  end

  describe "#self.results" do
    it "should return the wiki name from DMX" do
    expect(Search.results("DMX").name).to eq"DMX"
    end
    it "should return the wiki description from DMX" do
    expect(Search.results("DMX").description).to eq'Earl Simmons, better known by his stage names DMX and Dark Man X, is an American rapper and actor. In 1999, DMX released his best-selling album ...And Then There Was X, which featured the hit single "Party Up". He has acted in films such as Belly, Romeo Must Die, Exit Wounds, Cradle 2 The Grave, and Last Hour. In 2006, he starred in the reality television series DMX: Soul of a Man, which was primarily aired on the BET cable television network. In 2003, DMX published a book of his memoirs entitled, E.A.R.L.: The Autobiography of DMX. DMX has sold over 30 million records worldwide, making him one of the best-selling hip-hop artists of all time.'
    end
    it "should return the Freebase search DMX id" do
    expect(Search.results("DMX").id).to eq"/m/01vvzb1"
    end
  end

  describe "#self.youtube" do
    it "should pull the top youtube result for DMX" do
      expect(Search.youtube("DMX")).to eq(["DcCyv0grYAc", "thIVtEOtlWM", "ThlhSnRk21E", "9Ww-TQUeA3E", "NG_d9eesuX8", "VdrJF9et0cA", "PIZLDNQidwQ", "4klj5UWDU_0"])
    end
    it "should pull first video result for a query of China" do
      expect(Search.youtube("China").first).to eq"s2t32ZxxqWA"
    end
    it "should pull last video result for a query of China" do
      expect(Search.youtube("China").last).to eq"4YAYAUtdod8"
    end
  end

  describe "#self.google_image" do
    it "should pull the first eight images from google images" do
      expect(Search.google_image("DMX").count.to_s).to eq"8"
    end
    it "should pull the first result for DMX from google images" do
      expect(Search.google_image("DMX").first["width"]).to eq"1024"
    end
    it "should pull the first image id for DMX from google images" do
      expect(Search.google_image("DMX").first["imageId"]).to eq"ANd9GcSALbhWJ_h2ouT0TSU0zK8446z-TVUEvgIcNqKl769Mwjp7kCXHGwL6_Y1i"
    end
    it "should pull the first image caption for DMX from google images" do
      expect(Search.google_image("DMX").first["title"]).to eq"The Rapper Tracker | The Most Pointless Blog Ever"
    end
    it "should pull the first image caption for DMX from google images" do
      expect(Search.google_image("DMX").first["GsearchResultClass"]).to eq"GimageSearch"
    end
  end
 end



