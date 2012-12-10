require 'redmine'
require 'dispatcher'

require_dependency 'redmine_profile_email_domain_whitelist/hooks/view_layouts_base_html_head_hook'

Redmine::Plugin.register :redmine_profile_email_domain_whitelist do
  name 'Redmine profile email domain whitelist'
  author 'undev.ru, nettsundere'
  description 'Profile email domain whitelist for redmine.'
  version '1.8'

  default_settings = {
    'allowed_email_domains' => [],
    'whitelist_enabled' => true,
    'mail_banner_message' => '',
    'mail_domain_not_whitelisted_message' => "denied. Your E-Mail domain isn't allowed by redmine admin"
  }

  settings(:default => default_settings,
           :partial => 'settings/redmine_profile_email_domain_whitelist')
end

Dispatcher.to_prepare do
  User.send(:include, RedmineProfileEmailDomainWhitelist::Patches::UserPatch)

  AccountController.send(:include, RedmineProfileEmailDomainWhitelist::Patches::AccountControllerPatch)
end
