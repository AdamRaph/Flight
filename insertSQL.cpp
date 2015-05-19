#include<iostream>
#include<cstring>
#include<fstream>
#include<sstream>
#include <stdlib.h>
#include<vector>

using namespace std;

int main(int argc, char* argv[])
{
	vector<string> tableNames;
	vector<string> columnNames;
	string temp;
	if(argc == 2)
	{
		ifstream sqlFile;
		char insertChoice = 'y';
	
		sqlFile.open(argv[1]);
		
		while(!sqlFile.eof())
		{
			sqlFile >> temp;
			if(temp == "CREATE")
			{
				sqlFile >> temp;
				if(temp == "TABLE")
				{
					sqlFile >> temp;
					tableNames.push_back(temp);
				}
			}
		}
		sqlFile.close();
		for(int i = 0; i < tableNames.size(); i++)
		{
			cout << "\t"<< i+1 << ". " << tableNames[i] << "\n" << endl;
		}
		int tableChoice = 0;
		cout << "Table number to insert into: ";
		cin >> tableChoice;
		while(tableChoice > tableNames.size() || tableChoice < 1)
		{
			cout << "INVALID TABLE NUMBER" << endl;
			cout << "Table number to insert into: ";
			cin >> tableChoice;
		}
		
		sqlFile.open(argv[1]);
		sqlFile >> temp;
		while(temp != tableNames[tableChoice-1])
		{
			sqlFile >> temp;
		}
		sqlFile >> temp;
		while(temp != ");" && !sqlFile.eof()) 
		{
			sqlFile >> temp;
			if(temp != ");" && temp != "UNIQUE" && temp != "FOREIGN" && temp != "PRIMARY" && temp != "CONSTRAINT" && temp != "ON" && temp != "REFERENCES")
			{
				columnNames.push_back(temp);
				//sqlFile.getline(temp.c_str(), 256, '\n');
			}
			if(temp != ");")
			{
				getline(sqlFile, temp);
			}
		}
		sqlFile.close();
		
		for(int i = 0; i < columnNames.size(); i++)
		{
			cout << "\t"<< i+1 << ". " << columnNames[i] << endl;
		}
		
		cout << "Insert into " << tableNames[tableChoice-1] << "?(y/n): ";
		cin >> insertChoice;
		
		if(insertChoice == 'y')
		{
			sqlFile.open(argv[1]);
			sqlFile >> temp;
			while(temp != tableNames[tableChoice-1])
			{
					sqlFile >> temp;
			}
			getline(sqlFile, temp);
			
			int endCheck = temp.find('(');
			if(temp[endCheck] != '(')
			{
				getline(sqlFile, temp);
			}
			
			ostringstream insert_value;
			insert_value << "INSERT INTO " << tableNames[tableChoice-1] << " VALUES (";
			for(int i = 0; i < columnNames.size(); i++)
			{
				sqlFile >> temp;
				sqlFile >> temp;
				
				string filetype = temp;
				
				if(temp[temp.size()-1] == ',')
				{
					filetype.resize(temp.size()-1);
				}
				else
				{
					getline(sqlFile, temp);
				}
				
				string newdata;
				
				cout << "Data for " << columnNames[i] << " (" << filetype << "): ";
				cin >> newdata;
				
				int fBracket = filetype.find('(');
				int lBracket;
				int filetypeSize;
				if(filetype.find("DOUBLE") != std::string::npos)
				{
					lBracket = filetype.find(',');
					cout << (filetype.substr(fBracket+1, lBracket-fBracket-1)) << endl;
					filetypeSize = atoi((filetype.substr(fBracket+1, lBracket-fBracket-1)).c_str()) + 1;
				}
				else
				{
					lBracket = filetype.find(')');
					cout << (filetype.substr(fBracket+1, lBracket-fBracket-1)) << endl;
					filetypeSize = atoi((filetype.substr(fBracket+1, lBracket-fBracket-1)).c_str());
				}
				while(newdata.length() > filetypeSize)
				{
					cout << "Max data size is: " << filetypeSize << endl;
					cin >> newdata;
				}
				if(filetype.find("VARCHAR") != std::string::npos && newdata[0] != '\'')
				{
					insert_value << "\'";
				}
				insert_value << newdata;
				if(filetype.find("VARCHAR") != std::string::npos && newdata[0] != '\'')
				{
					insert_value << "\'";
				}
				if(i != columnNames.size()-1)
				{
					insert_value << ", ";
				}
			}
			insert_value << ");";
			cout << insert_value.str() << endl;
		}
	}
	else
	{
		cout << "no input file" << endl;
	}
	return 0;
}
