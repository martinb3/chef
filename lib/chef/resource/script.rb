#
# Author:: Adam Jacob (<adam@opscode.com>)
# Author:: Tyler Cloke (<tyler@opscode.com>)
# Copyright:: Copyright (c) 2008 Opscode, Inc.
# License:: Apache License, Version 2.0
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

require 'chef/resource/execute'

class Chef
  class Resource
    class Script < Chef::Resource::Execute

      identity_attr :command

      def initialize(name, run_context=nil)
        super
        @resource_name = :script
        @command = name
        @code = nil
        @interpreter = nil
        @flags = nil
        @guard_inherited_attributes = []

        set_guard_inherited_attributes(
          [
           :cwd,
           :environment,
           :group,
           :path,
           :user,
           :umask
          ])
      end

      def code(arg=nil)
        set_or_return(
          :code,
          arg,
          :kind_of => [ String ]
        )
      end

      def interpreter(arg=nil)
        set_or_return(
          :interpreter,
          arg,
          :kind_of => [ String ]
        )
      end

      def flags(arg=nil)
        set_or_return(
          :flags,
          arg,
          :kind_of => [ String ]
        )
      end

      protected

      def set_guard_inherited_attributes(inherited_attributes)
        @guard_inherited_attributes.concat(inherited_attributes).uniq
      end

      def guard_inherited_attributes
        @guard_inherited_attributes
      end

    end
  end
end
