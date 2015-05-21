#include<iostream>
#include<cstring>
#include<fstream>
#include<sstream>

using namespace std;

int main()
{
	int seat_id;
	string seat_class;
	string seat_num;
	bool occupied;
	int fleetID;
	
	int fleet_id;
	int first_class = 0;
	int business_class = 0;
	int premium_class = 0;
	int economy_class = 0;
	int seats_per_row = 6;
	cout << "planeID: ";
	cin >> fleet_id;
	cout << "How many seats in first class: ";
	cin >> first_class;
	cout << "How many seats in business class: ";
	cin >> business_class;
	cout << "How many seats in premium class: ";
	cin >> premium_class;
	cout << "How many seats in economy class: ";
	cin >> economy_class;
	
	int total = first_class + business_class + premium_class + economy_class;
	cout << "Total seats = " << total << endl;
	
	cout << "Seats in each row : ";
	cin >> seats_per_row;
	
	ofstream myfile;
	myfile.open("seatsToAdd.sql");
	
	for(int i = 0; i < total; i++)
	{
		ostringstream seat_name;
		seat_name << ((i/(seats_per_row))+1) << static_cast<char>('A'+i%seats_per_row);
		seat_num = seat_name.str();
		myfile << "INSERT INTO `Seat` VALUES (" << i+1 << ", ";
		if(i < first_class)
		{
			myfile << "'First', '" << seat_num << "', false, " << fleet_id << ");" << endl;
		}
		else if(i < first_class+business_class)
		{
			myfile << "'Business', '" << seat_num << "', false, " << fleet_id << ");"  << endl;
		}
		else if(i < first_class+business_class+premium_class)
		{
			myfile << "'Premium', '" << seat_num << "', false, " << fleet_id << ");"  << endl;
		}
		else
		{
			myfile << "'Economy', '" << seat_num << "', false, " << fleet_id << ");"  << endl;
		}
	}
	return 0;
}
