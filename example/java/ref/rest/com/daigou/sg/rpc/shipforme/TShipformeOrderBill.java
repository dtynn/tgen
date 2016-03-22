package com.daigou.sg.rpc.shipforme;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;

/**
 * This file is auto-generated by tgen
 * Don't change manually
 */

public class TShipformeOrderBill implements Serializable {
    public boolean couponUsed;
    public String couponErrorMessage;
    public com.daigou.sg.rpc.payment.TPaymentBill paymentBill;

    static TShipformeOrderBill fromJSON(JsonParser jp) throws IOException {
        // Sanity check: verify that we got "Json Object":
        if (jp.nextToken() != JsonToken.START_OBJECT) {
            throw new IOException("Expected data to start with a TShipformeOrderBill Object");
        }

        return doFromJSON(jp);
    }

    private static TShipformeOrderBill doFromJSON(JsonParser jp) throws IOException {
        TShipformeOrderBill result = new TShipformeOrderBill();

        // Iterate over object fields:
        while (jp.nextToken() != JsonToken.END_OBJECT) {
            String fieldName = jp.getCurrentName();

            if (false) {
            } else if (fieldName.equals("couponUsed")) {
                jp.nextToken();
                result.couponUsed = jp.getBooleanValue();
            } else if (fieldName.equals("couponErrorMessage")) {
                jp.nextToken();
                result.couponErrorMessage = jp.getText();
            } else if (fieldName.equals("paymentBill")) {
                result.paymentBill = com.daigou.sg.rpc.payment.TPaymentBill.fromJSON(jp);
                
            }
        }
        return result;
    }

    static ArrayList<TShipformeOrderBill> fromJSONArray(JsonParser jp) throws IOException {
        if (jp.nextToken() != JsonToken.START_ARRAY) {
            throw new IOException("Expected data to start with a TShipformeOrderBill array");
        }

        ArrayList<TShipformeOrderBill> result = new ArrayList<TShipformeOrderBill>();

        // Iterate over object fields:
        while (jp.nextToken() != JsonToken.END_ARRAY) {
            result.add(doFromJSON(jp));
        }
        return result;
    }
}