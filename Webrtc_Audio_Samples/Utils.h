#pragma once
#include <iostream>
#include <tchar.h>

namespace Utils
{
	int GetProjectExecuteDir(std::string &path)
	{
		TCHAR szFilePath[MAX_PATH + 1] = { 0 };
		GetModuleFileName(NULL, szFilePath, MAX_PATH);
		(_tcsrchr(szFilePath, _T('\\')))[1] = 0; // ɾ���ļ�����ֻ���·���ִ�

		path = std::string(szFilePath);
		return 0;
	}
};
