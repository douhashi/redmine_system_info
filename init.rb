Redmine::Plugin.register :redmine_system_info do
  name 'Redmine System Info plugin'
  author 'douhashi'
  description 'This is System Information plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/douhashi/redmine_system_info'
  author_url 'https://github.com/douhashi/redmine_system_info'

  menu :admin_menu, :system_info, { controller: 'system_info', action: 'index' }, caption: :label_system_info
end
