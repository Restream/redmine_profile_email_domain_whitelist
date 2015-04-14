# Redmine Profile Email Domain Whitelist Plugin

[![Build Status](https://travis-ci.org/Undev/redmine_profile_email_domain_whitelist.png)](https://travis-ci.org/Undev/redmine_profile_email_domain_whitelist)
[![Code Climate](https://codeclimate.com/github/Undev/redmine_profile_email_domain_whitelist.png)](https://codeclimate.com/github/Undev/redmine_profile_email_domain_whitelist)

This plugin enables you to configure a list of email domains that can be specified in Redmine user profiles.

The initial author is [Vladimir Kiselev](https://github.com/nettsundere/redmine_profile_email_domain_whitelist).

## Installation

*These installation instructions are based on Redmine 2.6.0. For instructions for previous versions, see [Redmine wiki](http://www.redmine.org/projects/redmine/wiki/Plugins).*

1. To install the plugin
    * Download the .ZIP archive, extract files and copy the plugin directory into *#{REDMINE_ROOT}/plugins*.
    
    Or

    * Change you current directory to your Redmine root directory:  

            cd {REDMINE_ROOT}
 
      Copy the plugin from GitHub using the following command:

            git clone https://github.com/Undev/redmine_profile_email_domain_whitelist.git plugins/redmine_profile_email_domain_whitelist

2. Install the required gems:  

         bundle install

3. Restart Redmine.

## Usage

The plugin enables you to specify the list of email domains allowed in Redmine. To do this, go to **Administration > Plugins** and click **Configure**.  
![whitelist settings](whitelistg_1.PNG)

Note that the configured settings will be applied only if you select the **Enabled** check box.

To add a domain to Redmine whitelist, click **Add domain** and type the domain in the corresponding field. You can add as many domains as you need. To remove a domain from the list, click **Remove domain**.

In the **Message if domain is not in whitelist** field, you can specify a custom text to be displayed if a user tries to create a new account and enters an email that is not allowed.

# License

Copyright (C) 2012 Undev.ru

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
