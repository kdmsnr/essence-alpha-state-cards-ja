build:
	ruby uml.rb > cards.uml
	plantuml cards.uml
	open cards.png

