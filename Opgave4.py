
import pandas as pd
import sqlite3
import os
import matplotlib.pyplot as plt

db_file = os.path.join(os.path.dirname(__file__), 'northwind.db')
conn = sqlite3.connect(db_file)

def barChart():
    df = pd.read_sql_query("SELECT Orders.OrderID, OrderDetails.OrderID, OrderDetails.ProductID, OrderDetails.UnitPrice, OrderDetails.Quantity, OrderDetails.Discount, Orders.ShipCountry FROM Orders FULL OUTER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID", conn)
    #dfSpain = pd.read_sql_query("SELECT Orders.OrderID, OrderDetails.OrderID, OrderDetails.ProductID, OrderDetails.UnitPrice, OrderDetails.Quantity, OrderDetails.Discount, Orders.ShipCountry FROM Orders FULL OUTER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID WHERE ShipCountry in ('Spain')", conn)
    df['DiscountPrice'] = df['UnitPrice'] * df['Discount']
    df['TotalSalg'] = (df['UnitPrice'] - df['DiscountPrice']) * df['Quantity']
    totalPriceCountry = df.groupby('ShipCountry')['TotalSalg'].sum().reset_index()
    print(totalPriceCountry)
    #print(df)
    #print(dfSpain)
    plt.figure(figsize=(10, 6))
    plt.bar(totalPriceCountry['ShipCountry'], totalPriceCountry['TotalSalg'], color='blue')
    plt.xlabel('Land')
    plt.ylabel('Totale salg')
    plt.title('Total salg for hvert Land!')
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.show()


barChart()
conn.close()