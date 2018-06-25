# Haskell-Student-Loan-Calculator
A UK student loan interest / payoff time calculator in haskell

The inputs, outputs and hardcoded information is specified below

hardcoded:

    the amount of your income you spend repaying the debt (I used figures from student loan website)
    interest rate based on income (also used figures from student loan website)

inputs: 

    1. incomeFunc   : function that gives income based on number of years after finishing uni (Int -> Float)
                      if you don't want to bother making a function for this just use "const 45000" or something 
    
    2. borrowAmount : amount borrowed each year at uni (Float) e.g. 9250 + maintinance loan
    
    3. yearsAtUni   : number of years at uni (Int) e.g. 3
    
    4. rpi          : current Retail Price Index (Float)
                      enter as a decimal e.g. if it is 3.1% enter 0.031
                      
    5. calcTime     : how many years after graduation to calculate for (Int)
                      the debt is cancelled 30 years after graduation so 30 is a good number
    
    
outputs:

    1. amount repayed in total (Float)
    
    2. amount left to pay after calcTime years (Float)
    
    
