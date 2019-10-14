class Startup
    attr_reader :name, :founder, :domain
    @@all=[]
    def initialize(name,founder,domain)
        @name=name
        @founder=founder
        @domain=domain
        @@all << self
    end
    def pivot(domain,name)
        @domain=domain
        @name=name
    end
    
    def sign_contract(vc,type,amount)
        FundingRound.new(self,vc,type,amount)
    end
    def rounds
        FundingRound.all.select do |fr|
            fr.startup == self
        end
    end
    def num_funding_rounds
        rounds.count
    end
    def total_funds
        total=0
        rounds.each do |round|
            total +=round.investment
        end
        total
    end 
    def investors
        inv=rounds.map do |round|
            round.venture_capitalist
        end
        inv.uniq
    end
    def big_investors
        investors.select do |vc|
            VentureCapitalist.tres_commas_club.include?(vc)
        end
    end
    def self.find_by_founder(founder)
        all.select do |startup|
            startup.founder == founder
        end
    end
    def self.domains
        all.map do |startup|
            startup.domain
        end
    end
    def self.all
        @@all
    end
end
