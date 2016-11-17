.PHONY: build
build: update
	TOOLCHAINS=swift swift build -c release -Xswiftc -Ounchecked

.PHONY: update
update: Package.swift
	swift package update

.PHONY: run
run: build
	 .build/release/Graphite
