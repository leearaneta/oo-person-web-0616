require "pry"

class Person

	attr_accessor :bank_account
	attr_reader :name, :hygiene, :happiness

	@@people = []

	def initialize(name)
		@name = name
		@bank_account = 25
		@happiness = 8
		@hygiene = 8
		@@people << self
	end

	def hygiene=(hygiene)
		@hygiene = hygiene
		@hygiene > 10 ? @hygiene = 10 : nil
		@hygiene < 0 ? @hygiene = 0 : nil
	end

	def happiness=(happiness)
		@happiness = happiness
		@happiness > 10 ? @happiness = 10 : nil
		@happiness < 0 ? @happiness = 0 : nil
	end

	def Person.people
		@@people
	end

	def clean?
		@hygiene > 7 ? true : false
	end

	def happy?
		@happiness > 7 ? true : false
	end

	def take_bath
		self.hygiene= @hygiene + 4
		"♪ Rub-a-dub just relaxing in the tub ♫"
	end

	def get_paid(salary)
		@bank_account += salary
		"all about the benjamins"
	end

	def work_out
		self.happiness= @happiness + 2
		self.hygiene= @hygiene - 3
		"♪ another one bites the dust ♫"
	end

	def call_friend(friend)
		self.happiness= @happiness + 3
		x = Person.people.find { |person| person == friend }
		x.happiness += 3
		"Hi #{x.name}! It's #{self.name}. How are you?"
	end

	def start_conversation(friend, topic)
		x = Person.people.find { |person| person == friend }
		case topic
		when "politics"
			self.happiness= @happiness - 2
			x.happiness = x.happiness - 2
			"blah blah partisan blah lobbyist"
		when "weather"
			self.happiness= @happiness + 1
			x.happiness += 1
			"blah blah sun blah rain"
		else
			"blah blah blah blah blah"
		end
	end
end

