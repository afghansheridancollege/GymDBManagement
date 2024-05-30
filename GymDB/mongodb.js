db.createCollection("Customer"); 

db.createCollection("Location"); 

db.Customer.insertOne(
{
	CustomerName: "Will Smith", 
	CustomerPhone: "422-000-0000",
	CustomerEmail: "will@smith.gmail.com"
}
); 

db.Location.insertOne(
{
	LocationName: "MidTown", 
	LocationAddress: "20 Street Avenue, Cityville", 
	Telephone: "444-209-9084",
	NumberOfVisists: 15, 
	Email: "midtown@teaches.gmail.com"
}); 