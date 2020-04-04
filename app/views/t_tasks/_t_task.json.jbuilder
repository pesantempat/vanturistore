json.extract! t_task, :id, :nama_task, :description, :rupiah, :presentase, :waktu, :frekuensi, :tingkat_kesulitan, :user_id, :created_at, :updated_at
json.url t_task_url(t_task, format: :json)
