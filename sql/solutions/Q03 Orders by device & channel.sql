/* Q03: Orders by device & channel
   Tables: orders
   Skills: multi-column GROUP BY, pivot-friendly output */

SELECT 
    device,
    channel,
    COUNT(order_id) AS total_orders
FROM orders
WHERE status = 'Completed'
GROUP BY device, channel
ORDER BY device, channel;

/* Q03: Orders by device & channel

| Device   | Channel      | Total Orders |
|----------|--------------|--------------|
| Desktop  | Marketplace  | 506          |
| Desktop  | Mobile App   | 2031         |
| Desktop  | Website      | 2588         |
| Mobile   | Marketplace  | 1047         |
| Mobile   | Mobile App   | 4167         |
| Mobile   | Website      | 5061         |
| Tablet   | Marketplace  | 170          |
| Tablet   | Mobile App   | 664          |
| Tablet   | Website      | 840          |
*/
