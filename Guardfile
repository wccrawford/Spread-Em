guard 'process', :name => 'jasmine', :env => {"NODE_PATH" => "public"}, :command => './node_modules/jasmine-node/bin/jasmine-node --coffee' do
	watch %r(public/.+.coffee)
	watch %r(spec/cs/.+spec.coffee)
end
