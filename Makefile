binary: # Works on Windows (not checked on other os)
	@echo "Updating binaries"
	@echo "Deleting existing"
	@if exist binaries (del /f /q /s  binaries\*.* > NUL) else (mkdir binaries)
	@echo "Creating build"
	@flutter build apk --split-per-abi
	@echo "Copying new binaries to binaries folder"
	@copy build\app\outputs\apk\release\app-arm*-release.apk binaries

runner: # To specify run mode add argument M=watch or M=build
	@echo "Running build_runner $(M)"
	@flutter pub run build_runner $(M) --delete-conflicting-outputs