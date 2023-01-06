server:
	@docker compose run \
		--name rebase-labs \
		--rm \
		--network rebase-labs \
		--service-ports \
		app \
		bash -c "ruby server.rb"
		
bundle:
	@docker compose run app bundle 
# para rodar o bundle install e atualizar gems