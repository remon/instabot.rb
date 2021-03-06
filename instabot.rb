require_relative './modules/modules.rb'
class Instabot

	include Config
	include Banner
	include Login
	include Actions
	include Protocol
	include Log
	include Grabber


	def options
		return {
			:username				=>		Config.options.username,
			:password				=>		Config.options.password,
			:max_likes_per_day		=>		Config.options.max_likes_per_day,
			:max_follow_per_day		=>		Config.options.max_follow_per_day,
			:max_comments_per_day	=>		Config.options.max_comments_per_day,
			:unwanted_list			=>		Config.options.unwanted_list,
			:white_list_users		=>		Config.options.white_list_users	
		}
	end

	def initialize

		@log_counter	= 1
		@login_status	= false
		@modules_dir	= "#{Dir.pwd}/modules"
		@root_dir		= "#{Dir.pwd}"
		@logs_dir		= "#@root_dir/logs"
		print_banner()
		create_mechanic
		login

	end


end
