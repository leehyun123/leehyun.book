package leehyun.book.user.domain;

import java.sql.Date;

public class Refund {
   private int refundNum;
   private Date refundDate;
   private String refundStatus;

   public Refund(int refundNum, Date refundDate, String refundStatus) {
      this.refundNum = refundNum;
      this.refundDate = refundDate;
      this.refundStatus = refundStatus;
   }

   public int getRefundNum() {
      return refundNum;
   }

   public Date getRefundDate() {
      return refundDate;
   }

   public String getRefundStatus() {
      return refundStatus;
   }

   public void setRefundNum(int refundNum) {
      this.refundNum = refundNum;
   }

   public void setRefundDate(Date refundDate) {
      this.refundDate = refundDate;
   }

   public void setRefundStatus(String refundStatus) {
      this.refundStatus = refundStatus;
   }
}