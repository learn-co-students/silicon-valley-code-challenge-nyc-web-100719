class VentureCapitalist
attr_reader :name
@@all = [ ]
    def initialize (name)
    @name = name
    @@all << self
    end

    def total_worth
        #returns a number that is the total worth of this 
        #investor (e.g., think of it as how much money they have)
        name = FundingRound.all.select do |funding|
                funding.venture_capitalist == self
        end
        investments =name.map do |funding|
                funding.investment
            end
            investments.inject(0, :+)
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        #returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)
        self.all.select do |venture_capitalist|
            venture_capitalist.total_worth >= 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        #given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new 
        #funding round and associates it with that startup and venture capitalist
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        #returns an array of all funding rounds for that venture capitalist
        FundingRound.all.select do |funding|
            funding.venture_capitalist == self
        end
    end

    def portfolio
        #Returns a unique list of all startups this venture capitalist has funded
        self.funding_rounds.map do |funding|
            funding.startup
        end
    end
#!!!!!!!!
    def biggest_investment
        #returns the largest funding round given by this venture capitalist
        self.funding_rounds.max{|a,b| a.investment <=> b.investment}
    end

    def invested(domain)
        #given a domain string, returns the total amount invested in that domain
        domain_invested_in =self.funding_rounds.select do |funding|
                funding.startup.domain == domain
        end
        investments_in_domain =domain_invested_in.map do |funding|
                funding.investment
        end
        investments_in_domain.inject(0, :+)
    end
end
