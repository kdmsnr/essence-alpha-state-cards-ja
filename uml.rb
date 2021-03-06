require "csv"

essence = {
  'opportunity.csv' => 'class 機会',
  'stakeholders.csv' => 'class ステークホルダー',
  'requirements.csv' => 'class 要求',
  'software-system.csv' => 'class ソフトウェアシステム',
  'work.csv' => 'class 作業',
  'team.csv' => 'class チーム',
  'way-of-working.csv' => 'class 作業方法'
}

icons = {
  'opportunity.csv' => '<< (C,lightgreen) >>',
  'stakeholders.csv' => '<< (C,lightgreen) >>',
  'requirements.csv' => '<< (S,yellow) >>',
  'software-system.csv' => '<< (S,yellow) >>',
  'team.csv' => '<< (E,lightblue) >>',
  'work.csv' => '<< (E,lightblue) >>',
  'way-of-working.csv' => '<< (E,lightblue) >>'
}

puts "@startuml"

essence.keys.each do |csv|
  header = essence[csv]
  icon = icons[csv]
  open(csv) do |f|
    state_num = 0
    while line = f.gets
      k, v = CSV.parse(line)[0]
      next if k.nil? or v.nil?
      if k.include? "□"
        puts "  -#{v}"
      else
        state_num += 1
        puts "}" if f.lineno != 1
        puts "#{header}(#{state_num}) #{icon} {"
        puts "#{v}"
        puts "--"
      end
    end
    puts "}"
  end
end

puts "hide empty members"
puts "@enduml"
