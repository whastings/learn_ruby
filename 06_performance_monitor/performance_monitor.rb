def measure(runs = 1)
  lengths = []
  runs.times do
    start_time = Time.now
    yield
    lengths << (Time.now - start_time)
  end
  lengths.inject(0) { |sum, length| sum + length }.to_f / lengths.count
end
