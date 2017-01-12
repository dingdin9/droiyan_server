// ThrowItem.cpp: implementation of the CThrowItem class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "ThrowItem.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CThrowItem::CThrowItem()
{
//	lRef = 0;
//	lExistRef = 0;
	m_pItem = NULL;
}

CThrowItem::~CThrowItem()
{
	if( m_pItem )
	{
		delete m_pItem;
		m_pItem = NULL;
	}
}