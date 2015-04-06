user1 = User.create(email: "test@test.com", password: "password")
user2 = User.create(email: "test2@test.com", password: "password")
user3 = User.create(email: "test3@test.com", password: "password")

Story.create(title: "Test Title", body: "This is my story blahblablahblablahblablahblablahblablahblablahblablahblablahblablahbla", user: user1)
Story.create(title: "Another Title", body: "This is my story blahblablahblablahblablahblablahblablahblablahblablahblablahblablahbla", user: user2)
Story.create(title: "HEY Title", body: "This is my story blahblablahblablahblablahblablahblablahblablahblablahblablahblablahbla", user: user2)
Story.create(title: "BLah Title", body: "This is my story blahblablahblablahblablahblablahblablahblablahblablahblablahblablahbla", user: user2)
Story.create(title: "This Title Spinach", body: "This is my story blahblablahblablahblablahblablahblablahblablahblablahblablahblablahbla", user: user3)
