@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Thu Jun 15 12:05:42 +0500 2023
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim Decoder_4x16_Sim_behav -key {Behavioral:sim_1:Functional:Decoder_4x16_Sim} -tclbatch Decoder_4x16_Sim.tcl -log simulate.log"
call xsim  Decoder_4x16_Sim_behav -key {Behavioral:sim_1:Functional:Decoder_4x16_Sim} -tclbatch Decoder_4x16_Sim.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
