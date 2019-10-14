class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []
    def initialize(name,total_worth)
        @name=name
        @total_worth=total_worth
        @@all << self
    end
    def offer_contract(startup,type,amount)
        FundingRound.new(startup,self,type,amount)
    end
    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end
    def portfolio
        funding_rounds.map do |round|
            round.startup
        end
    end
    def biggest_investment
        funding_rounds.max{|r1,r2| r1.investment<=>r2.investment}
    end
    def invested(domain)
       total=0
       dom=funding_rounds.select do |round|
        round.startup.domain == domain
       end
       dom.each do |round|
        total+=round.investment
       end
       total
    end
    def self.tres_commas_club
        all.select do |vc|
            vc.total_worth > 1000000000
        end
    end

    def self.all
        @@all
    end
end
