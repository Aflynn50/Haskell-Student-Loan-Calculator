interestPerYearWork :: Float -> (Float, Float) -> (Float, Float)

interestPerYearWork income (repayments, balance)
 | balance <= 0    = (repayments, 0)
 | income <= 25000 = (repayments, (balance * 1.033))
 | income <= 45000 = (repayments + repay, newBal)
 | otherwise       = (repayments + repay, (balance - repay) * 1.063)
   where repay  = if ((income - 25000) * 0.09) > balance then balance else ((income - 25000) * 0.09)
         newBal = ((balance - repay) * (1.033 + (((income - 25000) / 20000) * 0.03)))

interestPerYearStudy :: Float -> Float -> Float
interestPerYearStudy amount balance = ((balance * 1.063) + amount)


calcLoan :: Float -> Int -> Float -> (Float, Float)
calcLoan charge years avgIncome = iterate (interestPerYearWork avgIncome) (0, x) !! 30
                                   where x = iterate (interestPerYearStudy charge) 0 !! years
