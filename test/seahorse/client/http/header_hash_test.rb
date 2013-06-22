# Copyright 2011-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require 'test_helper'

module Seahorse
  class Client
    module Http
      describe HeaderHash do

        def hash
          @hash ||= HeaderHash.new
        end

        it 'provides indifferent access to symbolized keys' do
          hash[:key] = 'value'
          hash[:key].must_equal('value')
          hash['key'].must_equal('value')
        end

        it 'provides indifferent access to string keys' do
          hash['key'] = 'value'
          hash['key'].must_equal('value')
          hash[:key].must_equal('value')
        end

        describe '#to_hash' do

          it 'returns a regular hash' do
            hash[:abc] = 'xyz'
            hash.to_hash.must_equal({ 'abc' => 'xyz' })
          end

          it 'is aliased as #to_h' do
            hash[:abc] = 'xyz'
            hash.to_h.must_equal({ 'abc' => 'xyz' })
          end

        end


      end
    end
  end
end
