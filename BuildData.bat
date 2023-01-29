@echo off

if not exist .\release (
	mkdir release
)

compressonatorcli -fd BC7 .\data\OK!.png .\release\OK!
xcopy .\data\*.vs .\release
xcopy .\data\*.fs .\release