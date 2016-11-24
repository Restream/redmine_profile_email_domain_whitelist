require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  def setup
    @settings_stub = {
      'whitelist_enabled'                   => true,
      'mail_banner_message'                 => '',
      'allowed_email_domains'               => ['gooDDomain.com', 'init.com'],
      'mail_domain_not_whitelisted_message' => "denied. Your email domain isn't allowed by Redmine administrator."
    }

    Setting.stubs(:plugin_redmine_profile_email_domain_whitelist) \
      .returns(@settings_stub)

    @some_user   = User.generate!(mail: 'me@init.com')
    @admin       = User.generate!(mail: 'me2@init.com')
    @admin.admin = true
    @admin.save
  end

  def test_only_whitelisted_email_can_be_used_by_user
    @some_user.mail = 'bad@gooddomain.ru'
    assert !@some_user.valid?

    @some_user.mail = 'good@GoOddomAiN.com'
    assert @some_user.valid?
  end

  def test_admin_can_use_any_email
    @admin.mail = 'admin@asdasdasdas.com'
    assert @admin.valid?
  end

  def test_whitelist_can_be_disabled
    @settings_stub['whitelist_enabled'] = false

    @some_user.mail = 'bad@gooddomain.ru'
    assert @some_user.valid?

    @some_user.mail = 'good@GoOddomAiN.com'
    assert @some_user.valid?
  end
end

