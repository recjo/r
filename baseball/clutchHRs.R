#CD C:\Users\Acer15\Documents\R\1999eve
#BEVENT -y 1999 -f 0-96 *.EVA *.EVN > all1999.csv

setwd("~/R")

dataSEASON <- read.csv("data/all2000.csv", header=FALSE)
fields <- read.csv("data/fieldsBeventPBP.csv")
retroIds <- read.csv("data/retrosheetIDs.csv")

names(dataSEASON) <- fields[,"Header"]

totchr <- function(d) {
  c.CHR <- sum(d$CHR, na.rm=TRUE)
  c.HR <- nrow(d)
  c.IHR <- c.HR - c.CHR
  c.CHRP <- round(c.CHR / c.HR * 100, digits=1)
  data.frame(CHR=c.CHR, HR=c.HR, IHR=c.IHR, CHRP=c.CHRP)
}

getChr <- function(fname, lname) {
  playerId <- as.character(subset(retroIds, FIRST==fname & LAST==lname)$ID)
  #vaugnId <- as.character(subset(retroIds, FIRST=="Mo" & LAST=="Vaughn")$ID)
  playerData <- subset(dataSEASON, BAT_ID==playerId & EVENT_CD == 23)
  playerData$CHR <- with(playerData, ifelse((BAT_HOME_ID == 0 & HOME_SCORE_CT >= AWAY_SCORE_CT) | (BAT_HOME_ID == 1 & AWAY_SCORE_CT >= HOME_SCORE_CT), 1, 0))
  #vaughnData[,c("AWAY_TEAM_ID","BAT_HOME_ID","AWAY_SCORE_CT", "HOME_SCORE_CT", "CHR")]
  totchr(playerData)
}

getChr("Mo", "Vaughn")
getChr("Mark", "McGwire")
getChr("Sammy", "Sosa")