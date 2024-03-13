Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34C7C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 12:53:41 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.56])
 by mx.groups.io with SMTP id smtpd.web10.15896.1710334412187554039
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 05:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KZHTgLZA;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KZHTgLZA;
 spf=pass (domain: arm.com, ip: 40.107.20.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gqqMps+beZvtFVcTDOopPifEVvQyfd5wrWhEcCqSsHLXDupthi4Wp3wn2W3s2Lxwfhq6/mCq3qg2nGlDiWzuwiUMQsIGPOzsd2OM868BrAYq1ohVd3/B9W6sXa8Jd6IzySS/YJSHK6eIEdTN5JEm4URbVmBHDfBEshLtHtTG3BzG/2Y5ksqYcqFnViVH5nb3wEOfa+6j99xiOrGgHluOqJAAU45GHZKBCtIgtkXWVpEXs2JihMI/SC28zXrrNUbZHqrs06tqEFDVTrFpWILztb0afovBw6JGsOcu1w1poMOuoHCLJJTlJuCR/F8SCGjyx0lve7jBeBnZ6pySGfoMyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMYtOZBUHkgwXI8PqbRqmmL/FaktKJEHLhfcOb54eN4=;
 b=mDL58i7opBLtOzSvOnkACbCsckvsnBmy8Qjhf7o82u/VUZT2EKQHiX2XUXKs5znW5/+ViupN/BcYT8K/wwD3cyhqmOBVp/Rg214UM159NtZUJ5mFj1yFQDKDjCUhJ4yEWMQXeiqTiCH9BiuOw6Ro+A492UrnUQUuAYFfds9JJdt9XTwmrT29vSQAxvvt1kWUHNW203WAc4X7JVnKRH4O7ksa4/1rBYu8Y1bQg07OyzcwQ9XF637yWQQi/2G99WZqEi9bIFjTGbzeaVqwehw3dfoTfJhUB98qpr6Dta82mBFTmKeJuvEdG17AfTz0uLUfw8UulEu6qOvf8WWIv4hA7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMYtOZBUHkgwXI8PqbRqmmL/FaktKJEHLhfcOb54eN4=;
 b=KZHTgLZAu4Piaq9QaXGD7EBFm54rA/kK2HMpP2QqYcErEHxkgTE6sOtMwy+3u2nP93iUEiTylI5cwwQnaPRnctgf9mIr81XoxDzJIZR7cls1jE/AWFKFRzF31y4K61nefJh6pWwM5sFuFuUFEbAdGUiA4Q6PtdfHocRnzxCWHxs=
Received: from DB9PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:10:1da::17)
 by GV1PR08MB10424.eurprd08.prod.outlook.com (2603:10a6:150:15e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 12:53:28 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::62) by DB9PR05CA0012.outlook.office365.com
 (2603:10a6:10:1da::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19 via Frontend
 Transport; Wed, 13 Mar 2024 12:53:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.12 via Frontend Transport; Wed, 13 Mar 2024 12:53:27 +0000
Received: ("Tessian outbound 5fdc1e2b2c35:v276"); Wed, 13 Mar 2024 12:53:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2cdf380d72568a1a
X-CR-MTA-TID: 64aa7808
Received: from 3f37f903a62e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DE14D334-96B7-47C5-A186-5E9899883499.1;
	Wed, 13 Mar 2024 12:53:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3f37f903a62e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 Mar 2024 12:53:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfOJf//bJXaojzIe49zOerBFn8v9hGmSMmY1/G90gRVaGQ8vHeeUlg3zugOxhYkO8GxMWJ2JaRDxKXvFhAgc8XSWE5DGNBwPZ5e8t84+2nhagTyDYnRP8Z5YQmJKy/hiyrfFZlyyZjr9BI3t+2csjUQOr4RrcY5V7GCewtlM4hxjHFW2P7sm6CntSyzmBbF16M/xujlVYmCy07ejPL1e6oQK1Cr1cLhFQN/dZ/JbOdMTNzogaaZt1CQt+8eCvBlpco6+OZ02PsxDAW1Qk0Q/+zUW2WxoTJlByPEb6cQ9Vap4F7BYPhtRvGFcfV/DALsRAIb4WNCrWP3N5xt6cUsxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMYtOZBUHkgwXI8PqbRqmmL/FaktKJEHLhfcOb54eN4=;
 b=oWJ+r+07ErTg8eOAKj7fic3Q7v4Ad5U3Kb3sjb8jzYw92P8WrTVqlLI5GHK7arIarru8rH2meDiSXCFfqguEno1AWW47BOvjE56eRYTbwlAGtfoLS7IuuZ3SMyu6CyCN2rdjGYH0JyjHZ6W7LLBkoEiq8pnG8uPLGgpVr6/oYVQipcjV7i4yYEnbcYdus0oeZVStQnJHTtscKwFzOVKtUvt/90nfmBQXvSlDrVw5EIMx96V8SmtvsOVB0Prp8e9qOq/PP3jjeFhbB7XQSICIHsPp3zxqG1nvO877a+9GhkLB6vkPUT10wBm7cFVlhpyQFM0kxytWjAa+LZMMuM+hRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMYtOZBUHkgwXI8PqbRqmmL/FaktKJEHLhfcOb54eN4=;
 b=KZHTgLZAu4Piaq9QaXGD7EBFm54rA/kK2HMpP2QqYcErEHxkgTE6sOtMwy+3u2nP93iUEiTylI5cwwQnaPRnctgf9mIr81XoxDzJIZR7cls1jE/AWFKFRzF31y4K61nefJh6pWwM5sFuFuUFEbAdGUiA4Q6PtdfHocRnzxCWHxs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8390.eurprd08.prod.outlook.com (2603:10a6:150:bc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 12:53:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7362.035; Wed, 13 Mar 2024
 12:53:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Bence Balogh <Bence.Balogh@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/u-boot: corstone1000: fix
 SMCCC_ARCH_FEATURES detection in the PSCI driver
Thread-Topic: [meta-arm] [PATCH 1/2] arm-bsp/u-boot: corstone1000: fix
 SMCCC_ARCH_FEATURES detection in the PSCI driver
Thread-Index: AQHabiGMMzT70osfGk2n0bDwqxHP+rE1roUA
Date: Wed, 13 Mar 2024 12:53:17 +0000
Message-ID: <DC1EF4AE-96E2-4BBB-9EE8-1486D1B7FBC2@arm.com>
References: <20240304104715.228979-1-bence.balogh@arm.com>
 <20240304104715.228979-2-bence.balogh@arm.com>
In-Reply-To: <20240304104715.228979-2-bence.balogh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8390:EE_|DU2PEPF00028D01:EE_|GV1PR08MB10424:EE_
X-MS-Office365-Filtering-Correlation-Id: 1754e6b8-5110-457c-33bb-08dc435c940f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pBzZISX4cJ9nsLLNAZZGV5dCODizkreEUcS8AmE8LFzydMQ+LaWcWF9Nnq6Md3Chw1+fU6wQELFoo9XTjzj+q2eq/WkbCsxu4gIGGOkPcOiw1CkOle68Q6pEWy4V+VFcJQxBTMy0dxRK4SjeMsjMlbVrSxbeF5f4RNKRfGB/lMzqeU+NhXE2lRG1XmmKTqdeWNCOs6UoPA6+MjUkb6xytlanrHA4BC1OEqmsL0NRZTJuKn011NxZjJ4ZjYYtyJTg8/rveMnBKcvECfEiZCvRXfDY9uUcGcwIGFoq+re7MCUzmWmNjcgCRThsO1StL9XcUqgtaagH/ZNyL6PXRfJYgDC5fee0h9Gs08uUvBwII1nGfEMIkXTvuNUJZu21R/zTgOqoe9XtXLfCq8FDJheKYRwgzhFhvLNSL3sEBqVCBqG3pGb9HuAxWMDLXgZ5rRY9GCLEcIPmjSebaVSJbGAgVqp2RI4sxDIkjtrqpvPAe/POiVwA8TF/znIqJ97fkp72U3aO3aUNk6Hs19hUd7yc6e0IAHb7GZQFflO1beSJLIn9PPqhrPNmNzfEy+AUTPW8BeckAsQ3SS99pMmGXHKsUrlZt/XcCJ3BCp0WYVs7Of/lOEiv888Y6WBZfCO1xBP1sMqFNl/Mg/cpwTBkPs6ZAndTltBOOwwtsWPK+/PTcK4BLrSyEObId7y7oqWp1BDy/IPJ1uVoCFKPnmWYPYNfqu4c8dG2hh0b9NfUQvDUZK4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B63F08EDCF7EC0458D604F38DE6584B5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8390
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6d88e319-192e-4dab-bacc-08dc435c8df4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hoV0Jlai61l8Q5aeabHp9klinXqQJgQiFpsxpkfSg3AWPRcVHGXxaeXgKMkFEvWYZFYYdKMz7uT3X5n06tT9lvESdqzKq55FmNF1RLjYl6GASgK4PJvxPIdCepZcdjNq3FEtLydUzP507ReJr7cA9jhOvpBM+uaByIYxl++5slE99G1HDFbV2N6MRR57tv5UYWCFi0jEgs7/9EuIGxexJLT/azK7xWCStsk9uxba1WO/2ynf00DDH8MbNtWoH4vSB+9oSe00yG76mTgqXmFUwC3g5CTLrd38FaR02QvOJsSNJS304Tj8DyyUrHoKmO1XgukqGHIG4LH9UVw5HVrCQHXbO7NZd3KE3KnKdXw3w0p1PlldQFKplhBh8melKpRgwyg8LDcEDyu2v0RFPLKrFfRdxWkpI0vvddfdfryUvugG9IktDCnh4p36Pn4UGJlCS7XxsJlUhxAsxMauhbVs0UduNWlx89nceftKnv55lGY3hHwcwuT1AoReYEL45BsAKrPDVSVJlEpwtvOw70IUFjgfwDTkEcwt6ATv2nGLQNV3Kdpp4tqH3K14Dr9PgWYZ+AgBHLUQzoEHRrVGu73L3zdwFrWovpwlqv+16gM5x8WKqulHP5SduaOyHguTxTybZZgQcIJvpCx+oV+h9qFCTjJRQjNlBTwSmLN5Lkw/1v3diaRZzNmqbQihjPiDt5MX5BZ36BcFx0w4B0WDUT9aQ4mGvl+BtvY3dIfRjDzViiEygciyofGt55d2wO5DN/AK
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 12:53:27.9844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1754e6b8-5110-457c-33bb-08dc435c940f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10424
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 12:53:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5424

T24gNCBNYXIgMjAyNCwgYXQgMTA6NDcsIGJlbmNlLmJhbG9naCB2aWEgbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZyA8YmVuY2UuYmFsb2doPWFybS5jb21AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gd3Jv
dGU6DQo+ICtTUkNfVVJJOmFwcGVuZCA9ICIgXA0KPiArICAgIGZpbGU6Ly8wMDAxLWZpcm13YXJl
LXBzY2ktRml4LWJpbmRfc21jY2NfZmVhdHVyZXMtcHNjaS1jaGVjay5wYXRjaCBcDQo+ICsiDQoN
ClRoZSBjb21taXQgbWVzc2FnZSBpbXBsaWVzIHRoaXMgaXMgc3BlY2lmaWMgdG8gdGhlIENTMUss
IGJ1dCB0aGlzIHBhdGNoIGlzIGFwcGxpZWQgdG8gX2V2ZXJ5b25lXyBidWlsZGluZyB1LWJvb3Qs
IGV2ZW4gcGVvcGxlIHdobyBhZGQgbWV0YS1hcm0gdG8gdGhlaXIgbGF5ZXIgc2V0dXAgYnV0IGRv
buKAmXQgdXNlIHRoZSBtYWNoaW5lcy4NCg0KSXQgZmVlbHMgbGlrZSB0aGlzIHNob3VsZCBiZSBt
b3ZlZCB0byB0aGUgQ1MxSyBzcGVjaWZpYyBvdmVycmlkZSwgdW5sZXNzIGl0cyBnZW51aW5lbHkg
YSB1c2VmdWwgZml4IGZvciBldmVyeW9uZSBpbiB3aGljaCBjYXNlIHdlIHNob3VsZCBwYXRjaCBv
ZS1jb3JlIGluc3RlYWQuDQoNClJvc3MNCg0K

