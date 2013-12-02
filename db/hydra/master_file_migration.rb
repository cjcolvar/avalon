# Copyright 2011-2013, The Trustees of Indiana University and Northwestern
#   University.  Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
# 
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software distributed 
#   under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
#   CONDITIONS OF ANY KIND, either express or implied. See the License for the 
#   specific language governing permissions and limitations under the License.
# ---  END LICENSE_HEADER BLOCK  ---

class MasterFileMigration < Hydra::Migrate::Migration
  migrate nil => 'R2' do |obj,ver,dispatcher|
    dispatcher.migrate!(obj.derivatives)
    obj.duration = obj.derivatives.empty? ? '0' : obj.derivatives.first.duration.to_s
    obj.descMetadata.poster_offset = obj.descMetadata.thumbnail_offset = [obj.duration.to_i,2000].min.to_s
  end
end