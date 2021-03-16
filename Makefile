libIgnoreFile = android/libs/.gitignore

pigeon:
	flutter pub run pigeon --input pigeons/*.dart
publish-t:
	echo "*" > ${libIgnoreFile}
	echo "!*.aar" >> ${libIgnoreFile}
	flutter pub publish --dry-run
	echo '*' > ${libIgnoreFile}
publish:
	echo "*" > ${libIgnoreFile}
	echo '!*.aar' >> ${libIgnoreFile}
	flutter pub publish
	echo '*' > ${libIgnoreFile}
