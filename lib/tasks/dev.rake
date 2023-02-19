task sample_data: :environment do
  starting = Time.now

  usernames = Array.new

  usernames << "roei"
  usernames << "omer"

  usernames.each do |username|
    User.create(
      email: "#{username}@example.com",
      password: "password",
    )
  end
end
