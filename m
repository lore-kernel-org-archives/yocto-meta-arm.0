Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.73])
 by mx.groups.io with SMTP id smtpd.web11.24169.1593616784629731188
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 08:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cIufJFYd;
 spf=pass (domain: arm.com, ip: 40.107.14.73, mailfrom: steve.capper@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZ+fGme52HHacYn/ble1oReiPo98RMV8lRt2IC5sdt0=;
 b=cIufJFYd4jTpbE3xKjHn6+TH6UZfwtmyiYV95uG0BgN2a+UWLSoU9QnQZ8afufkv/hEY8USBOm5YmeJFrxQlIsTiW8FFoaSl84pRZx6tW0RcrarDyzsmK0yUE2iNCqaHf/e0l4QV42X4vtq1l86F1sGBBaF9qsYpym1rEjmPL20=
Received: from AM5PR0201CA0013.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::23) by AM0PR08MB3731.eurprd08.prod.outlook.com
 (2603:10a6:208:fc::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 1 Jul
 2020 15:19:42 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::c) by AM5PR0201CA0013.outlook.office365.com
 (2603:10a6:203:3d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Wed, 1 Jul 2020 15:19:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 1 Jul 2020 15:19:41 +0000
Received: ("Tessian outbound 8239f48e56bd:v62"); Wed, 01 Jul 2020 15:19:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 18e60347c9fbe28a
X-CR-MTA-TID: 64aa7808
Received: from b4fcf868f0d0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 55950D82-43B6-4357-8BA2-F5B918334EFA.1;
	Wed, 01 Jul 2020 15:19:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4fcf868f0d0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 15:19:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQV+kJqgLjpIMWxqv1kg5+0aUqN864Y7a/JKmQyc0uPqgtEp7ixftbKOezAaYMJdvFHmFbvND+9IFCZ31Y8POlWBgq3MwMP393WXi0Taid97bhh/GkdmvdfGXCoNLXwUUY3p/MrPZsmMk+2uYaqqdU6WbMvGwyJtu5IOgBNDA+WxBG22rWvQh+iVvMUugEtpH+S3u/xJtKugysfJ1O+85/v2LnCSynFmFb5QiYdw45R4fyfk3r0IO0STpwOtqHWq0eDrwxZ4TiuiYGJCWChy/Sc6hwdxZy1ldxfldG/zMvypBrApMcqpvU1Tx2y1GY7oRz7IdxYNy25xK6J/rNNYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZ+fGme52HHacYn/ble1oReiPo98RMV8lRt2IC5sdt0=;
 b=nN4TH1FxM+AJw/BluhYIlBR4H+BJOvPGZBmsVBopy40fAJooUf8g6oMf6Y1doCFH8dHGqm90Y7Vl2mcxcyThnFIX5SbugNYuseGa3k0eHWqG0OQomsizZdfZmqqNDeJRFYNNcaCoxAJW92+5GxuObUxj3qiSlCL/Url2fSfTMvke4NrIMr6UWdbjz/uFOHqBjJa4caZFwE8+2wbqjnVI8N6BGe5ryTIBnqf9km54KJ2x3bOqNcGvE5QEEVdyB/Tsn7mUWl/F2jACbZ9SqekJyM22DGN6B+ucDPFDLd+3eT5Rpt+L/iGY0B9FoFvgWWcy6ZihXs7t3gNC7gkpvZ6Pwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZ+fGme52HHacYn/ble1oReiPo98RMV8lRt2IC5sdt0=;
 b=cIufJFYd4jTpbE3xKjHn6+TH6UZfwtmyiYV95uG0BgN2a+UWLSoU9QnQZ8afufkv/hEY8USBOm5YmeJFrxQlIsTiW8FFoaSl84pRZx6tW0RcrarDyzsmK0yUE2iNCqaHf/e0l4QV42X4vtq1l86F1sGBBaF9qsYpym1rEjmPL20=
Received: from DB8PR08MB4986.eurprd08.prod.outlook.com (2603:10a6:10:e0::18)
 by DB6PR0801MB1941.eurprd08.prod.outlook.com (2603:10a6:4:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Wed, 1 Jul
 2020 15:19:33 +0000
Received: from DB8PR08MB4986.eurprd08.prod.outlook.com
 ([fe80::f9ba:4002:a159:6763]) by DB8PR08MB4986.eurprd08.prod.outlook.com
 ([fe80::f9ba:4002:a159:6763%3]) with mapi id 15.20.3131.030; Wed, 1 Jul 2020
 15:19:33 +0000
From: steve.capper@arm.com
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Test email
Thread-Topic: Test email
Thread-Index: AdZPuu1Mue6TCdzPSIa0yAh+2jmrZg==
Date: Wed, 1 Jul 2020 15:19:33 +0000
Message-ID: 
 <DB8PR08MB49868061C92873DA89CAD06D816C0@DB8PR08MB4986.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.20.117.196]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27cd63b5-1c9d-4b8e-24df-08d81dd22d71
x-ms-traffictypediagnostic: DB6PR0801MB1941:|AM0PR08MB3731:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3731BE1886349421BE7A15B9816C0@AM0PR08MB3731.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2331;OLM:9508;
x-forefront-prvs: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 d9G+j4ThAQU8C2lWJ5tvDpcTZgkdNiNKDLLUK3cWOt6sdEhFxg94GuARnRfglYf5goOCZn7CV6qz5BHSs8yZgDsgioSC3+L51lCeA3j1th4lA/bSLe7O9anLhlph44qP85wS9pFWCfKKEyPF9cwmF+zlgO+Cjw2QOkc2e5BmuqmNpl+UDuPTqUIa7s3SIoDOvrN1FHCXgtRq8aZMWm4JOIyp72USRNRWTFx/U0FKslmwR5mg4Oqe/o2YkYCjeK1lJydlrpIGi5aCyjn5rH6d4JSXEz58GhYMAQA8eyT8of9Tu7h5YBCrtx3IsCS8O4vntVZ7X3dnwOa4/5wBWfwq/Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4986.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(5660300002)(76116006)(66556008)(66446008)(7696005)(8676002)(6916009)(86362001)(33656002)(3480700007)(316002)(52536014)(55016002)(83380400001)(2906002)(64756008)(66946007)(66476007)(71200400001)(26005)(6506007)(4744005)(478600001)(8936002)(186003)(9686003)(7116003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 3nNKVC59ujzj0avX3uXrKPeiqock9VyRDUlmjWQGvrICSSWJ2ldzef2k+K21hEnGv3jVzPFC0XvIexPls8a6e8VbQiAz3l18e67/dbDCgfzvQncJ6+GNLYouVZW9TWUeoCWZNIsUzoIPmNn/HA2+C06Udli4mi1hV3NxqRhpT3RSLV1PQCUXb4rsWNBveK9P2nvO0C/qck1GEoJguk/vvskrVElo3ns0Z+zTUXAK9XH4DHXkj/zJefdP4YJtJIid6mHaUeHZ69Vi6Nxi825yNpT45SWIx0jsl10ZUHQqrEtceg0NoqYbTTQHxnpLlSEYFyMt9Xkdnimjp9U5o+aXAlAJ7GB8FNLWoiR+VHQaJGnhEsO7o5aHAwEpWLPhex3VjS958XbSxg8qi0rEo/0ddTj4dSbcbMTxzPg2RnRfJJfgP9W5EHgp2ONsJDSLKLWjeiEo4MfvcNOdwsXOzub8NaSI1zjlVT4eTN48w1fRsoyR8oaxBGBhiZc0Flu99cXp
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1941
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Steve.Capper@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(36906005)(83380400001)(5660300002)(86362001)(8676002)(3480700007)(70206006)(70586007)(316002)(336012)(52536014)(2906002)(6916009)(478600001)(7116003)(33656002)(186003)(8936002)(47076004)(55016002)(81166007)(7696005)(82740400003)(26005)(356005)(82310400002)(4744005)(6506007)(9686003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d0627e8a-dbd3-454c-abf9-08d81dd22882
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6E2olDW3Nb1DYq9o2733wrrCVcbgLwsw2tsI5RPqGdfZm0I9Bi8RokxKKZM8B2aSOrX29MdUr5o3og7QlrrewoeKUVrpXJh94jHZrCEjP+VNLLVABSmPopptyaSW1E7H4VhbaMjct+makut0CFrR8IqnV1oaioKmJ83jjal0kpCsRqD/Yi7IBfw4rEvMQIS7QxbJ80ATn+GHG3wh4SdcbRFwj7kMnwA3ecDUfquUF0W9hNCvfoCjVNE9a9OhAqH7HWJw7b4S2FUcAkZNglKjopuzg3wbMcs595smxEPaxMcC+kNpKwkjUej+LrIQzcqPFu5kqWCcAguLrs8+o0aOKyfsZatLw4+PmnACpA836OQVAcJLOOv5990oSb6rwI18xh81BfbT5LzcSWWqq7JI9w==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 15:19:41.4554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cd63b5-1c9d-4b8e-24df-08d81dd22d71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3731
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Test email, please ignore.
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
