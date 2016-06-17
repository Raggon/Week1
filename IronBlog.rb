require "date"
require 'colorize'
require "pry"

class Blog
attr_reader(:kappa)
	def initialize (startingpage = 0, pagecounter = 3)
		@posts = []
		@pagecounter = pagecounter
		@startingpage = startingpage
	end
	def add_posts(post)
		@posts.push(post)
	end
	def blog_printer
		#for the page num
		current_page = 1
		numpages = (@posts.length.to_f / 3).ceil
		@length = []
		num = 1

		while num <= numpages
			@length.push(num)
			num += 1
		end
		#end
		@posts = @posts.sort {|x,y| x.date <=> y.date} # sorting the posts


		index = 0
		while index != numpages+1
			length_string = @length.to_s
			page_string = current_page.to_s
			
			@posts.drop(@startingpage).take(@pagecounter).each do |x|
				x.print
			end
			
			length_string = length_string.sub!(page_string, page_string.red)
			print length_string

			choice = gets.chomp
			
			if choice == "next"
				@startingpage += 3
				index += 1
				current_page += 1
			elsif choice == "back"
				@startingpage -=3
				index -=1
				current_page -=1
			else 
				exit
			end
		end
	end
end


class Post
attr_reader(:title, :date, :text)
	def initialize(title, date, text)
		@title = title
		@date = date
		@text = text
	end

	def print
		puts @title
		puts "******************"
		puts @text
		puts "------------------"	
	end
end

class SponseredPost < Post
	def print
		puts "********* #{@title} ********"
		puts "****************************"
		puts @text
		puts "----------------------------"
	end
end


post1 = Post.new("Title of the post 1", Date.new(2012,1,25), "Text of the post 1")
post2 = Post.new("Title of the post 2", Date.new(2011,2,13), "Text of the post 2")
post3 = Post.new("Title of the post 3", Date.new(2012,3,2), "Text of the post 3")
post4 = Post.new("Title of the post 4", Date.new(2015,4,17), "Text of the post 4")
post5 = Post.new("Title of the post 5", Date.new(2014,5,31), "Text of the post 5")
post6 = Post.new("Title of the post 6", Date.new(2013,6,23), "Text of the post 6")
post7 = Post.new("Title of the post 7", Date.new(2013,7,17), "Text of the post 7")
post8 = Post.new("Title of the post 8", Date.new(2011,7,5), "Text of the post 8")
post9 = Post.new("Title of the post 9", Date.new(2015,2,26), "Text of the post 9")

blog = Blog.new
blog.add_posts(post1)
blog.add_posts(post2)
blog.add_posts(post3)
blog.add_posts(post4)
blog.add_posts(post5)
blog.add_posts(post6)
blog.add_posts(post7)
blog.add_posts(post8)
blog.add_posts(post9)

blog.blog_printer