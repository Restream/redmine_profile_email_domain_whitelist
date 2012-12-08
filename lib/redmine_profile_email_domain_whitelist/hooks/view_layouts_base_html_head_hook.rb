module RedmineProfileEmailDomainWhitelist
  module Hooks
    class ViewLayoutsBaseHtmlHeadHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        if context[:controller] && context[:controller].is_a?(SettingsController)
          if Redmine::VERSION.to_s.slice(0, 3) < "2.1"
            jquery_include = javascript_include_tag('jquery_loader.js', :plugin => 'redmine_profile_email_domain_whitelist') \
              + javascript_tag("jQuery.noConflict()")
          else
            jquery_include = ""
          end
          editable_js = javascript_include_tag('editable.js', :plugin => 'redmine_profile_email_domain_whitelist')
          css = stylesheet_link_tag('base.css', :plugin => 'redmine_profile_email_domain_whitelist')
          jquery_include + editable_js + css
        else
          return ''
        end
      end
    end
  end
end
