build:
	ruby uml.rb > cards.uml
	plantuml -tpng cards.uml
	plantuml -tsvg cards.uml

