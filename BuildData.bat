@echo off

if not exist .\release (
	mkdir release
)

compressonatorcli -fd BC1 .\data\OK!.png .\release\OK!