class Plan <ActiveRecord::Base
    has_many :users # Plans will be tied to many users ( eg many basi plans to difrent users)
end