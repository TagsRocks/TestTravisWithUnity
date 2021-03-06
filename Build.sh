
#! /bin/sh

# Change this the name of your project. This will be the name of the final executables as well.
# This will open Unity3D and attempt to generate a build

project="QABuild"

echo "Attempting to build $project for Windows"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd) \
  -buildWindowsPlayer "$(pwd)/Build/windows/$project.exe" \
  -silent-crashes \
  -quit


# Exit with the current exit code
if [ $? -eq 0 ]
then
	cat $(pwd)/unity.log
	exit 0
else
	cat $(pwd)/unity.log
	echo "Failed to build Application."
	exit 1
fi
