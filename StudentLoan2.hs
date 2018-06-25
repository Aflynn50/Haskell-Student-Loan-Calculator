-- Read spec for details on inputs
calcLoan :: (Int -> Float) -> Float -> Int -> Float -> Int -> (Float, Float, Int)
calcLoan incomeFunc borrowAmount yearsAtUni rpi calcTime = iterate (interestPerYearWork incomeFunc) (0, endOfUniBalance, 0) !! calcTime
    where endOfUniBalance = iterate (interestPerYearStudy borrowAmount rpi) 0 !! yearsAtUni
          interestPerYearWork :: (Int -> Float) -> (Float, Float, Int) -> (Float, Float, Int)
          interestPerYearWork incomeFunc (amountRepaid, balance, year)
             | balance <= 0    = (amountRepaid, 0, year)
             | income <= 25000 = (amountRepaid, (balance * (1 + rpi)), newYear)
             | income <= 45000 = (amountRepaid + repay, newBal, newYear)
             | otherwise       = (amountRepaid + repay, (balance - repay) * (1.03 + rpi), newYear)
                 where repay  = if ((income - 25000) * 0.09) > balance then balance else ((income - 25000) * 0.09)
                       newBal = ((balance - repay) * (1 + rpi + (((income - 25000) / 20000) * 0.03)))
                       income = incomeFunc year
                       newYear = year + 1

          interestPerYearStudy :: Float -> Float -> Float -> Float
          interestPerYearStudy borrowAmount rpi balance = ((balance * (rpi + 1.03)) + borrowAmount)





