Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web08.6512.1626954058003386398
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 04:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AcFHrxi3;
 spf=pass (domain: arm.com, ip: 40.107.22.84, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaY5MbNeswxndE5+hGZDJEXXvDM0I61n0obK4arAZm4=;
 b=AcFHrxi3BViBMKThNLSjelkJr5LArWdW6/06F7SjaoA+l9WhV2sqkqZqIWobEFKmQtTJ6j86hFeCJOyRwY4ikog1SAzPBPVaNJUanQkTNjgCFE0LtgJi7+IjNRSM4yF/4n76GaTVeHhULdi/u7TxcwdV5YxlqLpqJuWXqgPgCpE=
Received: from AM6P194CA0040.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::17)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.27; Thu, 22 Jul
 2021 11:40:47 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::d5) by AM6P194CA0040.outlook.office365.com
 (2603:10a6:209:84::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Thu, 22 Jul 2021 11:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 11:40:46 +0000
Received: ("Tessian outbound 809237f40a36:v99"); Thu, 22 Jul 2021 11:40:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 065ad61e178b04d8
X-CR-MTA-TID: 64aa7808
Received: from 28f1232babfb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C1A50DC8-3489-4286-9B41-2652DFA6E657.1;
	Thu, 22 Jul 2021 11:33:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 28f1232babfb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Jul 2021 11:33:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMQy2gRL6bc3LFXivtv28H7T9ph+KB2SWtY7d/c8uJ0Enb3PJWyLpwEYFRPyHfiz/+GL/wzgW/j2vN84zElLNlWpsQInYbathujBfmkv9osmWaghk7/X5WYTIHLjg7QQIHFJfWAQoai2Jpg7D+HMRdwt5NhMTqjWmHvNdWD9eze2cvuLI9g+BP2h8lqfsOEq6JMLZkj0p6kyINQg3lmcT+Ercc+4XZ9CM5KGordGdOJJceHLCF26DaCDDAQsmtd+bzQrYpT9b8iwa+owhLb3cppyFFGiXuJo+hQI7Gm/VwZ2iGziNRpMRTrNfMe/oecCW3NUEyaNe9IzTB63aQ1hhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaY5MbNeswxndE5+hGZDJEXXvDM0I61n0obK4arAZm4=;
 b=lC/b7+1vDifohGZXEA56PdEaZPdheANDvoH6eyDLsLGIAwBLa589iZKcbH4aKlPnJUEsxX3TN3LAt/qY6MCoVr/5v49bJBcSUG7V667EnoUtmnJ6uYqDbhvJM17pNMK7AJtQIdrUQ5CjtlQM7HWaf9uiek9fAh9RaLtTyBCkvsoBzxNnnM6Fm99NGi58RLO3VWciNLXQE7kOXSZpAsxSkwckjNEpkaZN5vB6I8TJx0CYN2IxeYVnqX2lebQrTG7X6iQj4c91t8NGxzkkrx5za1TiUUPFiqW18NfDz0fX2QZV9mT1nn8VO5aM0VPom6YGAGeSHik4ZJ0dICPgpuKFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaY5MbNeswxndE5+hGZDJEXXvDM0I61n0obK4arAZm4=;
 b=AcFHrxi3BViBMKThNLSjelkJr5LArWdW6/06F7SjaoA+l9WhV2sqkqZqIWobEFKmQtTJ6j86hFeCJOyRwY4ikog1SAzPBPVaNJUanQkTNjgCFE0LtgJi7+IjNRSM4yF/4n76GaTVeHhULdi/u7TxcwdV5YxlqLpqJuWXqgPgCpE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by PA4PR08MB5950.eurprd08.prod.outlook.com (2603:10a6:102:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Thu, 22 Jul
 2021 11:33:29 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 11:33:28 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 2/6] arm-bsp/linux: add ffa driver to TC0
Date: Thu, 22 Jul 2021 12:32:46 +0100
Message-ID: <20210722113250.3394087-2-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722113250.3394087-1-arunachalam.ganapathy@arm.com>
References: <20210722113250.3394087-1-arunachalam.ganapathy@arm.com>
X-ClientProxiedBy: LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::13) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.53) by LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Thu, 22 Jul 2021 11:33:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 915a407e-cec1-467d-0ba8-08d94d058bf4
X-MS-TrafficTypeDiagnostic: PA4PR08MB5950:|AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB354427B7245E2C52B4121D0FFBE49@AM6PR08MB3544.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:229;OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: YqCzVHkGpav/P+AR90IDM7v5SaOmIuo8CG/ZsXagmyEh6XBHYe/PuoFUF4lnp/lJEjdT3NVKaVGhqcdd4e52TRfiN7AMwe7ZEBxaLfryWGF334kAdrPJDvlDmmOJOnjxG3/YTfRslEbJqqayhWA90sX3W2DLyuDrfwnfalm/4a/i2kNtHOv050KY3cH/Q6d+Usloe9nPHvfIbcxtambfgN7HOQ6C7QfCbnOlTSHiscis+y6C5rwYybi5pNfucTHxzvah+yq25NGNG3ccQZNmvtr4AjnGS4OuLVYqMDuiJk9XAo/xEuAzaiC0bJObh40rRj5MUyJeM/WHw2WwEKIBGbXa0zaeymon2IPzo568H0jnUw9mZi7E7uDHzHwPgDfz61KaqvKKdAVfwlFy+v8jqd4vXqu2SP7aeu6H1tWwOpkIEF8iN1O6aqLcuQREyaaP8rt8FjFDRRP/eknt+oYRtQds66e2YmavIo0NqBYJLVTp1aG5uzu4bWRDOA84vra/yWg7WkmEK2SCpj7RPaEZB5tosRjRfglL9G/B9FjBpXgoqLjfAyVNFjumT1KTtbUv/jgNxYTIoSnZEtuw4o78qg6fGTpGxo79xwAOftM4X22Sq/pTVF8Juelk3Yqov2Yck9yj69sPqH4D+KHpS9g+O0tZX0JCrJPxHDpKdcQo6BYKKUF2kdCH5W6d6l1X9ANqRmRAtHr2uthQzpxCvdLUFSSVX7R9RBe6LkG/9ZT5QgatPAaxJWWIHNdo/hwMCXhcMLnqY3+rq+bZYnaA9bFV3LI4PeIpHS6FLELp9ZRS4ecrvgzmRX6EUwMOc8J7zQOmuQaMgMZRGOlArh4tWAyRdw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(45080400002)(316002)(6486002)(966005)(8936002)(38100700002)(5660300002)(44832011)(186003)(36756003)(26005)(52116002)(6666004)(66946007)(66476007)(86362001)(508600001)(4326008)(66556008)(8676002)(2906002)(2616005)(83380400001)(30864003)(1076003)(38350700002)(956004)(7696005)(6916009)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDdNWWtYVk1pUFMyU2J3TzM3SDJDcFY3WEtuSmZPTVhpSGduN3hVd0lZSUhv?=
 =?utf-8?B?VVBTVGFHT1FsbTdYRkVtMjEzVHRKZmZwM2ZSckV6UExLTWljRzVlQ2ZnR08w?=
 =?utf-8?B?c2ludEtVK2FxWEtGbDZwRnlkYWtSM3l4dDZiZHV6T2tiUzdqVzNGYk9QZmM5?=
 =?utf-8?B?Tm5QQ2dqSGtEN0lzd0cvNnczUmY3L2x2SHhMZVJ5aitiT2U2b3VpcitUVmov?=
 =?utf-8?B?Q2trVDE0Y01OVThqZFZsK3JYVFk3RkZwZm5Od0xucm9YTkp3bkw0QXF3NXBJ?=
 =?utf-8?B?UWM4WkorSEo4QW5wa051SnQ2bGs5dHI3UzZ6ZFc0TDIzRVV2Q3M1OGNqWjc4?=
 =?utf-8?B?bEhGNE9uelY4OWNlNWE4aWNMeFJBMmZ5TFRlVnFUTWNZNGh5dnEyazd5OFdJ?=
 =?utf-8?B?VjJhR2J5RUlueSt4UmdYZkQ1TjRTa3JVNTd2NEYzeGtvZndQekJuUHRQcVRn?=
 =?utf-8?B?dXduNU1xWUhnUXRNN3lWU3VsbkVjQ0pGU1l1Zm84MkZlVGlNaG9hR0V4d3BV?=
 =?utf-8?B?OGh1NHByZkIvamJqaHk2VjZkWVBPSy9BVmFTdlNiSzBFdEhVTFE5M2w5VWVy?=
 =?utf-8?B?RzNKQ3owaWwrUStDcFdCV0xieWhSL0RPMTNsY0lRaHk4VTl1NmhlK0oraWxZ?=
 =?utf-8?B?Q1dpWUd0dlV5Z1FUNVBTTHdqWlBNTFdGd01xUVppSkJLMHVsWHJUbnFoRGtx?=
 =?utf-8?B?dEwyMnM3K3JpcjhGVzA0TVIxRU1aeUs1elovNUlCTGZqNzNiKzgzb0tsN2ZI?=
 =?utf-8?B?empsNVBpOGZDVXNDMTVmSnJXeDc3Q1A0ZC9yWEpSUEZwcHd5czJ4NGVOS0tZ?=
 =?utf-8?B?VER4aXRqRW55ajhIckxMSThnZXh0MmFzQWo3dHpRMlJBSHhwVVkyM0RQY05K?=
 =?utf-8?B?UmZoeVQ4Z001R01vOE5JWktwV1RLQi93WHRpd01YME1vK3FCYVRtdlNXd1dq?=
 =?utf-8?B?R2hRNnBNVE5CY2JGeW9lbUFnQnNZblZsSkplNTF1UW5LUk9aVjY1T3pZQmg2?=
 =?utf-8?B?b0N2aENTbTREeFN0NEJWSGpBZzhLb282NTl0WnNocXNIcVNhakNSMFMxYnRR?=
 =?utf-8?B?MldpaVJYRjAwWGFQUG5UZERjSi9GZWNtYlI3SU5LMWdhU2JyRWZlMlJPb2tn?=
 =?utf-8?B?eVF1NVNWZGJ2dEs4V1lqWmwvall4V3FKSktQdG9DS3U1Y2NxTURkaXc0cGdp?=
 =?utf-8?B?ZjBUcGJzTHI5UExoZC9WalhMYThXWlpKTUhXVGZBNUlkQTdIVnNGelRUMzU1?=
 =?utf-8?B?Qk8zTGtTWWNqMlBHWjZoenJiZEVKaHpBYzBGVmROdFJwYmxoOVY0SHBqRTVz?=
 =?utf-8?B?eVBvS1hDNXkxTmVPNmllTysrSU5EMHhZRnh3bXZIaW1Ga3poWVNNMzBjQ3Zm?=
 =?utf-8?B?NDZDbkVFT0NUbTZ1QmJickF2MDlRU3Uwcm1SODREamczdmcwRHBtNEUzS2ky?=
 =?utf-8?B?MTZlNjJaN2R5TXQ3YW1mOEpqelNPZmZWNy9GODE0TjlKcnFHTEdrbXRkcTNC?=
 =?utf-8?B?UXhaQmZUNEdrcDBaRFQvUUE4bkdCY1FoaStaRGhZejkxWlFaQ1pLMDZVZ3hi?=
 =?utf-8?B?UWM2RGdvYmE3bE9KM3RFUURIMjhaRmFmTUE4T3ZlWjcyRVhFd1ovRDZBU0E4?=
 =?utf-8?B?bUtIZzAzeUU3QjhOS2N2SXVIR1JpbTdObWpMclVVZlR1ZmJLUXRLNTBUeERk?=
 =?utf-8?B?UGEzem5zQytZMHFOUjAzVlBCUWlEeGpyM3ZGYUYybXhuWUY1YnNkaGJHM1Nn?=
 =?utf-8?Q?X2RO2aO5r6NJVa5y5O5CoLPkSi9CRncxH4m7kyn?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5950
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	429e557a-2a40-404a-4afc-08d94d0486a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AehbeMWQMRRGCCroxH3bqZlpncZEOVr9+JEu4hSnYq4w1Bnb6ZoWMdnOxu21HDdycSJBXZ4zQYP+v+iOWbww1pIroXjquqdKavvuPKo86KoPcNb3sDBo++Gl3dwZ2gwz1CAZp2xbAkUE+0XNng9jET96vEKBytbJs+Jw7XtgIEyDf7rBvR93EnL116dUJKv9j1JnRpx9N04/mBvLCBa+i5d+roaCRqHXtS5EUx9GUklsfWDS7WunEyTS6O02JTNJWj2Zu1xfRAveFDXYLCIqcTiC/ksu18dX4lTulXM/Oe/XTt/KljFQIHhaLDjhWRh/sPSU+uqHrx4W1eQ9rJK83aqNy9CEN2E8aIwxojNvDsy2rNiK8khc3k0C74BPfAq5fAPGbAXi6rOIgca1JNL3SENXxuCviaRqeO23gSViOXKURgWuR0/k4CtS/E0Aul9GI5g4CA1tZlSJXgNcSmNyFmWNzbiccGvS4RsILSkf1PnAlwSwBxiHNv3Cg1hNXUThUCwDImOHbTTPKFT7BZ6ewdoF8znhxy3w4cYBWocWiUt+RR/b+grBwC2jopQKOcsheBxWMjXMxexudJqCgRd97dTrcO331rUOJbd1EDfSvIWBaDu9xoZ4Guv7Z1WuY+XcAiYfbfbauSfICgyQmekv5FRUZbIBPh9tHSZ1GIn0mXeXcb6lgFQtw6LfbE8QsFzjGTAkbk4k6gp0uF37D6ArL/URYoe/YDulTqpDPwqg6caJMeimW1Sm1myecw+IBOXbjtesvxwCnN0+Y3J5rFWr72ohSuZHQHM7fCBRUwEGz9rcjTK83+/xrhcHyQsP/JLUbImgXbWsIgzu0Wj2U14P8Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(396003)(346002)(46966006)(36840700001)(478600001)(6486002)(6916009)(36756003)(81166007)(336012)(82310400003)(2616005)(356005)(956004)(8936002)(8676002)(2906002)(316002)(966005)(83380400001)(26005)(44832011)(4326008)(36860700001)(5660300002)(82740400003)(1076003)(186003)(7696005)(6666004)(70206006)(86362001)(30864003)(70586007)(45080400002)(47076005)(579004)(559001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 11:40:46.7148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 915a407e-cec1-467d-0ba8-08d94d058bf4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This includes the initial version of ffa driver and optee driver
support for FF-A to ACK 5.10

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I8a2c6d0e26422bd2183f3c1f370b0c08eeba7c1e
---
 .../linux/linux-arm-platforms.inc             |   13 +
 ...support-for-SMCCCv1.2-extended-input.patch |  188 +++
 ...-Add-initial-FFA-bus-support-for-dev.patch |  420 ++++++
 ...a-Add-initial-Arm-FFA-driver-support.patch |  415 ++++++
 ...-Add-support-for-SMCCC-as-transport-.patch |  115 ++
 ...-Setup-in-kernel-users-of-FFA-partit.patch |  398 ++++++
 ..._ffa-Add-support-for-MEM_-interfaces.patch |  406 ++++++
 ...e-add-sec_world_id-to-struct-tee_shm.patch |   44 +
 .../0016-optee-simplify-optee_release.patch   |  179 +++
 .../tc0/0017-optee-sync-OP-TEE-headers.patch  |  644 +++++++++
 ...actor-driver-with-internal-callbacks.patch |  720 ++++++++++
 .../0019-optee-add-a-FF-A-memory-pool.patch   |  131 ++
 .../tc0/0020-optee-add-FF-A-support.patch     | 1269 +++++++++++++++++
 ...-optee-hack-for-UUID-endianess-issue.patch |   58 +
 14 files changed, 5000 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0009-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0010-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0011-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0012-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0013-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0014-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0015-tee-add-sec_world_id-to-struct-tee_shm.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0016-optee-simplify-optee_release.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0017-optee-sync-OP-TEE-headers.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0018-optee-refactor-driver-with-internal-callbacks.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0019-optee-add-a-FF-A-memory-pool.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0020-optee-add-FF-A-support.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0021-drivers-optee-hack-for-UUID-endianess-issue.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/me=
ta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 0a679da..ef87fd6 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -85,6 +85,19 @@ SRC_URI_append_tc0 =3D " \
     file://0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch \
     file://0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch \
     file://0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch=
 \
+    file://0009-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch=
 \
+    file://0010-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch=
 \
+    file://0011-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch =
\
+    file://0012-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch=
 \
+    file://0013-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch=
 \
+    file://0014-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch \
+    file://0015-tee-add-sec_world_id-to-struct-tee_shm.patch \
+    file://0016-optee-simplify-optee_release.patch \
+    file://0017-optee-sync-OP-TEE-headers.patch \
+    file://0018-optee-refactor-driver-with-internal-callbacks.patch \
+    file://0019-optee-add-a-FF-A-memory-pool.patch \
+    file://0020-optee-add-FF-A-support.patch \
+    file://0021-drivers-optee-hack-for-UUID-endianess-issue.patch \
     "
=20
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/000=
9-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0009-arm64-smccc-Add-support=
-for-SMCCCv1.2-extended-input.patch
new file mode 100644
index 0000000..ddcc488
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0009-arm64=
-smccc-Add-support-for-SMCCCv1.2-extended-input.patch
@@ -0,0 +1,188 @@
+From 6cc4b54570d508413982d86bf68f60ccdb8687f8 Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Fri, 30 Apr 2021 11:24:24 +0100
+Subject: [PATCH 01/14] arm64: smccc: Add support for SMCCCv1.2 extended
+ input/output registers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+SMCCC v1.2 allows x8-x17 to be used as parameter registers and x4=E2=80=94=
x17
+to be used as result registers in SMC64/HVC64. Arm Firmware Framework
+for Armv8-A specification makes use of x0-x7 as parameter and result
+registers. There are other users like Hyper-V who intend to use beyond
+x0-x7 as well.
+
+Current SMCCC interface in the kernel just use x0-x7 as parameter and
+x0-x3 as result registers as required by SMCCCv1.0. Let us add new
+interface to support this extended set of input/output registers namely
+x0-x17 as both parameter and result registers.
+
+Acked-by: Mark Rutland <mark.rutland@arm.com>
+Tested-by: Michael Kelley <mikelley@microsoft.com>
+Reviewed-by: Michael Kelley <mikelley@microsoft.com>
+Cc: Will Deacon <will@kernel.org>
+Cc: Catalin Marinas <catalin.marinas@arm.com>
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git=
/sudeep.holla/linux.git/commit/?h=3Dv5.10/ffa&id=3Dd3d7f68912d370e80f7c293e=
04c8fecf76d704c5]
+---
+ arch/arm64/kernel/asm-offsets.c |  9 ++++++
+ arch/arm64/kernel/smccc-call.S  | 57 +++++++++++++++++++++++++++++++++
+ include/linux/arm-smccc.h       | 55 +++++++++++++++++++++++++++++++
+ 3 files changed, 121 insertions(+)
+
+diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offse=
ts.c
+index f396d951ee54..6545c497064e 100644
+--- a/arch/arm64/kernel/asm-offsets.c
++++ b/arch/arm64/kernel/asm-offsets.c
+@@ -138,6 +138,15 @@ int main(void)
+   DEFINE(ARM_SMCCC_RES_X2_OFFS,		offsetof(struct arm_smccc_res, a2));
+   DEFINE(ARM_SMCCC_QUIRK_ID_OFFS,	offsetof(struct arm_smccc_quirk, id));
+   DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS,	offsetof(struct arm_smccc_quirk, sta=
te));
++  DEFINE(ARM_SMCCC_1_2_REGS_X0_OFFS,	offsetof(struct arm_smccc_1_2_regs, =
a0));
++  DEFINE(ARM_SMCCC_1_2_REGS_X2_OFFS,	offsetof(struct arm_smccc_1_2_regs, =
a2));
++  DEFINE(ARM_SMCCC_1_2_REGS_X4_OFFS,	offsetof(struct arm_smccc_1_2_regs, =
a4));
++  DEFINE(ARM_SMCCC_1_2_REGS_X6_OFFS,	offsetof(struct arm_smccc_1_2_regs, =
a6));
++  DEFINE(ARM_SMCCC_1_2_REGS_X8_OFFS,	offsetof(struct arm_smccc_1_2_regs, =
a8));
++  DEFINE(ARM_SMCCC_1_2_REGS_X10_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a10));
++  DEFINE(ARM_SMCCC_1_2_REGS_X12_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a12));
++  DEFINE(ARM_SMCCC_1_2_REGS_X14_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a14));
++  DEFINE(ARM_SMCCC_1_2_REGS_X16_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a16));
+   BLANK();
+   DEFINE(HIBERN_PBE_ORIG,	offsetof(struct pbe, orig_address));
+   DEFINE(HIBERN_PBE_ADDR,	offsetof(struct pbe, address));
+diff --git a/arch/arm64/kernel/smccc-call.S b/arch/arm64/kernel/smccc-call=
.S
+index d62447964ed9..2def9d0dd3dd 100644
+--- a/arch/arm64/kernel/smccc-call.S
++++ b/arch/arm64/kernel/smccc-call.S
+@@ -43,3 +43,60 @@ SYM_FUNC_START(__arm_smccc_hvc)
+ 	SMCCC	hvc
+ SYM_FUNC_END(__arm_smccc_hvc)
+ EXPORT_SYMBOL(__arm_smccc_hvc)
++
++	.macro SMCCC_1_2 instr
++	/* Save `res` and free a GPR that won't be clobbered */
++	stp     x1, x19, [sp, #-16]!
++
++	/* Ensure `args` won't be clobbered while loading regs in next step */
++	mov	x19, x0
++
++	/* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
++	ldp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
++	ldp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
++	ldp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
++	ldp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
++	ldp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
++	ldp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
++	ldp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
++	ldp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
++	ldp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
++
++	\instr #0
++
++	/* Load the `res` from the stack */
++	ldr	x19, [sp]
++
++	/* Store the registers x0 - x17 into the result structure */
++	stp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
++	stp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
++	stp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
++	stp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
++	stp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
++	stp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
++	stp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
++	stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
++	stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
++
++	/* Restore original x19 */
++	ldp     xzr, x19, [sp], #16
++	ret
++.endm
++
++/*
++ * void arm_smccc_1_2_hvc(const struct arm_smccc_1_2_regs *args,
++ *			  struct arm_smccc_1_2_regs *res);
++ */
++SYM_FUNC_START(arm_smccc_1_2_hvc)
++	SMCCC_1_2 hvc
++SYM_FUNC_END(arm_smccc_1_2_hvc)
++EXPORT_SYMBOL(arm_smccc_1_2_hvc)
++
++/*
++ * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
++ *			  struct arm_smccc_1_2_regs *res);
++ */
++SYM_FUNC_START(arm_smccc_1_2_smc)
++	SMCCC_1_2 smc
++SYM_FUNC_END(arm_smccc_1_2_smc)
++EXPORT_SYMBOL(arm_smccc_1_2_smc)
+diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
+index 62c54234576c..c8eb24af3c62 100644
+--- a/include/linux/arm-smccc.h
++++ b/include/linux/arm-smccc.h
+@@ -186,6 +186,61 @@ struct arm_smccc_res {
+ 	unsigned long a3;
+ };
+=20
++#ifdef CONFIG_ARM64
++/**
++ * struct arm_smccc_1_2_regs - Arguments for or Results from SMC/HVC call
++ * @a0-a17 argument values from registers 0 to 17
++ */
++struct arm_smccc_1_2_regs {
++	unsigned long a0;
++	unsigned long a1;
++	unsigned long a2;
++	unsigned long a3;
++	unsigned long a4;
++	unsigned long a5;
++	unsigned long a6;
++	unsigned long a7;
++	unsigned long a8;
++	unsigned long a9;
++	unsigned long a10;
++	unsigned long a11;
++	unsigned long a12;
++	unsigned long a13;
++	unsigned long a14;
++	unsigned long a15;
++	unsigned long a16;
++	unsigned long a17;
++};
++
++/**
++ * arm_smccc_1_2_hvc() - make HVC calls
++ * @args: arguments passed via struct arm_smccc_1_2_regs
++ * @res: result values via struct arm_smccc_1_2_regs
++ *
++ * This function is used to make HVC calls following SMC Calling Conventi=
on
++ * v1.2 or above. The content of the supplied param are copied from the
++ * structure to registers prior to the HVC instruction. The return values
++ * are updated with the content from registers on return from the HVC
++ * instruction.
++ */
++asmlinkage void arm_smccc_1_2_hvc(const struct arm_smccc_1_2_regs *args,
++				  struct arm_smccc_1_2_regs *res);
++
++/**
++ * arm_smccc_1_2_smc() - make SMC calls
++ * @args: arguments passed via struct arm_smccc_1_2_regs
++ * @res: result values via struct arm_smccc_1_2_regs
++ *
++ * This function is used to make SMC calls following SMC Calling Conventi=
on
++ * v1.2 or above. The content of the supplied param are copied from the
++ * structure to registers prior to the SMC instruction. The return values
++ * are updated with the content from registers on return from the SMC
++ * instruction.
++ */
++asmlinkage void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
++				  struct arm_smccc_1_2_regs *res);
++#endif
++
+ /**
+  * struct arm_smccc_quirk - Contains quirk information
+  * @id: quirk identification
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/001=
0-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0010-firmware-arm_ffa-Add-in=
itial-FFA-bus-support-for-dev.patch
new file mode 100644
index 0000000..1083ffe
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0010-firmw=
are-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch
@@ -0,0 +1,420 @@
+From 12e789c445956198f2c09798ecfc44fb2ff98b8e Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Fri, 30 Apr 2021 11:24:33 +0100
+Subject: [PATCH 02/14] firmware: arm_ffa: Add initial FFA bus support for
+ device enumeration
+
+The Arm FF for Armv8-A specification has concept of endpoints or
+partitions. In the Normal world, a partition could be a VM when
+the Virtualization extension is enabled or the kernel itself.
+
+In order to handle multiple partitions, we can create a FFA device for
+each such partition on a dedicated FFA bus. Similarly, different drivers
+requiring FFA transport can be registered on the same bus. We can match
+the device and drivers using UUID. This is mostly for the in-kernel
+users with FFA drivers.
+
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git=
/sudeep.holla/linux.git/commit/?h=3Dv5.10/ffa&id=3D6c31a912d7cf9042d80b24f4=
31f0739d53a7262d]
+---
+ MAINTAINERS                       |   7 +
+ drivers/firmware/Kconfig          |   1 +
+ drivers/firmware/Makefile         |   1 +
+ drivers/firmware/arm_ffa/Kconfig  |  16 +++
+ drivers/firmware/arm_ffa/Makefile |   4 +
+ drivers/firmware/arm_ffa/bus.c    | 207 ++++++++++++++++++++++++++++++
+ include/linux/arm_ffa.h           |  91 +++++++++++++
+ 7 files changed, 327 insertions(+)
+ create mode 100644 drivers/firmware/arm_ffa/Kconfig
+ create mode 100644 drivers/firmware/arm_ffa/Makefile
+ create mode 100644 drivers/firmware/arm_ffa/bus.c
+ create mode 100644 include/linux/arm_ffa.h
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 5234423c477a..d5fdc9e68c89 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -6847,6 +6847,13 @@ F:	include/linux/firewire.h
+ F:	include/uapi/linux/firewire*.h
+ F:	tools/firewire/
+=20
++FIRMWARE FRAMEWORK FOR ARMV8-A
++M:	Sudeep Holla <sudeep.holla@arm.com>
++L:	linux-arm-kernel@lists.infradead.org
++S:	Maintained
++F:	drivers/firmware/arm_ffa/
++F:	include/linux/arm_ffa.h
++
+ FIRMWARE LOADER (request_firmware)
+ M:	Luis Chamberlain <mcgrof@kernel.org>
+ L:	linux-kernel@vger.kernel.org
+diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
+index bfef3d8d14e7..90e6dd32f2cd 100644
+--- a/drivers/firmware/Kconfig
++++ b/drivers/firmware/Kconfig
+@@ -296,6 +296,7 @@ config TURRIS_MOX_RWTM
+ 	  other manufacturing data and also utilize the Entropy Bit Generator
+ 	  for hardware random number generation.
+=20
++source "drivers/firmware/arm_ffa/Kconfig"
+ source "drivers/firmware/broadcom/Kconfig"
+ source "drivers/firmware/google/Kconfig"
+ source "drivers/firmware/efi/Kconfig"
+diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
+index 523173cbff33..3c2af2e98def 100644
+--- a/drivers/firmware/Makefile
++++ b/drivers/firmware/Makefile
+@@ -23,6 +23,7 @@ obj-$(CONFIG_TI_SCI_PROTOCOL)	+=3D ti_sci.o
+ obj-$(CONFIG_TRUSTED_FOUNDATIONS) +=3D trusted_foundations.o
+ obj-$(CONFIG_TURRIS_MOX_RWTM)	+=3D turris-mox-rwtm.o
+=20
++obj-y				+=3D arm_ffa/
+ obj-y				+=3D arm_scmi/
+ obj-y				+=3D broadcom/
+ obj-y				+=3D meson/
+diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm_ffa/K=
config
+new file mode 100644
+index 000000000000..261a3660650a
+--- /dev/null
++++ b/drivers/firmware/arm_ffa/Kconfig
+@@ -0,0 +1,16 @@
++# SPDX-License-Identifier: GPL-2.0-only
++config ARM_FFA_TRANSPORT
++	tristate "Arm Firmware Framework for Armv8-A"
++	depends on OF
++	depends on ARM64
++	default n
++	help
++	  This Firmware Framework(FF) for Arm A-profile processors describes
++	  interfaces that standardize communication between the various
++	  software images which includes communication between images in
++	  the Secure world and Normal world. It also leverages the
++	  virtualization extension to isolate software images provided
++	  by an ecosystem of vendors from each other.
++
++	  This driver provides interface for all the client drivers making
++	  use of the features offered by ARM FF-A.
+diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ffa/=
Makefile
+new file mode 100644
+index 000000000000..bfe4323a8784
+--- /dev/null
++++ b/drivers/firmware/arm_ffa/Makefile
+@@ -0,0 +1,4 @@
++# SPDX-License-Identifier: GPL-2.0-only
++ffa-bus-y =3D bus.o
++ffa-module-objs :=3D $(ffa-bus-y)
++obj-$(CONFIG_ARM_FFA_TRANSPORT) =3D ffa-module.o
+diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus=
.c
+new file mode 100644
+index 000000000000..b743fb2256e9
+--- /dev/null
++++ b/drivers/firmware/arm_ffa/bus.c
+@@ -0,0 +1,207 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Copyright (C) 2020 ARM Ltd.
++ */
++
++#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
++
++#include <linux/arm_ffa.h>
++#include <linux/device.h>
++#include <linux/fs.h>
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/slab.h>
++#include <linux/types.h>
++
++static int ffa_device_match(struct device *dev, struct device_driver *drv=
)
++{
++	const struct ffa_device_id *id_table;
++	struct ffa_device *ffa_dev;
++
++	id_table =3D to_ffa_driver(drv)->id_table;
++	ffa_dev =3D to_ffa_dev(dev);
++
++	while (!uuid_is_null(&id_table->uuid)) {
++		if (uuid_equal(&ffa_dev->uuid, &id_table->uuid))
++			return 1;
++		id_table++;
++	}
++
++	return 0;
++}
++
++static int ffa_device_probe(struct device *dev)
++{
++	struct ffa_driver *ffa_drv =3D to_ffa_driver(dev->driver);
++	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
++
++	if (!ffa_device_match(dev, dev->driver))
++		return -ENODEV;
++
++	return ffa_drv->probe(ffa_dev);
++}
++
++static int ffa_device_uevent(struct device *dev, struct kobj_uevent_env *=
env)
++{
++	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
++
++	return add_uevent_var(env, "MODALIAS=3Darm_ffa:%04x:%pUb",
++			      ffa_dev->vm_id, &ffa_dev->uuid);
++}
++
++static ssize_t partition_id_show(struct device *dev,
++				 struct device_attribute *attr, char *buf)
++{
++	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
++
++	return sprintf(buf, "0x%04x\n", ffa_dev->vm_id);
++}
++static DEVICE_ATTR_RO(partition_id);
++
++static ssize_t uuid_show(struct device *dev, struct device_attribute *att=
r,
++			 char *buf)
++{
++	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
++
++	return sprintf(buf, "%pUb\n", &ffa_dev->uuid);
++}
++static DEVICE_ATTR_RO(uuid);
++
++static struct attribute *ffa_device_attributes_attrs[] =3D {
++	&dev_attr_partition_id.attr,
++	&dev_attr_uuid.attr,
++	NULL,
++};
++ATTRIBUTE_GROUPS(ffa_device_attributes);
++
++struct bus_type ffa_bus_type =3D {
++	.name		=3D "arm_ffa",
++	.match		=3D ffa_device_match,
++	.probe		=3D ffa_device_probe,
++	.uevent		=3D ffa_device_uevent,
++	.dev_groups	=3D ffa_device_attributes_groups,
++};
++EXPORT_SYMBOL_GPL(ffa_bus_type);
++
++int ffa_driver_register(struct ffa_driver *driver, struct module *owner,
++			const char *mod_name)
++{
++	int ret;
++
++	driver->driver.bus =3D &ffa_bus_type;
++	driver->driver.name =3D driver->name;
++	driver->driver.owner =3D owner;
++	driver->driver.mod_name =3D mod_name;
++
++	ret =3D driver_register(&driver->driver);
++	if (!ret)
++		pr_debug("registered new ffa driver %s\n", driver->name);
++
++	return ret;
++}
++EXPORT_SYMBOL_GPL(ffa_driver_register);
++
++void ffa_driver_unregister(struct ffa_driver *driver)
++{
++	driver_unregister(&driver->driver);
++}
++EXPORT_SYMBOL_GPL(ffa_driver_unregister);
++
++static void ffa_release_device(struct device *dev)
++{
++	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
++
++	kfree(ffa_dev);
++}
++
++static int __ffa_devices_unregister(struct device *dev, void *data)
++{
++	ffa_release_device(dev);
++
++	return 0;
++}
++
++static void ffa_devices_unregister(void)
++{
++	bus_for_each_dev(&ffa_bus_type, NULL, NULL,
++			 __ffa_devices_unregister);
++}
++
++bool ffa_device_is_valid(struct ffa_device *ffa_dev)
++{
++	bool valid =3D false;
++	struct device *dev =3D NULL;
++	struct ffa_device *tmp_dev;
++
++	do {
++		dev =3D bus_find_next_device(&ffa_bus_type, dev);
++		tmp_dev =3D to_ffa_dev(dev);
++		if (tmp_dev =3D=3D ffa_dev) {
++			valid =3D true;
++			break;
++		}
++		put_device(dev);
++	} while (dev);
++
++	put_device(dev);
++
++	return valid;
++}
++
++struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id)
++{
++	int ret;
++	struct device *dev;
++	struct ffa_device *ffa_dev;
++
++	ffa_dev =3D kzalloc(sizeof(*ffa_dev), GFP_KERNEL);
++	if (!ffa_dev)
++		return NULL;
++
++	dev =3D &ffa_dev->dev;
++	dev->bus =3D &ffa_bus_type;
++	dev->release =3D ffa_release_device;
++	dev_set_name(&ffa_dev->dev, "arm-ffa-%04x", vm_id);
++
++	ffa_dev->vm_id =3D vm_id;
++	uuid_copy(&ffa_dev->uuid, uuid);
++
++	ret =3D device_register(&ffa_dev->dev);
++	if (ret) {
++		dev_err(dev, "unable to register device %s err=3D%d\n",
++			dev_name(dev), ret);
++		put_device(dev);
++		return NULL;
++	}
++
++	return ffa_dev;
++}
++EXPORT_SYMBOL_GPL(ffa_device_register);
++
++void ffa_device_unregister(struct ffa_device *ffa_dev)
++{
++	if (!ffa_dev)
++		return;
++
++	device_unregister(&ffa_dev->dev);
++}
++EXPORT_SYMBOL_GPL(ffa_device_unregister);
++
++static int __init arm_ffa_bus_init(void)
++{
++	return bus_register(&ffa_bus_type);
++}
++module_init(arm_ffa_bus_init);
++
++static void __exit arm_ffa_bus_exit(void)
++{
++	ffa_devices_unregister();
++	bus_unregister(&ffa_bus_type);
++}
++
++module_exit(arm_ffa_bus_exit);
++
++MODULE_ALIAS("arm-ffa-bus");
++MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
++MODULE_DESCRIPTION("Arm FF-A bus driver");
++MODULE_LICENSE("GPL v2");
+diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
+new file mode 100644
+index 000000000000..aaff89364541
+--- /dev/null
++++ b/include/linux/arm_ffa.h
+@@ -0,0 +1,91 @@
++/* SPDX-License-Identifier: GPL-2.0-only */
++/*
++ * Copyright (C) 2020 ARM Ltd.
++ */
++
++#ifndef _LINUX_ARM_FFA_H
++#define _LINUX_ARM_FFA_H
++
++#include <linux/cdev.h>
++#include <linux/device.h>
++#include <linux/module.h>
++#include <linux/types.h>
++#include <linux/uuid.h>
++
++/* FFA Bus/Device/Driver related */
++struct ffa_device {
++	int vm_id;
++	uuid_t uuid;
++	struct device dev;
++};
++
++#define to_ffa_dev(d) container_of(d, struct ffa_device, dev)
++
++struct ffa_device_id {
++	uuid_t uuid;
++};
++
++struct ffa_driver {
++	const char *name;
++	int (*probe)(struct ffa_device *sdev);
++	void (*remove)(struct ffa_device *sdev);
++	const struct ffa_device_id *id_table;
++
++	struct device_driver driver;
++};
++
++#define to_ffa_driver(d) container_of(d, struct ffa_driver, driver)
++
++static inline void ffa_dev_set_drvdata(struct ffa_device *fdev, void *dat=
a)
++{
++	fdev->dev.driver_data =3D data;
++}
++
++#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
++struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id);
++void ffa_device_unregister(struct ffa_device *ffa_dev);
++int ffa_driver_register(struct ffa_driver *driver, struct module *owner,
++			const char *mod_name);
++void ffa_driver_unregister(struct ffa_driver *driver);
++bool ffa_device_is_valid(struct ffa_device *ffa_dev);
++
++#else
++static inline
++struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id)
++{
++	return NULL;
++}
++
++static inline void ffa_device_unregister(struct ffa_device *dev) {}
++
++static inline int
++ffa_driver_register(struct ffa_driver *driver, struct module *owner,
++		    const char *mod_name)
++{
++	return -EINVAL;
++}
++
++static inline void ffa_driver_unregister(struct ffa_driver *driver) {}
++
++static inline
++bool ffa_device_is_valid(struct ffa_device *ffa_dev) { return false; }
++
++#endif /* CONFIG_ARM_FFA_TRANSPORT */
++
++#define ffa_register(driver) \
++	ffa_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
++#define ffa_unregister(driver) \
++	ffa_driver_unregister(driver)
++
++/**
++ * module_ffa_driver() - Helper macro for registering a psa_ffa driver
++ * @__ffa_driver: ffa_driver structure
++ *
++ * Helper macro for psa_ffa drivers to set up proper module init / exit
++ * functions.  Replaces module_init() and module_exit() and keeps people =
from
++ * printing pointless things to the kernel log when their driver is loade=
d.
++ */
++#define module_ffa_driver(__ffa_driver)	\
++	module_driver(__ffa_driver, ffa_register, ffa_unregister)
++
++#endif /* _LINUX_ARM_FFA_H */
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/001=
1-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0011-firmware-arm_ffa-Add-ini=
tial-Arm-FFA-driver-support.patch
new file mode 100644
index 0000000..5236c23
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0011-firmw=
are-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
@@ -0,0 +1,415 @@
+From 09e109d71c11f6c990d272cf5cc2c5515f184705 Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Fri, 30 Apr 2021 11:24:39 +0100
+Subject: [PATCH 03/14] firmware: arm_ffa: Add initial Arm FFA driver suppo=
rt
+
+This just add a basic driver that sets up the transport(e.g. SMCCC),
+checks the FFA version implemented, get the partition ID for self and
+sets up the Tx/Rx buffers for communication.
+
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git=
/sudeep.holla/linux.git/commit/?h=3Dv5.10/ffa&id=3D13201f9a97be567e8c18fec5=
e357561f41d9b5f6]
+---
+ drivers/firmware/arm_ffa/Makefile |   3 +-
+ drivers/firmware/arm_ffa/bus.c    |  14 +-
+ drivers/firmware/arm_ffa/common.h |  24 +++
+ drivers/firmware/arm_ffa/driver.c | 307 ++++++++++++++++++++++++++++++
+ 4 files changed, 337 insertions(+), 11 deletions(-)
+ create mode 100644 drivers/firmware/arm_ffa/common.h
+ create mode 100644 drivers/firmware/arm_ffa/driver.c
+
+diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ffa/=
Makefile
+index bfe4323a8784..82d0d35c5324 100644
+--- a/drivers/firmware/arm_ffa/Makefile
++++ b/drivers/firmware/arm_ffa/Makefile
+@@ -1,4 +1,5 @@
+ # SPDX-License-Identifier: GPL-2.0-only
+ ffa-bus-y =3D bus.o
+-ffa-module-objs :=3D $(ffa-bus-y)
++ffa-driver-y =3D driver.o
++ffa-module-objs :=3D $(ffa-bus-y) $(ffa-driver-y)
+ obj-$(CONFIG_ARM_FFA_TRANSPORT) =3D ffa-module.o
+diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus=
.c
+index b743fb2256e9..58441266e60d 100644
+--- a/drivers/firmware/arm_ffa/bus.c
++++ b/drivers/firmware/arm_ffa/bus.c
+@@ -13,6 +13,8 @@
+ #include <linux/slab.h>
+ #include <linux/types.h>
+=20
++#include "common.h"
++
+ static int ffa_device_match(struct device *dev, struct device_driver *drv=
)
+ {
+ 	const struct ffa_device_id *id_table;
+@@ -187,21 +189,13 @@ void ffa_device_unregister(struct ffa_device *ffa_de=
v)
+ }
+ EXPORT_SYMBOL_GPL(ffa_device_unregister);
+=20
+-static int __init arm_ffa_bus_init(void)
++int __init arm_ffa_bus_init(void)
+ {
+ 	return bus_register(&ffa_bus_type);
+ }
+-module_init(arm_ffa_bus_init);
+=20
+-static void __exit arm_ffa_bus_exit(void)
++void __exit arm_ffa_bus_exit(void)
+ {
+ 	ffa_devices_unregister();
+ 	bus_unregister(&ffa_bus_type);
+ }
+-
+-module_exit(arm_ffa_bus_exit);
+-
+-MODULE_ALIAS("arm-ffa-bus");
+-MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
+-MODULE_DESCRIPTION("Arm FF-A bus driver");
+-MODULE_LICENSE("GPL v2");
+diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ffa/=
common.h
+new file mode 100644
+index 000000000000..9195f66f826c
+--- /dev/null
++++ b/drivers/firmware/arm_ffa/common.h
+@@ -0,0 +1,24 @@
++/* SPDX-License-Identifier: GPL-2.0 */
++/*
++ * Copyright (C) 2020 ARM Ltd.
++ */
++
++#ifndef _FFA_COMMON_H
++#define _FFA_COMMON_H
++
++#include <linux/arm-smccc.h>
++#include <linux/err.h>
++
++typedef struct arm_smccc_1_2_regs ffa_value_t;
++
++typedef void (ffa_fn)(ffa_value_t, ffa_value_t *);
++
++int __init arm_ffa_bus_init(void);
++void __exit arm_ffa_bus_exit(void);
++
++static inline int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
++{
++	return -EOPNOTSUPP;
++}
++
++#endif /* _FFA_COMMON_H */
+diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/=
driver.c
+new file mode 100644
+index 000000000000..d74f03b773d2
+--- /dev/null
++++ b/drivers/firmware/arm_ffa/driver.c
+@@ -0,0 +1,307 @@
++// SPDX-License-Identifier: GPL-2.0-only
++/*
++ * Arm Firmware Framework for ARMv8-A(FFA) interface driver
++ *
++ * The Arm FFA specification[1] describes a software architecture to
++ * leverages the virtualization extension to isolate software images
++ * provided by an ecosystem of vendors from each other and describes
++ * interfaces that standardize communication between the various software
++ * images including communication between images in the Secure world and
++ * Normal world. Any Hypervisor could use the FFA interfaces to enable
++ * communication between VMs it manages.
++ *
++ * The Hypervisor a.k.a Partition managers in FFA terminology can assign
++ * system resources(Memory regions, Devices, CPU cycles) to the partition=
s
++ * and manage isolation amongst them.
++ *
++ * [1] https://developer.arm.com/docs/den0077/latest
++ *
++ * Copyright (C) 2020 Arm Ltd.
++ */
++
++#define DRIVER_NAME "ARM FF-A"
++#define pr_fmt(fmt) DRIVER_NAME ": " fmt
++
++#include <linux/arm_ffa.h>
++#include <linux/bitfield.h>
++#include <linux/io.h>
++#include <linux/module.h>
++#include <linux/slab.h>
++
++#include "common.h"
++
++#define FFA_DRIVER_VERSION	FFA_VERSION_1_0
++
++#define FFA_SMC(calling_convention, func_num)				\
++	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
++			   ARM_SMCCC_OWNER_STANDARD, (func_num))
++
++#define FFA_SMC_32(func_num)	FFA_SMC(ARM_SMCCC_SMC_32, (func_num))
++#define FFA_SMC_64(func_num)	FFA_SMC(ARM_SMCCC_SMC_64, (func_num))
++
++#define FFA_ERROR			FFA_SMC_32(0x60)
++#define FFA_SUCCESS			FFA_SMC_32(0x61)
++#define FFA_INTERRUPT			FFA_SMC_32(0x62)
++#define FFA_VERSION			FFA_SMC_32(0x63)
++#define FFA_FEATURES			FFA_SMC_32(0x64)
++#define FFA_RX_RELEASE			FFA_SMC_32(0x65)
++#define FFA_RXTX_MAP			FFA_SMC_32(0x66)
++#define FFA_FN64_RXTX_MAP		FFA_SMC_64(0x66)
++#define FFA_RXTX_UNMAP			FFA_SMC_32(0x67)
++#define FFA_PARTITION_INFO_GET		FFA_SMC_32(0x68)
++#define FFA_ID_GET			FFA_SMC_32(0x69)
++#define FFA_MSG_POLL			FFA_SMC_32(0x6A)
++#define FFA_MSG_WAIT			FFA_SMC_32(0x6B)
++#define FFA_YIELD			FFA_SMC_32(0x6C)
++#define FFA_RUN				FFA_SMC_32(0x6D)
++#define FFA_MSG_SEND			FFA_SMC_32(0x6E)
++#define FFA_MSG_SEND_DIRECT_REQ		FFA_SMC_32(0x6F)
++#define FFA_FN64_MSG_SEND_DIRECT_REQ	FFA_SMC_64(0x6F)
++#define FFA_MSG_SEND_DIRECT_RESP	FFA_SMC_32(0x70)
++#define FFA_FN64_MSG_SEND_DIRECT_RESP	FFA_SMC_64(0x70)
++#define FFA_MEM_DONATE			FFA_SMC_32(0x71)
++#define FFA_FN64_MEM_DONATE		FFA_SMC_64(0x71)
++#define FFA_MEM_LEND			FFA_SMC_32(0x72)
++#define FFA_FN64_MEM_LEND		FFA_SMC_64(0x72)
++#define FFA_MEM_SHARE			FFA_SMC_32(0x73)
++#define FFA_FN64_MEM_SHARE		FFA_SMC_64(0x73)
++#define FFA_MEM_RETRIEVE_REQ		FFA_SMC_32(0x74)
++#define FFA_FN64_MEM_RETRIEVE_REQ	FFA_SMC_64(0x74)
++#define FFA_MEM_RETRIEVE_RESP		FFA_SMC_32(0x75)
++#define FFA_MEM_RELINQUISH		FFA_SMC_32(0x76)
++#define FFA_MEM_RECLAIM			FFA_SMC_32(0x77)
++#define FFA_MEM_OP_PAUSE		FFA_SMC_32(0x78)
++#define FFA_MEM_OP_RESUME		FFA_SMC_32(0x79)
++#define FFA_MEM_FRAG_RX			FFA_SMC_32(0x7A)
++#define FFA_MEM_FRAG_TX			FFA_SMC_32(0x7B)
++#define FFA_NORMAL_WORLD_RESUME		FFA_SMC_32(0x7C)
++
++/*
++ * For some calls it is necessary to use SMC64 to pass or return 64-bit v=
alues.
++ * For such calls FFA_FN_NATIVE(name) will choose the appropriate
++ * (native-width) function ID.
++ */
++#ifdef CONFIG_64BIT
++#define FFA_FN_NATIVE(name)	FFA_FN64_##name
++#else
++#define FFA_FN_NATIVE(name)	FFA_##name
++#endif
++
++/* FFA error codes. */
++#define FFA_RET_SUCCESS            (0)
++#define FFA_RET_NOT_SUPPORTED      (-1)
++#define FFA_RET_INVALID_PARAMETERS (-2)
++#define FFA_RET_NO_MEMORY          (-3)
++#define FFA_RET_BUSY               (-4)
++#define FFA_RET_INTERRUPTED        (-5)
++#define FFA_RET_DENIED             (-6)
++#define FFA_RET_RETRY              (-7)
++#define FFA_RET_ABORTED            (-8)
++
++#define MAJOR_VERSION_MASK	GENMASK(30, 16)
++#define MINOR_VERSION_MASK	GENMASK(15, 0)
++#define MAJOR_VERSION(x)	((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
++#define MINOR_VERSION(x)	((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
++#define PACK_VERSION_INFO(major, minor)			\
++	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
++	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
++#define FFA_VERSION_1_0		PACK_VERSION_INFO(1, 0)
++#define FFA_MIN_VERSION		FFA_VERSION_1_0
++
++#define SENDER_ID_MASK		GENMASK(31, 16)
++#define RECEIVER_ID_MASK	GENMASK(15, 0)
++#define SENDER_ID(x)		((u16)(FIELD_GET(SENDER_ID_MASK, (x))))
++#define RECEIVER_ID(x)		((u16)(FIELD_GET(RECEIVER_ID_MASK, (x))))
++#define PACK_TARGET_INFO(s, r)		\
++	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
++
++/**
++ * FF-A specification mentions explicitly about '4K pages'. This should
++ * not be confused with the kernel PAGE_SIZE, which is the translation
++ * granule kernel is configured and may be one among 4K, 16K and 64K.
++ */
++#define FFA_PAGE_SIZE		SZ_4K
++/*
++ * Keeping RX TX buffer size as 4K for now
++ * 64K may be preferred to keep it min a page in 64K PAGE_SIZE config
++ */
++#define RXTX_BUFFER_SIZE	SZ_4K
++
++static ffa_fn *invoke_ffa_fn;
++
++static const int ffa_linux_errmap[] =3D {
++	/* better than switch case as long as return value is continuous */
++	0,		/* FFA_RET_SUCCESS */
++	-EOPNOTSUPP,	/* FFA_RET_NOT_SUPPORTED */
++	-EINVAL,	/* FFA_RET_INVALID_PARAMETERS */
++	-ENOMEM,	/* FFA_RET_NO_MEMORY */
++	-EBUSY,		/* FFA_RET_BUSY */
++	-EINTR,		/* FFA_RET_INTERRUPTED */
++	-EACCES,	/* FFA_RET_DENIED */
++	-EAGAIN,	/* FFA_RET_RETRY */
++	-ECANCELED,	/* FFA_RET_ABORTED */
++};
++
++static inline int ffa_to_linux_errno(int errno)
++{
++	if (errno < FFA_RET_SUCCESS && errno >=3D -ARRAY_SIZE(ffa_linux_errmap))
++		return ffa_linux_errmap[-errno];
++	return -EINVAL;
++}
++
++struct ffa_drv_info {
++	u32 version;
++	u16 vm_id;
++	struct mutex rx_lock; /* lock to protect Rx buffer */
++	struct mutex tx_lock; /* lock to protect Tx buffer */
++	void *rx_buffer;
++	void *tx_buffer;
++};
++
++static struct ffa_drv_info *drv_info;
++
++static int ffa_version_check(u32 *version)
++{
++	ffa_value_t ver;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_VERSION, .a1 =3D FFA_DRIVER_VERSION,
++		      }, &ver);
++
++	if (ver.a0 =3D=3D FFA_RET_NOT_SUPPORTED) {
++		pr_info("FFA_VERSION returned not supported\n");
++		return -EOPNOTSUPP;
++	}
++
++	if (ver.a0 < FFA_MIN_VERSION || ver.a0 > FFA_DRIVER_VERSION) {
++		pr_err("Incompatible version %d.%d found\n",
++		       MAJOR_VERSION(ver.a0), MINOR_VERSION(ver.a0));
++		return -EINVAL;
++	}
++
++	*version =3D ver.a0;
++	pr_info("Version %d.%d found\n", MAJOR_VERSION(ver.a0),
++		MINOR_VERSION(ver.a0));
++	return 0;
++}
++
++static int ffa_rxtx_map(phys_addr_t tx_buf, phys_addr_t rx_buf, u32 pg_cn=
t)
++{
++	ffa_value_t ret;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_FN_NATIVE(RXTX_MAP),
++		      .a1 =3D tx_buf, .a2 =3D rx_buf, .a3 =3D pg_cnt,
++		      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	return 0;
++}
++
++static int ffa_rxtx_unmap(u16 vm_id)
++{
++	ffa_value_t ret;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_RXTX_UNMAP, .a1 =3D PACK_TARGET_INFO(vm_id, 0),
++		      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	return 0;
++}
++
++#define VM_ID_MASK	GENMASK(15, 0)
++static int ffa_id_get(u16 *vm_id)
++{
++	ffa_value_t id;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_ID_GET,
++		      }, &id);
++
++	if (id.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)id.a2);
++
++	*vm_id =3D FIELD_GET(VM_ID_MASK, (id.a2));
++
++	return 0;
++}
++
++static int __init ffa_init(void)
++{
++	int ret;
++
++	ret =3D arm_ffa_bus_init();
++	if (ret)
++		return ret;
++
++	ret =3D ffa_transport_init(&invoke_ffa_fn);
++	if (ret)
++		return ret;
++
++	drv_info =3D kzalloc(sizeof(*drv_info), GFP_KERNEL);
++	if (!drv_info)
++		return -ENOMEM;
++
++	ret =3D ffa_version_check(&drv_info->version);
++	if (ret)
++		goto free_drv_info;
++
++	if (ffa_id_get(&drv_info->vm_id)) {
++		pr_err("failed to obtain VM id for self\n");
++		ret =3D -ENODEV;
++		goto free_drv_info;
++	}
++
++	drv_info->rx_buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL);
++	if (!drv_info->rx_buffer) {
++		ret =3D -ENOMEM;
++		goto free_pages;
++	}
++
++	drv_info->tx_buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL);
++	if (!drv_info->tx_buffer) {
++		ret =3D -ENOMEM;
++		goto free_pages;
++	}
++
++	ret =3D ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
++			   virt_to_phys(drv_info->rx_buffer),
++			   RXTX_BUFFER_SIZE / FFA_PAGE_SIZE);
++	if (ret) {
++		pr_err("failed to register FFA RxTx buffers\n");
++		goto free_pages;
++	}
++
++	mutex_init(&drv_info->rx_lock);
++	mutex_init(&drv_info->tx_lock);
++
++	return 0;
++free_pages:
++	if (drv_info->tx_buffer)
++		free_pages_exact(drv_info->tx_buffer, RXTX_BUFFER_SIZE);
++	free_pages_exact(drv_info->rx_buffer, RXTX_BUFFER_SIZE);
++free_drv_info:
++	kfree(drv_info);
++	return ret;
++}
++module_init(ffa_init);
++
++static void __exit ffa_exit(void)
++{
++	ffa_rxtx_unmap(drv_info->vm_id);
++	free_pages_exact(drv_info->tx_buffer, RXTX_BUFFER_SIZE);
++	free_pages_exact(drv_info->rx_buffer, RXTX_BUFFER_SIZE);
++	kfree(drv_info);
++	arm_ffa_bus_exit();
++}
++module_exit(ffa_exit);
++
++MODULE_ALIAS("arm-ffa");
++MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
++MODULE_DESCRIPTION("Arm FF-A interface driver");
++MODULE_LICENSE("GPL v2");
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/001=
2-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0012-firmware-arm_ffa-Add-su=
pport-for-SMCCC-as-transport-.patch
new file mode 100644
index 0000000..27964e1
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0012-firmw=
are-arm_ffa-Add-support-for-SMCCC-as-transport-.patch
@@ -0,0 +1,115 @@
+From a4e518ab87ffdff5bbfa629334dff4a37524e579 Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Fri, 30 Apr 2021 11:24:43 +0100
+Subject: [PATCH 04/14] firmware: arm_ffa: Add support for SMCCC as transpo=
rt
+ to FFA driver
+
+There are requests to keep the transport separate in order to allow
+other possible transports like virtio. So let us keep the SMCCC transport
+specific routines abstracted.
+
+It is kept simple for now. Once we add another transport, we can develop
+better abstraction.
+
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git=
/sudeep.holla/linux.git/commit/?h=3Dv5.10/ffa&id=3Dba0c60e85cb3773a9e172425=
bd14d76cf9d6e67b]
+---
+ drivers/firmware/arm_ffa/Kconfig  |  5 ++++
+ drivers/firmware/arm_ffa/Makefile |  3 ++-
+ drivers/firmware/arm_ffa/common.h |  4 ++++
+ drivers/firmware/arm_ffa/smccc.c  | 39 +++++++++++++++++++++++++++++++
+ 4 files changed, 50 insertions(+), 1 deletion(-)
+ create mode 100644 drivers/firmware/arm_ffa/smccc.c
+
+diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm_ffa/K=
config
+index 261a3660650a..5e3ae5cf82e8 100644
+--- a/drivers/firmware/arm_ffa/Kconfig
++++ b/drivers/firmware/arm_ffa/Kconfig
+@@ -14,3 +14,8 @@ config ARM_FFA_TRANSPORT
+=20
+ 	  This driver provides interface for all the client drivers making
+ 	  use of the features offered by ARM FF-A.
++
++config ARM_FFA_SMCCC
++	bool
++	default ARM_FFA_TRANSPORT
++	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
+diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ffa/=
Makefile
+index 82d0d35c5324..9d9f37523200 100644
+--- a/drivers/firmware/arm_ffa/Makefile
++++ b/drivers/firmware/arm_ffa/Makefile
+@@ -1,5 +1,6 @@
+ # SPDX-License-Identifier: GPL-2.0-only
+ ffa-bus-y =3D bus.o
+ ffa-driver-y =3D driver.o
+-ffa-module-objs :=3D $(ffa-bus-y) $(ffa-driver-y)
++ffa-transport-$(CONFIG_ARM_FFA_SMCCC) +=3D smccc.o
++ffa-module-objs :=3D $(ffa-bus-y) $(ffa-driver-y) $(ffa-transport-y)
+ obj-$(CONFIG_ARM_FFA_TRANSPORT) =3D ffa-module.o
+diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ffa/=
common.h
+index 9195f66f826c..842451666827 100644
+--- a/drivers/firmware/arm_ffa/common.h
++++ b/drivers/firmware/arm_ffa/common.h
+@@ -16,9 +16,13 @@ typedef void (ffa_fn)(ffa_value_t, ffa_value_t *);
+ int __init arm_ffa_bus_init(void);
+ void __exit arm_ffa_bus_exit(void);
+=20
++#ifdef CONFIG_ARM_FFA_SMCCC
++int __init ffa_transport_init(ffa_fn **invoke_ffa_fn);
++#else
+ static inline int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
+ {
+ 	return -EOPNOTSUPP;
+ }
++#endif
+=20
+ #endif /* _FFA_COMMON_H */
+diff --git a/drivers/firmware/arm_ffa/smccc.c b/drivers/firmware/arm_ffa/s=
mccc.c
+new file mode 100644
+index 000000000000..22c34b788769
+--- /dev/null
++++ b/drivers/firmware/arm_ffa/smccc.c
+@@ -0,0 +1,39 @@
++// SPDX-License-Identifier: GPL-2.0-only
++/*
++ * Copyright (C) 2020 ARM Ltd.
++ */
++
++#include <linux/printk.h>
++
++#include "common.h"
++
++static void __arm_ffa_fn_smc(ffa_value_t args, ffa_value_t *res)
++{
++	arm_smccc_1_2_smc(&args, res);
++}
++
++static void __arm_ffa_fn_hvc(ffa_value_t args, ffa_value_t *res)
++{
++	arm_smccc_1_2_hvc(&args, res);
++}
++
++int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
++{
++	enum arm_smccc_conduit conduit;
++
++	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
++		return -EOPNOTSUPP;
++
++	conduit =3D arm_smccc_1_1_get_conduit();
++	if (conduit =3D=3D SMCCC_CONDUIT_NONE) {
++		pr_err("%s: invalid SMCCC conduit\n", __func__);
++		return -EOPNOTSUPP;
++	}
++
++	if (conduit =3D=3D SMCCC_CONDUIT_SMC)
++		*invoke_ffa_fn =3D __arm_ffa_fn_smc;
++	else
++		*invoke_ffa_fn =3D __arm_ffa_fn_hvc;
++
++	return 0;
++}
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/001=
3-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0013-firmware-arm_ffa-Setup-=
in-kernel-users-of-FFA-partit.patch
new file mode 100644
index 0000000..af28a68
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0013-firmw=
are-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch
@@ -0,0 +1,398 @@
+From 4eff52bdae3113edf0256bfd1e986866f7282365 Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Fri, 30 Apr 2021 11:24:48 +0100
+Subject: [PATCH 05/14] firmware: arm_ffa: Setup in-kernel users of FFA
+ partitions
+
+Parse the FFA nodes from the device-tree and register all the partitions
+whose services will be used in the kernel.
+
+In order to also enable in-kernel users of FFA interface, let us add
+simple set of operations for such devices.
+
+The in-kernel users are registered without the character device interface.
+
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git=
/sudeep.holla/linux.git/commit/?h=3Dv5.10/ffa&id=3Df9a344783c03e17cf58f9846=
e5f689cd5233a844]
+---
+ drivers/firmware/arm_ffa/bus.c    |   9 ++
+ drivers/firmware/arm_ffa/common.h |   3 +
+ drivers/firmware/arm_ffa/driver.c | 213 ++++++++++++++++++++++++++++++
+ include/linux/arm_ffa.h           |  38 +++++-
+ 4 files changed, 262 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus=
.c
+index 58441266e60d..da23100c2e39 100644
+--- a/drivers/firmware/arm_ffa/bus.c
++++ b/drivers/firmware/arm_ffa/bus.c
+@@ -24,6 +24,15 @@ static int ffa_device_match(struct device *dev, struct =
device_driver *drv)
+ 	ffa_dev =3D to_ffa_dev(dev);
+=20
+ 	while (!uuid_is_null(&id_table->uuid)) {
++		/*
++		 * FF-A v1.0 doesn't provide discovery of UUIDs, just the
++		 * partition IDs, so fetch the partitions IDs for this
++		 * id_table UUID and assign the UUID to the device if the
++		 * partition ID matches
++		 */
++		if (uuid_is_null(&ffa_dev->uuid))
++			ffa_device_match_uuid(ffa_dev, &id_table->uuid);
++
+ 		if (uuid_equal(&ffa_dev->uuid, &id_table->uuid))
+ 			return 1;
+ 		id_table++;
+diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ffa/=
common.h
+index 842451666827..80ad71f02235 100644
+--- a/drivers/firmware/arm_ffa/common.h
++++ b/drivers/firmware/arm_ffa/common.h
+@@ -6,6 +6,7 @@
+ #ifndef _FFA_COMMON_H
+ #define _FFA_COMMON_H
+=20
++#include <linux/arm_ffa.h>
+ #include <linux/arm-smccc.h>
+ #include <linux/err.h>
+=20
+@@ -15,6 +16,8 @@ typedef void (ffa_fn)(ffa_value_t, ffa_value_t *);
+=20
+ int __init arm_ffa_bus_init(void);
+ void __exit arm_ffa_bus_exit(void);
++bool ffa_device_is_valid(struct ffa_device *ffa_dev);
++void ffa_device_match_uuid(struct ffa_device *ffa_dev, const uuid_t *uuid=
);
+=20
+ #ifdef CONFIG_ARM_FFA_SMCCC
+ int __init ffa_transport_init(ffa_fn **invoke_ffa_fn);
+diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/=
driver.c
+index d74f03b773d2..cefbb3edf142 100644
+--- a/drivers/firmware/arm_ffa/driver.c
++++ b/drivers/firmware/arm_ffa/driver.c
+@@ -24,9 +24,12 @@
+=20
+ #include <linux/arm_ffa.h>
+ #include <linux/bitfield.h>
++#include <linux/device.h>
+ #include <linux/io.h>
++#include <linux/kernel.h>
+ #include <linux/module.h>
+ #include <linux/slab.h>
++#include <linux/uuid.h>
+=20
+ #include "common.h"
+=20
+@@ -185,6 +188,22 @@ static int ffa_version_check(u32 *version)
+ 	return 0;
+ }
+=20
++static int ffa_rx_release(void)
++{
++	ffa_value_t ret;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_RX_RELEASE,
++		      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	/* check for ret.a0 =3D=3D FFA_RX_RELEASE ? */
++
++	return 0;
++}
++
+ static int ffa_rxtx_map(phys_addr_t tx_buf, phys_addr_t rx_buf, u32 pg_cn=
t)
+ {
+ 	ffa_value_t ret;
+@@ -214,6 +233,64 @@ static int ffa_rxtx_unmap(u16 vm_id)
+ 	return 0;
+ }
+=20
++/* buffer must be sizeof(struct ffa_partition_info) * num_partitions */
++static int
++__ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
++			 struct ffa_partition_info *buffer, int num_partitions)
++{
++	int count;
++	ffa_value_t partition_info;
++
++	mutex_lock(&drv_info->rx_lock);
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_PARTITION_INFO_GET,
++		      .a1 =3D uuid0, .a2 =3D uuid1, .a3 =3D uuid2, .a4 =3D uuid3,
++		      }, &partition_info);
++
++	if (partition_info.a0 =3D=3D FFA_ERROR) {
++		mutex_unlock(&drv_info->rx_lock);
++		return ffa_to_linux_errno((int)partition_info.a2);
++	}
++
++	count =3D partition_info.a2;
++
++	if (buffer && count <=3D num_partitions)
++		memcpy(buffer, drv_info->rx_buffer, sizeof(*buffer) * count);
++
++	ffa_rx_release();
++
++	mutex_unlock(&drv_info->rx_lock);
++
++	return count;
++}
++
++/* buffer is allocated and caller must free the same if returned count > =
0 */
++static int
++ffa_partition_probe(const uuid_t *uuid, struct ffa_partition_info **buffe=
r)
++{
++	int count;
++	u32 uuid0_4[4];
++	struct ffa_partition_info *pbuf;
++
++	export_uuid((u8 *)uuid0_4, uuid);
++	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
++					 uuid0_4[3], NULL, 0);
++	if (count <=3D 0)
++		return count;
++
++	pbuf =3D kcalloc(count, sizeof(*pbuf), GFP_KERNEL);
++	if (!pbuf)
++		return -ENOMEM;
++
++	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
++					 uuid0_4[3], pbuf, count);
++	if (count <=3D 0)
++		kfree(pbuf);
++
++	*buffer =3D pbuf;
++	return count;
++}
++
+ #define VM_ID_MASK	GENMASK(15, 0)
+ static int ffa_id_get(u16 *vm_id)
+ {
+@@ -231,6 +308,140 @@ static int ffa_id_get(u16 *vm_id)
+ 	return 0;
+ }
+=20
++static int ffa_msg_send_direct_req(u16 src_id, u16 dst_id, bool mode_32bi=
t,
++				   struct ffa_send_direct_data *data)
++{
++	u32 req_id, resp_id, src_dst_ids =3D PACK_TARGET_INFO(src_id, dst_id);
++	ffa_value_t ret;
++
++	if (mode_32bit) {
++		req_id =3D FFA_MSG_SEND_DIRECT_REQ;
++		resp_id =3D FFA_MSG_SEND_DIRECT_RESP;
++	} else {
++		req_id =3D FFA_FN_NATIVE(MSG_SEND_DIRECT_REQ);
++		resp_id =3D FFA_FN_NATIVE(MSG_SEND_DIRECT_RESP);
++	}
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D req_id, .a1 =3D src_dst_ids, .a2 =3D 0,
++		      .a3 =3D data->data0, .a4 =3D data->data1, .a5 =3D data->data2,
++		      .a6 =3D data->data3, .a7 =3D data->data4,
++		      }, &ret);
++
++	while (ret.a0 =3D=3D FFA_INTERRUPT)
++		invoke_ffa_fn((ffa_value_t){
++			      .a0 =3D FFA_RUN, .a1 =3D ret.a1,
++			      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	if (ret.a0 =3D=3D resp_id) {
++		data->data0 =3D ret.a3;
++		data->data1 =3D ret.a4;
++		data->data2 =3D ret.a5;
++		data->data3 =3D ret.a6;
++		data->data4 =3D ret.a7;
++		return 0;
++	}
++
++	return -EINVAL;
++}
++
++static u32 ffa_api_version_get(void)
++{
++	return drv_info->version;
++}
++
++static int ffa_partition_info_get(const char *uuid_str,
++				  struct ffa_partition_info *buffer)
++{
++	int count;
++	uuid_t uuid;
++	struct ffa_partition_info *pbuf;
++
++	if (uuid_parse(uuid_str, &uuid)) {
++		pr_err("invalid uuid (%s)\n", uuid_str);
++		return -ENODEV;
++	}
++
++	count =3D ffa_partition_probe(&uuid_null, &pbuf);
++	if (count <=3D 0)
++		return -ENOENT;
++
++	memcpy(buffer, pbuf, sizeof(*pbuf) * count);
++	kfree(pbuf);
++	return 0;
++}
++
++static void ffa_mode_32bit_set(struct ffa_device *dev)
++{
++	dev->mode_32bit =3D true;
++}
++
++static int ffa_sync_send_receive(struct ffa_device *dev,
++				 struct ffa_send_direct_data *data)
++{
++	return ffa_msg_send_direct_req(drv_info->vm_id, dev->vm_id,
++				       dev->mode_32bit, data);
++}
++
++static const struct ffa_dev_ops ffa_ops =3D {
++	.api_version_get =3D ffa_api_version_get,
++	.partition_info_get =3D ffa_partition_info_get,
++	.mode_32bit_set =3D ffa_mode_32bit_set,
++	.sync_send_receive =3D ffa_sync_send_receive,
++};
++
++const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
++{
++	if (ffa_device_is_valid(dev))
++		return &ffa_ops;
++
++	return NULL;
++}
++EXPORT_SYMBOL_GPL(ffa_dev_ops_get);
++
++void ffa_device_match_uuid(struct ffa_device *ffa_dev, const uuid_t *uuid=
)
++{
++	int count, idx;
++	struct ffa_partition_info *pbuf, *tpbuf;
++
++	count =3D ffa_partition_probe(uuid, &pbuf);
++	if (count <=3D 0)
++		return;
++
++	for (idx =3D 0, tpbuf =3D pbuf; idx < count; idx++, tpbuf++)
++		if (tpbuf->id =3D=3D ffa_dev->vm_id)
++			uuid_copy(&ffa_dev->uuid, uuid);
++	kfree(pbuf);
++}
++
++static void ffa_setup_partitions(void)
++{
++	int count, idx;
++	struct ffa_device *ffa_dev;
++	struct ffa_partition_info *pbuf, *tpbuf;
++
++	count =3D ffa_partition_probe(&uuid_null, &pbuf);
++	if (count <=3D 0) {
++		pr_info("%s: No partitions found, error %d\n", __func__, count);
++		return;
++	}
++
++	for (idx =3D 0, tpbuf =3D pbuf; idx < count; idx++, tpbuf++) {
++		ffa_dev =3D ffa_device_register(&uuid_null, tpbuf->id);
++		if (!ffa_dev) {
++			pr_err("%s: failed to register partition ID 0x%x\n",
++			       __func__, tpbuf->id);
++			continue;
++		}
++
++		ffa_dev_set_drvdata(ffa_dev, drv_info);
++	}
++	kfree(pbuf);
++}
++
+ static int __init ffa_init(void)
+ {
+ 	int ret;
+@@ -280,6 +491,8 @@ static int __init ffa_init(void)
+ 	mutex_init(&drv_info->rx_lock);
+ 	mutex_init(&drv_info->tx_lock);
+=20
++	ffa_setup_partitions();
++
+ 	return 0;
+ free_pages:
+ 	if (drv_info->tx_buffer)
+diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
+index aaff89364541..b242fbbce4f0 100644
+--- a/include/linux/arm_ffa.h
++++ b/include/linux/arm_ffa.h
+@@ -6,7 +6,6 @@
+ #ifndef _LINUX_ARM_FFA_H
+ #define _LINUX_ARM_FFA_H
+=20
+-#include <linux/cdev.h>
+ #include <linux/device.h>
+ #include <linux/module.h>
+ #include <linux/types.h>
+@@ -15,6 +14,7 @@
+ /* FFA Bus/Device/Driver related */
+ struct ffa_device {
+ 	int vm_id;
++	bool mode_32bit;
+ 	uuid_t uuid;
+ 	struct device dev;
+ };
+@@ -48,6 +48,7 @@ int ffa_driver_register(struct ffa_driver *driver, struc=
t module *owner,
+ 			const char *mod_name);
+ void ffa_driver_unregister(struct ffa_driver *driver);
+ bool ffa_device_is_valid(struct ffa_device *ffa_dev);
++const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev);
+=20
+ #else
+ static inline
+@@ -70,6 +71,10 @@ static inline void ffa_driver_unregister(struct ffa_dri=
ver *driver) {}
+ static inline
+ bool ffa_device_is_valid(struct ffa_device *ffa_dev) { return false; }
+=20
++const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
++{
++	return NULL;
++}
+ #endif /* CONFIG_ARM_FFA_TRANSPORT */
+=20
+ #define ffa_register(driver) \
+@@ -88,4 +93,35 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev) { =
return false; }
+ #define module_ffa_driver(__ffa_driver)	\
+ 	module_driver(__ffa_driver, ffa_register, ffa_unregister)
+=20
++/* FFA transport related */
++struct ffa_partition_info {
++	u16 id;
++	u16 exec_ctxt;
++/* partition supports receipt of direct requests */
++#define FFA_PARTITION_DIRECT_RECV	BIT(0)
++/* partition can send direct requests. */
++#define FFA_PARTITION_DIRECT_SEND	BIT(1)
++/* partition can send and receive indirect messages. */
++#define FFA_PARTITION_INDIRECT_MSG	BIT(2)
++	u32 properties;
++};
++
++/* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via regist=
ers */
++struct ffa_send_direct_data {
++	unsigned long data0; /* w3/x3 */
++	unsigned long data1; /* w4/x4 */
++	unsigned long data2; /* w5/x5 */
++	unsigned long data3; /* w6/x6 */
++	unsigned long data4; /* w7/x7 */
++};
++
++struct ffa_dev_ops {
++	u32 (*api_version_get)(void);
++	int (*partition_info_get)(const char *uuid_str,
++				  struct ffa_partition_info *buffer);
++	void (*mode_32bit_set)(struct ffa_device *dev);
++	int (*sync_send_receive)(struct ffa_device *dev,
++				 struct ffa_send_direct_data *data);
++};
++
+ #endif /* _LINUX_ARM_FFA_H */
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/001=
4-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/linux-arm64-ack-5.10/tc0/0014-firmware-arm_ffa-Add-suppor=
t-for-MEM_-interfaces.patch
new file mode 100644
index 0000000..a9ff1fc
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0014-firmw=
are-arm_ffa-Add-support-for-MEM_-interfaces.patch
@@ -0,0 +1,406 @@
+From 6795f86f52751608a03cc6de0dda8e28a5c68cd1 Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Fri, 30 Apr 2021 11:24:51 +0100
+Subject: [PATCH 06/14] firmware: arm_ffa: Add support for MEM_* interfaces
+
+Most of the MEM_* APIs share the same parameters, so they can be
+generalised. Currently only MEM_SHARE is implemented and the user space
+interface for that is not added yet.
+
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git=
/sudeep.holla/linux.git/commit/?h=3Dv5.10/ffa&id=3Df27cbd0b3f83cb40ff7385f0=
0d05afe1be7577b2]
+---
+ drivers/firmware/arm_ffa/driver.c | 199 ++++++++++++++++++++++++++++++
+ include/linux/arm_ffa.h           | 139 +++++++++++++++++++++
+ 2 files changed, 338 insertions(+)
+
+diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/=
driver.c
+index cefbb3edf142..056a3fca14d1 100644
+--- a/drivers/firmware/arm_ffa/driver.c
++++ b/drivers/firmware/arm_ffa/driver.c
+@@ -28,6 +28,8 @@
+ #include <linux/io.h>
+ #include <linux/kernel.h>
+ #include <linux/module.h>
++#include <linux/mm.h>
++#include <linux/scatterlist.h>
+ #include <linux/slab.h>
+ #include <linux/uuid.h>
+=20
+@@ -348,6 +350,192 @@ static int ffa_msg_send_direct_req(u16 src_id, u16 d=
st_id, bool mode_32bit,
+ 	return -EINVAL;
+ }
+=20
++static int ffa_mem_first_frag(u32 func_id, phys_addr_t buf, u32 buf_sz,
++			      u32 frag_len, u32 len, u64 *handle)
++{
++	ffa_value_t ret;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D func_id, .a1 =3D len, .a2 =3D frag_len,
++		      .a3 =3D buf, .a4 =3D buf_sz,
++		      }, &ret);
++
++	while (ret.a0 =3D=3D FFA_MEM_OP_PAUSE)
++		invoke_ffa_fn((ffa_value_t){
++			      .a0 =3D FFA_MEM_OP_RESUME,
++			      .a1 =3D ret.a1, .a2 =3D ret.a2,
++			      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	if (ret.a0 !=3D FFA_SUCCESS)
++		return -EOPNOTSUPP;
++
++	if (handle)
++		*handle =3D PACK_HANDLE(ret.a2, ret.a3);
++
++	return frag_len;
++}
++
++static int ffa_mem_next_frag(u64 handle, u32 frag_len)
++{
++	ffa_value_t ret;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_MEM_FRAG_TX,
++		      .a1 =3D HANDLE_LOW(handle), .a2 =3D HANDLE_HIGH(handle),
++		      .a3 =3D frag_len,
++		      }, &ret);
++
++	while (ret.a0 =3D=3D FFA_MEM_OP_PAUSE)
++		invoke_ffa_fn((ffa_value_t){
++			      .a0 =3D FFA_MEM_OP_RESUME,
++			      .a1 =3D ret.a1, .a2 =3D ret.a2,
++			      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	if (ret.a0 !=3D FFA_MEM_FRAG_RX)
++		return -EOPNOTSUPP;
++
++	return ret.a3;
++}
++
++static int
++ffa_transmit_fragment(u32 func_id, phys_addr_t buf, u32 buf_sz, u32 frag_=
len,
++		      u32 len, u64 *handle, bool first)
++{
++	if (!first)
++		return ffa_mem_next_frag(*handle, frag_len);
++
++	return ffa_mem_first_frag(func_id, buf, buf_sz, frag_len, len, handle);
++}
++
++static u32 ffa_get_num_pages_sg(struct scatterlist *sg)
++{
++	u32 num_pages =3D 0;
++
++	do {
++		num_pages +=3D sg->length / FFA_PAGE_SIZE;
++	} while ((sg =3D sg_next(sg)));
++
++	return num_pages;
++}
++
++static int
++ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
++		       struct ffa_mem_ops_args *args)
++{
++	int rc =3D 0;
++	bool first =3D true;
++	phys_addr_t addr =3D 0;
++	struct ffa_composite_mem_region *composite;
++	struct ffa_mem_region_addr_range *constituents;
++	struct ffa_mem_region_attributes *ep_mem_access;
++	struct ffa_mem_region *mem_region =3D buffer;
++	u32 idx, frag_len, length, buf_sz =3D 0, num_entries =3D sg_nents(args->=
sg);
++
++	mem_region->tag =3D args->tag;
++	mem_region->flags =3D args->flags;
++	mem_region->sender_id =3D drv_info->vm_id;
++	mem_region->attributes =3D FFA_MEM_NORMAL | FFA_MEM_WRITE_BACK |
++				 FFA_MEM_INNER_SHAREABLE;
++	ep_mem_access =3D &mem_region->ep_mem_access[0];
++
++	for (idx =3D 0; idx < args->nattrs; idx++, ep_mem_access++) {
++		ep_mem_access->receiver =3D args->attrs[idx].receiver;
++		ep_mem_access->attrs =3D args->attrs[idx].attrs;
++		ep_mem_access->composite_off =3D COMPOSITE_OFFSET(args->nattrs);
++	}
++	mem_region->ep_count =3D args->nattrs;
++
++	composite =3D buffer + COMPOSITE_OFFSET(args->nattrs);
++	composite->total_pg_cnt =3D ffa_get_num_pages_sg(args->sg);
++	composite->addr_range_cnt =3D num_entries;
++
++	length =3D COMPOSITE_CONSTITUENTS_OFFSET(args->nattrs, num_entries);
++	frag_len =3D COMPOSITE_CONSTITUENTS_OFFSET(args->nattrs, 0);
++	if (frag_len > max_fragsize)
++		return -ENXIO;
++
++	if (!args->use_txbuf) {
++		addr =3D virt_to_phys(buffer);
++		buf_sz =3D max_fragsize / FFA_PAGE_SIZE;
++	}
++
++	constituents =3D buffer + frag_len;
++	idx =3D 0;
++	do {
++		if (frag_len =3D=3D max_fragsize) {
++			rc =3D ffa_transmit_fragment(func_id, addr, buf_sz,
++						   frag_len, length,
++						   &args->g_handle, first);
++			if (rc < 0)
++				return -ENXIO;
++
++			first =3D false;
++			idx =3D 0;
++			frag_len =3D 0;
++			constituents =3D buffer;
++		}
++
++		if ((void *)constituents - buffer > max_fragsize) {
++			pr_err("Memory Region Fragment > Tx Buffer size\n");
++			return -EFAULT;
++		}
++
++		constituents->address =3D sg_phys(args->sg);
++		constituents->pg_cnt =3D args->sg->length / FFA_PAGE_SIZE;
++		constituents++;
++		frag_len +=3D sizeof(struct ffa_mem_region_addr_range);
++	} while ((args->sg =3D sg_next(args->sg)));
++
++	return ffa_transmit_fragment(func_id, addr, buf_sz, frag_len,
++				     length, &args->g_handle, first);
++}
++
++static int ffa_memory_ops(u32 func_id, struct ffa_mem_ops_args *args)
++{
++	int ret;
++	void *buffer;
++
++	if (!args->use_txbuf) {
++		buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL);
++		if (!buffer)
++			return -ENOMEM;
++	} else {
++		buffer =3D drv_info->tx_buffer;
++		mutex_lock(&drv_info->tx_lock);
++	}
++
++	ret =3D ffa_setup_and_transmit(func_id, buffer, RXTX_BUFFER_SIZE, args);
++
++	if (args->use_txbuf)
++		mutex_unlock(&drv_info->tx_lock);
++	else
++		free_pages_exact(buffer, RXTX_BUFFER_SIZE);
++
++	return ret < 0 ? ret : 0;
++}
++
++static int ffa_memory_reclaim(u64 g_handle, u32 flags)
++{
++	ffa_value_t ret;
++
++	invoke_ffa_fn((ffa_value_t){
++		      .a0 =3D FFA_MEM_RECLAIM,
++		      .a1 =3D HANDLE_LOW(g_handle), .a2 =3D HANDLE_HIGH(g_handle),
++		      .a3 =3D flags,
++		      }, &ret);
++
++	if (ret.a0 =3D=3D FFA_ERROR)
++		return ffa_to_linux_errno((int)ret.a2);
++
++	return 0;
++}
++
+ static u32 ffa_api_version_get(void)
+ {
+ 	return drv_info->version;
+@@ -386,11 +574,22 @@ static int ffa_sync_send_receive(struct ffa_device *=
dev,
+ 				       dev->mode_32bit, data);
+ }
+=20
++static int
++ffa_memory_share(struct ffa_device *dev, struct ffa_mem_ops_args *args)
++{
++	if (dev->mode_32bit)
++		return ffa_memory_ops(FFA_MEM_SHARE, args);
++
++	return ffa_memory_ops(FFA_FN_NATIVE(MEM_SHARE), args);
++}
++
+ static const struct ffa_dev_ops ffa_ops =3D {
+ 	.api_version_get =3D ffa_api_version_get,
+ 	.partition_info_get =3D ffa_partition_info_get,
+ 	.mode_32bit_set =3D ffa_mode_32bit_set,
+ 	.sync_send_receive =3D ffa_sync_send_receive,
++	.memory_reclaim =3D ffa_memory_reclaim,
++	.memory_share =3D ffa_memory_share,
+ };
+=20
+ const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
+diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
+index b242fbbce4f0..6dc0f4e425b9 100644
+--- a/include/linux/arm_ffa.h
++++ b/include/linux/arm_ffa.h
+@@ -115,6 +115,142 @@ struct ffa_send_direct_data {
+ 	unsigned long data4; /* w7/x7 */
+ };
+=20
++struct ffa_mem_region_addr_range {
++	/* The base IPA of the constituent memory region, aligned to 4 kiB */
++	u64 address;
++	/* The number of 4 kiB pages in the constituent memory region. */
++	u32 pg_cnt;
++	u32 reserved;
++};
++
++struct ffa_composite_mem_region {
++	/*
++	 * The total number of 4 kiB pages included in this memory region. This
++	 * must be equal to the sum of page counts specified in each
++	 * `struct ffa_mem_region_addr_range`.
++	 */
++	u32 total_pg_cnt;
++	/* The number of constituents included in this memory region range */
++	u32 addr_range_cnt;
++	u64 reserved;
++	/** An array of `addr_range_cnt` memory region constituents. */
++	struct ffa_mem_region_addr_range constituents[];
++};
++
++struct ffa_mem_region_attributes {
++	/* The ID of the VM to which the memory is being given or shared. */
++	u16 receiver;
++	/*
++	 * The permissions with which the memory region should be mapped in the
++	 * receiver's page table.
++	 */
++#define FFA_MEM_EXEC		BIT(3)
++#define FFA_MEM_NO_EXEC		BIT(2)
++#define FFA_MEM_RW		BIT(1)
++#define FFA_MEM_RO		BIT(0)
++	u8 attrs;
++	/*
++	 * Flags used during FFA_MEM_RETRIEVE_REQ and FFA_MEM_RETRIEVE_RESP
++	 * for memory regions with multiple borrowers.
++	 */
++#define FFA_MEM_RETRIEVE_SELF_BORROWER	BIT(0)
++	u8 flag;
++	u32 composite_off;
++	/*
++	 * Offset in bytes from the start of the outer `ffa_memory_region` to
++	 * an `struct ffa_mem_region_addr_range`.
++	 */
++	u64 reserved;
++};
++
++struct ffa_mem_region {
++	/* The ID of the VM/owner which originally sent the memory region */
++	u16 sender_id;
++#define FFA_MEM_NORMAL		BIT(5)
++#define FFA_MEM_DEVICE		BIT(4)
++
++#define FFA_MEM_WRITE_BACK	(3 << 2)
++#define FFA_MEM_NON_CACHEABLE	(1 << 2)
++
++#define FFA_DEV_nGnRnE		(0 << 2)
++#define FFA_DEV_nGnRE		(1 << 2)
++#define FFA_DEV_nGRE		(2 << 2)
++#define FFA_DEV_GRE		(3 << 2)
++
++#define FFA_MEM_NON_SHAREABLE	(0)
++#define FFA_MEM_OUTER_SHAREABLE	(2)
++#define FFA_MEM_INNER_SHAREABLE	(3)
++	u8 attributes;
++	u8 reserved_0;
++/*
++ * Clear memory region contents after unmapping it from the sender and
++ * before mapping it for any receiver.
++ */
++#define FFA_MEM_CLEAR			BIT(0)
++/*
++ * Whether the hypervisor may time slice the memory sharing or retrieval
++ * operation.
++ */
++#define FFA_TIME_SLICE_ENABLE		BIT(1)
++
++#define FFA_MEM_RETRIEVE_TYPE_IN_RESP	(0 << 3)
++#define FFA_MEM_RETRIEVE_TYPE_SHARE	(1 << 3)
++#define FFA_MEM_RETRIEVE_TYPE_LEND	(2 << 3)
++#define FFA_MEM_RETRIEVE_TYPE_DONATE	(3 << 3)
++
++#define FFA_MEM_RETRIEVE_ADDR_ALIGN_HINT	BIT(9)
++#define FFA_MEM_RETRIEVE_ADDR_ALIGN(x)		((x) << 5)
++	/* Flags to control behaviour of the transaction. */
++	u32 flags;
++#define HANDLE_LOW_MASK		GENMASK_ULL(31, 0)
++#define HANDLE_HIGH_MASK	GENMASK_ULL(63, 32)
++#define HANDLE_LOW(x)		((u32)(FIELD_GET(HANDLE_LOW_MASK, (x))))
++#define	HANDLE_HIGH(x)		((u32)(FIELD_GET(HANDLE_HIGH_MASK, (x))))
++
++#define PACK_HANDLE(l, h)		\
++	(FIELD_PREP(HANDLE_LOW_MASK, (l)) | FIELD_PREP(HANDLE_HIGH_MASK, (h)))
++	/*
++	 * A globally-unique ID assigned by the hypervisor for a region
++	 * of memory being sent between VMs.
++	 */
++	u64 handle;
++	/*
++	 * An implementation defined value associated with the receiver and the
++	 * memory region.
++	 */
++	u64 tag;
++	u32 reserved_1;
++	/*
++	 * The number of `ffa_mem_region_attributes` entries included in this
++	 * transaction.
++	 */
++	u32 ep_count;
++	/*
++	 * An array of endpoint memory access descriptors.
++	 * Each one specifies a memory region offset, an endpoint and the
++	 * attributes with which this memory region should be mapped in that
++	 * endpoint's page table.
++	 */
++	struct ffa_mem_region_attributes ep_mem_access[];
++};
++
++#define	COMPOSITE_OFFSET(x)	\
++	(offsetof(struct ffa_mem_region, ep_mem_access[x]))
++#define CONSTITUENTS_OFFSET(x)	\
++	(offsetof(struct ffa_composite_mem_region, constituents[x]))
++#define COMPOSITE_CONSTITUENTS_OFFSET(x, y)	\
++	(COMPOSITE_OFFSET(x) + CONSTITUENTS_OFFSET(y))
++
++struct ffa_mem_ops_args {
++	bool use_txbuf;
++	u32 nattrs;
++	u32 flags;
++	u64 tag;
++	u64 g_handle;
++	struct scatterlist *sg;
++	struct ffa_mem_region_attributes *attrs;
++};
++
+ struct ffa_dev_ops {
+ 	u32 (*api_version_get)(void);
+ 	int (*partition_info_get)(const char *uuid_str,
+@@ -122,6 +258,9 @@ struct ffa_dev_ops {
+ 	void (*mode_32bit_set)(struct ffa_device *dev);
+ 	int (*sync_send_receive)(struct ffa_device *dev,
+ 				 struct ffa_send_direct_data *data);
++	int (*memory_reclaim)(u64 g_handle, u32 flags);
++	int (*memory_share)(struct ffa_device *dev,
++			    struct ffa_mem_ops_args *args);
+ };
+=20
+ #endif /* _LINUX_ARM_FFA_H */
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/001=
5-tee-add-sec_world_id-to-struct-tee_shm.patch b/meta-arm-bsp/recipes-kerne=
l/linux/linux-arm64-ack-5.10/tc0/0015-tee-add-sec_world_id-to-struct-tee_sh=
m.patch
new file mode 100644
index 0000000..286d6f8
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0015-tee-a=
dd-sec_world_id-to-struct-tee_shm.patch
@@ -0,0 +1,44 @@
+From 0f6e0009dc123faa5630bc02977674e182c5938c Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Thu, 25 Mar 2021 15:08:44 +0100
+Subject: [PATCH 07/14] tee: add sec_world_id to struct tee_shm
+
+Adds sec_world_id to struct tee_shm which describes a shared memory
+object. sec_world_id can be used by a driver to store an id assigned by
+secure world.
+
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ include/linux/tee_drv.h | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
+index cdd049a724b1..93d836fded8b 100644
+--- a/include/linux/tee_drv.h
++++ b/include/linux/tee_drv.h
+@@ -196,7 +196,11 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 co=
nnection_method,
+  * @num_pages:	number of locked pages
+  * @dmabuf:	dmabuf used to for exporting to user space
+  * @flags:	defined by TEE_SHM_* in tee_drv.h
+- * @id:		unique id of a shared memory object on this device
++ * @id:		unique id of a shared memory object on this device, shared
++ *		with user space
++ * @sec_world_id:
++ *		secure world assigned id of this shared memory object, not
++ *		used by all drivers
+  *
+  * This pool is only supposed to be accessed directly from the TEE
+  * subsystem and from drivers that implements their own shm pool manager.
+@@ -212,6 +216,7 @@ struct tee_shm {
+ 	struct dma_buf *dmabuf;
+ 	u32 flags;
+ 	int id;
++	u64 sec_world_id;
+ };
+=20
+ /**
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/001=
6-optee-simplify-optee_release.patch b/meta-arm-bsp/recipes-kernel/linux/li=
nux-arm64-ack-5.10/tc0/0016-optee-simplify-optee_release.patch
new file mode 100644
index 0000000..6fe573d
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0016-optee=
-simplify-optee_release.patch
@@ -0,0 +1,179 @@
+From 0c25ca5835725220605f3dbf6225dcf22923cc0f Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Thu, 25 Mar 2021 15:08:46 +0100
+Subject: [PATCH 08/14] optee: simplify optee_release()
+
+Simplifies optee_release() with a new helper function,
+optee_close_session_helper() which has been factored out from
+optee_close_session().
+
+A separate optee_release_supp() is added for the supplicant device.
+
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/tee/optee/call.c          | 31 ++++++++++-------
+ drivers/tee/optee/core.c          | 55 +++++++++++--------------------
+ drivers/tee/optee/optee_private.h |  1 +
+ 3 files changed, 39 insertions(+), 48 deletions(-)
+
+diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
+index 780d7c4fd756..c0eca4d7d7f2 100644
+--- a/drivers/tee/optee/call.c
++++ b/drivers/tee/optee/call.c
+@@ -283,12 +283,28 @@ int optee_open_session(struct tee_context *ctx,
+ 	return rc;
+ }
+=20
+-int optee_close_session(struct tee_context *ctx, u32 session)
++int optee_close_session_helper(struct tee_context *ctx, u32 session)
+ {
+-	struct optee_context_data *ctxdata =3D ctx->data;
+ 	struct tee_shm *shm;
+ 	struct optee_msg_arg *msg_arg;
+ 	phys_addr_t msg_parg;
++
++	shm =3D get_msg_arg(ctx, 0, &msg_arg, &msg_parg);
++	if (IS_ERR(shm))
++		return PTR_ERR(shm);
++
++	msg_arg->cmd =3D OPTEE_MSG_CMD_CLOSE_SESSION;
++	msg_arg->session =3D session;
++	optee_do_call_with_arg(ctx, msg_parg);
++
++	tee_shm_free(shm);
++
++	return 0;
++}
++
++int optee_close_session(struct tee_context *ctx, u32 session)
++{
++	struct optee_context_data *ctxdata =3D ctx->data;
+ 	struct optee_session *sess;
+=20
+ 	/* Check that the session is valid and remove it from the list */
+@@ -301,16 +317,7 @@ int optee_close_session(struct tee_context *ctx, u32 =
session)
+ 		return -EINVAL;
+ 	kfree(sess);
+=20
+-	shm =3D get_msg_arg(ctx, 0, &msg_arg, &msg_parg);
+-	if (IS_ERR(shm))
+-		return PTR_ERR(shm);
+-
+-	msg_arg->cmd =3D OPTEE_MSG_CMD_CLOSE_SESSION;
+-	msg_arg->session =3D session;
+-	optee_do_call_with_arg(ctx, msg_parg);
+-
+-	tee_shm_free(shm);
+-	return 0;
++	return optee_close_session_helper(ctx, session);
+ }
+=20
+ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_ar=
g *arg,
+diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
+index 63542c1cc291..e39c6d290d83 100644
+--- a/drivers/tee/optee/core.c
++++ b/drivers/tee/optee/core.c
+@@ -263,59 +263,42 @@ static int optee_open(struct tee_context *ctx)
+ 	return 0;
+ }
+=20
+-static void optee_release(struct tee_context *ctx)
++static void optee_release_helper(struct tee_context *ctx,
++				 int (*close_session)(struct tee_context *ctx,
++						      u32 session))
+ {
+ 	struct optee_context_data *ctxdata =3D ctx->data;
+-	struct tee_device *teedev =3D ctx->teedev;
+-	struct optee *optee =3D tee_get_drvdata(teedev);
+-	struct tee_shm *shm;
+-	struct optee_msg_arg *arg =3D NULL;
+-	phys_addr_t parg;
+ 	struct optee_session *sess;
+ 	struct optee_session *sess_tmp;
+=20
+ 	if (!ctxdata)
+ 		return;
+=20
+-	shm =3D tee_shm_alloc(ctx, sizeof(struct optee_msg_arg), TEE_SHM_MAPPED)=
;
+-	if (!IS_ERR(shm)) {
+-		arg =3D tee_shm_get_va(shm, 0);
+-		/*
+-		 * If va2pa fails for some reason, we can't call into
+-		 * secure world, only free the memory. Secure OS will leak
+-		 * sessions and finally refuse more sessions, but we will
+-		 * at least let normal world reclaim its memory.
+-		 */
+-		if (!IS_ERR(arg))
+-			if (tee_shm_va2pa(shm, arg, &parg))
+-				arg =3D NULL; /* prevent usage of parg below */
+-	}
+-
+ 	list_for_each_entry_safe(sess, sess_tmp, &ctxdata->sess_list,
+ 				 list_node) {
+ 		list_del(&sess->list_node);
+-		if (!IS_ERR_OR_NULL(arg)) {
+-			memset(arg, 0, sizeof(*arg));
+-			arg->cmd =3D OPTEE_MSG_CMD_CLOSE_SESSION;
+-			arg->session =3D sess->session_id;
+-			optee_do_call_with_arg(ctx, parg);
+-		}
++		close_session(ctx, sess->session_id);
+ 		kfree(sess);
+ 	}
+ 	kfree(ctxdata);
++	ctx->data =3D NULL;
++}
+=20
+-	if (!IS_ERR(shm))
+-		tee_shm_free(shm);
++static void optee_release(struct tee_context *ctx)
++{
++	optee_release_helper(ctx, optee_close_session_helper);
++}
+=20
+-	ctx->data =3D NULL;
++static void optee_release_supp(struct tee_context *ctx)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+=20
+-	if (teedev =3D=3D optee->supp_teedev) {
+-		if (optee->scan_bus_wq) {
+-			destroy_workqueue(optee->scan_bus_wq);
+-			optee->scan_bus_wq =3D NULL;
+-		}
+-		optee_supp_release(&optee->supp);
++	optee_release_helper(ctx, optee_close_session_helper);
++	if (optee->scan_bus_wq) {
++		destroy_workqueue(optee->scan_bus_wq);
++		optee->scan_bus_wq =3D NULL;
+ 	}
++	optee_supp_release(&optee->supp);
+ }
+=20
+ static const struct tee_driver_ops optee_ops =3D {
+@@ -339,7 +322,7 @@ static const struct tee_desc optee_desc =3D {
+ static const struct tee_driver_ops optee_supp_ops =3D {
+ 	.get_version =3D optee_get_version,
+ 	.open =3D optee_open,
+-	.release =3D optee_release,
++	.release =3D optee_release_supp,
+ 	.supp_recv =3D optee_supp_recv,
+ 	.supp_send =3D optee_supp_send,
+ 	.shm_register =3D optee_shm_register_supp,
+diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_p=
rivate.h
+index e25b216a14ef..2b63b796645e 100644
+--- a/drivers/tee/optee/optee_private.h
++++ b/drivers/tee/optee/optee_private.h
+@@ -152,6 +152,7 @@ u32 optee_do_call_with_arg(struct tee_context *ctx, ph=
ys_addr_t parg);
+ int optee_open_session(struct tee_context *ctx,
+ 		       struct tee_ioctl_open_session_arg *arg,
+ 		       struct tee_param *param);
++int optee_close_session_helper(struct tee_context *ctx, u32 session);
+ int optee_close_session(struct tee_context *ctx, u32 session);
+ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_ar=
g *arg,
+ 		      struct tee_param *param);
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/001=
7-optee-sync-OP-TEE-headers.patch b/meta-arm-bsp/recipes-kernel/linux/linux=
-arm64-ack-5.10/tc0/0017-optee-sync-OP-TEE-headers.patch
new file mode 100644
index 0000000..a8797a3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0017-optee=
-sync-OP-TEE-headers.patch
@@ -0,0 +1,644 @@
+From c325e66e1cbacc074051034ce7e40b3e0e987c99 Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Wed, 20 Jan 2021 11:14:12 +0100
+Subject: [PATCH 09/14] optee: sync OP-TEE headers
+
+Pulls in updates in the internal headers from OP-TEE OS [1]. A few
+defines has been shortened, hence the changes in rpc.c. Defines not used
+by the driver in tee_rpc_cmd.h has been filtered out.
+
+Note that this does not change the ABI.
+
+Link: [1] https://github.com/OP-TEE/optee_os
+Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+Change-Id: I5d20a22a3f38bfc9d232279d5f00505c4d3ba965
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git=
/torvalds/linux.git/commit/?h=3Dv5.13-rc7&id=3D617d8e8b347edcee6da38df0aeb6=
71fc9c9ba19c]
+---
+ drivers/tee/optee/optee_msg.h     | 156 ++----------------------------
+ drivers/tee/optee/optee_rpc_cmd.h | 103 ++++++++++++++++++++
+ drivers/tee/optee/optee_smc.h     |  70 +++++++++-----
+ drivers/tee/optee/rpc.c           |  39 ++++----
+ 4 files changed, 179 insertions(+), 189 deletions(-)
+ create mode 100644 drivers/tee/optee/optee_rpc_cmd.h
+
+diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
+index 7b2d919da2ac..1e1341a5eaf2 100644
+--- a/drivers/tee/optee/optee_msg.h
++++ b/drivers/tee/optee/optee_msg.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
+ /*
+- * Copyright (c) 2015-2019, Linaro Limited
++ * Copyright (c) 2015-2021, Linaro Limited
+  */
+ #ifndef _OPTEE_MSG_H
+ #define _OPTEE_MSG_H
+@@ -12,11 +12,9 @@
+  * This file defines the OP-TEE message protocol used to communicate
+  * with an instance of OP-TEE running in secure world.
+  *
+- * This file is divided into three sections.
++ * This file is divided into two sections.
+  * 1. Formatting of messages.
+  * 2. Requests from normal world
+- * 3. Requests from secure world, Remote Procedure Call (RPC), handled by
+- *    tee-supplicant.
+  */
+=20
+ /************************************************************************=
*****
+@@ -54,8 +52,8 @@
+  * Every entry in buffer should point to a 4k page beginning (12 least
+  * significant bits must be equal to zero).
+  *
+- * 12 least significant bints of optee_msg_param.u.tmem.buf_ptr should ho=
ld page
+- * offset of the user buffer.
++ * 12 least significant bits of optee_msg_param.u.tmem.buf_ptr should hol=
d
++ * page offset of user buffer.
+  *
+  * So, entries should be placed like members of this structure:
+  *
+@@ -176,17 +174,9 @@ struct optee_msg_param {
+  * @params: the parameters supplied to the OS Command
+  *
+  * All normal calls to Trusted OS uses this struct. If cmd requires furth=
er
+- * information than what these field holds it can be passed as a paramete=
r
++ * information than what these fields hold it can be passed as a paramete=
r
+  * tagged as meta (setting the OPTEE_MSG_ATTR_META bit in corresponding
+- * attrs field). All parameters tagged as meta has to come first.
+- *
+- * Temp memref parameters can be fragmented if supported by the Trusted O=
S
+- * (when optee_smc.h is bearer of this protocol this is indicated with
+- * OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM). If a logical memref parameter is
+- * fragmented then has all but the last fragment the
+- * OPTEE_MSG_ATTR_FRAGMENT bit set in attrs. Even if a memref is fragment=
ed
+- * it will still be presented as a single logical memref to the Trusted
+- * Application.
++ * attrs field). All parameters tagged as meta have to come first.
+  */
+ struct optee_msg_arg {
+ 	u32 cmd;
+@@ -290,15 +280,12 @@ struct optee_msg_arg {
+  * OPTEE_MSG_CMD_REGISTER_SHM registers a shared memory reference. The
+  * information is passed as:
+  * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
+- *					[| OPTEE_MSG_ATTR_FRAGMENT]
++ *					[| OPTEE_MSG_ATTR_NONCONTIG]
+  * [in] param[0].u.tmem.buf_ptr		physical address (of first fragment)
+  * [in] param[0].u.tmem.size		size (of first fragment)
+  * [in] param[0].u.tmem.shm_ref		holds shared memory reference
+- * ...
+- * The shared memory can optionally be fragmented, temp memrefs can follo=
w
+- * each other with all but the last with the OPTEE_MSG_ATTR_FRAGMENT bit =
set.
+  *
+- * OPTEE_MSG_CMD_UNREGISTER_SHM unregisteres a previously registered shar=
ed
++ * OPTEE_MSG_CMD_UNREGISTER_SHM unregisters a previously registered share=
d
+  * memory reference. The information is passed as:
+  * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
+  * [in] param[0].u.rmem.shm_ref		holds shared memory reference
+@@ -313,131 +300,4 @@ struct optee_msg_arg {
+ #define OPTEE_MSG_CMD_UNREGISTER_SHM	5
+ #define OPTEE_MSG_FUNCID_CALL_WITH_ARG	0x0004
+=20
+-/************************************************************************=
*****
+- * Part 3 - Requests from secure world, RPC
+- ************************************************************************=
*****/
+-
+-/*
+- * All RPC is done with a struct optee_msg_arg as bearer of information,
+- * struct optee_msg_arg::arg holds values defined by OPTEE_MSG_RPC_CMD_* =
below
+- *
+- * RPC communication with tee-supplicant is reversed compared to normal
+- * client communication desribed above. The supplicant receives requests
+- * and sends responses.
+- */
+-
+-/*
+- * Load a TA into memory, defined in tee-supplicant
+- */
+-#define OPTEE_MSG_RPC_CMD_LOAD_TA	0
+-
+-/*
+- * Reserved
+- */
+-#define OPTEE_MSG_RPC_CMD_RPMB		1
+-
+-/*
+- * File system access, defined in tee-supplicant
+- */
+-#define OPTEE_MSG_RPC_CMD_FS		2
+-
+-/*
+- * Get time
+- *
+- * Returns number of seconds and nano seconds since the Epoch,
+- * 1970-01-01 00:00:00 +0000 (UTC).
+- *
+- * [out] param[0].u.value.a	Number of seconds
+- * [out] param[0].u.value.b	Number of nano seconds.
+- */
+-#define OPTEE_MSG_RPC_CMD_GET_TIME	3
+-
+-/*
+- * Wait queue primitive, helper for secure world to implement a wait queu=
e.
+- *
+- * If secure world need to wait for a secure world mutex it issues a slee=
p
+- * request instead of spinning in secure world. Conversely is a wakeup
+- * request issued when a secure world mutex with a thread waiting thread =
is
+- * unlocked.
+- *
+- * Waiting on a key
+- * [in] param[0].u.value.a OPTEE_MSG_RPC_WAIT_QUEUE_SLEEP
+- * [in] param[0].u.value.b wait key
+- *
+- * Waking up a key
+- * [in] param[0].u.value.a OPTEE_MSG_RPC_WAIT_QUEUE_WAKEUP
+- * [in] param[0].u.value.b wakeup key
+- */
+-#define OPTEE_MSG_RPC_CMD_WAIT_QUEUE	4
+-#define OPTEE_MSG_RPC_WAIT_QUEUE_SLEEP	0
+-#define OPTEE_MSG_RPC_WAIT_QUEUE_WAKEUP	1
+-
+-/*
+- * Suspend execution
+- *
+- * [in] param[0].value	.a number of milliseconds to suspend
+- */
+-#define OPTEE_MSG_RPC_CMD_SUSPEND	5
+-
+-/*
+- * Allocate a piece of shared memory
+- *
+- * Shared memory can optionally be fragmented, to support that additional
+- * spare param entries are allocated to make room for eventual fragments.
+- * The spare param entries has .attr =3D OPTEE_MSG_ATTR_TYPE_NONE when
+- * unused. All returned temp memrefs except the last should have the
+- * OPTEE_MSG_ATTR_FRAGMENT bit set in the attr field.
+- *
+- * [in]  param[0].u.value.a		type of memory one of
+- *					OPTEE_MSG_RPC_SHM_TYPE_* below
+- * [in]  param[0].u.value.b		requested size
+- * [in]  param[0].u.value.c		required alignment
+- *
+- * [out] param[0].u.tmem.buf_ptr	physical address (of first fragment)
+- * [out] param[0].u.tmem.size		size (of first fragment)
+- * [out] param[0].u.tmem.shm_ref	shared memory reference
+- * ...
+- * [out] param[n].u.tmem.buf_ptr	physical address
+- * [out] param[n].u.tmem.size		size
+- * [out] param[n].u.tmem.shm_ref	shared memory reference (same value
+- *					as in param[n-1].u.tmem.shm_ref)
+- */
+-#define OPTEE_MSG_RPC_CMD_SHM_ALLOC	6
+-/* Memory that can be shared with a non-secure user space application */
+-#define OPTEE_MSG_RPC_SHM_TYPE_APPL	0
+-/* Memory only shared with non-secure kernel */
+-#define OPTEE_MSG_RPC_SHM_TYPE_KERNEL	1
+-
+-/*
+- * Free shared memory previously allocated with OPTEE_MSG_RPC_CMD_SHM_ALL=
OC
+- *
+- * [in]  param[0].u.value.a		type of memory one of
+- *					OPTEE_MSG_RPC_SHM_TYPE_* above
+- * [in]  param[0].u.value.b		value of shared memory reference
+- *					returned in param[0].u.tmem.shm_ref
+- *					above
+- */
+-#define OPTEE_MSG_RPC_CMD_SHM_FREE	7
+-
+-/*
+- * Access a device on an i2c bus
+- *
+- * [in]  param[0].u.value.a		mode: RD(0), WR(1)
+- * [in]  param[0].u.value.b		i2c adapter
+- * [in]  param[0].u.value.c		i2c chip
+- *
+- * [in]  param[1].u.value.a		i2c control flags
+- *
+- * [in/out] memref[2]			buffer to exchange the transfer data
+- *					with the secure world
+- *
+- * [out]  param[3].u.value.a		bytes transferred by the driver
+- */
+-#define OPTEE_MSG_RPC_CMD_I2C_TRANSFER 21
+-/* I2C master transfer modes */
+-#define OPTEE_MSG_RPC_CMD_I2C_TRANSFER_RD 0
+-#define OPTEE_MSG_RPC_CMD_I2C_TRANSFER_WR 1
+-/* I2C master control flags */
+-#define OPTEE_MSG_RPC_CMD_I2C_FLAGS_TEN_BIT  BIT(0)
+-
+ #endif /* _OPTEE_MSG_H */
+diff --git a/drivers/tee/optee/optee_rpc_cmd.h b/drivers/tee/optee/optee_r=
pc_cmd.h
+new file mode 100644
+index 000000000000..b8275140cef8
+--- /dev/null
++++ b/drivers/tee/optee/optee_rpc_cmd.h
+@@ -0,0 +1,103 @@
++/* SPDX-License-Identifier: BSD-2-Clause */
++/*
++ * Copyright (c) 2016-2021, Linaro Limited
++ */
++
++#ifndef __OPTEE_RPC_CMD_H
++#define __OPTEE_RPC_CMD_H
++
++/*
++ * All RPC is done with a struct optee_msg_arg as bearer of information,
++ * struct optee_msg_arg::arg holds values defined by OPTEE_RPC_CMD_* belo=
w.
++ * Only the commands handled by the kernel driver are defined here.
++ *
++ * RPC communication with tee-supplicant is reversed compared to normal
++ * client communication described above. The supplicant receives requests
++ * and sends responses.
++ */
++
++/*
++ * Get time
++ *
++ * Returns number of seconds and nano seconds since the Epoch,
++ * 1970-01-01 00:00:00 +0000 (UTC).
++ *
++ * [out]    value[0].a	    Number of seconds
++ * [out]    value[0].b	    Number of nano seconds.
++ */
++#define OPTEE_RPC_CMD_GET_TIME		3
++
++/*
++ * Wait queue primitive, helper for secure world to implement a wait queu=
e.
++ *
++ * If secure world needs to wait for a secure world mutex it issues a sle=
ep
++ * request instead of spinning in secure world. Conversely is a wakeup
++ * request issued when a secure world mutex with a thread waiting thread =
is
++ * unlocked.
++ *
++ * Waiting on a key
++ * [in]    value[0].a	    OPTEE_RPC_WAIT_QUEUE_SLEEP
++ * [in]    value[0].b	    Wait key
++ *
++ * Waking up a key
++ * [in]    value[0].a	    OPTEE_RPC_WAIT_QUEUE_WAKEUP
++ * [in]    value[0].b	    Wakeup key
++ */
++#define OPTEE_RPC_CMD_WAIT_QUEUE	4
++#define OPTEE_RPC_WAIT_QUEUE_SLEEP	0
++#define OPTEE_RPC_WAIT_QUEUE_WAKEUP	1
++
++/*
++ * Suspend execution
++ *
++ * [in]    value[0].a	Number of milliseconds to suspend
++ */
++#define OPTEE_RPC_CMD_SUSPEND		5
++
++/*
++ * Allocate a piece of shared memory
++ *
++ * [in]    value[0].a	    Type of memory one of
++ *			    OPTEE_RPC_SHM_TYPE_* below
++ * [in]    value[0].b	    Requested size
++ * [in]    value[0].c	    Required alignment
++ * [out]   memref[0]	    Buffer
++ */
++#define OPTEE_RPC_CMD_SHM_ALLOC		6
++/* Memory that can be shared with a non-secure user space application */
++#define OPTEE_RPC_SHM_TYPE_APPL		0
++/* Memory only shared with non-secure kernel */
++#define OPTEE_RPC_SHM_TYPE_KERNEL	1
++
++/*
++ * Free shared memory previously allocated with OPTEE_RPC_CMD_SHM_ALLOC
++ *
++ * [in]     value[0].a	    Type of memory one of
++ *			    OPTEE_RPC_SHM_TYPE_* above
++ * [in]     value[0].b	    Value of shared memory reference or cookie
++ */
++#define OPTEE_RPC_CMD_SHM_FREE		7
++
++/*
++ * Issue master requests (read and write operations) to an I2C chip.
++ *
++ * [in]     value[0].a	    Transfer mode (OPTEE_RPC_I2C_TRANSFER_*)
++ * [in]     value[0].b	    The I2C bus (a.k.a adapter).
++ *				16 bit field.
++ * [in]     value[0].c	    The I2C chip (a.k.a address).
++ *				16 bit field (either 7 or 10 bit effective).
++ * [in]     value[1].a	    The I2C master control flags (ie, 10 bit addre=
ss).
++ *				16 bit field.
++ * [in/out] memref[2]	    Buffer used for data transfers.
++ * [out]    value[3].a	    Number of bytes transferred by the REE.
++ */
++#define OPTEE_RPC_CMD_I2C_TRANSFER	21
++
++/* I2C master transfer modes */
++#define OPTEE_RPC_I2C_TRANSFER_RD	0
++#define OPTEE_RPC_I2C_TRANSFER_WR	1
++
++/* I2C master control flags */
++#define OPTEE_RPC_I2C_FLAGS_TEN_BIT	BIT(0)
++
++#endif /*__OPTEE_RPC_CMD_H*/
+diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc.h
+index 777ad54d4c2c..821e1c30c150 100644
+--- a/drivers/tee/optee/optee_smc.h
++++ b/drivers/tee/optee/optee_smc.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
+ /*
+- * Copyright (c) 2015-2019, Linaro Limited
++ * Copyright (c) 2015-2021, Linaro Limited
+  */
+ #ifndef OPTEE_SMC_H
+ #define OPTEE_SMC_H
+@@ -39,10 +39,10 @@
+ /*
+  * Function specified by SMC Calling convention
+  *
+- * Return one of the following UIDs if using API specified in this file
+- * without further extentions:
+- * 65cb6b93-af0c-4617-8ed6-644a8d1140f8
+- * see also OPTEE_SMC_UID_* in optee_msg.h
++ * Return the following UID if using API specified in this file
++ * without further extensions:
++ * 384fb3e0-e7f8-11e3-af63-0002a5d5c51b.
++ * see also OPTEE_MSG_UID_* in optee_msg.h
+  */
+ #define OPTEE_SMC_FUNCID_CALLS_UID OPTEE_MSG_FUNCID_CALLS_UID
+ #define OPTEE_SMC_CALLS_UID \
+@@ -53,7 +53,7 @@
+ /*
+  * Function specified by SMC Calling convention
+  *
+- * Returns 2.0 if using API specified in this file without further extent=
ions.
++ * Returns 2.0 if using API specified in this file without further extens=
ions.
+  * see also OPTEE_MSG_REVISION_* in optee_msg.h
+  */
+ #define OPTEE_SMC_FUNCID_CALLS_REVISION OPTEE_MSG_FUNCID_CALLS_REVISION
+@@ -109,8 +109,8 @@ struct optee_smc_call_get_os_revision_result {
+  *
+  * Call register usage:
+  * a0	SMC Function ID, OPTEE_SMC*CALL_WITH_ARG
+- * a1	Upper 32bit of a 64bit physical pointer to a struct optee_msg_arg
+- * a2	Lower 32bit of a 64bit physical pointer to a struct optee_msg_arg
++ * a1	Upper 32 bits of a 64-bit physical pointer to a struct optee_msg_ar=
g
++ * a2	Lower 32 bits of a 64-bit physical pointer to a struct optee_msg_ar=
g
+  * a3	Cache settings, not used if physical pointer is in a predefined sha=
red
+  *	memory area else per OPTEE_SMC_SHM_*
+  * a4-6	Not used
+@@ -214,8 +214,9 @@ struct optee_smc_get_shm_config_result {
+  * secure world accepts command buffers located in any parts of non-secur=
e RAM
+  */
+ #define OPTEE_SMC_SEC_CAP_DYNAMIC_SHM		BIT(2)
+-
+-/* Secure world supports Shared Memory with a NULL buffer reference */
++/* Secure world is built with virtualization support */
++#define OPTEE_SMC_SEC_CAP_VIRTUALIZATION	BIT(3)
++/* Secure world supports Shared Memory with a NULL reference */
+ #define OPTEE_SMC_SEC_CAP_MEMREF_NULL		BIT(4)
+=20
+ #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES	9
+@@ -245,8 +246,8 @@ struct optee_smc_exchange_capabilities_result {
+  *
+  * Normal return register usage:
+  * a0	OPTEE_SMC_RETURN_OK
+- * a1	Upper 32bit of a 64bit Shared memory cookie
+- * a2	Lower 32bit of a 64bit Shared memory cookie
++ * a1	Upper 32 bits of a 64-bit Shared memory cookie
++ * a2	Lower 32 bits of a 64-bit Shared memory cookie
+  * a3-7	Preserved
+  *
+  * Cache empty return register usage:
+@@ -293,6 +294,31 @@ struct optee_smc_disable_shm_cache_result {
+ #define OPTEE_SMC_ENABLE_SHM_CACHE \
+ 	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_ENABLE_SHM_CACHE)
+=20
++/*
++ * Query OP-TEE about number of supported threads
++ *
++ * Normal World OS or Hypervisor issues this call to find out how many
++ * threads OP-TEE supports. That is how many standard calls can be issued
++ * in parallel before OP-TEE will return OPTEE_SMC_RETURN_ETHREAD_LIMIT.
++ *
++ * Call requests usage:
++ * a0	SMC Function ID, OPTEE_SMC_GET_THREAD_COUNT
++ * a1-6 Not used
++ * a7	Hypervisor Client ID register
++ *
++ * Normal return register usage:
++ * a0	OPTEE_SMC_RETURN_OK
++ * a1	Number of threads
++ * a2-7 Preserved
++ *
++ * Error return:
++ * a0	OPTEE_SMC_RETURN_UNKNOWN_FUNCTION   Requested call is not implement=
ed
++ * a1-7	Preserved
++ */
++#define OPTEE_SMC_FUNCID_GET_THREAD_COUNT	15
++#define OPTEE_SMC_GET_THREAD_COUNT \
++	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_THREAD_COUNT)
++
+ /*
+  * Resume from RPC (for example after processing a foreign interrupt)
+  *
+@@ -341,16 +367,16 @@ struct optee_smc_disable_shm_cache_result {
+  *
+  * "Return" register usage:
+  * a0	SMC Function ID, OPTEE_SMC_CALL_RETURN_FROM_RPC.
+- * a1	Upper 32bits of 64bit physical pointer to allocated
++ * a1	Upper 32 bits of 64-bit physical pointer to allocated
+  *	memory, (a1 =3D=3D 0 && a2 =3D=3D 0) if size was 0 or if memory can't
+  *	be allocated.
+- * a2	Lower 32bits of 64bit physical pointer to allocated
++ * a2	Lower 32 bits of 64-bit physical pointer to allocated
+  *	memory, (a1 =3D=3D 0 && a2 =3D=3D 0) if size was 0 or if memory can't
+  *	be allocated
+  * a3	Preserved
+- * a4	Upper 32bits of 64bit Shared memory cookie used when freeing
++ * a4	Upper 32 bits of 64-bit Shared memory cookie used when freeing
+  *	the memory or doing an RPC
+- * a5	Lower 32bits of 64bit Shared memory cookie used when freeing
++ * a5	Lower 32 bits of 64-bit Shared memory cookie used when freeing
+  *	the memory or doing an RPC
+  * a6-7	Preserved
+  */
+@@ -363,9 +389,9 @@ struct optee_smc_disable_shm_cache_result {
+  *
+  * "Call" register usage:
+  * a0	This value, OPTEE_SMC_RETURN_RPC_FREE
+- * a1	Upper 32bits of 64bit shared memory cookie belonging to this
++ * a1	Upper 32 bits of 64-bit shared memory cookie belonging to this
+  *	argument memory
+- * a2	Lower 32bits of 64bit shared memory cookie belonging to this
++ * a2	Lower 32 bits of 64-bit shared memory cookie belonging to this
+  *	argument memory
+  * a3-7	Resume information, must be preserved
+  *
+@@ -379,7 +405,7 @@ struct optee_smc_disable_shm_cache_result {
+ 	OPTEE_SMC_RPC_VAL(OPTEE_SMC_RPC_FUNC_FREE)
+=20
+ /*
+- * Deliver foreign interrupt to normal world.
++ * Deliver a foreign interrupt in normal world.
+  *
+  * "Call" register usage:
+  * a0	OPTEE_SMC_RETURN_RPC_FOREIGN_INTR
+@@ -389,7 +415,7 @@ struct optee_smc_disable_shm_cache_result {
+  * a0	SMC Function ID, OPTEE_SMC_CALL_RETURN_FROM_RPC.
+  * a1-7	Preserved
+  */
+-#define OPTEE_SMC_RPC_FUNC_FOREIGN_INTR		4
++#define OPTEE_SMC_RPC_FUNC_FOREIGN_INTR	4
+ #define OPTEE_SMC_RETURN_RPC_FOREIGN_INTR \
+ 	OPTEE_SMC_RPC_VAL(OPTEE_SMC_RPC_FUNC_FOREIGN_INTR)
+=20
+@@ -405,10 +431,10 @@ struct optee_smc_disable_shm_cache_result {
+  *
+  * "Call" register usage:
+  * a0	OPTEE_SMC_RETURN_RPC_CMD
+- * a1	Upper 32bit of a 64bit Shared memory cookie holding a
++ * a1	Upper 32 bits of a 64-bit Shared memory cookie holding a
+  *	struct optee_msg_arg, must be preserved, only the data should
+  *	be updated
+- * a2	Lower 32bit of a 64bit Shared memory cookie holding a
++ * a2	Lower 32 bits of a 64-bit Shared memory cookie holding a
+  *	struct optee_msg_arg, must be preserved, only the data should
+  *	be updated
+  * a3-7	Resume information, must be preserved
+diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
+index 6cbb3643c6c4..1849180b0278 100644
+--- a/drivers/tee/optee/rpc.c
++++ b/drivers/tee/optee/rpc.c
+@@ -12,6 +12,7 @@
+ #include <linux/tee_drv.h>
+ #include "optee_private.h"
+ #include "optee_smc.h"
++#include "optee_rpc_cmd.h"
+=20
+ struct wq_entry {
+ 	struct list_head link;
+@@ -90,7 +91,7 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_=
context *ctx,
+ 	if (!adapter)
+ 		goto bad;
+=20
+-	if (params[1].u.value.a & OPTEE_MSG_RPC_CMD_I2C_FLAGS_TEN_BIT) {
++	if (params[1].u.value.a & OPTEE_RPC_I2C_FLAGS_TEN_BIT) {
+ 		if (!i2c_check_functionality(adapter,
+ 					     I2C_FUNC_10BIT_ADDR)) {
+ 			i2c_put_adapter(adapter);
+@@ -105,10 +106,10 @@ static void handle_rpc_func_cmd_i2c_transfer(struct =
tee_context *ctx,
+ 	msg.len  =3D params[2].u.memref.size;
+=20
+ 	switch (params[0].u.value.a) {
+-	case OPTEE_MSG_RPC_CMD_I2C_TRANSFER_RD:
++	case OPTEE_RPC_I2C_TRANSFER_RD:
+ 		msg.flags |=3D I2C_M_RD;
+ 		break;
+-	case OPTEE_MSG_RPC_CMD_I2C_TRANSFER_WR:
++	case OPTEE_RPC_I2C_TRANSFER_WR:
+ 		break;
+ 	default:
+ 		i2c_put_adapter(adapter);
+@@ -195,10 +196,10 @@ static void handle_rpc_func_cmd_wq(struct optee *opt=
ee,
+ 		goto bad;
+=20
+ 	switch (arg->params[0].u.value.a) {
+-	case OPTEE_MSG_RPC_WAIT_QUEUE_SLEEP:
++	case OPTEE_RPC_WAIT_QUEUE_SLEEP:
+ 		wq_sleep(&optee->wait_queue, arg->params[0].u.value.b);
+ 		break;
+-	case OPTEE_MSG_RPC_WAIT_QUEUE_WAKEUP:
++	case OPTEE_RPC_WAIT_QUEUE_WAKEUP:
+ 		wq_wakeup(&optee->wait_queue, arg->params[0].u.value.b);
+ 		break;
+ 	default:
+@@ -268,11 +269,11 @@ static struct tee_shm *cmd_alloc_suppl(struct tee_co=
ntext *ctx, size_t sz)
+ 	struct tee_shm *shm;
+=20
+ 	param.attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
+-	param.u.value.a =3D OPTEE_MSG_RPC_SHM_TYPE_APPL;
++	param.u.value.a =3D OPTEE_RPC_SHM_TYPE_APPL;
+ 	param.u.value.b =3D sz;
+ 	param.u.value.c =3D 0;
+=20
+-	ret =3D optee_supp_thrd_req(ctx, OPTEE_MSG_RPC_CMD_SHM_ALLOC, 1, &param)=
;
++	ret =3D optee_supp_thrd_req(ctx, OPTEE_RPC_CMD_SHM_ALLOC, 1, &param);
+ 	if (ret)
+ 		return ERR_PTR(-ENOMEM);
+=20
+@@ -309,10 +310,10 @@ static void handle_rpc_func_cmd_shm_alloc(struct tee=
_context *ctx,
+=20
+ 	sz =3D arg->params[0].u.value.b;
+ 	switch (arg->params[0].u.value.a) {
+-	case OPTEE_MSG_RPC_SHM_TYPE_APPL:
++	case OPTEE_RPC_SHM_TYPE_APPL:
+ 		shm =3D cmd_alloc_suppl(ctx, sz);
+ 		break;
+-	case OPTEE_MSG_RPC_SHM_TYPE_KERNEL:
++	case OPTEE_RPC_SHM_TYPE_KERNEL:
+ 		shm =3D tee_shm_alloc(ctx, sz, TEE_SHM_MAPPED);
+ 		break;
+ 	default:
+@@ -384,7 +385,7 @@ static void cmd_free_suppl(struct tee_context *ctx, st=
ruct tee_shm *shm)
+ 	struct tee_param param;
+=20
+ 	param.attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
+-	param.u.value.a =3D OPTEE_MSG_RPC_SHM_TYPE_APPL;
++	param.u.value.a =3D OPTEE_RPC_SHM_TYPE_APPL;
+ 	param.u.value.b =3D tee_shm_get_id(shm);
+ 	param.u.value.c =3D 0;
+=20
+@@ -401,7 +402,7 @@ static void cmd_free_suppl(struct tee_context *ctx, st=
ruct tee_shm *shm)
+ 	 */
+ 	tee_shm_put(shm);
+=20
+-	optee_supp_thrd_req(ctx, OPTEE_MSG_RPC_CMD_SHM_FREE, 1, &param);
++	optee_supp_thrd_req(ctx, OPTEE_RPC_CMD_SHM_FREE, 1, &param);
+ }
+=20
+ static void handle_rpc_func_cmd_shm_free(struct tee_context *ctx,
+@@ -419,10 +420,10 @@ static void handle_rpc_func_cmd_shm_free(struct tee_=
context *ctx,
+=20
+ 	shm =3D (struct tee_shm *)(unsigned long)arg->params[0].u.value.b;
+ 	switch (arg->params[0].u.value.a) {
+-	case OPTEE_MSG_RPC_SHM_TYPE_APPL:
++	case OPTEE_RPC_SHM_TYPE_APPL:
+ 		cmd_free_suppl(ctx, shm);
+ 		break;
+-	case OPTEE_MSG_RPC_SHM_TYPE_KERNEL:
++	case OPTEE_RPC_SHM_TYPE_KERNEL:
+ 		tee_shm_free(shm);
+ 		break;
+ 	default:
+@@ -459,23 +460,23 @@ static void handle_rpc_func_cmd(struct tee_context *=
ctx, struct optee *optee,
+ 	}
+=20
+ 	switch (arg->cmd) {
+-	case OPTEE_MSG_RPC_CMD_GET_TIME:
++	case OPTEE_RPC_CMD_GET_TIME:
+ 		handle_rpc_func_cmd_get_time(arg);
+ 		break;
+-	case OPTEE_MSG_RPC_CMD_WAIT_QUEUE:
++	case OPTEE_RPC_CMD_WAIT_QUEUE:
+ 		handle_rpc_func_cmd_wq(optee, arg);
+ 		break;
+-	case OPTEE_MSG_RPC_CMD_SUSPEND:
++	case OPTEE_RPC_CMD_SUSPEND:
+ 		handle_rpc_func_cmd_wait(arg);
+ 		break;
+-	case OPTEE_MSG_RPC_CMD_SHM_ALLOC:
++	case OPTEE_RPC_CMD_SHM_ALLOC:
+ 		free_pages_list(call_ctx);
+ 		handle_rpc_func_cmd_shm_alloc(ctx, arg, call_ctx);
+ 		break;
+-	case OPTEE_MSG_RPC_CMD_SHM_FREE:
++	case OPTEE_RPC_CMD_SHM_FREE:
+ 		handle_rpc_func_cmd_shm_free(ctx, arg);
+ 		break;
+-	case OPTEE_MSG_RPC_CMD_I2C_TRANSFER:
++	case OPTEE_RPC_CMD_I2C_TRANSFER:
+ 		handle_rpc_func_cmd_i2c_transfer(ctx, arg);
+ 		break;
+ 	default:
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/001=
8-optee-refactor-driver-with-internal-callbacks.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-arm64-ack-5.10/tc0/0018-optee-refactor-driver-with-int=
ernal-callbacks.patch
new file mode 100644
index 0000000..3c7d7fd
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0018-optee=
-refactor-driver-with-internal-callbacks.patch
@@ -0,0 +1,720 @@
+From ca74085bd229be214f9bb9eec33f84a8f0a9090c Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Thu, 25 Mar 2021 15:08:50 +0100
+Subject: [PATCH 10/14] optee: refactor driver with internal callbacks
+
+The OP-TEE driver is refactored with three internal callbacks replacing
+direct calls to optee_from_msg_param(), optee_to_msg_param() and
+optee_do_call_with_arg().
+
+These functions a central to communicating with OP-TEE in secure world
+by using the SMC Calling Convention directly.
+
+This refactoring makes room for using other primitives to communicate
+with OP-TEE in secure world while being able to reuse as much as
+possible from the present driver.
+
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/tee/optee/call.c          |  86 +++++++++--------
+ drivers/tee/optee/core.c          | 148 ++++++++++++++++++++----------
+ drivers/tee/optee/optee_private.h |  35 +++++--
+ drivers/tee/optee/rpc.c           |  19 ++--
+ 4 files changed, 182 insertions(+), 106 deletions(-)
+
+diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
+index c0eca4d7d7f2..1439ab896cd0 100644
+--- a/drivers/tee/optee/call.c
++++ b/drivers/tee/optee/call.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0-only
+ /*
+- * Copyright (c) 2015, Linaro Limited
++ * Copyright (c) 2015-2021, Linaro Limited
+  */
+ #include <linux/arm-smccc.h>
+ #include <linux/device.h>
+@@ -116,20 +116,25 @@ static struct optee_session *find_session(struct opt=
ee_context_data *ctxdata,
+ /**
+  * optee_do_call_with_arg() - Do an SMC to OP-TEE in secure world
+  * @ctx:	calling context
+- * @parg:	physical address of message to pass to secure world
++ * @arg:	shared memory holding the message to pass to secure world
+  *
+  * Does and SMC to OP-TEE in secure world and handles eventual resulting
+  * Remote Procedure Calls (RPC) from OP-TEE.
+  *
+  * Returns return code from secure world, 0 is OK
+  */
+-u32 optee_do_call_with_arg(struct tee_context *ctx, phys_addr_t parg)
++int optee_do_call_with_arg(struct tee_context *ctx, struct tee_shm *arg)
+ {
+ 	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	struct optee_call_waiter w;
+ 	struct optee_rpc_param param =3D { };
+ 	struct optee_call_ctx call_ctx =3D { };
+-	u32 ret;
++	phys_addr_t parg;
++	int rc;
++
++	rc =3D tee_shm_get_pa(arg, 0, &parg);
++	if (rc)
++		return rc;
+=20
+ 	param.a0 =3D OPTEE_SMC_CALL_WITH_ARG;
+ 	reg_pair_from_64(&param.a1, &param.a2, parg);
+@@ -157,7 +162,7 @@ u32 optee_do_call_with_arg(struct tee_context *ctx, ph=
ys_addr_t parg)
+ 			param.a3 =3D res.a3;
+ 			optee_handle_rpc(ctx, &param, &call_ctx);
+ 		} else {
+-			ret =3D res.a0;
++			rc =3D res.a0;
+ 			break;
+ 		}
+ 	}
+@@ -169,14 +174,12 @@ u32 optee_do_call_with_arg(struct tee_context *ctx, =
phys_addr_t parg)
+ 	 */
+ 	optee_cq_wait_final(&optee->call_queue, &w);
+=20
+-	return ret;
++	return rc;
+ }
+=20
+ static struct tee_shm *get_msg_arg(struct tee_context *ctx, size_t num_pa=
rams,
+-				   struct optee_msg_arg **msg_arg,
+-				   phys_addr_t *msg_parg)
++				   struct optee_msg_arg **msg_arg)
+ {
+-	int rc;
+ 	struct tee_shm *shm;
+ 	struct optee_msg_arg *ma;
+=20
+@@ -187,22 +190,13 @@ static struct tee_shm *get_msg_arg(struct tee_contex=
t *ctx, size_t num_params,
+=20
+ 	ma =3D tee_shm_get_va(shm, 0);
+ 	if (IS_ERR(ma)) {
+-		rc =3D PTR_ERR(ma);
+-		goto out;
++		tee_shm_free(shm);
++		return (void *)ma;
+ 	}
+=20
+-	rc =3D tee_shm_get_pa(shm, 0, msg_parg);
+-	if (rc)
+-		goto out;
+-
+ 	memset(ma, 0, OPTEE_MSG_GET_ARG_SIZE(num_params));
+ 	ma->num_params =3D num_params;
+ 	*msg_arg =3D ma;
+-out:
+-	if (rc) {
+-		tee_shm_free(shm);
+-		return ERR_PTR(rc);
+-	}
+=20
+ 	return shm;
+ }
+@@ -211,15 +205,15 @@ int optee_open_session(struct tee_context *ctx,
+ 		       struct tee_ioctl_open_session_arg *arg,
+ 		       struct tee_param *param)
+ {
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	struct optee_context_data *ctxdata =3D ctx->data;
+ 	int rc;
+ 	struct tee_shm *shm;
+ 	struct optee_msg_arg *msg_arg;
+-	phys_addr_t msg_parg;
+ 	struct optee_session *sess =3D NULL;
+=20
+ 	/* +2 for the meta parameters added below */
+-	shm =3D get_msg_arg(ctx, arg->num_params + 2, &msg_arg, &msg_parg);
++	shm =3D get_msg_arg(ctx, arg->num_params + 2, &msg_arg);
+ 	if (IS_ERR(shm))
+ 		return PTR_ERR(shm);
+=20
+@@ -242,7 +236,8 @@ int optee_open_session(struct tee_context *ctx,
+ 	if (rc)
+ 		goto out;
+=20
+-	rc =3D optee_to_msg_param(msg_arg->params + 2, arg->num_params, param);
++	rc =3D optee->ops->to_msg_param(optee, msg_arg->params + 2,
++				      arg->num_params, param);
+ 	if (rc)
+ 		goto out;
+=20
+@@ -252,7 +247,7 @@ int optee_open_session(struct tee_context *ctx,
+ 		goto out;
+ 	}
+=20
+-	if (optee_do_call_with_arg(ctx, msg_parg)) {
++	if (optee->ops->do_call_with_arg(ctx, shm)) {
+ 		msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
+ 		msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
+ 	}
+@@ -267,7 +262,8 @@ int optee_open_session(struct tee_context *ctx,
+ 		kfree(sess);
+ 	}
+=20
+-	if (optee_from_msg_param(param, arg->num_params, msg_arg->params + 2)) {
++	if (optee->ops->from_msg_param(optee, param, arg->num_params,
++				       msg_arg->params + 2)) {
+ 		arg->ret =3D TEEC_ERROR_COMMUNICATION;
+ 		arg->ret_origin =3D TEEC_ORIGIN_COMMS;
+ 		/* Close session again to avoid leakage */
+@@ -286,16 +282,16 @@ int optee_open_session(struct tee_context *ctx,
+ int optee_close_session_helper(struct tee_context *ctx, u32 session)
+ {
+ 	struct tee_shm *shm;
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	struct optee_msg_arg *msg_arg;
+-	phys_addr_t msg_parg;
+=20
+-	shm =3D get_msg_arg(ctx, 0, &msg_arg, &msg_parg);
++	shm =3D get_msg_arg(ctx, 0, &msg_arg);
+ 	if (IS_ERR(shm))
+ 		return PTR_ERR(shm);
+=20
+ 	msg_arg->cmd =3D OPTEE_MSG_CMD_CLOSE_SESSION;
+ 	msg_arg->session =3D session;
+-	optee_do_call_with_arg(ctx, msg_parg);
++	optee->ops->do_call_with_arg(ctx, shm);
+=20
+ 	tee_shm_free(shm);
+=20
+@@ -323,10 +319,10 @@ int optee_close_session(struct tee_context *ctx, u32=
 session)
+ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_ar=
g *arg,
+ 		      struct tee_param *param)
+ {
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	struct optee_context_data *ctxdata =3D ctx->data;
+ 	struct tee_shm *shm;
+ 	struct optee_msg_arg *msg_arg;
+-	phys_addr_t msg_parg;
+ 	struct optee_session *sess;
+ 	int rc;
+=20
+@@ -337,7 +333,7 @@ int optee_invoke_func(struct tee_context *ctx, struct =
tee_ioctl_invoke_arg *arg,
+ 	if (!sess)
+ 		return -EINVAL;
+=20
+-	shm =3D get_msg_arg(ctx, arg->num_params, &msg_arg, &msg_parg);
++	shm =3D get_msg_arg(ctx, arg->num_params, &msg_arg);
+ 	if (IS_ERR(shm))
+ 		return PTR_ERR(shm);
+ 	msg_arg->cmd =3D OPTEE_MSG_CMD_INVOKE_COMMAND;
+@@ -345,16 +341,18 @@ int optee_invoke_func(struct tee_context *ctx, struc=
t tee_ioctl_invoke_arg *arg,
+ 	msg_arg->session =3D arg->session;
+ 	msg_arg->cancel_id =3D arg->cancel_id;
+=20
+-	rc =3D optee_to_msg_param(msg_arg->params, arg->num_params, param);
++	rc =3D optee->ops->to_msg_param(optee, msg_arg->params, arg->num_params,
++				      param);
+ 	if (rc)
+ 		goto out;
+=20
+-	if (optee_do_call_with_arg(ctx, msg_parg)) {
++	if (optee->ops->do_call_with_arg(ctx, shm)) {
+ 		msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
+ 		msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
+ 	}
+=20
+-	if (optee_from_msg_param(param, arg->num_params, msg_arg->params)) {
++	if (optee->ops->from_msg_param(optee, param, arg->num_params,
++				       msg_arg->params)) {
+ 		msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
+ 		msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
+ 	}
+@@ -368,10 +366,10 @@ int optee_invoke_func(struct tee_context *ctx, struc=
t tee_ioctl_invoke_arg *arg,
+=20
+ int optee_cancel_req(struct tee_context *ctx, u32 cancel_id, u32 session)
+ {
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	struct optee_context_data *ctxdata =3D ctx->data;
+ 	struct tee_shm *shm;
+ 	struct optee_msg_arg *msg_arg;
+-	phys_addr_t msg_parg;
+ 	struct optee_session *sess;
+=20
+ 	/* Check that the session is valid */
+@@ -381,14 +379,14 @@ int optee_cancel_req(struct tee_context *ctx, u32 ca=
ncel_id, u32 session)
+ 	if (!sess)
+ 		return -EINVAL;
+=20
+-	shm =3D get_msg_arg(ctx, 0, &msg_arg, &msg_parg);
++	shm =3D get_msg_arg(ctx, 0, &msg_arg);
+ 	if (IS_ERR(shm))
+ 		return PTR_ERR(shm);
+=20
+ 	msg_arg->cmd =3D OPTEE_MSG_CMD_CANCEL;
+ 	msg_arg->session =3D session;
+ 	msg_arg->cancel_id =3D cancel_id;
+-	optee_do_call_with_arg(ctx, msg_parg);
++	optee->ops->do_call_with_arg(ctx, shm);
+=20
+ 	tee_shm_free(shm);
+ 	return 0;
+@@ -587,10 +585,10 @@ int optee_shm_register(struct tee_context *ctx, stru=
ct tee_shm *shm,
+ 		       struct page **pages, size_t num_pages,
+ 		       unsigned long start)
+ {
+-	struct tee_shm *shm_arg =3D NULL;
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	struct optee_msg_arg *msg_arg;
++	struct tee_shm *shm_arg;
+ 	u64 *pages_list;
+-	phys_addr_t msg_parg;
+ 	int rc;
+=20
+ 	if (!num_pages)
+@@ -604,7 +602,7 @@ int optee_shm_register(struct tee_context *ctx, struct=
 tee_shm *shm,
+ 	if (!pages_list)
+ 		return -ENOMEM;
+=20
+-	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg, &msg_parg);
++	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg);
+ 	if (IS_ERR(shm_arg)) {
+ 		rc =3D PTR_ERR(shm_arg);
+ 		goto out;
+@@ -625,7 +623,7 @@ int optee_shm_register(struct tee_context *ctx, struct=
 tee_shm *shm,
+ 	msg_arg->params->u.tmem.buf_ptr =3D virt_to_phys(pages_list) |
+ 	  (tee_shm_get_page_offset(shm) & (OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1));
+=20
+-	if (optee_do_call_with_arg(ctx, msg_parg) ||
++	if (optee->ops->do_call_with_arg(ctx, shm) ||
+ 	    msg_arg->ret !=3D TEEC_SUCCESS)
+ 		rc =3D -EINVAL;
+=20
+@@ -637,12 +635,12 @@ int optee_shm_register(struct tee_context *ctx, stru=
ct tee_shm *shm,
+=20
+ int optee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
+ {
+-	struct tee_shm *shm_arg;
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	struct optee_msg_arg *msg_arg;
+-	phys_addr_t msg_parg;
++	struct tee_shm *shm_arg;
+ 	int rc =3D 0;
+=20
+-	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg, &msg_parg);
++	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg);
+ 	if (IS_ERR(shm_arg))
+ 		return PTR_ERR(shm_arg);
+=20
+@@ -651,7 +649,7 @@ int optee_shm_unregister(struct tee_context *ctx, stru=
ct tee_shm *shm)
+ 	msg_arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+ 	msg_arg->params[0].u.rmem.shm_ref =3D (unsigned long)shm;
+=20
+-	if (optee_do_call_with_arg(ctx, msg_parg) ||
++	if (optee->ops->do_call_with_arg(ctx, shm) ||
+ 	    msg_arg->ret !=3D TEEC_SUCCESS)
+ 		rc =3D -EINVAL;
+ 	tee_shm_free(shm_arg);
+diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
+index e39c6d290d83..ab602bb8e14a 100644
+--- a/drivers/tee/optee/core.c
++++ b/drivers/tee/optee/core.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0-only
+ /*
+- * Copyright (c) 2015, Linaro Limited
++ * Copyright (c) 2015-2021, Linaro Limited
+  */
+=20
+ #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+@@ -26,21 +26,87 @@
+=20
+ #define OPTEE_SHM_NUM_PRIV_PAGES	CONFIG_OPTEE_SHM_NUM_PRIV_PAGES
+=20
++static void from_msg_param_value(struct tee_param *p, u32 attr,
++				 const struct optee_msg_param *mp)
++{
++	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
++		  attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
++	p->u.value.a =3D mp->u.value.a;
++	p->u.value.b =3D mp->u.value.b;
++	p->u.value.c =3D mp->u.value.c;
++}
++
++static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
++				  const struct optee_msg_param *mp)
++{
++	struct tee_shm *shm;
++	phys_addr_t pa;
++	int rc;
++
++	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
++		  attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
++	p->u.memref.size =3D mp->u.tmem.size;
++	shm =3D (struct tee_shm *)(unsigned long)mp->u.tmem.shm_ref;
++	if (!shm) {
++		p->u.memref.shm_offs =3D 0;
++		p->u.memref.shm =3D NULL;
++		return 0;
++	}
++
++	rc =3D tee_shm_get_pa(shm, 0, &pa);
++	if (rc)
++		return rc;
++
++	p->u.memref.shm_offs =3D mp->u.tmem.buf_ptr - pa;
++	p->u.memref.shm =3D shm;
++
++	/* Check that the memref is covered by the shm object */
++	if (p->u.memref.size) {
++		size_t o =3D p->u.memref.shm_offs +
++			   p->u.memref.size - 1;
++
++		rc =3D tee_shm_get_pa(shm, o, NULL);
++		if (rc)
++			return rc;
++	}
++
++	return 0;
++}
++
++static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
++				   const struct optee_msg_param *mp)
++{
++	struct tee_shm *shm;
++
++	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
++		  attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
++	p->u.memref.size =3D mp->u.rmem.size;
++	shm =3D (struct tee_shm *)(unsigned long)mp->u.rmem.shm_ref;
++
++	if (shm) {
++		p->u.memref.shm_offs =3D mp->u.rmem.offs;
++		p->u.memref.shm =3D shm;
++	} else {
++		p->u.memref.shm_offs =3D 0;
++		p->u.memref.shm =3D NULL;
++	}
++}
++
+ /**
+  * optee_from_msg_param() - convert from OPTEE_MSG parameters to
+  *			    struct tee_param
++ * @optee:	main service struct
+  * @params:	subsystem internal parameter representation
+  * @num_params:	number of elements in the parameter arrays
+  * @msg_params:	OPTEE_MSG parameters
+  * Returns 0 on success or <0 on failure
+  */
+-int optee_from_msg_param(struct tee_param *params, size_t num_params,
+-			 const struct optee_msg_param *msg_params)
++static int optee_from_msg_param(struct optee *optee, struct tee_param *pa=
rams,
++				size_t num_params,
++				const struct optee_msg_param *msg_params)
+ {
+ 	int rc;
+ 	size_t n;
+-	struct tee_shm *shm;
+-	phys_addr_t pa;
+=20
+ 	for (n =3D 0; n < num_params; n++) {
+ 		struct tee_param *p =3D params + n;
+@@ -55,48 +121,19 @@ int optee_from_msg_param(struct tee_param *params, si=
ze_t num_params,
+ 		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
+ 		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
+ 		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
+-			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
+-				  attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+-			p->u.value.a =3D mp->u.value.a;
+-			p->u.value.b =3D mp->u.value.b;
+-			p->u.value.c =3D mp->u.value.c;
++			from_msg_param_value(p, attr, mp);
+ 			break;
+ 		case OPTEE_MSG_ATTR_TYPE_TMEM_INPUT:
+ 		case OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT:
+ 		case OPTEE_MSG_ATTR_TYPE_TMEM_INOUT:
+-			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
+-				  attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+-			p->u.memref.size =3D mp->u.tmem.size;
+-			shm =3D (struct tee_shm *)(unsigned long)
+-				mp->u.tmem.shm_ref;
+-			if (!shm) {
+-				p->u.memref.shm_offs =3D 0;
+-				p->u.memref.shm =3D NULL;
+-				break;
+-			}
+-			rc =3D tee_shm_get_pa(shm, 0, &pa);
++			rc =3D from_msg_param_tmp_mem(p, attr, mp);
+ 			if (rc)
+ 				return rc;
+-			p->u.memref.shm_offs =3D mp->u.tmem.buf_ptr - pa;
+-			p->u.memref.shm =3D shm;
+ 			break;
+ 		case OPTEE_MSG_ATTR_TYPE_RMEM_INPUT:
+ 		case OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT:
+ 		case OPTEE_MSG_ATTR_TYPE_RMEM_INOUT:
+-			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
+-				  attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+-			p->u.memref.size =3D mp->u.rmem.size;
+-			shm =3D (struct tee_shm *)(unsigned long)
+-				mp->u.rmem.shm_ref;
+-
+-			if (!shm) {
+-				p->u.memref.shm_offs =3D 0;
+-				p->u.memref.shm =3D NULL;
+-				break;
+-			}
+-			p->u.memref.shm_offs =3D mp->u.rmem.offs;
+-			p->u.memref.shm =3D shm;
+-
++			from_msg_param_reg_mem(p, attr, mp);
+ 			break;
+=20
+ 		default:
+@@ -106,6 +143,16 @@ int optee_from_msg_param(struct tee_param *params, si=
ze_t num_params,
+ 	return 0;
+ }
+=20
++static void to_msg_param_value(struct optee_msg_param *mp,
++			       const struct tee_param *p)
++{
++	mp->attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
++		   TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
++	mp->u.value.a =3D p->u.value.a;
++	mp->u.value.b =3D p->u.value.b;
++	mp->u.value.c =3D p->u.value.c;
++}
++
+ static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
+ 				const struct tee_param *p)
+ {
+@@ -148,13 +195,15 @@ static int to_msg_param_reg_mem(struct optee_msg_par=
am *mp,
+=20
+ /**
+  * optee_to_msg_param() - convert from struct tee_params to OPTEE_MSG par=
ameters
++ * @optee:	main service struct
+  * @msg_params:	OPTEE_MSG parameters
+  * @num_params:	number of elements in the parameter arrays
+  * @params:	subsystem itnernal parameter representation
+  * Returns 0 on success or <0 on failure
+  */
+-int optee_to_msg_param(struct optee_msg_param *msg_params, size_t num_par=
ams,
+-		       const struct tee_param *params)
++static int optee_to_msg_param(struct optee *optee,
++			      struct optee_msg_param *msg_params,
++			      size_t num_params, const struct tee_param *params)
+ {
+ 	int rc;
+ 	size_t n;
+@@ -171,11 +220,7 @@ int optee_to_msg_param(struct optee_msg_param *msg_pa=
rams, size_t num_params,
+ 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
+ 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
+ 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
+-			mp->attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
+-				   TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+-			mp->u.value.a =3D p->u.value.a;
+-			mp->u.value.b =3D p->u.value.b;
+-			mp->u.value.c =3D p->u.value.c;
++			to_msg_param_value(mp, p);
+ 			break;
+ 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
+ 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
+@@ -301,7 +346,7 @@ static void optee_release_supp(struct tee_context *ctx=
)
+ 	optee_supp_release(&optee->supp);
+ }
+=20
+-static const struct tee_driver_ops optee_ops =3D {
++static const struct tee_driver_ops optee_clnt_ops =3D {
+ 	.get_version =3D optee_get_version,
+ 	.open =3D optee_open,
+ 	.release =3D optee_release,
+@@ -313,9 +358,9 @@ static const struct tee_driver_ops optee_ops =3D {
+ 	.shm_unregister =3D optee_shm_unregister,
+ };
+=20
+-static const struct tee_desc optee_desc =3D {
++static const struct tee_desc optee_clnt_desc =3D {
+ 	.name =3D DRIVER_NAME "-clnt",
+-	.ops =3D &optee_ops,
++	.ops =3D &optee_clnt_ops,
+ 	.owner =3D THIS_MODULE,
+ };
+=20
+@@ -336,6 +381,12 @@ static const struct tee_desc optee_supp_desc =3D {
+ 	.flags =3D TEE_DESC_PRIVILEGED,
+ };
+=20
++static const struct optee_ops optee_ops =3D {
++	.do_call_with_arg =3D optee_do_call_with_arg,
++	.to_msg_param =3D optee_to_msg_param,
++	.from_msg_param =3D optee_from_msg_param,
++};
++
+ static bool optee_msg_api_uid_is_optee_api(optee_invoke_fn *invoke_fn)
+ {
+ 	struct arm_smccc_res res;
+@@ -637,10 +688,11 @@ static int optee_probe(struct platform_device *pdev)
+ 		goto err;
+ 	}
+=20
++	optee->ops =3D &optee_ops;
+ 	optee->invoke_fn =3D invoke_fn;
+ 	optee->sec_caps =3D sec_caps;
+=20
+-	teedev =3D tee_device_alloc(&optee_desc, NULL, pool, optee);
++	teedev =3D tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
+ 	if (IS_ERR(teedev)) {
+ 		rc =3D PTR_ERR(teedev);
+ 		goto err;
+diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_p=
rivate.h
+index 2b63b796645e..c5741e96e967 100644
+--- a/drivers/tee/optee/optee_private.h
++++ b/drivers/tee/optee/optee_private.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: GPL-2.0-only */
+ /*
+- * Copyright (c) 2015, Linaro Limited
++ * Copyright (c) 2015-2021, Linaro Limited
+  */
+=20
+ #ifndef OPTEE_PRIVATE_H
+@@ -66,9 +66,34 @@ struct optee_supp {
+ 	struct completion reqs_c;
+ };
+=20
++struct optee;
++
++/**
++ * struct optee_ops - OP-TEE driver internal operations
++ * @do_call_with_arg:	enters OP-TEE in secure world
++ * @to_msg_param:	converts from struct tee_param to OPTEE_MSG parameters
++ * @from_msg_param:	converts from OPTEE_MSG parameters to struct tee_para=
m
++ *
++ * These OPs are only supposed to be used internally in the OP-TEE driver
++ * as a way of abstracting the different methogs of entering OP-TEE in
++ * secure world.
++ */
++struct optee_ops {
++	int (*do_call_with_arg)(struct tee_context *ctx,
++				struct tee_shm *shm_arg);
++	int (*to_msg_param)(struct optee *optee,
++			    struct optee_msg_param *msg_params,
++			    size_t num_params, const struct tee_param *params);
++	int (*from_msg_param)(struct optee *optee, struct tee_param *params,
++			      size_t num_params,
++			      const struct optee_msg_param *msg_params);
++};
++
+ /**
+  * struct optee - main service struct
+  * @supp_teedev:	supplicant device
++ * @ops:		internal callbacks for different ways to reach secure
++ *			world
+  * @teedev:		client device
+  * @invoke_fn:		function to issue smc or hvc
+  * @call_queue:		queue of threads waiting to call @invoke_fn
+@@ -86,6 +111,7 @@ struct optee_supp {
+ struct optee {
+ 	struct tee_device *supp_teedev;
+ 	struct tee_device *teedev;
++	const struct optee_ops *ops;
+ 	optee_invoke_fn *invoke_fn;
+ 	struct optee_call_queue call_queue;
+ 	struct optee_wait_queue wait_queue;
+@@ -148,7 +174,7 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func=
, u32 *num_params,
+ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
+ 		    struct tee_param *param);
+=20
+-u32 optee_do_call_with_arg(struct tee_context *ctx, phys_addr_t parg);
++int optee_do_call_with_arg(struct tee_context *ctx, struct tee_shm *arg);
+ int optee_open_session(struct tee_context *ctx,
+ 		       struct tee_ioctl_open_session_arg *arg,
+ 		       struct tee_param *param);
+@@ -171,11 +197,6 @@ int optee_shm_register_supp(struct tee_context *ctx, =
struct tee_shm *shm,
+ 			    unsigned long start);
+ int optee_shm_unregister_supp(struct tee_context *ctx, struct tee_shm *sh=
m);
+=20
+-int optee_from_msg_param(struct tee_param *params, size_t num_params,
+-			 const struct optee_msg_param *msg_params);
+-int optee_to_msg_param(struct optee_msg_param *msg_params, size_t num_par=
ams,
+-		       const struct tee_param *params);
+-
+ u64 *optee_allocate_pages_list(size_t num_entries);
+ void optee_free_pages_list(void *array, size_t num_entries);
+ void optee_fill_pages_list(u64 *dst, struct page **pages, int num_pages,
+diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
+index 1849180b0278..39562fb6841e 100644
+--- a/drivers/tee/optee/rpc.c
++++ b/drivers/tee/optee/rpc.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0-only
+ /*
+- * Copyright (c) 2015-2016, Linaro Limited
++ * Copyright (c) 2015-2021, Linaro Limited
+  */
+=20
+ #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+@@ -55,6 +55,7 @@ static void handle_rpc_func_cmd_get_time(struct optee_ms=
g_arg *arg)
+ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
+ 					     struct optee_msg_arg *arg)
+ {
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	struct tee_param *params;
+ 	struct i2c_adapter *adapter;
+ 	struct i2c_msg msg =3D { };
+@@ -79,7 +80,8 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_=
context *ctx,
+ 		return;
+ 	}
+=20
+-	if (optee_from_msg_param(params, arg->num_params, arg->params))
++	if (optee->ops->from_msg_param(optee, params, arg->num_params,
++				       arg->params))
+ 		goto bad;
+=20
+ 	for (i =3D 0; i < arg->num_params; i++) {
+@@ -122,7 +124,8 @@ static void handle_rpc_func_cmd_i2c_transfer(struct te=
e_context *ctx,
+ 		arg->ret =3D TEEC_ERROR_COMMUNICATION;
+ 	} else {
+ 		params[3].u.value.a =3D msg.len;
+-		if (optee_to_msg_param(arg->params, arg->num_params, params))
++		if (optee->ops->to_msg_param(optee, arg->params,
++					     arg->num_params, params))
+ 			arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+ 		else
+ 			arg->ret =3D TEEC_SUCCESS;
+@@ -234,7 +237,7 @@ static void handle_rpc_func_cmd_wait(struct optee_msg_=
arg *arg)
+ 	arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+ }
+=20
+-static void handle_rpc_supp_cmd(struct tee_context *ctx,
++static void handle_rpc_supp_cmd(struct tee_context *ctx, struct optee *op=
tee,
+ 				struct optee_msg_arg *arg)
+ {
+ 	struct tee_param *params;
+@@ -248,14 +251,16 @@ static void handle_rpc_supp_cmd(struct tee_context *=
ctx,
+ 		return;
+ 	}
+=20
+-	if (optee_from_msg_param(params, arg->num_params, arg->params)) {
++	if (optee->ops->from_msg_param(optee, params, arg->num_params,
++				       arg->params)) {
+ 		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+ 		goto out;
+ 	}
+=20
+ 	arg->ret =3D optee_supp_thrd_req(ctx, arg->cmd, arg->num_params, params)=
;
+=20
+-	if (optee_to_msg_param(arg->params, arg->num_params, params))
++	if (optee->ops->to_msg_param(optee, arg->params, arg->num_params,
++				     params))
+ 		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+ out:
+ 	kfree(params);
+@@ -480,7 +485,7 @@ static void handle_rpc_func_cmd(struct tee_context *ct=
x, struct optee *optee,
+ 		handle_rpc_func_cmd_i2c_transfer(ctx, arg);
+ 		break;
+ 	default:
+-		handle_rpc_supp_cmd(ctx, arg);
++		handle_rpc_supp_cmd(ctx, optee, arg);
+ 	}
+ }
+=20
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/001=
9-optee-add-a-FF-A-memory-pool.patch b/meta-arm-bsp/recipes-kernel/linux/li=
nux-arm64-ack-5.10/tc0/0019-optee-add-a-FF-A-memory-pool.patch
new file mode 100644
index 0000000..fc6ba04
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0019-optee=
-add-a-FF-A-memory-pool.patch
@@ -0,0 +1,131 @@
+From 69f802594252a0745ba4e798012a0fb6524b6267 Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Thu, 25 Mar 2021 15:08:52 +0100
+Subject: [PATCH 11/14] optee: add a FF-A memory pool
+
+Adds a memory pool to be used when the driver uses FF-A [1] as transport
+layer.
+
+[1] https://developer.arm.com/documentation/den0077/latest
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/tee/optee/shm_pool.c | 65 +++++++++++++++++++++++++++++++++---
+ drivers/tee/optee/shm_pool.h |  1 +
+ 2 files changed, 61 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/tee/optee/shm_pool.c b/drivers/tee/optee/shm_pool.c
+index d767eebf30bd..d2116cb39c8b 100644
+--- a/drivers/tee/optee/shm_pool.c
++++ b/drivers/tee/optee/shm_pool.c
+@@ -12,8 +12,14 @@
+ #include "optee_smc.h"
+ #include "shm_pool.h"
+=20
+-static int pool_op_alloc(struct tee_shm_pool_mgr *poolm,
+-			 struct tee_shm *shm, size_t size)
++static int
++pool_op_alloc_helper(struct tee_shm_pool_mgr *poolm,
++		     struct tee_shm *shm, size_t size,
++		     int (*shm_register)(struct tee_context *ctx,
++					 struct tee_shm *shm,
++					 struct page **pages,
++					 size_t num_pages,
++					 unsigned long start))
+ {
+ 	unsigned int order =3D get_order(size);
+ 	struct page *page;
+@@ -27,7 +33,7 @@ static int pool_op_alloc(struct tee_shm_pool_mgr *poolm,
+ 	shm->paddr =3D page_to_phys(page);
+ 	shm->size =3D PAGE_SIZE << order;
+=20
+-	if (shm->flags & TEE_SHM_DMA_BUF) {
++	if (shm_register) {
+ 		unsigned int nr_pages =3D 1 << order, i;
+ 		struct page **pages;
+=20
+@@ -41,14 +47,23 @@ static int pool_op_alloc(struct tee_shm_pool_mgr *pool=
m,
+ 		}
+=20
+ 		shm->flags |=3D TEE_SHM_REGISTER;
+-		rc =3D optee_shm_register(shm->ctx, shm, pages, nr_pages,
+-					(unsigned long)shm->kaddr);
++		rc =3D shm_register(shm->ctx, shm, pages, nr_pages,
++				  (unsigned long)shm->kaddr);
+ 		kfree(pages);
+ 	}
+=20
+ 	return rc;
+ }
+=20
++static int pool_op_alloc(struct tee_shm_pool_mgr *poolm,
++			 struct tee_shm *shm, size_t size)
++{
++	if (!(shm->flags & TEE_SHM_DMA_BUF))
++		return pool_op_alloc_helper(poolm, shm, size, NULL);
++
++	return pool_op_alloc_helper(poolm, shm, size, optee_shm_register);
++}
++
+ static void pool_op_free(struct tee_shm_pool_mgr *poolm,
+ 			 struct tee_shm *shm)
+ {
+@@ -87,3 +102,43 @@ struct tee_shm_pool_mgr *optee_shm_pool_alloc_pages(vo=
id)
+=20
+ 	return mgr;
+ }
++
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++static int pool_ffa_op_alloc(struct tee_shm_pool_mgr *poolm,
++			     struct tee_shm *shm, size_t size)
++{
++	return pool_op_alloc_helper(poolm, shm, size, optee_ffa_shm_register);
++}
++
++static void pool_ffa_op_free(struct tee_shm_pool_mgr *poolm,
++			     struct tee_shm *shm)
++{
++	optee_ffa_shm_unregister(shm->ctx, shm);
++	free_pages((unsigned long)shm->kaddr, get_order(shm->size));
++	shm->kaddr =3D NULL;
++}
++
++static const struct tee_shm_pool_mgr_ops pool_ffa_ops =3D {
++	.alloc =3D pool_ffa_op_alloc,
++	.free =3D pool_ffa_op_free,
++	.destroy_poolmgr =3D pool_op_destroy_poolmgr,
++};
++
++/**
++ * optee_ffa_shm_pool_alloc_pages() - create page-based allocator pool
++ *
++ * This pool is used with OP-TEE over FF-A. In this case command buffers
++ * and such are allocated from kernel's own memory.
++ */
++struct tee_shm_pool_mgr *optee_ffa_shm_pool_alloc_pages(void)
++{
++	struct tee_shm_pool_mgr *mgr =3D kzalloc(sizeof(*mgr), GFP_KERNEL);
++
++	if (!mgr)
++		return ERR_PTR(-ENOMEM);
++
++	mgr->ops =3D &pool_ffa_ops;
++
++	return mgr;
++}
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
+diff --git a/drivers/tee/optee/shm_pool.h b/drivers/tee/optee/shm_pool.h
+index 28109d991c4b..34c5fd74a3ff 100644
+--- a/drivers/tee/optee/shm_pool.h
++++ b/drivers/tee/optee/shm_pool.h
+@@ -10,5 +10,6 @@
+ #include <linux/tee_drv.h>
+=20
+ struct tee_shm_pool_mgr *optee_shm_pool_alloc_pages(void);
++struct tee_shm_pool_mgr *optee_ffa_shm_pool_alloc_pages(void);
+=20
+ #endif
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/002=
0-optee-add-FF-A-support.patch b/meta-arm-bsp/recipes-kernel/linux/linux-ar=
m64-ack-5.10/tc0/0020-optee-add-FF-A-support.patch
new file mode 100644
index 0000000..6c4e4e6
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0020-optee=
-add-FF-A-support.patch
@@ -0,0 +1,1269 @@
+From c7fedcabea2762c23a9e22cd5f5e4bb0de1f5081 Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Thu, 25 Mar 2021 15:08:53 +0100
+Subject: [PATCH 12/14] optee: add FF-A support
+
+Adds support for using FF-A [1] as transport to the OP-TEE driver.
+
+Introduces struct optee_msg_param_fmem which carries all information
+needed when OP-TEE is calling FFA_MEM_RETRIEVE_REQ to get the shared
+memory reference mapped by the hypervisor in S-EL2. Register usage is
+also updated to include the information needed.
+
+The FF-A part of this driver is enabled if CONFIG_ARM_FFA_TRANSPORT is
+enabled.
+
+[1] https://developer.arm.com/documentation/den0077/latest
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/tee/optee/call.c          | 212 ++++++++++++-
+ drivers/tee/optee/core.c          | 486 +++++++++++++++++++++++++++++-
+ drivers/tee/optee/optee_ffa.h     | 153 ++++++++++
+ drivers/tee/optee/optee_msg.h     |  27 +-
+ drivers/tee/optee/optee_private.h |  52 ++++
+ drivers/tee/optee/rpc.c           | 118 ++++++++
+ 6 files changed, 1040 insertions(+), 8 deletions(-)
+ create mode 100644 drivers/tee/optee/optee_ffa.h
+
+diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
+index 1439ab896cd0..3d03a79dd246 100644
+--- a/drivers/tee/optee/call.c
++++ b/drivers/tee/optee/call.c
+@@ -3,15 +3,18 @@
+  * Copyright (c) 2015-2021, Linaro Limited
+  */
+ #include <linux/arm-smccc.h>
++#include <linux/arm_ffa.h>
+ #include <linux/device.h>
+ #include <linux/err.h>
+ #include <linux/errno.h>
+ #include <linux/mm.h>
+ #include <linux/sched.h>
++#include <linux/scatterlist.h>
+ #include <linux/slab.h>
+ #include <linux/tee_drv.h>
+ #include <linux/types.h>
+ #include <linux/uaccess.h>
++#include "optee_ffa.h"
+ #include "optee_private.h"
+ #include "optee_smc.h"
+=20
+@@ -180,11 +183,21 @@ int optee_do_call_with_arg(struct tee_context *ctx, =
struct tee_shm *arg)
+ static struct tee_shm *get_msg_arg(struct tee_context *ctx, size_t num_pa=
rams,
+ 				   struct optee_msg_arg **msg_arg)
+ {
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	size_t sz =3D OPTEE_MSG_GET_ARG_SIZE(num_params);
+ 	struct tee_shm *shm;
+ 	struct optee_msg_arg *ma;
+=20
+-	shm =3D tee_shm_alloc(ctx, OPTEE_MSG_GET_ARG_SIZE(num_params),
+-			    TEE_SHM_MAPPED);
++	/*
++	 * rpc_arg_count is set to the number of allocated parameters in
++	 * the RPC argument struct if a second MSG arg struct is expected.
++	 * The second arg struct will then be used for RPC. So far only
++	 * enabled when using FF-A as transport layer.
++	 */
++	if (optee->rpc_arg_count)
++		sz +=3D OPTEE_MSG_GET_ARG_SIZE(optee->rpc_arg_count);
++
++	shm =3D tee_shm_alloc(ctx, sz, TEE_SHM_MAPPED);
+ 	if (IS_ERR(shm))
+ 		return shm;
+=20
+@@ -671,3 +684,198 @@ int optee_shm_unregister_supp(struct tee_context *ct=
x, struct tee_shm *shm)
+ {
+ 	return 0;
+ }
++
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++static int optee_ffa_yielding_call(struct tee_context *ctx,
++				   struct ffa_send_direct_data *data,
++				   struct optee_msg_arg *rpc_arg)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	const struct ffa_dev_ops *ffa_ops =3D optee->ffa.ffa_ops;
++	struct ffa_device *ffa_dev =3D optee->ffa.ffa_dev;
++	struct optee_call_waiter w;
++	u32 cmd =3D data->data0;
++	u32 w4 =3D data->data1;
++	u32 w5 =3D data->data2;
++	u32 w6 =3D data->data3;
++	int rc;
++
++	/* Initialize waiter */
++	optee_cq_wait_init(&optee->call_queue, &w);
++	while (true) {
++		rc =3D ffa_ops->sync_send_receive(ffa_dev, data);
++		if (rc)
++			goto done;
++
++		switch ((int)data->data0) {
++		case TEEC_SUCCESS:
++			break;
++		case TEEC_ERROR_BUSY:
++			if (cmd =3D=3D OPTEE_FFA_YIELDING_CALL_RESUME) {
++				rc =3D -EIO;
++				goto done;
++			}
++
++			/*
++			 * Out of threads in secure world, wait for a thread
++			 * become available.
++			 */
++			optee_cq_wait_for_completion(&optee->call_queue, &w);
++			data->data0 =3D cmd;
++			data->data1 =3D w4;
++			data->data2 =3D w5;
++			data->data3 =3D w6;
++			continue;
++		default:
++			rc =3D -EIO;
++			goto done;
++		}
++
++		if (data->data1 =3D=3D OPTEE_FFA_YIELDING_CALL_RETURN_DONE)
++			goto done;
++
++		/*
++		 * OP-TEE has returned with a RPC request.
++		 *
++		 * Note that data->data4 (passed in register w7) is already
++		 * filled in by ffa_ops->sync_send_receive() returning
++		 * above.
++		 */
++		cond_resched();
++		optee_handle_ffa_rpc(ctx, data->data1, rpc_arg);
++		cmd =3D OPTEE_FFA_YIELDING_CALL_RESUME;
++		data->data0 =3D cmd;
++		data->data1 =3D 0;
++		data->data2 =3D 0;
++		data->data3 =3D 0;
++	}
++done:
++	/*
++	 * We're done with our thread in secure world, if there's any
++	 * thread waiters wake up one.
++	 */
++	optee_cq_wait_final(&optee->call_queue, &w);
++
++	return rc;
++}
++
++/**
++ * optee_ffa_do_call_with_arg() - Do a FF-A call to enter OP-TEE in secur=
e world
++ * @ctx:	calling context
++ * @shm:	shared memory holding the message to pass to secure world
++ *
++ * Does a FF-A call to OP-TEE in secure world and handles eventual result=
ing
++ * Remote Procedure Calls (RPC) from OP-TEE.
++ *
++ * Returns return code from FF-A, 0 is OK
++ */
++
++int optee_ffa_do_call_with_arg(struct tee_context *ctx, struct tee_shm *s=
hm)
++{
++	struct ffa_send_direct_data data =3D {
++		.data0 =3D OPTEE_FFA_YIELDING_CALL_WITH_ARG,
++		.data1 =3D (u32)shm->sec_world_id,
++		.data2 =3D (u32)(shm->sec_world_id >> 32),
++		.data3 =3D shm->offset,
++	};
++	struct optee_msg_arg *arg =3D tee_shm_get_va(shm, 0);
++	unsigned int rpc_arg_offs =3D OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
++	struct optee_msg_arg *rpc_arg =3D tee_shm_get_va(shm, rpc_arg_offs);
++
++	return optee_ffa_yielding_call(ctx, &data, rpc_arg);
++}
++
++int optee_ffa_shm_register(struct tee_context *ctx, struct tee_shm *shm,
++			   struct page **pages, size_t num_pages,
++			   unsigned long start)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	const struct ffa_dev_ops *ffa_ops =3D optee->ffa.ffa_ops;
++	struct ffa_device *ffa_dev =3D optee->ffa.ffa_dev;
++	struct ffa_mem_region_attributes mem_attr =3D {
++		.receiver =3D ffa_dev->vm_id,
++		.attrs =3D FFA_MEM_RW,
++	};
++	struct ffa_mem_ops_args args =3D {
++		.use_txbuf =3D true,
++		.attrs =3D &mem_attr,
++		.nattrs =3D 1,
++	};
++	struct sg_table sgt;
++	int rc;
++
++	rc =3D check_mem_type(start, num_pages);
++	if (rc)
++		return rc;
++
++	rc =3D sg_alloc_table_from_pages(&sgt, pages, num_pages, 0,
++				       num_pages * PAGE_SIZE, GFP_KERNEL);
++	if (rc)
++		return rc;
++	args.sg =3D sgt.sgl;
++	rc =3D ffa_ops->memory_share(ffa_dev, &args);
++	sg_free_table(&sgt);
++	if (rc)
++		return rc;
++
++	rc =3D optee_shm_add_ffa_handle(optee, shm, args.g_handle);
++	if (rc) {
++		ffa_ops->memory_reclaim(args.g_handle, 0);
++		return rc;
++	}
++
++	shm->sec_world_id =3D args.g_handle;
++
++	return 0;
++}
++
++int optee_ffa_shm_unregister(struct tee_context *ctx, struct tee_shm *shm=
)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	const struct ffa_dev_ops *ffa_ops =3D optee->ffa.ffa_ops;
++	struct ffa_device *ffa_dev =3D optee->ffa.ffa_dev;
++	u64 global_handle =3D shm->sec_world_id;
++	struct ffa_send_direct_data data =3D {
++		.data0 =3D OPTEE_FFA_UNREGISTER_SHM,
++		.data1 =3D (u32)global_handle,
++		.data2 =3D (u32)(global_handle >> 32)
++	};
++	int rc;
++
++	optee_shm_rem_ffa_handle(optee, global_handle);
++	shm->sec_world_id =3D 0;
++
++	rc =3D ffa_ops->sync_send_receive(ffa_dev, &data);
++	if (rc)
++		pr_err("Unregister SHM id 0x%llx rc %d\n", global_handle, rc);
++
++	rc =3D ffa_ops->memory_reclaim(global_handle, 0);
++	if (rc)
++		pr_err("mem_reclain: 0x%llx %d", global_handle, rc);
++
++	return rc;
++}
++
++int optee_ffa_shm_unregister_supp(struct tee_context *ctx, struct tee_shm=
 *shm)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	const struct ffa_dev_ops *ffa_ops =3D optee->ffa.ffa_ops;
++	u64 global_handle =3D shm->sec_world_id;
++	int rc;
++
++	/*
++	 * We're skipping the OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM call
++	 * since this is OP-TEE freeing via RPC so it has already retired
++	 * this ID.
++	 */
++
++	optee_shm_rem_ffa_handle(optee, global_handle);
++	rc =3D ffa_ops->memory_reclaim(global_handle, 0);
++	if (rc)
++		pr_err("mem_reclain: 0x%llx %d", global_handle, rc);
++
++	shm->sec_world_id =3D 0;
++
++	return rc;
++}
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
+diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
+index ab602bb8e14a..b9719c60dc48 100644
+--- a/drivers/tee/optee/core.c
++++ b/drivers/tee/optee/core.c
+@@ -6,6 +6,7 @@
+ #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+=20
+ #include <linux/arm-smccc.h>
++#include <linux/arm_ffa.h>
+ #include <linux/errno.h>
+ #include <linux/io.h>
+ #include <linux/module.h>
+@@ -20,6 +21,7 @@
+ #include <linux/workqueue.h>
+ #include "optee_private.h"
+ #include "optee_smc.h"
++#include "optee_ffa.h"
+ #include "shm_pool.h"
+=20
+ #define DRIVER_NAME "optee"
+@@ -299,10 +301,9 @@ static int optee_open(struct tee_context *ctx)
+ 	mutex_init(&ctxdata->mutex);
+ 	INIT_LIST_HEAD(&ctxdata->sess_list);
+=20
+-	if (optee->sec_caps & OPTEE_SMC_SEC_CAP_MEMREF_NULL)
+-		ctx->cap_memref_null  =3D true;
+-	else
+-		ctx->cap_memref_null =3D false;
++	ctx->cap_memref_null =3D optee_is_ffa_based(optee) ||
++			       (optee->sec_caps &
++				OPTEE_SMC_SEC_CAP_MEMREF_NULL);
+=20
+ 	ctx->data =3D ctxdata;
+ 	return 0;
+@@ -567,6 +568,472 @@ optee_config_shm_memremap(optee_invoke_fn *invoke_fn=
, void **memremaped_shm)
+ 	return rc;
+ }
+=20
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++static void optee_ffa_get_version(struct tee_device *teedev,
++				  struct tee_ioctl_version_data *vers)
++{
++	struct tee_ioctl_version_data v =3D {
++		.impl_id =3D TEE_IMPL_ID_OPTEE,
++		.impl_caps =3D TEE_OPTEE_CAP_TZ,
++		.gen_caps =3D TEE_GEN_CAP_GP | TEE_GEN_CAP_REG_MEM |
++			    TEE_GEN_CAP_MEMREF_NULL,
++	};
++
++	*vers =3D v;
++}
++
++struct shm_rhash {
++	struct tee_shm *shm;
++	u64 global_id;
++	struct rhash_head linkage;
++};
++
++static void rh_free_fn(void *ptr, void *arg)
++{
++	kfree(ptr);
++}
++
++static const struct rhashtable_params shm_rhash_params =3D {
++	.head_offset =3D offsetof(struct shm_rhash, linkage),
++	.key_len     =3D sizeof(u64),
++	.key_offset  =3D offsetof(struct shm_rhash, global_id),
++	.automatic_shrinking =3D true,
++};
++
++struct tee_shm *optee_shm_from_ffa_handle(struct optee *optee, u64 global=
_id)
++{
++	struct tee_shm *shm =3D NULL;
++	struct shm_rhash *r;
++
++	mutex_lock(&optee->ffa.mutex);
++	r =3D rhashtable_lookup_fast(&optee->ffa.global_ids, &global_id,
++				   shm_rhash_params);
++	if (r)
++		shm =3D r->shm;
++	mutex_unlock(&optee->ffa.mutex);
++
++	return shm;
++}
++
++int optee_shm_add_ffa_handle(struct optee *optee, struct tee_shm *shm,
++			     u64 global_id)
++{
++	struct shm_rhash *r;
++	int rc;
++
++	r =3D kmalloc(sizeof(*r), GFP_KERNEL);
++	if (!r)
++		return -ENOMEM;
++	r->shm =3D shm;
++	r->global_id =3D global_id;
++
++	mutex_lock(&optee->ffa.mutex);
++	rc =3D rhashtable_lookup_insert_fast(&optee->ffa.global_ids, &r->linkage=
,
++					   shm_rhash_params);
++	mutex_unlock(&optee->ffa.mutex);
++
++	if (rc)
++		kfree(r);
++
++	return rc;
++}
++
++int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id)
++{
++	struct shm_rhash *r;
++	int rc =3D -ENOENT;
++
++	mutex_lock(&optee->ffa.mutex);
++	r =3D rhashtable_lookup_fast(&optee->ffa.global_ids, &global_id,
++				   shm_rhash_params);
++	if (r)
++		rc =3D rhashtable_remove_fast(&optee->ffa.global_ids,
++					    &r->linkage, shm_rhash_params);
++	mutex_unlock(&optee->ffa.mutex);
++
++	if (!rc)
++		kfree(r);
++
++	return rc;
++}
++
++static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param =
*p,
++				   u32 attr, const struct optee_msg_param *mp)
++{
++	struct tee_shm *shm =3D NULL;
++	u64 offs_high =3D 0;
++	u64 offs_low =3D 0;
++
++	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
++		  attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
++	p->u.memref.size =3D mp->u.fmem.size;
++
++	if (mp->u.fmem.global_id !=3D OPTEE_MSG_FMEM_INVALID_GLOBAL_ID)
++		shm =3D optee_shm_from_ffa_handle(optee, mp->u.fmem.global_id);
++	p->u.memref.shm =3D shm;
++
++	if (shm) {
++		offs_low =3D mp->u.fmem.offs_low;
++		offs_high =3D mp->u.fmem.offs_high;
++	}
++	p->u.memref.shm_offs =3D offs_low | offs_high << 32;
++}
++
++/**
++ * optee_ffa_from_msg_param() - convert from OPTEE_MSG parameters to
++ *				struct tee_param
++ * @optee:	main service struct
++ * @params:	subsystem internal parameter representation
++ * @num_params:	number of elements in the parameter arrays
++ * @msg_params:	OPTEE_MSG parameters
++ *
++ * Returns 0 on success or <0 on failure
++ */
++static int optee_ffa_from_msg_param(struct optee *optee,
++				    struct tee_param *params, size_t num_params,
++				    const struct optee_msg_param *msg_params)
++{
++	size_t n;
++
++	for (n =3D 0; n < num_params; n++) {
++		struct tee_param *p =3D params + n;
++		const struct optee_msg_param *mp =3D msg_params + n;
++		u32 attr =3D mp->attr & OPTEE_MSG_ATTR_TYPE_MASK;
++
++		switch (attr) {
++		case OPTEE_MSG_ATTR_TYPE_NONE:
++			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
++			memset(&p->u, 0, sizeof(p->u));
++			break;
++		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
++		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
++		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
++			from_msg_param_value(p, attr, mp);
++			break;
++		case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
++		case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
++		case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
++			from_msg_param_ffa_mem(optee, p, attr, mp);
++			break;
++		default:
++			return -EINVAL;
++		}
++	}
++
++	return 0;
++}
++
++static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
++				const struct tee_param *p)
++{
++	struct tee_shm *shm =3D p->u.memref.shm;
++
++	mp->attr =3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr -
++		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
++
++	if (shm) {
++		u64 shm_offs =3D p->u.memref.shm_offs;
++
++		mp->u.fmem.internal_offs =3D shm->offset;
++
++		mp->u.fmem.offs_low =3D shm_offs;
++		mp->u.fmem.offs_high =3D shm_offs >> 32;
++		/* Check that the entire offset could be stored. */
++		if (mp->u.fmem.offs_high !=3D shm_offs >> 32)
++			return -EINVAL;
++
++		mp->u.fmem.global_id =3D shm->sec_world_id;
++	} else {
++		memset(&mp->u, 0, sizeof(mp->u));
++		mp->u.fmem.global_id =3D OPTEE_MSG_FMEM_INVALID_GLOBAL_ID;
++	}
++	mp->u.fmem.size =3D p->u.memref.size;
++
++	return 0;
++}
++
++/**
++ * optee_ffa_to_msg_param() - convert from struct tee_params to OPTEE_MSG
++ *			      parameters
++ * @optee:	main service struct
++ * @msg_params:	OPTEE_MSG parameters
++ * @num_params:	number of elements in the parameter arrays
++ * @params:	subsystem itnernal parameter representation
++ * Returns 0 on success or <0 on failure
++ */
++static int optee_ffa_to_msg_param(struct optee *optee,
++				  struct optee_msg_param *msg_params,
++				  size_t num_params,
++				  const struct tee_param *params)
++{
++	size_t n;
++
++	for (n =3D 0; n < num_params; n++) {
++		const struct tee_param *p =3D params + n;
++		struct optee_msg_param *mp =3D msg_params + n;
++
++		switch (p->attr) {
++		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
++			mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
++			memset(&mp->u, 0, sizeof(mp->u));
++			break;
++		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
++			to_msg_param_value(mp, p);
++			break;
++		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
++			if (to_msg_param_ffa_mem(mp, p))
++				return -EINVAL;
++			break;
++		default:
++			return -EINVAL;
++		}
++	}
++
++	return 0;
++}
++
++static bool optee_ffa_api_is_compatbile(struct ffa_device *ffa_dev,
++					const struct ffa_dev_ops *ops)
++{
++	struct ffa_send_direct_data data =3D { OPTEE_FFA_GET_API_VERSION };
++	int rc;
++
++	ops->mode_32bit_set(ffa_dev);
++
++	rc =3D ops->sync_send_receive(ffa_dev, &data);
++	if (rc) {
++		pr_err("Unexpected error %d\n", rc);
++		return false;
++	}
++	if (data.data0 !=3D OPTEE_FFA_VERSION_MAJOR ||
++	    data.data1 < OPTEE_FFA_VERSION_MINOR) {
++		pr_err("Incompatible OP-TEE API version %lu.%lu",
++		       data.data0, data.data1);
++		return false;
++	}
++
++	data =3D (struct ffa_send_direct_data){ OPTEE_FFA_GET_OS_VERSION };
++	rc =3D ops->sync_send_receive(ffa_dev, &data);
++	if (rc) {
++		pr_err("Unexpected error %d\n", rc);
++		return false;
++	}
++	if (data.data2)
++		pr_info("revision %lu.%lu (%08lx)",
++			data.data0, data.data1, data.data2);
++	else
++		pr_info("revision %lu.%lu", data.data0, data.data1);
++
++	return true;
++}
++
++static bool optee_ffa_exchange_caps(struct ffa_device *ffa_dev,
++				    const struct ffa_dev_ops *ops,
++				    u32 *sec_caps, unsigned int *rpc_arg_count)
++{
++	struct ffa_send_direct_data data =3D { OPTEE_FFA_EXCHANGE_CAPABILITIES }=
;
++	int rc;
++
++	rc =3D ops->sync_send_receive(ffa_dev, &data);
++	if (rc) {
++		pr_err("Unexpected error %d", rc);
++		return false;
++	}
++	if (data.data0) {
++		pr_err("Unexpected exchange error %lu", data.data0);
++		return false;
++	}
++
++	*sec_caps =3D 0;
++	*rpc_arg_count =3D (u8)data.data1;
++
++	return true;
++}
++
++static struct tee_shm_pool *optee_ffa_config_dyn_shm(void)
++{
++	struct tee_shm_pool_mgr *priv_mgr;
++	struct tee_shm_pool_mgr *dmabuf_mgr;
++	void *rc;
++
++	rc =3D optee_ffa_shm_pool_alloc_pages();
++	if (IS_ERR(rc))
++		return rc;
++	priv_mgr =3D rc;
++
++	rc =3D optee_ffa_shm_pool_alloc_pages();
++	if (IS_ERR(rc)) {
++		tee_shm_pool_mgr_destroy(priv_mgr);
++		return rc;
++	}
++	dmabuf_mgr =3D rc;
++
++	rc =3D tee_shm_pool_alloc(priv_mgr, dmabuf_mgr);
++	if (IS_ERR(rc)) {
++		tee_shm_pool_mgr_destroy(priv_mgr);
++		tee_shm_pool_mgr_destroy(dmabuf_mgr);
++	}
++
++	return rc;
++}
++
++static const struct tee_driver_ops optee_ffa_clnt_ops =3D {
++	.get_version =3D optee_ffa_get_version,
++	.open =3D optee_open,
++	.release =3D optee_release,
++	.open_session =3D optee_open_session,
++	.close_session =3D optee_close_session,
++	.invoke_func =3D optee_invoke_func,
++	.cancel_req =3D optee_cancel_req,
++	.shm_register =3D optee_ffa_shm_register,
++	.shm_unregister =3D optee_ffa_shm_unregister,
++};
++
++static const struct tee_desc optee_ffa_clnt_desc =3D {
++	.name =3D DRIVER_NAME "ffa-clnt",
++	.ops =3D &optee_ffa_clnt_ops,
++	.owner =3D THIS_MODULE,
++};
++
++static const struct tee_driver_ops optee_ffa_supp_ops =3D {
++	.get_version =3D optee_ffa_get_version,
++	.open =3D optee_open,
++	.release =3D optee_release_supp,
++	.supp_recv =3D optee_supp_recv,
++	.supp_send =3D optee_supp_send,
++	.shm_register =3D optee_ffa_shm_register, /* same as for clnt ops */
++	.shm_unregister =3D optee_ffa_shm_unregister_supp,
++};
++
++static const struct tee_desc optee_ffa_supp_desc =3D {
++	.name =3D DRIVER_NAME "ffa-supp",
++	.ops =3D &optee_ffa_supp_ops,
++	.owner =3D THIS_MODULE,
++	.flags =3D TEE_DESC_PRIVILEGED,
++};
++
++static const struct optee_ops optee_ffa_ops =3D {
++	.do_call_with_arg =3D optee_ffa_do_call_with_arg,
++	.to_msg_param =3D optee_ffa_to_msg_param,
++	.from_msg_param =3D optee_ffa_from_msg_param,
++};
++
++static void optee_ffa_remove(struct ffa_device *ffa_dev)
++{
++	(void)ffa_dev;
++}
++
++static int optee_ffa_probe(struct ffa_device *ffa_dev)
++{
++	const struct ffa_dev_ops *ffa_ops;
++	unsigned int rpc_arg_count;
++	struct tee_device *teedev;
++	struct optee *optee;
++	u32 sec_caps;
++	int rc;
++
++	ffa_ops =3D ffa_dev_ops_get(ffa_dev);
++	if (!ffa_ops) {
++		pr_warn("failed \"method\" init: ffa\n");
++		return -ENOENT;
++	}
++
++	if (!optee_ffa_api_is_compatbile(ffa_dev, ffa_ops))
++		return -EINVAL;
++
++	if (!optee_ffa_exchange_caps(ffa_dev, ffa_ops, &sec_caps,
++				     &rpc_arg_count))
++		return -EINVAL;
++
++	optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
++	if (!optee) {
++		rc =3D -ENOMEM;
++		goto err;
++	}
++	optee->pool =3D optee_ffa_config_dyn_shm();
++	if (IS_ERR(optee->pool)) {
++		rc =3D PTR_ERR(optee->pool);
++		optee->pool =3D NULL;
++		goto err;
++	}
++
++	optee->ops =3D &optee_ffa_ops;
++	optee->ffa.ffa_dev =3D ffa_dev;
++	optee->ffa.ffa_ops =3D ffa_ops;
++	optee->sec_caps =3D sec_caps;
++	optee->rpc_arg_count =3D rpc_arg_count;
++
++	teedev =3D tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
++				  optee);
++	if (IS_ERR(teedev)) {
++		rc =3D PTR_ERR(teedev);
++		goto err;
++	}
++	optee->teedev =3D teedev;
++
++	teedev =3D tee_device_alloc(&optee_ffa_supp_desc, NULL, optee->pool,
++				  optee);
++	if (IS_ERR(teedev)) {
++		rc =3D PTR_ERR(teedev);
++		goto err;
++	}
++	optee->supp_teedev =3D teedev;
++
++	rc =3D tee_device_register(optee->teedev);
++	if (rc)
++		goto err;
++
++	rc =3D tee_device_register(optee->supp_teedev);
++	if (rc)
++		goto err;
++
++	rc =3D rhashtable_init(&optee->ffa.global_ids, &shm_rhash_params);
++	if (rc)
++		goto err;
++	mutex_init(&optee->ffa.mutex);
++	mutex_init(&optee->call_queue.mutex);
++	INIT_LIST_HEAD(&optee->call_queue.waiters);
++	optee_wait_queue_init(&optee->wait_queue);
++	optee_supp_init(&optee->supp);
++	ffa_dev_set_drvdata(ffa_dev, optee);
++
++	pr_info("initialized driver\n");
++	return 0;
++err:
++	/*
++	 * tee_device_unregister() is safe to call even if the
++	 * devices hasn't been registered with
++	 * tee_device_register() yet.
++	 */
++	tee_device_unregister(optee->supp_teedev);
++	tee_device_unregister(optee->teedev);
++	if (optee->pool)
++		tee_shm_pool_free(optee->pool);
++	kfree(optee);
++	return rc;
++}
++
++static const struct ffa_device_id optee_ffa_device_id[] =3D {
++	/* 486178e0-e7f8-11e3-bc5e0002a5d5c51b */
++	{ UUID_INIT(0x486178e0, 0xe7f8, 0x11e3,
++		    0xbc, 0x5e, 0x00, 0x02, 0xa5, 0xd5, 0xc5, 0x1b) },
++	{}
++};
++
++static struct ffa_driver optee_ffa_driver =3D {
++	.name =3D "optee",
++	.probe =3D optee_ffa_probe,
++	.remove =3D optee_ffa_remove,
++	.id_table =3D optee_ffa_device_id,
++};
++
++module_ffa_driver(optee_ffa_driver);
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
++
+ /* Simple wrapper functions to be able to use a function pointer */
+ static void optee_smccc_smc(unsigned long a0, unsigned long a1,
+ 			    unsigned long a2, unsigned long a3,
+@@ -615,7 +1082,8 @@ static int optee_remove(struct platform_device *pdev)
+ 	 * reference counters and also avoid wild pointers in secure world
+ 	 * into the old shared memory range.
+ 	 */
+-	optee_disable_shm_cache(optee);
++	if (!optee_is_ffa_based(optee))
++		optee_disable_shm_cache(optee);
+=20
+ 	/*
+ 	 * The two devices have to be unregistered before we can free the
+@@ -631,6 +1099,14 @@ static int optee_remove(struct platform_device *pdev=
)
+ 	optee_supp_uninit(&optee->supp);
+ 	mutex_destroy(&optee->call_queue.mutex);
+=20
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++	if (optee->ffa.ffa_ops) {
++		mutex_destroy(&optee->ffa.mutex);
++		rhashtable_free_and_destroy(&optee->ffa.global_ids,
++					    rh_free_fn, NULL);
++	}
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
++
+ 	kfree(optee);
+=20
+ 	return 0;
+diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ffa.h
+new file mode 100644
+index 000000000000..ee3a03fc392c
+--- /dev/null
++++ b/drivers/tee/optee/optee_ffa.h
+@@ -0,0 +1,153 @@
++/* SPDX-License-Identifier: BSD-2-Clause */
++/*
++ * Copyright (c) 2019-2021, Linaro Limited
++ */
++
++/*
++ * This file is exported by OP-TEE and is kept in sync between secure wor=
ld
++ * and normal world drivers. We're using ARM FF-A 1.0 specification.
++ */
++
++#ifndef __OPTEE_FFA_H
++#define __OPTEE_FFA_H
++
++#include <linux/arm_ffa.h>
++
++/*
++ * Normal world sends requests with FFA_MSG_SEND_DIRECT_REQ and
++ * responses are returned with FFA_MSG_SEND_DIRECT_RESP for normal
++ * messages.
++ *
++ * All requests with FFA_MSG_SEND_DIRECT_REQ and FFA_MSG_SEND_DIRECT_RESP
++ * are using the AArch32 SMC calling convention with register usage as
++ * defined in FF-A specification:
++ * w0:    Function ID (0x8400006F or 0x84000070)
++ * w1:    Source/Destination IDs
++ * w2:    Reserved (MBZ)
++ * w3-w7: Implementation defined, free to be used below
++ */
++
++#define OPTEE_FFA_VERSION_MAJOR	1
++#define OPTEE_FFA_VERSION_MINOR	0
++
++#define OPTEE_FFA_BLOCKING_CALL(id)	(id)
++#define OPTEE_FFA_YIELDING_CALL_BIT	31
++#define OPTEE_FFA_YIELDING_CALL(id)	((id) | BIT(OPTEE_FFA_YIELDING_CALL_B=
IT))
++
++/*
++ * Returns the API version implemented, currently follows the FF-A versio=
n.
++ * Call register usage:
++ * w3:    Service ID, OPTEE_FFA_GET_API_VERSION
++ * w4-w7: Not used (MBZ)
++ *
++ * Return register usage:
++ * w3:    OPTEE_FFA_VERSION_MAJOR
++ * w4:    OPTEE_FFA_VERSION_MINOR
++ * w5-w7: Not used (MBZ)
++ */
++#define OPTEE_FFA_GET_API_VERSION	OPTEE_FFA_BLOCKING_CALL(0)
++
++/*
++ * Returns the revision of OP-TEE.
++ *
++ * Used by non-secure world to figure out which version of the Trusted OS
++ * is installed. Note that the returned revision is the revision of the
++ * Trusted OS, not of the API.
++ *
++ * Call register usage:
++ * w3:    Service ID, OPTEE_FFA_GET_OS_VERSION
++ * w4-w7: Unused (MBZ)
++ *
++ * Return register usage:
++ * w3:    CFG_OPTEE_REVISION_MAJOR
++ * w4:    CFG_OPTEE_REVISION_MINOR
++ * w5:    TEE_IMPL_GIT_SHA1 (or zero if not supported)
++ */
++#define OPTEE_FFA_GET_OS_VERSION	OPTEE_FFA_BLOCKING_CALL(1)
++
++/*
++ * Exchange capabilities between normal world and secure world.
++ *
++ * Currently there are no defined capabilities. When features are added n=
ew
++ * capabilities may be added.
++ *
++ * Call register usage:
++ * w3:    Service ID, OPTEE_FFA_EXCHANGE_CAPABILITIES
++ * w4-w7: Note used (MBZ)
++ *
++ * Return register usage:
++ * w3:    Error code, 0 on success
++ * w4:    Bit[7:0]:  Number of parameters needed for RPC to be supplied
++ *                   as the second MSG arg struct for
++ *                   OPTEE_FFA_YIELDING_CALL_WITH_ARG.
++ *        Bit[31:8]: Reserved (MBZ)
++ * w5-w7: Note used (MBZ)
++ */
++#define OPTEE_FFA_EXCHANGE_CAPABILITIES OPTEE_FFA_BLOCKING_CALL(2)
++
++/*
++ * Unregister shared memory
++ *
++ * Call register usage:
++ * w3:    Service ID, OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM
++ * w4:    Shared memory handle, lower bits
++ * w5:    Shared memory handle, higher bits
++ * w6-w7: Not used (MBZ)
++ *
++ * Return register usage:
++ * w3:    Error code, 0 on success
++ * w4-w7: Note used (MBZ)
++ */
++#define OPTEE_FFA_UNREGISTER_SHM	OPTEE_FFA_BLOCKING_CALL(3)
++
++/*
++ * Call with struct optee_msg_arg as argument in the supplied shared memo=
ry
++ * with a zero internal offset and normal cached memory attributes.
++ * Register usage:
++ * w3:    Service ID, OPTEE_FFA_YIELDING_CALL_WITH_ARG
++ * w4:    Lower 32 bits of a 64-bit Shared memory handle
++ * w5:    Upper 32 bits of a 64-bit Shared memory handle
++ * w6:    Offset into shared memory pointing to a struct optee_msg_arg
++ *	  right after the parameters of this struct (at offset
++ *	  OPTEE_MSG_GET_ARG_SIZE(num_params) follows a struct optee_msg_arg
++ *	  for RPC, this struct has reserved space for the number of RPC
++ *	  parameters as returned by OPTEE_FFA_EXCHANGE_CAPABILITIES.
++ * w7:    Not used (MBZ)
++ * Resume from RPC. Register usage:
++ * w3:    Service ID, OPTEE_FFA_YIELDING_CALL_RESUME
++ * w4-w6: Not used (MBZ)
++ * w7:    Resume info
++ *
++ * Normal return (yielding call is completed). Register usage:
++ * w3:    Error code, 0 on success
++ * w4:    OPTEE_FFA_YIELDING_CALL_RETURN_DONE
++ * w5-w7: Not used (MBZ)
++ *
++ * RPC interrupt return (RPC from secure world). Register usage:
++ * w3:    Error code =3D=3D 0
++ * w4:    Any defined RPC code but OPTEE_FFA_YIELDING_CALL_RETURN_DONE
++ * w5-w6: Not used (MBZ)
++ * w7:    Resume info
++ *
++ * Possible error codes in register w3:
++ * 0:                       Success
++ * FFA_DENIED:              w4 isn't one of OPTEE_FFA_YIELDING_CALL_START
++ *                          OPTEE_FFA_YIELDING_CALL_RESUME
++ *
++ * Possible error codes for OPTEE_FFA_YIELDING_CALL_START,
++ * FFA_BUSY:               Number of OP-TEE OS threads exceeded,
++ *                         try again later
++ * FFA_DENIED:             RPC shared memory object not found
++ * FFA_INVALID_PARAMETER:  Bad shared memory handle or offset into the me=
mory
++ *
++ * Possible error codes for OPTEE_FFA_YIELDING_CALL_RESUME
++ * FFA_INVALID_PARAMETER:  Bad resume info
++ */
++#define OPTEE_FFA_YIELDING_CALL_WITH_ARG	OPTEE_FFA_YIELDING_CALL(0)
++#define OPTEE_FFA_YIELDING_CALL_RESUME		OPTEE_FFA_YIELDING_CALL(1)
++
++#define OPTEE_FFA_YIELDING_CALL_RETURN_DONE		0
++#define OPTEE_FFA_YIELDING_CALL_RETURN_RPC_CMD		1
++#define OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT	2
++
++#endif /*__OPTEE_FFA_H*/
+diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
+index 1e1341a5eaf2..62348cee3e33 100644
+--- a/drivers/tee/optee/optee_msg.h
++++ b/drivers/tee/optee/optee_msg.h
+@@ -28,6 +28,9 @@
+ #define OPTEE_MSG_ATTR_TYPE_RMEM_INPUT		0x5
+ #define OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT		0x6
+ #define OPTEE_MSG_ATTR_TYPE_RMEM_INOUT		0x7
++#define OPTEE_MSG_ATTR_TYPE_FMEM_INPUT		OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
++#define OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT		OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT
++#define OPTEE_MSG_ATTR_TYPE_FMEM_INOUT		OPTEE_MSG_ATTR_TYPE_RMEM_INOUT
+ #define OPTEE_MSG_ATTR_TYPE_TMEM_INPUT		0x9
+ #define OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT		0xa
+ #define OPTEE_MSG_ATTR_TYPE_TMEM_INOUT		0xb
+@@ -96,6 +99,8 @@
+  */
+ #define OPTEE_MSG_NONCONTIG_PAGE_SIZE		4096
+=20
++#define OPTEE_MSG_FMEM_INVALID_GLOBAL_ID	0xffffffffffffffff
++
+ /**
+  * struct optee_msg_param_tmem - temporary memory reference parameter
+  * @buf_ptr:	Address of the buffer
+@@ -127,6 +132,23 @@ struct optee_msg_param_rmem {
+ 	u64 shm_ref;
+ };
+=20
++/**
++ * struct optee_msg_param_fmem - ffa memory reference parameter
++ * @offs_lower:	   Lower bits of offset into shared memory reference
++ * @offs_upper:	   Upper bits of offset into shared memory reference
++ * @internal_offs: Internal offset into the first page of shared memory
++ *		   reference
++ * @size:	   Size of the buffer
++ * @global_id:	   Global identifier of Shared memory
++ */
++struct optee_msg_param_fmem {
++	u32 offs_low;
++	u16 offs_high;
++	u16 internal_offs;
++	u64 size;
++	u64 global_id;
++};
++
+ /**
+  * struct optee_msg_param_value - opaque value parameter
+  *
+@@ -143,12 +165,14 @@ struct optee_msg_param_value {
+  * @attr:	attributes
+  * @tmem:	parameter by temporary memory reference
+  * @rmem:	parameter by registered memory reference
++ * @fmem:	parameter by ffa registered memory reference
+  * @value:	parameter by opaque value
+  *
+  * @attr & OPTEE_MSG_ATTR_TYPE_MASK indicates if tmem, rmem or value is u=
sed in
+  * the union. OPTEE_MSG_ATTR_TYPE_VALUE_* indicates value,
+  * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @tmem and
+- * OPTEE_MSG_ATTR_TYPE_RMEM_* indicates @rmem,
++ * OPTEE_MSG_ATTR_TYPE_RMEM_* or the alias PTEE_MSG_ATTR_TYPE_FMEM_* indi=
cates
++ * @rmem or @fmem depending on the conduit.
+  * OPTEE_MSG_ATTR_TYPE_NONE indicates that none of the members are used.
+  */
+ struct optee_msg_param {
+@@ -156,6 +180,7 @@ struct optee_msg_param {
+ 	union {
+ 		struct optee_msg_param_tmem tmem;
+ 		struct optee_msg_param_rmem rmem;
++		struct optee_msg_param_fmem fmem;
+ 		struct optee_msg_param_value value;
+ 	} u;
+ };
+diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_p=
rivate.h
+index c5741e96e967..1ffe74e66d15 100644
+--- a/drivers/tee/optee/optee_private.h
++++ b/drivers/tee/optee/optee_private.h
+@@ -7,6 +7,7 @@
+ #define OPTEE_PRIVATE_H
+=20
+ #include <linux/arm-smccc.h>
++#include <linux/rhashtable.h>
+ #include <linux/semaphore.h>
+ #include <linux/tee_drv.h>
+ #include <linux/types.h>
+@@ -20,6 +21,7 @@
+ #define TEEC_ERROR_NOT_SUPPORTED	0xFFFF000A
+ #define TEEC_ERROR_COMMUNICATION	0xFFFF000E
+ #define TEEC_ERROR_OUT_OF_MEMORY	0xFFFF000C
++#define TEEC_ERROR_BUSY			0xFFFF000D
+ #define TEEC_ERROR_SHORT_BUFFER		0xFFFF0010
+=20
+ #define TEEC_ORIGIN_COMMS		0x00000002
+@@ -66,6 +68,22 @@ struct optee_supp {
+ 	struct completion reqs_c;
+ };
+=20
++/**
++ * struct optee_ffa_data -  FFA communication struct
++ * @ffa_dev		FFA device, contains the destination id, the id of
++ *			OP-TEE in secure world
++ * @ffa_ops		FFA operations
++ * @mutex		Serializes access to @global_ids
++ * @global_ids		FF-A shared memory global handle translation
++ */
++struct optee_ffa {
++	struct ffa_device *ffa_dev;
++	const struct ffa_dev_ops *ffa_ops;
++	/* Serializes access to @global_ids */
++	struct mutex mutex;
++	struct rhashtable global_ids;
++};
++
+ struct optee;
+=20
+ /**
+@@ -113,11 +131,15 @@ struct optee {
+ 	struct tee_device *teedev;
+ 	const struct optee_ops *ops;
+ 	optee_invoke_fn *invoke_fn;
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++	struct optee_ffa ffa;
++#endif
+ 	struct optee_call_queue call_queue;
+ 	struct optee_wait_queue wait_queue;
+ 	struct optee_supp supp;
+ 	struct tee_shm_pool *pool;
+ 	void *memremaped_shm;
++	unsigned int rpc_arg_count;
+ 	u32 sec_caps;
+ 	bool   scan_bus_done;
+ 	struct workqueue_struct *scan_bus_wq;
+@@ -206,6 +228,36 @@ void optee_fill_pages_list(u64 *dst, struct page **pa=
ges, int num_pages,
+ #define PTA_CMD_GET_DEVICES_SUPP	0x1
+ int optee_enumerate_devices(u32 func);
+=20
++int optee_shm_add_ffa_handle(struct optee *optee, struct tee_shm *shm,
++			     u64 global_id);
++int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id);
++
++struct tee_shm *optee_shm_from_ffa_handle(struct optee *optee, u64 global=
_id);
++
++int optee_ffa_shm_register(struct tee_context *ctx, struct tee_shm *shm,
++			   struct page **pages, size_t num_pages,
++			   unsigned long start);
++int optee_ffa_shm_unregister(struct tee_context *ctx, struct tee_shm *shm=
);
++int optee_ffa_shm_register_supp(struct tee_context *ctx, struct tee_shm *=
shm,
++				struct page **pages, size_t num_pages,
++				unsigned long start);
++int optee_ffa_shm_unregister_supp(struct tee_context *ctx,
++				  struct tee_shm *shm);
++
++int optee_ffa_do_call_with_arg(struct tee_context *ctx, struct tee_shm *a=
rg);
++int optee_ffa_rpc_shm_register(struct tee_context *ctx, struct tee_shm *s=
hm);
++void optee_handle_ffa_rpc(struct tee_context *ctx, u32 cmd,
++			  struct optee_msg_arg *arg);
++
++static inline bool optee_is_ffa_based(struct optee *optee)
++{
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++	return optee->ffa.ffa_ops;
++#else
++	return false;
++#endif
++}
++
+ /*
+  * Small helpers
+  */
+diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
+index 39562fb6841e..865a9ab3cf65 100644
+--- a/drivers/tee/optee/rpc.c
++++ b/drivers/tee/optee/rpc.c
+@@ -10,6 +10,7 @@
+ #include <linux/i2c.h>
+ #include <linux/slab.h>
+ #include <linux/tee_drv.h>
++#include "optee_ffa.h"
+ #include "optee_private.h"
+ #include "optee_smc.h"
+ #include "optee_rpc_cmd.h"
+@@ -543,3 +544,120 @@ void optee_handle_rpc(struct tee_context *ctx, struc=
t optee_rpc_param *param,
+=20
+ 	param->a0 =3D OPTEE_SMC_CALL_RETURN_FROM_RPC;
+ }
++
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++static void handle_ffa_rpc_func_cmd_shm_alloc(struct tee_context *ctx,
++					      struct optee_msg_arg *arg)
++{
++	struct tee_shm *shm;
++
++	if (arg->num_params !=3D 1 ||
++	    arg->params[0].attr !=3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT) {
++		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
++		return;
++	}
++
++	switch (arg->params[0].u.value.a) {
++	case OPTEE_RPC_SHM_TYPE_APPL:
++		shm =3D cmd_alloc_suppl(ctx, arg->params[0].u.value.b);
++		break;
++	case OPTEE_RPC_SHM_TYPE_KERNEL:
++		shm =3D tee_shm_alloc(ctx, arg->params[0].u.value.b,
++				    TEE_SHM_MAPPED);
++		break;
++	default:
++		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
++		return;
++	}
++
++	if (IS_ERR(shm)) {
++		arg->ret =3D TEEC_ERROR_OUT_OF_MEMORY;
++		return;
++	}
++
++	arg->params[0] =3D (struct optee_msg_param){
++		.attr =3D OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT,
++		.u.fmem.size =3D tee_shm_get_size(shm),
++		.u.fmem.global_id =3D shm->sec_world_id,
++		.u.fmem.internal_offs =3D shm->offset,
++	};
++
++	arg->ret =3D TEEC_SUCCESS;
++}
++
++static void handle_ffa_rpc_func_cmd_shm_free(struct tee_context *ctx,
++					     struct optee *optee,
++					     struct optee_msg_arg *arg)
++{
++	struct tee_shm *shm;
++
++	if (arg->num_params !=3D 1 ||
++	    arg->params[0].attr !=3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT)
++		goto err_bad_param;
++
++	shm =3D optee_shm_from_ffa_handle(optee, arg->params[0].u.value.b);
++	if (!shm)
++		goto err_bad_param;
++	switch (arg->params[0].u.value.a) {
++	case OPTEE_RPC_SHM_TYPE_APPL:
++		cmd_free_suppl(ctx, shm);
++		break;
++	case OPTEE_RPC_SHM_TYPE_KERNEL:
++		tee_shm_free(shm);
++		break;
++	default:
++		goto err_bad_param;
++	}
++	arg->ret =3D TEEC_SUCCESS;
++	return;
++
++err_bad_param:
++	arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
++}
++
++static void handle_ffa_rpc_func_cmd(struct tee_context *ctx,
++				    struct optee_msg_arg *arg)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++
++	arg->ret_origin =3D TEEC_ORIGIN_COMMS;
++	switch (arg->cmd) {
++	case OPTEE_RPC_CMD_GET_TIME:
++		handle_rpc_func_cmd_get_time(arg);
++		break;
++	case OPTEE_RPC_CMD_WAIT_QUEUE:
++		handle_rpc_func_cmd_wq(optee, arg);
++		break;
++	case OPTEE_RPC_CMD_SUSPEND:
++		handle_rpc_func_cmd_wait(arg);
++		break;
++	case OPTEE_RPC_CMD_SHM_ALLOC:
++		handle_ffa_rpc_func_cmd_shm_alloc(ctx, arg);
++		break;
++	case OPTEE_RPC_CMD_SHM_FREE:
++		handle_ffa_rpc_func_cmd_shm_free(ctx, optee, arg);
++		break;
++	case OPTEE_RPC_CMD_I2C_TRANSFER:
++		handle_rpc_func_cmd_i2c_transfer(ctx, arg);
++		break;
++	default:
++		handle_rpc_supp_cmd(ctx, optee, arg);
++	}
++}
++
++void optee_handle_ffa_rpc(struct tee_context *ctx, u32 cmd,
++			  struct optee_msg_arg *arg)
++{
++	switch (cmd) {
++	case OPTEE_FFA_YIELDING_CALL_RETURN_RPC_CMD:
++		handle_ffa_rpc_func_cmd(ctx, arg);
++		break;
++	case OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT:
++		/* Interrupt delivered by now */
++		break;
++	default:
++		pr_warn("Unknown RPC func 0x%x\n", cmd);
++		break;
++	}
++}
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/002=
1-drivers-optee-hack-for-UUID-endianess-issue.patch b/meta-arm-bsp/recipes-=
kernel/linux/linux-arm64-ack-5.10/tc0/0021-drivers-optee-hack-for-UUID-endi=
aness-issue.patch
new file mode 100644
index 0000000..8f3d397
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0021-drive=
rs-optee-hack-for-UUID-endianess-issue.patch
@@ -0,0 +1,58 @@
+From 831d01e34ff2065c585da91c8923ea44146097cd Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Thu, 27 May 2021 13:40:33 +0100
+Subject: [PATCH 13/14] drivers: optee: hack for UUID endianess issue
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+Change-Id: Id5c42e4fe491a448f746b9d132dae20c85666554
+
+Upstream-Status: Inappropriate [will not be submitted as its only a workar=
ound]
+---
+ drivers/firmware/arm_ffa/driver.c | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/=
driver.c
+index 056a3fca14d1..82c84fe10be2 100644
+--- a/drivers/firmware/arm_ffa/driver.c
++++ b/drivers/firmware/arm_ffa/driver.c
+@@ -275,8 +275,18 @@ ffa_partition_probe(const uuid_t *uuid, struct ffa_pa=
rtition_info **buffer)
+ 	struct ffa_partition_info *pbuf;
+=20
+ 	export_uuid((u8 *)uuid0_4, uuid);
++
++#if 0
+ 	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
+ 					 uuid0_4[3], NULL, 0);
++#else
++	/* hack for optee UUID endianess issue */
++	count =3D __ffa_partition_info_get(be32_to_cpup(&uuid0_4[0]),
++					 be32_to_cpup(&uuid0_4[1]),
++					 be32_to_cpup(&uuid0_4[2]),
++					 be32_to_cpup(&uuid0_4[3]), NULL, 0);
++#endif
++
+ 	if (count <=3D 0)
+ 		return count;
+=20
+@@ -284,8 +294,17 @@ ffa_partition_probe(const uuid_t *uuid, struct ffa_pa=
rtition_info **buffer)
+ 	if (!pbuf)
+ 		return -ENOMEM;
+=20
++#if 0
+ 	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
+ 					 uuid0_4[3], pbuf, count);
++#else
++	/* hack for optee UUID endianess issue */
++	count =3D __ffa_partition_info_get(be32_to_cpup(&uuid0_4[0]),
++					 be32_to_cpup(&uuid0_4[1]),
++					 be32_to_cpup(&uuid0_4[2]),
++					 be32_to_cpup(&uuid0_4[3]),
++					 pbuf, count);
++#endif
+ 	if (count <=3D 0)
+ 		kfree(pbuf);
+=20
+--=20
+2.29.2
+
--=20
2.29.2

