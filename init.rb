require 'redmine'

require_dependency 'redmine_profile_email_domain_whitelist/hooks/view_layouts_base_html_head_hook'

Redmine::Plugin.register :redmine_profile_email_domain_whitelist do
  name 'Redmine profile email domain whitelist'
  author 'undev.ru, nettsundere'
  description 'This plugin enables configuring the email domain whitelist for Redmine.'
  version '1.9.1'

  default_settings = {
    'allowed_email_domains' => [],
    'whitelist_enabled' => false,
    'mail_banner_message' => '',
    'mail_domain_not_whitelisted_message' => "denied. Your email domain isn't allowed by Redmine administrator."
  }

  settings(:default => default_settings,
           :partial => 'settings/redmine_profile_email_domain_whitelist')
end

ActionDispatch::Callbacks.to_prepare  do
  require 'redmine_profile_email_domain_whitelist'
end
