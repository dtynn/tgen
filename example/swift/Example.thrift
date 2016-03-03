include "Shared.thrift"

namespace java com.ezbuy.example
namespace swift Example

struct TFoo {}

struct TExample {
    1:required double amountAvailable;
    2:required string rebateAmountAvailable;
    3:optional bool amountPendingVerification;
    4:optional i32 pendingWithdrawAmount;
    5:optional i64 unpaidAmount;
    6:required list<TFoo> fooes;
    7:required list<string> strs;
    8:required list<i16> ints;
}

service Example extends Shared.Basic {
  void ping(1: string ip),
  i32 getPendingWithdrawAmount()
}