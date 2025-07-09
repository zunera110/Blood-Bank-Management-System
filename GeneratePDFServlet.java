import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet("/GeneratePDFServlet")
public class GeneratePDFServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set content type
//        response.setContentType("application/pdf");
//        response.setHeader("Content-Disposition", "inline; filename=payment_confirmation.pdf");
          response.setContentType("application/pdf");
          response.setHeader("Content-Disposition", "attachment; filename=payment_confirmation.pdf");

        // Get form parameters
        String amount = request.getParameter("amount");
        String paymentMethod = request.getParameter("paymentMethod");
        String bloodGroup = request.getParameter("bloodGroup");
        String quantity = request.getParameter("requestedQuantity");

        String cardholderName = request.getParameter("cardholderName");
        String cardNumber = request.getParameter("cardNumber");
        String expiryMonth = request.getParameter("expiryMonth");
        String expiryYear = request.getParameter("expiryYear");
        String upiId = request.getParameter("upiId");

        Document document = new Document();
        try {
            OutputStream out = response.getOutputStream();
            PdfWriter.getInstance(document, out);
            document.open();

            // --- Header Table: Logo and Title ---
            PdfPTable headerTable = new PdfPTable(2);
            headerTable.setWidthPercentage(100);
            headerTable.setWidths(new float[]{1f, 4f});

            String logoPath = getServletContext().getRealPath("BloodDrop.jpg");
            Image logo = Image.getInstance(logoPath);
            logo.scaleToFit(70, 70);
            PdfPCell logoCell = new PdfPCell(logo);
            logoCell.setBorder(Rectangle.NO_BORDER);
            logoCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            logoCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            headerTable.addCell(logoCell);

            Font titleFont = new Font(Font.FontFamily.HELVETICA, 26, Font.BOLD);
            PdfPCell titleCell = new PdfPCell(new Paragraph("Blood Bank Management System", titleFont));
            titleCell.setBorder(Rectangle.NO_BORDER);
            titleCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            titleCell.setHorizontalAlignment(Element.ALIGN_LEFT);
            headerTable.addCell(titleCell);

            document.add(headerTable);
            document.add(new Paragraph(" ")); // spacing

            // --- Payment Confirmation Heading ---
            Font headingFont = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
            Font headingFont1 = new Font(Font.FontFamily.HELVETICA, 14);
            Paragraph confirmation = new Paragraph("Payment Confirmation : ", headingFont);
            Paragraph confirmation1 = new Paragraph("Thank you! Your payment was successfully processed. We appreciate your contribution to the Blood Bank. Thank you for your support.", headingFont1);
            confirmation.setAlignment(Element.ALIGN_LEFT);
            document.add(confirmation);
            document.add(confirmation1);
            document.add(new Paragraph(" "));

            // --- "Payment Details" Heading ---
            Font detailHeadingFont = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
            Paragraph detailsHeading = new Paragraph("Payment Details:", detailHeadingFont);
            detailsHeading.setSpacingBefore(10);
            detailsHeading.setAlignment(Element.ALIGN_LEFT);
            document.add(detailsHeading);
            document.add(new Paragraph(" "));

// --- Details Box ---
PdfPTable detailsBox = new PdfPTable(1);
detailsBox.setWidthPercentage(70); // Wider box
detailsBox.setHorizontalAlignment(Element.ALIGN_CENTER);

PdfPCell detailCell = new PdfPCell();
detailCell.setBackgroundColor(new BaseColor(245, 245, 245));
detailCell.setBorderColor(BaseColor.WHITE);
detailCell.setPadding(14f);

// Font styles
Font labelFont = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
Font valueFont = new Font(Font.FontFamily.HELVETICA, 14);

// Helper method for each line
Phrase detailPhrase = new Phrase();

detailPhrase.add(new Chunk("Amount Paid                 : ", labelFont));
detailPhrase.add(new Chunk("₹" + amount + "\n\n", valueFont));

detailPhrase.add(new Chunk("Payment Method         : ", labelFont));
detailPhrase.add(new Chunk(paymentMethod.toUpperCase() + "\n\n", valueFont));

detailPhrase.add(new Chunk("Blood Group Ordered : ", labelFont));
detailPhrase.add(new Chunk(bloodGroup + "\n\n", valueFont));

detailPhrase.add(new Chunk("Quantity Requested     : ", labelFont));
detailPhrase.add(new Chunk((quantity != null ? quantity : "N/A") + " units\n\n", valueFont));

if ("card".equalsIgnoreCase(paymentMethod)) {
    detailPhrase.add(new Chunk("Card Holder                   : ", labelFont));
    detailPhrase.add(new Chunk(cardholderName != null ? cardholderName + "\n\n" : "N/A\n\n", valueFont));

    if (cardNumber != null && cardNumber.length() >= 4) {
        String last4Digits = cardNumber.substring(cardNumber.length() - 4);
        detailPhrase.add(new Chunk("Card Number               : ", labelFont));
        detailPhrase.add(new Chunk("**** **** **** " + last4Digits + "\n\n", valueFont));
    } else {
        detailPhrase.add(new Chunk("Card Number               : ", labelFont));
        detailPhrase.add(new Chunk("N/A\n\n", valueFont));
    }

    detailPhrase.add(new Chunk("Expiry Date                   : ", labelFont));
    detailPhrase.add(new Chunk(expiryMonth + "/" + expiryYear + "\n\n", valueFont));
} else if ("upi".equalsIgnoreCase(paymentMethod)) {
    detailPhrase.add(new Chunk("UPI ID                          : ", labelFont));
    detailPhrase.add(new Chunk((upiId != null ? upiId : "N/A") + "\n\n", valueFont));
}

detailCell.setPhrase(detailPhrase);
detailsBox.addCell(detailCell);
document.add(detailsBox);
document.add(new Paragraph(" ")); // Extra spacing after box


            // --- Thank you message ---
            Font thankFont = new Font(Font.FontFamily.HELVETICA, 12, Font.ITALIC);
            Paragraph thanks = new Paragraph("Thank you for your payment!", thankFont);
            thanks.setAlignment(Element.ALIGN_CENTER);
            document.add(thanks);

            document.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error generating PDF: " + e.getMessage());
        }
    }
}
