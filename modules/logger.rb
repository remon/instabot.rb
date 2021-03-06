module Log

	def write_file(filename, text="")
		File.open("#{logs_dir}/#{filename}") {|file| file.puts "#{text},"}
	end

	def log(text="",from="")
		time = Time.new.strftime("%H:%M:%S %y-%m-%d")
		if !File.exists?(@logs_dir)
			Dir.mkdir(@logs_dir)
		elsif File.exists?("#{@logs_dir}/logs.log")
			File.delete("#{@logs_dir}/logs.log")
		else
			File.open("#{@logs_dir}/logs.log","a+") do |log_file|
				log_file.puts "[#{@log_counter}] [#{time}] [#{from}] -- : #{text}"
			end
		end
		@log_counter += 1
	end

	def save_action_data(id=0,type=:default)
		case type
		when :follow
			write_file("followed_users.txt",id)
		when :unfollow
			write_file("unfollowed_users.txt",id)
		when :like
			write_file("liked_medias.txt",id)
		when :comment
			write_file("commented_medias.txt",id)
		when :default
			puts "please choice a type"
		end
	end

end	


