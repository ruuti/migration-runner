build:
	docker image build . -t migration-runner

only-structure:
	docker run -it --rm migration-runner \
		mysqldump \
		--host=host.docker.internal \
		--user=user \
		--password=password \
		--no-data \
		--add-drop-table \
		--port=3306 services > backup_structure.sql

data-and-structure:
	docker run -it --rm migration-runner \
		mysqldump \
		--host=host.docker.internal \
		--user=user \
		--password=password \
		--port=3306 services > backup.sql