require "csv"

essence = {
  'stakeholders.csv' => 'class ステークホルダー',
  'opportunity.csv' => 'class 機会',
  'requirements.csv' => 'class 要求',
  'software-system.csv' => 'class ソフトウェアシステム',
  'team.csv' => 'enum チーム',
  'work.csv' => 'enum 作業',
  'way-of-working.csv' => 'enum 作業方法'
}

icons = {
  'stakeholders.csv' => '',
  'opportunity.csv' => '',
  'requirements.csv' => '<< (S,orchid) >>',
  'software-system.csv' => '<< (S,orchid) >>',
  'team.csv' => '',
  'work.csv' => '',
  'way-of-working.csv' => ''
}

puts "@startuml"
# puts "scale 500 width"

essence.keys.each do |csv|
  header = essence[csv]
  icon = icons[csv]
  open(csv) do |f|
    while line = f.gets
      k, v = CSV.parse(line)[0]
      if k.include? "□"
        puts "  -#{v}"
      else
        puts "}" if f.lineno != 1
        puts "#{header}.#{v} #{icon} {"
      end
    end
    puts "}"
  end
end

puts "hide empty members"
puts "@enduml"
