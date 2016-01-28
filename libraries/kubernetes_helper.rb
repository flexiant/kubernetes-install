module Kubernetes
  module Helper

    def is_port_open?(host, port, timeout, sleep_period)
      tries = 0
      begin
        Timeout::timeout(timeout) do
          begin
            tries += 1
            s = TCPSocket.new(host, port)
            s.close
            return true
          rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
            sleep(sleep_period)
            retry if tries < 10
          end
        end
      rescue Timeout::Error
        return false
      end
    end

  end
end
