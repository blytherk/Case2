using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Linq;

/// <summary>
/// Summary description for CustomerList
/// </summary>
public class CustomerList
{
    private List<Customer> customers;
	public CustomerList()
	{
        customers = new List<Customer>();
	}

    public int Count { get { return customers.Count; }}
    public Customer this[int index]
    {
        get { return customers[index]; }
        set { customers[index] = value; }
    }
    public Customer this[string id]
    {
        get { return customers.FirstOrDefault(c => c.CustomerID == id);
        }
    }
    public static CustomerList GetCustomers()
    {
        CustomerList cList = (CustomerList)HttpContext.Current.Session["CustList"];
        if (cList == null)
        {
            HttpContext.Current.Session["CustList"] = new CustomerList();
        }
        return (CustomerList)HttpContext.Current.Session["CustList"];
    }
    public void AddCust(Customer customer)
    {
        customers.Add(customer);
    }
    public void RemoveAt(int index){
        customers.RemoveAt(index);
    }
    public void Clear()
    {
        customers.Clear();
    }

}