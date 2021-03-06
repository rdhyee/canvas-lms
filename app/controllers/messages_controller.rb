#
# Copyright (C) 2011 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

class MessagesController < ApplicationController
  before_filter :require_read_messages, :get_context

  def require_read_messages
    require_site_admin_with_permission(:read_messages)
  end

  def index
    @messages = @context.messages.scoped(:order => 'created_at DESC').paginate(:page => params[:page], :per_page => 20)
  end
end
