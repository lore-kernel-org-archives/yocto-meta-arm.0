Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web10.198661.1598284863891703476
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 09:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=d++TWs1e;
 spf=pass (domain: arm.com, ip: 40.107.21.48, mailfrom: steve.capper@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07uKNqY8Gvtcrwqy/+B7+cKooXQNVJPRJMItwMP1XCY=;
 b=d++TWs1eTnjUJAyZyPF+mtFtksrXRUZBYMz4y5KR2YACohCQOpo4S1VruKkNEADJQPLicvqEv79EswTr+mF9sch6w7ipgIKOAdOzcHBWqy3LFVYV0hN4df9qZaZIUAg7aIb7xZ22d/d0qeBAHrgzeHpKOz6SNoB7YT/AscbyWC4=
Received: from AM6PR08CA0026.eurprd08.prod.outlook.com (2603:10a6:20b:c0::14)
 by AM0PR08MB5010.eurprd08.prod.outlook.com (2603:10a6:208:15c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 16:01:00 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::f0) by AM6PR08CA0026.outlook.office365.com
 (2603:10a6:20b:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Mon, 24 Aug 2020 16:01:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 16:00:58 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Mon, 24 Aug 2020 16:00:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28d3f9d459d3cc2b
X-CR-MTA-TID: 64aa7808
Received: from 5b45c0ef5859.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 03BF18A7-EC44-4F04-834D-A45696D1BF9C.1;
	Mon, 24 Aug 2020 16:00:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5b45c0ef5859.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 24 Aug 2020 16:00:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8kXaR0Fe7F4vFXA/Qchk29rYhkDwNXW2vWsIRAKTUZatvk35n4r7FXvvObxZBdRh9YSO2+wUmrm+TbjqG1/Ur6M7sj6XD2HEWeoUdJLyQIDtc/q8PFOa0PT1vUoP1YvE8GJOLfpCaKWFcpHGcd97q2RhQHudHoBfMWpkt0yqxt4DQnm0jHcmy+wUalQG+KB2NwphR0otKOAEESrUPFDzkwMIzc0NmgeAwJ1DJvEwAH4s6q67pcLkpkY4HvtH3dd7qNJa23ugGXa61y8C6P4uun0AMXkYfPtcsKo12qRX75T7vdTOIONQbmmA13pep590VJr3/7tFIOquLOmN33oOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07uKNqY8Gvtcrwqy/+B7+cKooXQNVJPRJMItwMP1XCY=;
 b=XUjwinozfjX1zL3rZTccuCQcYRFQAZcYB7wqf7aBvAXzmSLqOR3z54K5jm6DcPovwvoL9qRPHqB/Ol8oq0BTZyvP181PvJeTMrV+Gjv51ddLxdU97v3/HAA08mxvx91v+bgKQ217tCbPen0zfJ/SGLBDMF7PThOXHH2c0lgtVj8Buc6EqhCR+sMyFaLW5Von9QjM90taCC8B2Ipan2yeAL9r4NjUcVP1M1699tq8oQC2PjZywctCIOfc6V4hairY3cMWPGKegiPktZSARirL92GrjryKCC6Cj4AyuMYl/VugjwA6LZTkCc5cthTDiXUcJxSgItTozlf5l47kE1VVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07uKNqY8Gvtcrwqy/+B7+cKooXQNVJPRJMItwMP1XCY=;
 b=d++TWs1eTnjUJAyZyPF+mtFtksrXRUZBYMz4y5KR2YACohCQOpo4S1VruKkNEADJQPLicvqEv79EswTr+mF9sch6w7ipgIKOAdOzcHBWqy3LFVYV0hN4df9qZaZIUAg7aIb7xZ22d/d0qeBAHrgzeHpKOz6SNoB7YT/AscbyWC4=
Received: from DB8PR08MB4986.eurprd08.prod.outlook.com (2603:10a6:10:e0::18)
 by DB7PR08MB3449.eurprd08.prod.outlook.com (2603:10a6:10:42::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 16:00:49 +0000
Received: from DB8PR08MB4986.eurprd08.prod.outlook.com
 ([fe80::406a:a54a:e36b:175]) by DB8PR08MB4986.eurprd08.prod.outlook.com
 ([fe80::406a:a54a:e36b:175%5]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 16:00:48 +0000
From: "Steve Capper" <steve.capper@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Test email
Thread-Topic: Test email
Thread-Index: AdZ6L6wbHhpT+2iORDeunvVoY5531g==
Date: Mon, 24 Aug 2020 16:00:48 +0000
Message-ID: 
 <DB8PR08MB49865617E89D8CD34BD36BDF81560@DB8PR08MB4986.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.20.117.196]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27c05180-3abc-424a-3506-08d84846e42b
x-ms-traffictypediagnostic: DB7PR08MB3449:|AM0PR08MB5010:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB5010F2888AAE9998079F6B9081560@AM0PR08MB5010.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2657;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 9HEVaHrzDDWAzzyNC28YYRbHY+BlUxB87mUZNMG1fpObD1yvGTJCGjn2p7mvOsMbM6Jz19IhQMLsg4kiiuQWbE7Q8iXst6cGbj7xzTeHZel3E6WJf2KY2mico70Tb2B78Oye1rqcQyqOc6ODmuZtCatQl1TXb3FE7DRfxebm6K5XGg41NSPBXFw0Y/4euQUPmm3w2pr5rtv+5mGKsmZ4+Fs60H9rEroz0tn6KDeJzBaU3YrFRVqJABiQO03x2dnFSLUs5f+Aq+HVlkluV6yAkb3I+XWw45FJuT1JZChlJqmx1bG5SvwLIWHTcDs18bfS+tZXABYxJntGBsi0Wemlbg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4986.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(9686003)(3480700007)(8676002)(7696005)(26005)(316002)(6506007)(7116003)(55016002)(478600001)(8936002)(64756008)(66446008)(66946007)(66556008)(4744005)(66476007)(52536014)(71200400001)(2906002)(83380400001)(186003)(5660300002)(86362001)(33656002)(6916009)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 3JTFjemaP4FtOcaFhkBLFJhZyNFYPuINSdilq8rTQAs6CM6vE+ppm9aUlf0BbQaKHic0yJwbzOj4xe1pDCFufoP4ai3Dugzo/DUYSgZNXTwNjQdaaiVyOFkCuLUcBeeQoQJRTA9CTR4AezdJhO7DKQjEKghYy5DGWR76Ix3Bxh+9s9L0bRR2Yxa6zOW9aiQq2VuXGxNwd6bn/q1+SFA81PL20Yx5kE/+JDtU4t81rbTsUXVq0quFI+kxm1t2CbuAx4pwnZTYpKbb0xK4XbsHRIVZi/XSgTVBaN7wVp60e/imeiskMC1Vi6O7+p7/L4fWmeFwRoU+2iRlLVnx/3efPKKh0FmWfwlvZR7uq4dT7YrOn7m794Lav8R8+6dJ2HPaQTUtQUgwqpoZ7fPYflzCg/2dNNCysb+JuHa3unwiNpe9SnC5wB2DN1nSxogSTQMjKWRPDnhzk1Lvrfh1QXszyCNsOXZ+IMEtFhWTYqwtzVCmklZp+a4Xqjiebp5Z6UAsUpJ7181PpLORNAc7aoVApiO8RnK36iMibTVnD6IEvP+xLtnrMhA/t1Oy3qaVQ+ZgC/lT62jnukXEe40vn0U9eHbczmxO6J9IVT2pXbUppjNVpWp68z9Frcqq2iYmPzJl52Q9zmEZVB1O1NAF4zdN+g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3449
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Steve.Capper@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	56232d61-acca-4646-1cb1-08d84846de72
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p29LnTmlYPOQM93chPkLKNxnz3x6Kj9fhiQOHMIAKu4VwHdA/ICAYXPJH17JLj/ThGXtwJG+DRutYu1ubdBflQTlwlzzC6SmXET+yNckNaVUsbCCxMgCtbEudez1ZAy2uzkmCaKJQ2BhZhdKvaPcVIVrVu46z+MRuFLSJFSUymOlJu01rSXhtsQ+qZrI+K2RrodK1eM2ad1epHpEcwrL1Fw01jqY0zm0E0XoK36abj3utCxXPulz3EUPElliTnZBvALpcygNOgeAwNBhbyfGI/S+2EZSNZYMQMXXXkjbQG26/NaQ/kCIeoAWk7i47bLWcMVWp5LMzq4V3pJB44mTV/iig7CgoDWEE0asyBRmjAZvp4zFBA4Y+bqJXpcw3OsN2ZNjJj3SvPLgHQTHXhSRRQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966005)(70206006)(356005)(6916009)(9686003)(36906005)(26005)(33656002)(70586007)(86362001)(186003)(55016002)(2906002)(3480700007)(316002)(47076004)(82310400002)(82740400003)(81166007)(7116003)(83380400001)(8676002)(336012)(52536014)(478600001)(6506007)(7696005)(4744005)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 16:00:58.4603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c05180-3abc-424a-3506-08d84846e42b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5010
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Test email,
Please ignore.

Cheers,
--
Steve
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
