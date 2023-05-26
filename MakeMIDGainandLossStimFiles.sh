#!/bin/csh
#
mkdir ./MIDGainandLoss1DFiles

set events_csv = `jq -r '.events_csv' config.json`

set ntrials = `more ${events_csv}|grep -v "TrialNumber"|wc|awk '{print $1}'`

foreach trial (`seq 1 ${ntrials}`)
set trialline = `expr ${trial} + 1`
set trialtype = `more ${events_csv}|head -n${trialline}|tail -n1|awk -F "," '{print $2}'`
set anticipationstart = `more ${events_csv}|head -n${trialline}|tail -n1|awk -F "," '{print $12}'`
set anticipationduration = `more ${events_csv}|head -n${trialline}|tail -n1|awk -F "," '{print $13}'`
set targetrt = `more ${events_csv}|head -n${trialline}|tail -n1|awk -F "," '{print $31}'`
set pretargetrt = `more ${events_csv}|head -n${trialline}|tail -n1|awk -F "," '{print $33}'`
set posttargetrt = `more ${events_csv}|head -n${trialline}|tail -n1|awk -F "," '{print $35}'`
set outcomestart = `more ${events_csv}|head -n${trialline}|tail -n1|awk -F "," '{print $22}'`
set outcomeduration = `more ${events_csv}|head -n${trialline}|tail -n1|awk -F "," '{print $23}'`
set targethit = `more ${events_csv}|head -n${trialline}|tail -n1|awk -F "," '{print $42}'`
echo "${anticipationstart}:${anticipationduration}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_${trialtype}AnticipationStart_Times.1D
if (${targetrt} != "NA") then
echo "${targetrt}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_ButtonPress_Times.1D
endif
if (${pretargetrt} != "NA") then
echo "${pretargetrt}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_ButtonPress_Times.1D
endif
if (${posttargetrt} != "NA") then
echo "${posttargetrt}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_ButtonPress_Times.1D
endif
if (${trialtype} == "PlusOne" && ${targethit} == "1") then
echo "${outcomestart}:${outcomeduration}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusOneOutcome_Times.1D
endif
if (${trialtype} == "PlusOne" && ${targethit} == "0") then
echo "${outcomestart}:${outcomeduration}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusZeroOutcome_Times.1D
endif
if (${trialtype} == "PlusFive" && ${targethit} == "1") then
echo "${outcomestart}:${outcomeduration}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusFiveOutcome_Times.1D
endif
if (${trialtype} == "PlusFive" && ${targethit} == "0") then
echo "${outcomestart}:${outcomeduration}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusZeroOutcome_Times.1D
endif
if (${trialtype} == "PlusZero") then
echo "${outcomestart}:${outcomeduration}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusZeroOutcome_Times.1D
endif
if (${trialtype} == "NoResponse") then
echo "${outcomestart}:${outcomeduration}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_NullZeroOutcome_Times.1D
endif
if (${trialtype} == "MinusOne" && ${targethit} == "1") then
echo "${outcomestart}:${outcomeduration}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusZeroOutcome_Times.1D
endif
if (${trialtype} == "MinusOne" && ${targethit} == "0") then
echo "${outcomestart}:${outcomeduration}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusOneOutcome_Times.1D
endif
if (${trialtype} == "MinusFive" && ${targethit} == "1") then
echo "${outcomestart}:${outcomeduration}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusZeroOutcome_Times.1D
endif
if (${trialtype} == "MinusFive" && ${targethit} == "0") then
echo "${outcomestart}:${outcomeduration}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusFiveOutcome_Times.1D
endif
if (${trialtype} == "MinusZero") then
echo "${outcomestart}:${outcomeduration}" >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusZeroOutcome_Times.1D
endif
end
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusOneAnticipationStart_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_PlusOneAnticipationStart_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusFiveAnticipationStart_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_PlusFiveAnticipationStart_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusZeroAnticipationStart_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_PlusZeroAnticipationStart_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_NoResponseAnticipationStart_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_NoResponseAnticipationStart_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusOneAnticipationStart_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_MinusOneAnticipationStart_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusFiveAnticipationStart_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_MinusFiveAnticipationStart_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusZeroAnticipationStart_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_MinusZeroAnticipationStart_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_ButtonPress_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_ButtonPress_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusOneOutcome_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_PlusOneOutcome_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusFiveOutcome_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_PlusFiveOutcome_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusZeroOutcome_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_PlusZeroOutcome_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_NullZeroOutcome_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_NullZeroOutcome_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusOneOutcome_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_MinusOneOutcome_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusFiveOutcome_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_MinusFiveOutcome_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusZeroOutcome_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_MinusZeroOutcome_Times.1D
cat ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusOneAnticipationStart_Times.1D ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusFiveAnticipationStart_Times.1D|sort -n >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_RewardAnticipationStart_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_RewardAnticipationStart_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_RewardAnticipationStart_Times.1D
cat ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusOneAnticipationStart_Times.1D ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusFiveAnticipationStart_Times.1D|sort -n >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_LossAnticipationStart_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_LossAnticipationStart_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_LossAnticipationStart_Times.1D
cat ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusOneOutcome_Times.1D ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusFiveOutcome_Times.1D|sort -n >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_RewardOutcome_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_RewardOutcome_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_RewardOutcome_Times.1D
cat ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusOneOutcome_Times.1D ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusFiveOutcome_Times.1D|sort -n >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PunishmentOutcome_Times.1D
cat ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_PlusZeroOutcome_Times.1D ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_NullZeroOutcome_Times.1D ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_MinusZeroOutcome_Times.1D|sort -n >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_AllZeroOutcome_Times.1D
echo `more ./MIDGainandLoss1DFiles/MIDGainandLoss_Col_AllZeroOutcome_Times.1D` >> ./MIDGainandLoss1DFiles/MIDGainandLoss_Row_AllZeroOutcome_Times.1D
