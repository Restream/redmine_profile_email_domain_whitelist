require_dependency 'redmine_profile_email_domain_whitelist/hooks/view_layouts_base_html_head_hook'
require_dependency 'redmine_profile_email_domain_whitelist/patches/user_patch'
require_dependency 'redmine_profile_email_domain_whitelist/patches/account_controller_patch'

ActionDispatch::Callbacks.to_prepare do

  unless User.included_modules.include?(RedmineProfileEmailDomainWhitelist::Patches::UserPatch)
    User.send(:include, RedmineProfileEmailDomainWhitelist::Patches::UserPatch)
  end

  unless AccountController.included_modules.include?(RedmineProfileEmailDomainWhitelist::Patches::AccountControllerPatch)
    AccountController.send(:include, RedmineProfileEmailDomainWhitelist::Patches::AccountControllerPatch)
  end

end