db.createCollection("Customer"); 

db.createCollection("Location"); 

db.Customer.insertOne(
{
	CustomerName: "Will Smith", 
	CustomerPhone: "422-000-0000",
	CustomerEmail: "will@smith.gmail.com"
}
)
db.Customer.insertOne(
{
	CustomerName: "Amin Afghan", 
	CustomerPhone: "568-282-3956",
	CustomerEmail: "afghan@sheridanc.ca"
}
); 
db.Customer.find()

db.Location.insertOne(
{
	LocationName: "MidTown", 
	LocationAddress: "20 Street Avenue, Cityville", 
	Telephone: "444-209-9084",
	NumberOfVisists: 15, 
	Email: "midtown@teacher.gmail.com"
}); 
db.Location.insertOne(
{
	LocationName: "MidTown", 
	LocationAddress: "20 Sheridan Street", 
	Telephone: "468-898-5634",
	NumberOfVisists: 12, 
	Email: "midtownfitness@.gmail.com"
}); 
db.Location.find()