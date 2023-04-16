
require 'grpc'
require 'gen/payment_services_pb'

class PaymentServer :: Payment::Service
#   todo -> def initialize
end

def serve
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:1600', :this_port_is_insecure)
  GRPC.logger.info(".payment server.. running insecurely on #{port}")
  s.handle(PaymentServer)
  s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

serve