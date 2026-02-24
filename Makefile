.PHONY: gen slang

# Generate code
gen:
	fvm dart run build_runner build --delete-conflicting-outputs

# Generate translations
slang:
	fvm dart run slang
	fvm dart run slang configure
	fvm dart run slang normalize
