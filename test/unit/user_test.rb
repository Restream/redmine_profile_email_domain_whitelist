require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  def setup
    settings_stub = {
      'allowed_email_domains' => ['gooddomain.com'],
      'mail_domain_not_whitelisted_message' => "denied. Your E-Mail domain isn't allowed by redmine admin"
    }

    Setting.stubs(:plugin_redmine_profile_email_domain_whitelist) \
      .returns(settings_stub)
  end

  def test_only_whitelisted_email_can_be_used_by_user
    some_user = User.generate_with_protected(:admin => false)

    some_user.mail = "bad@gooddomain.com.ru"
    assert !some_user.valid?

    some_user.mail = "good@gooddomain.com"
    assert some_user.valid?
  end

  def test_admin_can_use_any_email
    admin = User.generate_with_protected(:admin => true)
    admin.mail = "admin@asdasdasdas.com"
    assert admin.valid?
  end
end

