shared_context 'rack test App', rack_test: true do
  def app
    KivaSnapshotApp
  end
end
