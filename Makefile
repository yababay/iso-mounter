-include .env

git:
	@git add .
	@git commit -am ok
	@echo $(GH_TOKEN)
