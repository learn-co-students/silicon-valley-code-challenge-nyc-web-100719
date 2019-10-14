class Startup
    
    attr_reader :founder
    attr_accessor :startup, :domain
    @@all = [ ]

    def initialize(startup, founder, domain)
        @startup = startup
        @founder = founder
        @domain = domain 
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(domain,startup_name)
    #given a string of a domain and a string 
    #of a name, change the domain and name of the startup
    self.domain = domain
    self.startup = startup_name
    binding.pry
    end

    
    def self.find_by_founder(founder)
        #given a string of a founder's name, returns 
        #the first startup whose founder's name matches
       FundingRound.all.find do |funding|
                funding.startup.founder == founder
            end
    end

    def self.domains
        # return an array of all of the different startup domains
        self.all.collect do |startup| 
                startup.domain
            end
    end

    def sign_contract(venture_capitalist, type, investment)
        #given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), 
        #creates a new funding round and associates it with that startup and venture capitalist.
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        #Returns the total number of funding rounds that the startup has gotten
            #go through each startup, make startup == self, and count each funding round that includes startup
        funding_rounds= FundingRound.all.select do |funding|
                funding.startup == self
            end
        funding_rounds.count
    end
    
    def total_funds
        #Returns the total sum of investments that the startup has gotten
            #go through each startup, make startup == self, and get each investment in array, add array
        funding_rounds= FundingRound.all.select do |funding|
            funding.startup == self
        end
        funding_investments= funding_rounds.collect do |funding|
                funding.investment
        end
        funding_investments.inject(0, :+)
    end

    def investors
        #Returns a unique array of all the venture capitalists that have invested in this company
            #find out who invested in THIS company
            funding_rounds= FundingRound.all.select do |funding|
                funding.startup == self
            end
            venture_capitalists_funding= funding_rounds.collect do |funding|
                    funding.venture_capitalist      
            end
            venture_capitalists_funding.uniq
    end

    def big_investors
        #Returns a unique array of all the venture capitalists that have invested in this company 
        #and are in the Trés Commas club
        self.investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end
    
    end
end
