# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Book.create(title: "1984", author: "George Orwell", year_published: 1961, description: "A startling and haunting novel, 1984 creates an imaginary world that is completely convincing from start to finish. No one can deny the novel’s hold on the imaginations of whole generations, or the power of its admonitions—a power that seems to grow, not lessen, with the passage of time.")
Book.create(title: "Dune", author: "Frank Herbert", year_published: 2005, description: "Set on the desert planet Arrakis, Dune is the story of the boy Paul Atreides, heir to a noble family tasked with ruling an inhospitable world where the only thing of value is the “spice” melange, a drug capable of extending life and enhancing consciousness. Coveted across the known universe, melange is a prize worth killing for....")
b = Book.create(title: "The Tiger's Daughter", author: "K. Arsenault Rivera", year_published: 2017, description: "The story takes place in a secondary world inspired by historical East and Central Asian cultures. The series is concerned with the adventures of, and the romantic relationship between, two young warrior noblewomen: Shizuka, the heir to the Hokkaran Empire, and Shefali, daughter of the ruler of the Qorin steppe nomads. The books take the form of a collection of letters between the two. The trilogy is part of a type of fantasy based on Middle Eastern, Central or East Asian history, sometimes called 'Silk Road fantasy'")

u = User.create(username: "Moe", email: "moe@email.com", password: "password")

r = Review.create(book_id: b.id, user_id: u.id, content: "Best book I have ever read, completely stunned.", rating: 10)

