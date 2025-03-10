pre-commit:
	echo "make sure you have precommit installed"
	echo "pip install pre-commit"
	echo "yay pre-commit"
	pre-commit install
	pre-commit run --all-files

install-from-git:
	ansible-galaxy install --force -r requirements.yml
