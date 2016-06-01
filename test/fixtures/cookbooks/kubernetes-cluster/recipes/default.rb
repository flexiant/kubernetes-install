hostsfile_entry '192.168.40.10' do
  hostname  'cluster-master'
  unique    true
end

hostsfile_entry '192.168.40.11' do
  hostname  'cluster-minion'
  unique    true
end
