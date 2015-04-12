shared_context 'rack test App', type: :feature do
  def app
    KivaSnapshotApp
  end
end
