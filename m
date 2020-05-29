Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web10.37258.1590766639363169714
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 May 2020 08:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=SAxU6s5O;
 spf=pass (domain: arm.com, ip: 40.107.8.72, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBpo32yIN4J3FEiLKVuuAaL2dXmzjTzvMCTJqnz2B6o=;
 b=SAxU6s5Oj42S42ug+mgfW0B1Nf549p/HZWNvvp82i0LpdTLjaqZFT64L+ggYabRv/h6FAaKwHbMKNmCog2KxDKsKquBft+8/+V5PaaeQLMauz0QwuStEm4xMg7/8Jb2FZRVvv28NQ5VHXtlm/gvmg/EXcShQ+gm25nMpz5CxJB8=
Received: from AM6P195CA0060.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::37)
 by DB6PR0802MB2151.eurprd08.prod.outlook.com (2603:10a6:4:84::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 29 May
 2020 15:37:16 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::8) by AM6P195CA0060.outlook.office365.com
 (2603:10a6:209:87::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Fri, 29 May 2020 15:37:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 29 May 2020 15:37:16 +0000
Received: ("Tessian outbound b157666c5529:v57"); Fri, 29 May 2020 15:37:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24177058e069e23f
X-CR-MTA-TID: 64aa7808
Received: from bec12c36aaf4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 518EA4A4-612E-4FE2-91AE-37F709879482.1;
	Fri, 29 May 2020 15:37:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bec12c36aaf4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 29 May 2020 15:37:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4/ortngytE+2UwQT4PT4VoXYisAd4GAejk7kPtnARxP9rO5gg536AW3qD4Cwu7L46ulqPFAi2KkZRkmk8D/ZmfduBXLz9H25vo/tMoDo6sI7D00v9q0AIFX3eS5WkkOr1whswhKLtw9ZLm7XzycpMpJW05zlqti/h9Cs4kwSpnm0HN2nY3x+YAHnpvEmA2NqyrsEAJ5omdRvNq566UGpzUFLHeDD+ZL+f3QSP9TdX3GimhwVwMeZ9GfmRuHkiZNJP5cCEmDNmpxCpYKSzhSWzqzADheiEyHluAY7bzGuD+AgYjNGLd1x981NKYZaL82jydcg8adXc/oYIyPUMGIhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBpo32yIN4J3FEiLKVuuAaL2dXmzjTzvMCTJqnz2B6o=;
 b=XgdywRefwr0okCYc9T4xonvRa71UKsxFAbEg06L4kLKkrMPeZ+X0eVpnGW2/S4bvB/ZJu5FNv14ihUfpEHke800966JK+K99JNKgxVd0o6UjTBSa1JDYqzp+RzPhb8IR1PEQKg7FvGZ9JCchk8atEtd7nyPN1l+JqdM1XYgqjrpXF6FmJNgxaR3YPKsekOzMeZeJjgix79DIC5Ryt2Egv2ToOnrShwcrLvKss9f3OoqiBCMaFha12vC6km5q4lrmD4hHgupOGMyaBiB5F9N08b9yP/INr7wBm+0sjKBPcAWwwyJ7SkMTBL1T4lhisbqfksXf73HyLSZFbpVoaW/leQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBpo32yIN4J3FEiLKVuuAaL2dXmzjTzvMCTJqnz2B6o=;
 b=SAxU6s5Oj42S42ug+mgfW0B1Nf549p/HZWNvvp82i0LpdTLjaqZFT64L+ggYabRv/h6FAaKwHbMKNmCog2KxDKsKquBft+8/+V5PaaeQLMauz0QwuStEm4xMg7/8Jb2FZRVvv28NQ5VHXtlm/gvmg/EXcShQ+gm25nMpz5CxJB8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3882.eurprd08.prod.outlook.com (2603:10a6:10:7d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 15:37:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 15:37:08 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Joshua Watt <JPEWhacker@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
Thread-Topic: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
Thread-Index: AQHWNcvskZ+QueGwKUSOkAT6GqB9t6i/LhQAgAAC7QCAAAFtAA==
Date: Fri, 29 May 2020 15:37:08 +0000
Message-ID: <09986319-6338-471F-A0C1-5096F5ED7AA3@arm.com>
References: <20200529151427.20272-1-JPEWhacker@gmail.com>
 <90DD68A5-0834-4C82-8A06-BC3972756CA3@arm.com>
 <6d6ccf5c-f134-1a15-e5eb-8f5e10d03832@gmail.com>
In-Reply-To: <6d6ccf5c-f134-1a15-e5eb-8f5e10d03832@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 46100c31-7563-4359-f705-08d803e62a94
x-ms-traffictypediagnostic: DB7PR08MB3882:|DB6PR0802MB2151:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2151135A0C2A952ED4950FBE9D8F0@DB6PR0802MB2151.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:923;OLM:923;
x-forefront-prvs: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lOQbj+Mi/v2/DOdL7yBDOwwmH5AFekkkLkYe/vkX5JfWPwHw8GD/5feexyr0ftCLnUj9gjx0CYbyOL4g7Xzt/lK37RAZI5/xnXZSEOVU6NK3YwgPFhWS/A+doh0SNGFoA9IueYF2YgKYRYOg8QyayXPfaWR49AickPKCH7KN/lI315/CdWoQfWWcpESZJward4UO3UptK00kfQIWBPZsp/ColGToR26zrJgyCY+U+zzHx1jylxnm7YTdG3yWeVpY6I4x3lEUkn8HtP76PazF4StMPJeTADBWUMjTNyVLza+3wY3jN1Q+tAO/picfB3+6HA01Zopo99CTjgPgh7LUP41Ze3v7/5Xhr508PDkltAL6ICUZzQWH6+fWk8o2mPysiPVWDWWYhHMTZEGsp9pQFA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(5660300002)(186003)(64756008)(66446008)(2906002)(91956017)(76116006)(66946007)(26005)(66476007)(66556008)(6486002)(966005)(8676002)(478600001)(4326008)(86362001)(6916009)(316002)(83380400001)(33656002)(6512007)(53546011)(6506007)(36756003)(71200400001)(2616005)(54906003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 u1GEN9Sws1viJQ62nIs3rWwizP+anP7Ppn0wFRn6CT+Q2h/lpckibyZKBsOt+e7Rw5KxHz+lWVMBMYRPYczOE//hSK0jhd8brTIgDH0n34K1U1i1WFM70mxx0r7+OzmImt1pR5MAT0shiapXxGzPOLRiflDt9zgZkjhAUkmXR3ECbduZgM5f3SO3tDGtnEFhPGxwUVGGi+J/ZqMyPki7/sCP5zLqkJ0XxjOle9j1cIqnAHutvmYKfu6dEvXUuEhAGTo0NDrt6jQMzoRHGysFV0/FRXp5Xrmuw2PNSvur+dkoOAhc5ZVLsWzIj1ABSu7YjX4bHjgYrSklLztrJ9gDajCCIz63K6bx1nb4DDcJAGXN+M9ZHsMUuHDldq/IfTDgN7X3Ob3hSVVfTE9rCiPuPCKdKAHbni9xG5IGT2JtSOLbe5EbDUPy8NmWnB6SKiXXDNXacH+drGbZ1XyXUc4vUjSJHi+tAISPhXiDj1SG9OWNxVykzlzCNpT4hVl1dTLx
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3882
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966005)(6512007)(53546011)(6506007)(186003)(36756003)(26005)(478600001)(966005)(54906003)(36906005)(82310400002)(356005)(316002)(70206006)(70586007)(33656002)(81166007)(6486002)(82740400003)(86362001)(5660300002)(47076004)(6862004)(336012)(8676002)(4326008)(8936002)(83380400001)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cc397293-6ee1-40d7-eae2-08d803e625f5
X-Forefront-PRVS: 04180B6720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lUBYONDlFvPLEkPJX/zazWGKRX9N7QdY6d/vNQxlOLC08/AZ6YvWMzYjvvSCAMPS+u4Mg6+h171AmGwdFR17Zz8nUmo0HW6hM9Jd+4bCROzBFc/b3uYi4q30PgQa6/e4NswICIv9eHQ+i7x7CmDhogwZEO6riBLuy6dRmPfNoevyzplRQWL+TpAFjJcvveFJAhrL4aL/3bURdxFCttIa1nymK8Ko6uuWZ/A5cRZFWBidljSUSHHyQTHvpGHntJX6be05ykdNkaPA3nGq7kYiui/2Jg1q5cXh5mu8aZKUx4NR7vxJLzVhptNqoCrVnjAl7orS16smSPDr+HAZHSjSmgs4bpcUZ+Q+rwUr+D4QZulXVlfJ3tM1bcpLQFpv4ICEhApcE0YXubENdts1WJTGvOvp0vdO/nS7R61zlXu4B1GkdFUg2Y4wEQLmMKbOPso6qsFn0YD+Udb0jiset0+Z4r3zaGBufaBmjbqZqGZ3h2E=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 15:37:16.4122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46100c31-7563-4359-f705-08d803e62a94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2151
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B49601D107A15446B0D627CF7240BD4A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 29 May 2020, at 16:32, Joshua Watt <JPEWhacker@gmail.com> wrote:
>=20
>=20
> On 5/29/20 10:21 AM, Bertrand Marquis wrote:
>>=20
>>> On 29 May 2020, at 16:14, Joshua Watt via lists.yoctoproject.org <JPEW=
hacker=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>=20
>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>> ---
>>> meta-arm/conf/layer.conf | 3 +--
>>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>>=20
>>> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
>>> index d96e9f1..1c241d4 100644
>>> --- a/meta-arm/conf/layer.conf
>>> +++ b/meta-arm/conf/layer.conf
>>> @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm =3D "6"
>>>=20
>>> LAYERDEPENDS_meta-arm =3D " \
>>>     core \
>>> -    meta-python \
>>> "
>>> -LAYERSERIES_COMPAT_meta-arm =3D "warrior zeus dunfell"
>>> +LAYERSERIES_COMPAT_meta-arm =3D "gatesgarth"
>> Could you explain why you want to remove dunfell compatibility ?
>=20
> dunfell doesn't have the required python recipes in oe-core, so it isn't=
 compatible with it anymore.

Nothing has been tested or is compatible with gatesgarth right now so this=
 change will really have a breaking impact.

Bertrand

>=20
>=20
>>=20
>> Bertrand
>>=20
>>> --=20
>>> 2.17.1
>>>=20
>>>=20

