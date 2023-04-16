# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: payment.proto for package 'payment'

require 'grpc'
require 'payment_pb'

module Payment
  module PaymentService
    # The above is the proto file for the payment service.
    # It defines the service and the messages that will be used to communicate
    # between the client and the server. The service is defined as follows:
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'payment.PaymentService'

      # create_payment creates a new payment
      rpc :CreatePayment, ::Payment::CreatePaymentRequest, ::Payment::CreatePaymentResponse
      # get_payment gets a payment by id
      rpc :GetPayment, ::Google::Protobuf::StringValue, ::Payment::GetPaymentResponse
      # list_payments lists payments
      rpc :ListPayments, ::Google::Protobuf::Empty, ::Payment::ListPaymentsResponse
      # update_payment updates a payment
      rpc :UpdatePayment, ::Payment::UpdatePaymentRequest, ::Payment::UpdatePaymentResponse
      # delete_payment deletes a payment
      rpc :DeletePayment, ::Google::Protobuf::StringValue, ::Google::Protobuf::Empty
    end

    Stub = Service.rpc_stub_class
  end
end
