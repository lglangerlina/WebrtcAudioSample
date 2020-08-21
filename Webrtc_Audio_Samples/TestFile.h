#pragma once

#include <iostream>
#include <thread>

using namespace std;

int16_t buffer[320];
class TestFileFunction
{
public:
	TestFileFunction(const std::string &input_fileName, const std::string &output_file) {
		
		fopen_s(&m_inputFile, input_fileName.c_str(), "rb");
		fopen_s(&m_outputFile, output_file.c_str(), "wb");

		//fseek(m_inputFile, 44, SEEK_SET);
	}

	void copyData()
	{
		for (int i = 0; i < 100 * 10; ++i) {
			if (m_inputFile && m_outputFile) {
				int readSize = fread(buffer, 160, 1, m_inputFile);

				int writeSize = fwrite(buffer, 160 , 1, m_outputFile);

				int ret = 0;
			}

			//std::this_thread::sleep_for(std::chrono::milliseconds(10));
		}

		fclose(m_inputFile);
		fclose(m_outputFile);

	}

	~TestFileFunction()
	{

	}

private:
	FILE  *m_inputFile = nullptr;
	FILE  *m_outputFile = nullptr;
};
