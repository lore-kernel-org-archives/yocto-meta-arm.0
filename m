Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF76C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 16:43:42 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.75])
 by mx.groups.io with SMTP id smtpd.web09.1250.1652201019339042577
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 May 2022 09:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=j3OD+MFP;
 spf=pass (domain: arm.com, ip: 40.107.7.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hV8112zYz/moy5OgYDEwkn3ZyU7U1ODpWCcOGwTX8JwAanrr+nBBuJQ5ijt9vCZW9B8lwuX5kK/dAlhuLGpHIzriaMiWAIiURVEgwlVT1YhDxl/nQXZ3uvomhdr148axvcd58Q/DeRZcDEjUkFCSGfO6Vptig4A7uLnq8kAbwRxEr7sPGIEr6K9k7p3pcmeHL866Yvq2cUOvpTStoDIT54yA9fn+P8Iy94fjDH5BNy17mWlQNJB2BTELh9vXqL73iACDupMM+wjh/ADGma20pyK4kFZL3f0EGvaudKu+R+VmVAC4YM/G9M8LtWrHCCdHzfxawONz/4pIUd+OiROA+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Kc2U2rI7xlAR61CmZtmfTqZYXC35FLe1qGr5baGnnI=;
 b=JO2MT7FElInPZx3SS66/c3uAtHCR9XcT+cVjEuOLWsM99Qat7zumH1/vlhbns8UXe0hKvvNn9lohafBtKiQjQrankG2TcVoFy8KA/LY5eXuHJz85qFI5DVFZlhHcMXC9Xe1YohyOF6HTpG6+IBYS5gjpvfLsKxTwWglK+IjwP+bXlwRqyRQEH7yJ715N1zmVsUElnYZH6w0x50N0WcD8grY9yLnCYR/07WjZeAul0SwBBHyizjsPcyLYqm0gyoVfgKZ+J3K2E1ZTO8vALg2UwVMjf+fH7MirnHloXk9+arIqyjVdyUBLEeDdNAdCKRaGSplL1ZL1ue+wL7j+AXW6uw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Kc2U2rI7xlAR61CmZtmfTqZYXC35FLe1qGr5baGnnI=;
 b=j3OD+MFPnQRhD3eGyw0dvQfSYJwg+jj7yK5VIuQuzhIQf4SyeWA4DdjsUDORL31dqyCRKW4vJhVDerzuGxPFMFxJBXW5kDm/PSzok3Dg1/5tHl+eXPtmeIMUojjre6w0px7jqwZlpwI0OOL4cHNlx+IufJZbY5Zj4m94pCLKT2M=
Received: from AM6PR10CA0105.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::46)
 by PA4PR08MB6077.eurprd08.prod.outlook.com (2603:10a6:102:e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 16:43:35 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::be) by AM6PR10CA0105.outlook.office365.com
 (2603:10a6:209:8c::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Tue, 10 May 2022 16:43:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 16:43:34 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Tue, 10 May 2022 16:43:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae2eeac5da7b406e
X-CR-MTA-TID: 64aa7808
Received: from caa587704135.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 51CA77A6-EC12-4C73-AF7C-768D31727EAC.1;
	Tue, 10 May 2022 16:43:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 caa587704135.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 May 2022 16:43:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHQnUttGQ23/a3Q1tDsT2yejKEWTY6lu1j6KOzdr7qhhl4a41Ur6W6dkWPaP0yt0E/U8D1egf5B9CCzbKqweVOQE0fc6G6kinJ1/ii81FrYSz3CyJ4zJdIHRui+jVtzxSWb02+WS8IeNp77VqpYDrmR2ZSx6tg9Qvl0/JtQQvMD6JVfs2t/dm8MhJeuGMOcNslV3Fmc1F279V9DqrgtsBssXG31TkMyeC90w6f6stoXYVidCmM0nkO1puj9Cukz5xJi0VY7kK/XSupF8ucDCJT+5SGqMIhdtip1bPBfD37gksUGVod+4ejTlK5Vb6dqoo+txOEHjyT+JUh+rTES7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Kc2U2rI7xlAR61CmZtmfTqZYXC35FLe1qGr5baGnnI=;
 b=J7gIbP0gaMcPBD2lwOfbSq77UoPgfzuW5/rLhCejHpGJdFcs6Kyd26urZt0XlVz0dK+92whnW9k2pSpueqA9g180o9IbITevED3Nyf7ubDdhEf5PnDGjdO34a/TdOHnZnYrPZht5FdaWRMryrnoAjdpod3rMEjWlfbttzpiDfgECEkn/FrXJ6CY2NMHZqIZUdhITrd6YzjLNr8TeaAwkLrDz/JCTdwM1u5V9Pm5MJBfDZr2JBdOKdQKTsbx70IwEGFPAn+ew1C6ea0aX1RXGoQwLkKy+OXTNUj/jBHgN5r1zp/qF9y/ylce8ooUY+bWAxYJMetZZqYQcLh2Uka6Z0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Kc2U2rI7xlAR61CmZtmfTqZYXC35FLe1qGr5baGnnI=;
 b=j3OD+MFPnQRhD3eGyw0dvQfSYJwg+jj7yK5VIuQuzhIQf4SyeWA4DdjsUDORL31dqyCRKW4vJhVDerzuGxPFMFxJBXW5kDm/PSzok3Dg1/5tHl+eXPtmeIMUojjre6w0px7jqwZlpwI0OOL4cHNlx+IufJZbY5Zj4m94pCLKT2M=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5609.eurprd08.prod.outlook.com (2603:10a6:102:81::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 16:43:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%7]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 16:43:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH] CI: use kirkstone branches for meta-clang and
 meta-virtualization
Thread-Topic: [meta-arm] [PATCH] CI: use kirkstone branches for meta-clang and
 meta-virtualization
Thread-Index: AQHYZI0EbarU6W9RS0uazZdHBCDI1K0YUP8L
Date: Tue, 10 May 2022 16:43:23 +0000
Message-ID: 
 <PA4PR08MB7411BA405048B9BEF696C9DAE8C99@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20220510101508.2785347-1-ross.burton@arm.com>
 <20220510164251.GR9834@denix.org>
In-Reply-To: <20220510164251.GR9834@denix.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a655fedc-12ae-4ef0-bcf0-08da32a4394a
x-ms-traffictypediagnostic: 
	PR3PR08MB5609:EE_|VE1EUR03FT034:EE_|PA4PR08MB6077:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB60777D3375FD6DC9D6156D40E8C99@PA4PR08MB6077.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3bmCBpGtmFdHngAKJqHp/bR9bTeBYbse5b6bBIhSqO50bahpQa/pPTajH3IOxpzTgGemrZ8kFuKjpqoIELO3jO8fTpwr6MiVyuUeWFdrnz5WY8kdWmKsxPmUgaSaMileFsbcuL+mwmj9B+mPqDar7GdqU6ATh7gPHmH2iLlzN/QwEmvT+fC1CUO1gbZTVxQqZYPu21eQz0RcQjj+UaS4tRT57+hlSSHlnuVNvfaIwMy/16PGu17O7rzKjfPZkUCHQU2m2NuYbYipQrn5Wjp4lEN1LeLHxexOSZvF+TzX/+VRNP55T0p72Rilp5OQOF7xne3YIig3bOVeIvELETF4Yk1kfF0oej1rOwWdfM5BBGZkhFP5bn9JD+QGVUc3DUhyy96OfHQQnk6LWHTUbJianJ2F/CHl5oiTgOFAMOPz1tf352ORSabhcQxd0/xvQsiPMZ5/vjg6uhojrCbpS6lLaYRt6e9Y9Dq41At76N2YXT4wW/2jGOL6cW3G8B2Da5QLUFI1JgqLuPVH16AfoWm0w1qCQFcLc8bFjJUbrz9wv7TCCQ1KkXkN65/qCrnu7L0PWsJaZ6wq8ugBSzkGIE0sbHfENuDAt/OQBty+Yt5hZmg4RsHO4pU+05TGJCNzjY917W70qH444fww58zYo7vFQVWKOj6UjkjJqhVeMJSFQa1CU312HTPB0G/LfKbKFZfL1gyvG+HrHyG5Tf0dxMQ/xdCwC9VoGWQsrSn7pSeeRR5opfsQl2eAbqwpBY7pVvVO6W3ZHl+B15Fxmr5htcErNhTvaS2e1WzUchlZiEteTtU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(122000001)(9686003)(53546011)(6506007)(186003)(38070700005)(508600001)(26005)(7696005)(966005)(166002)(38100700002)(86362001)(6916009)(55016003)(54906003)(66446008)(83380400001)(33656002)(5660300002)(64756008)(52536014)(8936002)(91956017)(76116006)(66946007)(66476007)(2906002)(316002)(66556008)(4326008)(8676002);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB7411BA405048B9BEF696C9DAE8C99PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5609
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	38918e11-d41a-474d-279d-08da32a43304
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1q4PaHXT0OI4z6dQc4ibQR4WFasB1aQhZpCdk90DY/KqsTKa51b1kGDl3rHZtRof79vCZwArnBUKU2Yxq47tb+ZuMKeC+dZ+AAWrPocI4C6KETbiWa5o/t2L8BDeqRAVxaiBAiFR5NOTLb3ZyhgdZ8IC+1mgBjMAp0rsLaj8+FWkAQfAp99IiDEAUFQ85OOHfjATnL65BhRkYtORG+Pq3K/+VJOZvY7v1PjbF6AoUFyYPIduWzu/cInZstfXOuRtzjGOd6QDn7mZTLbJa4TE3SFTyw3qNlKU5yb6if2jlM6DrVKcl0VVK7xAWlYHyBec0WPFFJ7mQERedC0Ddl9TOIpYk/gR9+eK4QwrEsh5GG2fjkjosil2Qd7lYWoebpQBS5IS09450g6wXCLkVDPGhLsuMzsWeItOxXatOvtEd5ReDk/gcjkdwB2LGxXmBCNZykcfO6pQ0hnPlfFDObi2ZW9jyZ0yXh2BwJR6U0jv1R8/Nlsm9GZNLz24dSfiG01CeqpBPYhcqplup8KKv6p+NXSsTV1iyFBP8xJcVOkIR2iTvhQtygXmdtE05yfZkOrlnzmdwMZIBcYf0umpefVTPAvc4N3N7Z9Iz9VRSxODewZFUkfuHCt0Qta52KrGzw1b+nhKE7c8iEI6UlrdbrlUagxXoH+xQAlfE64puTxUZU4kYQXmooyUKkfj+EKBNzvya0OeVTsuGqZJZERmNc4yB9658lgGsRwTRYIWq91djqdMfK0WVFRDxQst2pHEXiH6ErqQH1RVh0rht0iMBsRtqQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(54906003)(26005)(8676002)(9686003)(47076005)(316002)(6862004)(40460700003)(33656002)(70206006)(70586007)(33964004)(82310400005)(81166007)(53546011)(83380400001)(52536014)(186003)(5660300002)(6506007)(2906002)(356005)(166002)(508600001)(7696005)(966005)(55016003)(86362001)(8936002)(336012)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 16:43:34.2165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a655fedc-12ae-4ef0-bcf0-08da32a4394a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6077
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 May 2022 16:43:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3377

--_000_PA4PR08MB7411BA405048B9BEF696C9DAE8C99PA4PR08MB7411eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBJIGRpZCDwn5iKDQoNCkZyb206IERlbnlzIERteXRyaXllbmtvIDxkZW5pc0BkZW5peC5v
cmc+DQpEYXRlOiBUdWVzZGF5LCAxMCBNYXkgMjAyMiBhdCAxNzo0Mw0KVG86IFJvc3MgQnVydG9u
IDxSb3NzLkJ1cnRvbkBhcm0uY29tPg0KQ2M6IG1ldGEtYXJtQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmcgPG1ldGEtYXJtQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+LCBuZCA8bmRAYXJtLmNvbT4NClN1
YmplY3Q6IFJlOiBbbWV0YS1hcm1dIFtQQVRDSF0gQ0k6IHVzZSBraXJrc3RvbmUgYnJhbmNoZXMg
Zm9yIG1ldGEtY2xhbmcgYW5kIG1ldGEtdmlydHVhbGl6YXRpb24NCk9uIFR1ZSwgTWF5IDEwLCAy
MDIyIGF0IDExOjE1OjA4QU0gKzAxMDAsIFJvc3MgQnVydG9uIHdyb3RlOg0KPiBUaGVzZSBicmFu
Y2hlcyBoYXZlIGtpcmtzdG9uZSBicmFuY2hlcyBub3csIHNvIHVzZSB0aGVtLg0KDQpEaWQgeW91
IG1lYW4gInRoZXNlICpsYXllcnMqIGhhdmUga2lyc2t0b25lIGJyYW5jaGVzIG5vdyI/DQoNCg0K
PiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4gLS0t
DQo+ICBjaS9jbGFuZy55bWwgICAgICAgICAgICAgICB8IDEgLQ0KPiAgY2kvbWV0YS12aXJ0dWFs
aXphdGlvbi55bWwgfCAxIC0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL2NpL2NsYW5nLnltbCBiL2NpL2NsYW5nLnltbA0KPiBpbmRleCBlNWU3
ZGQ1Zi4uYTIwNjNmMTkgMTAwNjQ0DQo+IC0tLSBhL2NpL2NsYW5nLnltbA0KPiArKysgYi9jaS9j
bGFuZy55bWwNCj4gQEAgLTQsNyArNCw2IEBAIGhlYWRlcjoNCj4gIHJlcG9zOg0KPiAgICBtZXRh
LWNsYW5nOg0KPiAgICAgIHVybDogaHR0cHM6Ly9naXRodWIuY29tL2tyYWovbWV0YS1jbGFuZw0K
PiAtICAgIHJlZnNwZWM6IG1hc3Rlcg0KPg0KPiAgbG9jYWxfY29uZl9oZWFkZXI6DQo+ICAgIGNs
YW5nOiB8DQo+IGRpZmYgLS1naXQgYS9jaS9tZXRhLXZpcnR1YWxpemF0aW9uLnltbCBiL2NpL21l
dGEtdmlydHVhbGl6YXRpb24ueW1sDQo+IGluZGV4IDg3OTFmYzNiLi4xY2QwZTIxYSAxMDA2NDQN
Cj4gLS0tIGEvY2kvbWV0YS12aXJ0dWFsaXphdGlvbi55bWwNCj4gKysrIGIvY2kvbWV0YS12aXJ0
dWFsaXphdGlvbi55bWwNCj4gQEAgLTYsNCArNiwzIEBAIGhlYWRlcjoNCj4gIHJlcG9zOg0KPiAg
ICBtZXRhLXZpcnR1YWxpemF0aW9uOg0KPiAgICAgIHVybDogZ2l0Oi8vZ2l0LnlvY3RvcHJvamVj
dC5vcmcvbWV0YS12aXJ0dWFsaXphdGlvbg0KPiAtICAgIHJlZnNwZWM6IG1hc3Rlcg0KPiAtLQ0K
PiAyLjI1LjENCj4NCg==

--_000_PA4PR08MB7411BA405048B9BEF696C9DAE8C99PA4PR08MB7411eurp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGNtOw0KCWZvbnQtc2l6
ZToxMC4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBz
cGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Ymx1ZTsN
Cgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE5DQoJe21zby1z
dHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5
cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjEN
Cgl7c2l6ZTo2MTIuMHB0IDc5Mi4wcHQ7DQoJbWFyZ2luOjcyLjBwdCA3Mi4wcHQgNzIuMHB0IDcy
LjBwdDt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5
bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1HQiIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBs
ZSIgc3R5bGU9IndvcmQtd3JhcDpicmVhay13b3JkIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9u
MSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtt
c28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+WWVzLCBJIGRpZA0KPC9zcGFuPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1
b3Q7O21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj4mIzEyODUyMjs8L3NwYW4+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQ7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPjxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0O21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwv
c3Bhbj48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNCNUM0
REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwY20gMGNtIDBjbSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
IiBzdHlsZT0ibWFyZ2luLWJvdHRvbToxMi4wcHQiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTIuMHB0O2NvbG9yOmJsYWNrIj5Gcm9tOg0KPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjEyLjBwdDtjb2xvcjpibGFjayI+RGVueXMgRG15dHJpeWVua28gJmx0O2RlbmlzQGRlbml4
Lm9yZyZndDs8YnI+DQo8Yj5EYXRlOiA8L2I+VHVlc2RheSwgMTAgTWF5IDIwMjIgYXQgMTc6NDM8
YnI+DQo8Yj5UbzogPC9iPlJvc3MgQnVydG9uICZsdDtSb3NzLkJ1cnRvbkBhcm0uY29tJmd0Ozxi
cj4NCjxiPkNjOiA8L2I+bWV0YS1hcm1AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyAmbHQ7bWV0YS1h
cm1AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyZndDssIG5kICZsdDtuZEBhcm0uY29tJmd0Ozxicj4N
CjxiPlN1YmplY3Q6IDwvYj5SZTogW21ldGEtYXJtXSBbUEFUQ0hdIENJOiB1c2Uga2lya3N0b25l
IGJyYW5jaGVzIGZvciBtZXRhLWNsYW5nIGFuZCBtZXRhLXZpcnR1YWxpemF0aW9uPG86cD48L286
cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPk9uIFR1ZSwgTWF5IDEwLCAyMDIyIGF0IDExOjE1OjA4
QU0gKzAxMDAsIFJvc3MgQnVydG9uIHdyb3RlOjxicj4NCiZndDsgVGhlc2UgYnJhbmNoZXMgaGF2
ZSBraXJrc3RvbmUgYnJhbmNoZXMgbm93LCBzbyB1c2UgdGhlbS48YnI+DQo8YnI+DQpEaWQgeW91
IG1lYW4gJnF1b3Q7dGhlc2UgKmxheWVycyogaGF2ZSBraXJza3RvbmUgYnJhbmNoZXMgbm93JnF1
b3Q7Pzxicj4NCjxicj4NCjxicj4NCiZndDsgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gJmx0
O3Jvc3MuYnVydG9uQGFybS5jb20mZ3Q7PGJyPg0KJmd0OyAtLS08YnI+DQomZ3Q7Jm5ic3A7IGNp
L2NsYW5nLnltbCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB8IDEgLTxicj4NCiZndDsmbmJz
cDsgY2kvbWV0YS12aXJ0dWFsaXphdGlvbi55bWwgfCAxIC08YnI+DQomZ3Q7Jm5ic3A7IDIgZmls
ZXMgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSk8YnI+DQomZ3Q7IDxicj4NCiZndDsgZGlmZiAtLWdp
dCBhL2NpL2NsYW5nLnltbCBiL2NpL2NsYW5nLnltbDxicj4NCiZndDsgaW5kZXggZTVlN2RkNWYu
LmEyMDYzZjE5IDEwMDY0NDxicj4NCiZndDsgLS0tIGEvY2kvY2xhbmcueW1sPGJyPg0KJmd0OyAr
KysgYi9jaS9jbGFuZy55bWw8YnI+DQomZ3Q7IEBAIC00LDcgKzQsNiBAQCBoZWFkZXI6PGJyPg0K
Jmd0OyZuYnNwOyByZXBvczo8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7IG1ldGEtY2xhbmc6
PGJyPg0KJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB1cmw6IDxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS9rcmFqL21ldGEtY2xhbmciPmh0dHBzOi8vZ2l0aHViLmNvbS9rcmFq
L21ldGEtY2xhbmc8L2E+PGJyPg0KJmd0OyAtJm5ic3A7Jm5ic3A7Jm5ic3A7IHJlZnNwZWM6IG1h
c3Rlcjxicj4NCiZndDsmbmJzcDsgPGJyPg0KJmd0OyZuYnNwOyBsb2NhbF9jb25mX2hlYWRlcjo8
YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNsYW5nOiB8PGJyPg0KJmd0OyBkaWZmIC0tZ2l0
IGEvY2kvbWV0YS12aXJ0dWFsaXphdGlvbi55bWwgYi9jaS9tZXRhLXZpcnR1YWxpemF0aW9uLnlt
bDxicj4NCiZndDsgaW5kZXggODc5MWZjM2IuLjFjZDBlMjFhIDEwMDY0NDxicj4NCiZndDsgLS0t
IGEvY2kvbWV0YS12aXJ0dWFsaXphdGlvbi55bWw8YnI+DQomZ3Q7ICsrKyBiL2NpL21ldGEtdmly
dHVhbGl6YXRpb24ueW1sPGJyPg0KJmd0OyBAQCAtNiw0ICs2LDMgQEAgaGVhZGVyOjxicj4NCiZn
dDsmbmJzcDsgcmVwb3M6PGJyPg0KJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyBtZXRhLXZpcnR1YWxp
emF0aW9uOjxicj4NCiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdXJsOiBnaXQ6
Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9tZXRhLXZpcnR1YWxpemF0aW9uPGJyPg0KJmd0OyAtJm5i
c3A7Jm5ic3A7Jm5ic3A7IHJlZnNwZWM6IG1hc3Rlcjxicj4NCiZndDsgLS0gPGJyPg0KJmd0OyAy
LjI1LjE8YnI+DQomZ3Q7IDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8
L2JvZHk+DQo8L2h0bWw+DQo=

--_000_PA4PR08MB7411BA405048B9BEF696C9DAE8C99PA4PR08MB7411eurp_--

