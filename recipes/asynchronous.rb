#
# Author:: Dario Blanco (<dario@darioblanco.com>)
# Cookbook Name:: uwsgi_server
# Recipes:: asynchronous
#
# Copyright 2013, Dario Blanco
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "uwsgi_server::app"

# Needed packages by gevent
package "libevent-dev"

# Install gevent 1.0 release candidate from the github repository
python_pip "pip install cython -e git://github.com/surfly/gevent.git@1.0rc2#egg=gevent" do
  action :install
end

# Force a supervisor service restart
supervisor_service "uwsgi-app" do
  action [:restart]
end
