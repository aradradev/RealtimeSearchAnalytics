# db/seeds.rb

# Create Companies
company1 = Company.create(name: 'TechCorp', industry: 'Technology')
company2 = Company.create(name: 'EduCo', industry: 'Education')

# Create Users
user1 = User.create(name: 'John Doe', email: 'john.doe@techcorp.com', company: company1)
user2 = User.create(name: 'Alice Smith', email: 'alice.smith@techcorp.com', company: company1)
user3 = User.create(name: 'Bob Johnson', email: 'bob.johnson@educo.com', company: company2)

# Search events for the last month
SearchEvent.create(
  query: 'Ruby programming',
  user: user1,
  company: company1,
  created_at: 1.month.ago,
  searched_at: 1.month.ago
)

SearchEvent.create(
  query: 'React.js tutorial',
  user: user2,
  company: company1,
  created_at: 1.month.ago,
  searched_at: 1.month.ago
)

# Search events for the last week
SearchEvent.create(
  query: 'Machine learning basics',
  user: user3,
  company: company2,
  created_at: 1.week.ago,
  searched_at: 1.week.ago
)




puts 'Seed data created successfully!'
