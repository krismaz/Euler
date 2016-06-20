import Data.Time
import Data.Time.Calendar.WeekDate

main::IO()
main = print $ length [ Nothing|
    y<-[1901..2000],
    m<-[1..12],
    let (_, _, z) = toWeekDate (fromGregorian  y m 1) in
    z == 7]