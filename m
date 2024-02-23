Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F933C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 11:36:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.80])
 by mx.groups.io with SMTP id smtpd.web11.8610.1708688190433914544
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Feb 2024 03:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qwfivOie;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qwfivOie;
 spf=pass (domain: arm.com, ip: 40.107.22.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ntCctx60fnrUDZlQolhRIsgYx48sf2IooPjOhDqKyVutRlMAdKa/XJoXiQk6NIXghQsbLx/ErGsfd9xT4oq7rc8n+AM31KPILkwHXOUA3SWQQppDe6TOhv1dpgdUdKHRSSv9coT/DwNBnKqyYqJuE26Wo/fE4bZwJdS6jJl+yT9aSmnUgmfNzeOvpq9SkwUfHrZ2sQApsGC3og2cOB5oPadnFDkY0A4oSV1JSY8APVLsX/sfFGPH2ltuSjfLdUfRmPMD4StKVHrO9VcvQsXgoF8Xn7tCnwTsNHEgzsbsfOcFPaNPwwlrzmNNHRk5mj1T3wReFDnMDk4iESzXYjE2Jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DU+/CWvbPVqC5I+1oDYtGdFEF7o1GB0DHlvs3+v2dzw=;
 b=Do/4uMR3QMAUosXck/wJNAJfCAmQL1Eaj/HTyO8XIjiwF9Y4Ulqzqj6SNbK8dZF4hJCib5hIUkkwibl8IgIsGJ9xhmUUWMHBtP3EHDYM71F+U4TjUo17VV7RI44CE+AfS+wl4vSQYIP0/GAKeUvHcO9X/VveexN/kI35EzAtYs3a8hZz5vagsHBjz7+Vrt5ToHtj+NaloPb97wH6gqChgeHEEXUB1QqEO+6Qlk4RmXun8fjJ1WZmnbJGucLnH+yyQIIVPVXGsITwhXPRAHVQiXsApDpxC8/EtXAsHCuab31wH73tXO97jf91vPHel9HqvY4YLFtqfx+5mbaUMpQlag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DU+/CWvbPVqC5I+1oDYtGdFEF7o1GB0DHlvs3+v2dzw=;
 b=qwfivOieAdrpTXAgIP50kVVrAn54tg2fg/6t+BRnp2LKuC++/nBq+vVwORq/3axyGrmHQYpI9YXqlRCyFY7V/POtD9bnIWmcC5ftAgmoe1oB4ZzufPxgwBpEtW3xheXCL8g3Ko/G9MT0ZFgzMUDKcHsE6MoiRKCpgoIKeNHmxCE=
Received: from AS9PR06CA0515.eurprd06.prod.outlook.com (2603:10a6:20b:49d::7)
 by PA4PR08MB6126.eurprd08.prod.outlook.com (2603:10a6:102:ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 11:36:25 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:49d:cafe::43) by AS9PR06CA0515.outlook.office365.com
 (2603:10a6:20b:49d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.43 via Frontend
 Transport; Fri, 23 Feb 2024 11:36:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.0 via Frontend Transport; Fri, 23 Feb 2024 11:36:25 +0000
Received: ("Tessian outbound 778f5fac34db:v228"); Fri, 23 Feb 2024 11:36:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 56b1d9be5db9d1e5
X-CR-MTA-TID: 64aa7808
Received: from 40c075c3c720.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B67690D4-47F6-4D4D-84F7-D4152D826650.1;
	Fri, 23 Feb 2024 11:36:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 40c075c3c720.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 23 Feb 2024 11:36:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTs44aoxtHENPHImyFf7Ur2qptyy3qyISE74C186j1QY/elqN6iZtGMnni2pvh7Pntps6j/hgK1uMZX7RF9dbM3+7gnG5yV9LuoClclEsMSHfHiK4qTNJ+i8h7HOvpWEvcgTatCCE88k0Jt24iNRI7WEifGTVSTbT850Mx2oGUhWsf9cvBt8+c7JjyoVHgewZhSVwi2FodXdd1YVUsNN3bqQeiljwF/NsMoce9ozED0Xxe/Isltqt4CXZKswkncwIbggUCc+mxzYjR1AA1bUGBUc2rl9MkILF2ybMQtBQYFVxTvpg9xRP8+T/tT5pbOGabEGSXvdiHipd80Ir5/x/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DU+/CWvbPVqC5I+1oDYtGdFEF7o1GB0DHlvs3+v2dzw=;
 b=FbvjECnW7rcP+w6rTws64gvbI4C/pNR9q5P0o9v3iXEQx4lMrJ/v3Fw/zOjOqSlybxsDhAGgGRZdKV08JoxSuMrGPp/17YFIozxCvEBFHClIWR34AuUY/M91wfXnhkksC9NMKM+YYTYpIe1VSRQhHtG20BdONH8dbwpiywm7VXAWTDF7jFIEnlT0fMnAtAY+ppO8lBDVA4AMspwOMC1nZzVNXGv7cTY0Yoea4JspBXbCTmB8D9dDKog7JiU/wdie0DpR0nRlVo9OG0qBQpBCLrkm5pARDfZ+jnX83a5hDPUwTrd6FhliSy7aS4gSeUMtm8gfGvYJob7ws6ljHHPC3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DU+/CWvbPVqC5I+1oDYtGdFEF7o1GB0DHlvs3+v2dzw=;
 b=qwfivOieAdrpTXAgIP50kVVrAn54tg2fg/6t+BRnp2LKuC++/nBq+vVwORq/3axyGrmHQYpI9YXqlRCyFY7V/POtD9bnIWmcC5ftAgmoe1oB4ZzufPxgwBpEtW3xheXCL8g3Ko/G9MT0ZFgzMUDKcHsE6MoiRKCpgoIKeNHmxCE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB3PR08MB9035.eurprd08.prod.outlook.com (2603:10a6:10:429::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 11:36:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 11:36:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] Suggestion about keeping the recipes of LTS releases
Thread-Topic: [meta-arm] Suggestion about keeping the recipes of LTS releases
Thread-Index: AQHaZXx3cLnp6kFE9ku3cNUD7w3swrEXzf2A
Date: Fri, 23 Feb 2024 11:36:13 +0000
Message-ID: <F49E61A1-0C49-495E-AC29-98405E5712DD@arm.com>
References: <pQS5.1708598777054968832.zupm@lists.yoctoproject.org>
In-Reply-To: <pQS5.1708598777054968832.zupm@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB3PR08MB9035:EE_|AM4PEPF00025F9A:EE_|PA4PR08MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 0123396e-aeb5-4280-a63e-08dc3463aaff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7tbUouguDKuz0hHGYVoYMWMp3NmRunXe6KWg/1/V8ymRoOBxOX522T5XfX5h0vy1Yh2YCTDIwiWFOad+q6fl0SyDvCY/eYYwSfMOqlSd+YGFQndzxX6i6qMVk3XuJlT6Z7TV7a+BnRqJN9L8Qd3sm+OnBrgJEXzqCrmVfyvUyu4/NS08wkWSqg/0mtzxE6kMbdeEr7BwAWxS5gBFZGQiI5KQwgfYgJ2NKDR/p5GVm5HBg75RvZrAc/GKkiQluo/OHtJyAGL5k1VVrw1rxfQ6kjA7MhKMC6uuVRliNUq2weOtGP/xzxPxd9HcFFv5mEiHQ0y2BjwkQlM8fZxWeo3S6BjlwZr5r+R3tnRFPLvUn8mR98Xj04GSWAlzAjZ6Uas9oN9e3jT67V3ZVJWMGsxtf80rVzu745nySMEpSd0B/Cbc9iGl/1ZF3NFINGItF0brVafA1RTM6HBCHjQSQF2mIkJgjJt7ojS9ot3ofIcTeQpFnlO4/dic1tMl4SCS8EH5crDzTc1pmNx0MXUR4rrFpOU2I83CfO3xuzq++/ZuGP0jRQ51RbtPIxKV8jLfGmKQmc6hlVugz5oZnYJv56tcyWO4a6iZVt5caClLz70jadP6QZLpeL7/ANz2N/J6wYfg
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <07024D66C72C6D49A7752FF5EBC779E4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9035
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f8416987-38cf-48c7-4f8a-08dc3463a3ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/MQjSwmSxp4T5vqsw9i9tR2Z7JnL7KB0EwHCjX4oJ102ScJCl1DZQAXRBTGk5hwH58NmjiUYb6oxWaQK5CvJyQ0CSzLb7f1tNL1nkzQnOzdSWhFzPaGn8D8nDBqfWf33pRc3qZE1wxlYST3H4ea3jOu+q4/HZudJEgF1zG6mZdrE5nuQg9wo6/QLHc5UxM9L9xi4SvwGtqiRGC4csRdw69uZ22dFxhhzEdNxYM8m67QNs2BaBlInmJOeohfuE2Luhb2qv9Pi68Oia7WCe+FGDeKDat8JGvbhjXd1YaqVQLcqMQb3v/mnCeNc1ST6pRd9GE5+lNwoCWZ42H4zOqy8QF9g7pyVsvErb21Ak/nBpDJmqFZpzUxNMB3C8GW1xV+3dGOeJuJxqtmSSoeNaPVu2yHh8cvvBDuLAi2+6x8ohS4WQ2vPMAjk+nGVvApSYAIuSi4GsiyZirZkPxEHmoKe3ldsBIraMQEAkiBbWZd7BT+xm9rev7dTWm0bxEnHw0dfp1QQ/Gv2OHTK/WI3mdlwmvlMcGIE+4kloIwyOv7kwebQ2lNDu6QsBRMi0r8cQaKZtKesraljKrr1WpvBGcCcnOknIyP0gEpLKjgjKQRygmUZjdWaVrKBxrmYsZyQqko4x4YaCRsarYG4tuJw07hVS3C4u0pUSeZrKu1GkZXyDaQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 11:36:25.4586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0123396e-aeb5-4280-a63e-08dc3463aaff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6126
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Feb 2024 11:36:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5398

T24gMjIgRmViIDIwMjQsIGF0IDEwOjQ2LCBBYmRlbGxhdGlmIEVsIEtobGlmaSB2aWEgbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZyA8YWJkZWxsYXRpZi5lbGtobGlmaT1hcm0uY29tQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IHdyb3RlOg0KPiAgIFdlIHN1Z2dlc3Qga2VlcGluZyB0aGUgcmVjaXBlcyBv
ZiB0aGUgbGFzdCBMVFMgcmVsZWFzZXMgb24gbWV0YS1hcm0gbWFzdGVyLg0KPiAgIFRoaXMgYXBw
bGllcyB0byByZWNpcGVzIG1haW50YWluZWQgaW4gbWV0YS1hcm0gc3VjaCBhczogVEYtQSwgVEYt
TSwgT3B0ZWUgT1MsIFRydXN0ZWQgU2VydmljZXMsIC4uLg0KPiAgIFRoaXMgYXBwcm9hY2ggcHJv
dmlkZXMgdGhlIGZvbGxvd2luZyBhZHZhbnRhZ2VzOg0KPiAgIC0gUmVkdWNlIHRoZSBtYWludGVu
YW5jZSBlZmZvcnRzIGZvciBwbGF0Zm9ybXMgd2hvIHByZWZlciB0byBzdGljayB3aXRoIExUUyBy
ZWxlYXNlcw0KPiAtIEluY3JlYXNlIHRoZSBzdGFiaWxpdHkgb2YgdGhlIGxlZ2FjeSBwbGF0Zm9y
bXMgd2hpY2ggdXNlIExUUw0KDQpGb3IgcmVjaXBlcyBzdWNoIGFzIFRGLUEgd2hpY2ggYXJlIG1h
a2luZyBib3RoIExUUyBhbmQgc2hvcnQtdGVybSByZWxlYXNlcywgSeKAmW0gaGFwcHkgdG8ga2Vl
cCB0aGUgTFRTIHJlbGVhc2VzIGluIHRoZSBicmFuY2hlcy4gIFRoaXMgd2lsbCBiZSBlc3BlY2lh
bGx5IHVzZWZ1bCBmb3IgdGhlIExUUyBtZXRhLWFybSByZWxlYXNlcywgd2hlcmUgc2hpcHBpbmcg
ZmlybXdhcmUgdGhhdCBpc27igJl0IHN1cHBvcnRlZCB3b3VsZCBiZSBhIGJhZCBpZGVhLg0KDQpS
b3NzDQoNCg==

