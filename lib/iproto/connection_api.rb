require 'bin_utils'
module IProto
  module ConnectionAPI
    DEFAULT_RECONNECT = 0.1
    HEADER_SIZE = 12

    def next_request_id
      @next_request_id = ((@next_request_id ||= 0) + 1) & 0x7fffffff
    end

    def send_request(request_id, data)
      # for override
    end

    BINARY = ::Encoding::BINARY
    def pack_request(request_type, request_id, body)
      data = ::BinUtils.append_int32_le!(nil, request_type, body.bytesize, request_id)
      ::BinUtils.append_string!(data, body)
    end
  end
end
