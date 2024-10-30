Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FCAD7497F
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 08:02:41 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.87])
 by mx.groups.io with SMTP id smtpd.web11.9804.1730275357715918579
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 01:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B343kkzx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B343kkzx;
 spf=pass (domain: arm.com, ip: 40.107.241.87, mailfrom: gyorgy.szing@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YJeYUuzeW7g/yJJlhQoCePK7cYPX0sLdPwED8Ns/wDFHKDQz1pKkXcVARLPEzPDsiVe75GLBlIPkNW9yfsvpU3RUqucm9fBkKIvq7flzYg8gQ6Wg+p/EfvLm0JGCyYHV+YIhWogbgXoiQsim7ihf+B6eHh4JtzUAAfDw5DhhrXRwDYqLH16fCCotM6Y5yzkCE+45YGNfR3oVKPZ8gpNGSXGu3YDBRDrE88VbjLL6TyUSY1YsczAP1OHcFkOKCfgG/cXRVHBOn71sXiignMNCojhl+vjK9eRsvD2IErZ3/XuIB3g3tN1xDRk319vVqdsgHG9zZ/R7lpHElRR+VZO4Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xYaEY/bKXBYPNN4E88LXokvOhgoXPKCkhKIFMvWQAM=;
 b=TyKmdtvsF1Fda107sS842GZYP2iGwEjEoDRVrDPwA67uATELczO9gd4YqiE7jpkIBUL/W8DPdsXVyJJ9mi9pzPUsgkwfiZenonSFs/Jiiu7SI7x4xeBIiUn3CDHU+3IL5h7yr+EA9DATa+lEqwNr5/WTst7+zkQjiyo9826CeFCj4S2EXQWUqCqsgbo6H5M9dOQ0VSbJxba412vxjWpqbbrlR8G5r4UNoZefFVC8bXUuVRezX8qYxiJvK9K2CI3d2nRVkICqUvYuru+F8fkbfRoc4Wkaag3q7l0yek0vjCoulr/i4b4/4ZGLRGfyYWNx4ouKNxY26dkyXuhcqPkVtg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xYaEY/bKXBYPNN4E88LXokvOhgoXPKCkhKIFMvWQAM=;
 b=B343kkzxXHHE4ZBfz06qi3YJH+X1o5uN264V96jyK2v/seTpi0NCmW//GGkpUptw6ZxoD4+TVgk2+iA29ao4KDhgOlzOIqisOSOkVde7ATiXyRGa61ixqPmoWbFmGdPn7SuO+oSuEqt0okWvZmv8ZFnuQD7hM6+Jdort1oJT7jU=
Received: from AM6PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::25)
 by DBBPR08MB6026.eurprd08.prod.outlook.com (2603:10a6:10:1f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Wed, 30 Oct
 2024 08:02:33 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:209:89:cafe::8e) by AM6PR10CA0012.outlook.office365.com
 (2603:10a6:209:89::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Wed, 30 Oct 2024 08:02:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Wed, 30 Oct 2024 08:02:30 +0000
Received: ("Tessian outbound 0fe1877cedb7:v490"); Wed, 30 Oct 2024 08:02:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aafd006738bd4711
X-TessianGatewayMetadata: yxUGELAUV7C1KpSmCwf7TymQ7M8rnFsX+JPv8RL238A3PS0dlS516iAh7LJ7+/XTEUvD0H6h2sH8QYGwZ8mpig+S9uA8EbkyhcOucL2XBbEFc5R7PdKnLUD6dKBxiIVzIDTPzcP47ykPgxPuF96rw3G2R3mXiyFYZPWHIu8CqCBEERlfmfVrPVGpChULSrzjIjehzo1g70BOxSyV3oyJ7g==
X-CR-MTA-TID: 64aa7808
Received: from Lf7622eb1e6b4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2843A72E-D65D-408C-B1D5-E0A98D8F388D.1;
	Wed, 30 Oct 2024 08:02:24 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf7622eb1e6b4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Oct 2024 08:02:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=on+rQyZkvcS0YxVzTzlNgbqC6Nld0b3F1pjBd07/B7MeUTE+aTvB7v7KbsSgyGdzgqQrYfT9xBaZHTXujF7gkfJOz73rt7UdmUb0kleFf91FsaWAKmLzWr6qj/JkoswpuyKgng8JtYKa5rvMh514a1g24gQeIDP+FpDL+I3LYmZxcfSvoEP/suSfZk1/DxuOZPbhhTopSNNs4WsXuq1WWAjH1b+4IbApPeJEEIQVtcoVCoYurnl9CgQVwi5z3WstlyyBZYqEJhlpgaj7tN5ieFCUOJsFzncbtBYkuZaasrRZV1pC1CiJ/a+N7MylFOBU7dP1bunYDF2OBmd82C2wfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xYaEY/bKXBYPNN4E88LXokvOhgoXPKCkhKIFMvWQAM=;
 b=tcAt2nuukwem48Qx9C1gdKn3zT/0j0XM2skdJyYXez4TJ/+aC7U8HxkfjGQSpJg2avr9rqoOFDNa/B2NBbn8oa0t5OdJ4lCP1R62NAnwooTUiXS2+TwbLPYLLooN2inUfbZsoVJechCiFTjUsTc1P6VszSNPPGu42uJYtWYHAWf3DaiggAUwlyS5IDVgSqK1UYRxPN1RcraEMZYGRGXIxSr442R0ODxmWPpDAQ7SOSDyoxgt1kOPajBfzUy/Mli+HnFG6+E0snFsFeVSzDJ3yVMCB6w4gZRXB530FfroyBRFWoL2tRPvG69qOPtHUIv0/xqSh9QxOaL9vhFKmfK0+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xYaEY/bKXBYPNN4E88LXokvOhgoXPKCkhKIFMvWQAM=;
 b=B343kkzxXHHE4ZBfz06qi3YJH+X1o5uN264V96jyK2v/seTpi0NCmW//GGkpUptw6ZxoD4+TVgk2+iA29ao4KDhgOlzOIqisOSOkVde7ATiXyRGa61ixqPmoWbFmGdPn7SuO+oSuEqt0okWvZmv8ZFnuQD7hM6+Jdort1oJT7jU=
Received: from AS8PR08MB5895.eurprd08.prod.outlook.com (2603:10a6:20b:298::16)
 by AS1PR08MB7539.eurprd08.prod.outlook.com (2603:10a6:20b:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 08:02:19 +0000
Received: from AS8PR08MB5895.eurprd08.prod.outlook.com
 ([fe80::bac5:353d:9e15:e4d8]) by AS8PR08MB5895.eurprd08.prod.outlook.com
 ([fe80::bac5:353d:9e15:e4d8%5]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 08:02:19 +0000
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: "tom.hochstein@oss.nxp.com" <tom.hochstein@oss.nxp.com>, Mikko Rapeli
	<mikko.rapeli@linaro.org>, Tom Hochstein <tom.hochstein@nxp.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Sahil
 Malhotra <sahil.malhotra@nxp.com>
Subject: Re: [meta-arm] [PATCH v3 1/2] optee-client: use udev rule and systemd
 service from upstream
Thread-Topic: [meta-arm] [PATCH v3 1/2] optee-client: use udev rule and
 systemd service from upstream
Thread-Index: AQHbIGJP6ZsFad4JT0yVYVTYOI8k2LKUbTcAgAACK4CAAAcQcYAJkVSAgADzSSA=
Date: Wed, 30 Oct 2024 08:02:19 +0000
Message-ID: 
 <AS8PR08MB589517BA3B9BD14644DEF4CE91542@AS8PR08MB5895.eurprd08.prod.outlook.com>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <PAXPR04MB9448F0D1DE0F84A6634EFBC5E24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkId04rSl5ykKCJ@nuoska>
 <PAXPR04MB9448DC39953E357F3E73D07EE24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkOI7vA6YDQZewJ@nuoska> <7c3c9ad1-a1e0-474f-8710-9b77d2a2ea17@oss.nxp.com>
In-Reply-To: <7c3c9ad1-a1e0-474f-8710-9b77d2a2ea17@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB5895:EE_|AS1PR08MB7539:EE_|AMS0EPF000001A1:EE_|DBBPR08MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: d5470133-6e22-4ecb-8e04-08dcf8b93440
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?mDXBU1pq1xwmc6/UQ8MRmjTLxZllXLJmxpET5rt9CflEhyomCkviJ+4TnoDf?=
 =?us-ascii?Q?lnyDCIj3ZN31E6XhpYynRvY7dSUfWD4srzespyK1KMy0WX3rx826AUWSRYui?=
 =?us-ascii?Q?gQ9vrW7/pUe3BulQ700DUsl4Oic/rO4v4RIq+LcTZwQ6jrXhVRysQDHY49/4?=
 =?us-ascii?Q?4xzKWKNWsF+TY0mxUseaZ21CxQi3Ky1bT8QptxKhMcqdB13S6DwBiyWYzKF2?=
 =?us-ascii?Q?4QtOfzBJdY1oyFUIM1oScXMWq6yHSGY3YDQ8Aim2riWyU1GBOiM5b2GhQKM1?=
 =?us-ascii?Q?muaM/1I4IJgfsOxbSRIps1gfdBmV3AW6Bd4FONb2rlrsbsIVufDE4qutwF4M?=
 =?us-ascii?Q?B9mlhxwDkFLz3LFvxf/CSW0rXqfgEUvir2iAQrbpMy2gpQZcJIhxmkp2cw9a?=
 =?us-ascii?Q?Ri/zWHK4PlIN8YrGMt6yo3OBph4KZkBzYXSx/GPcJl+8uNWuwu/kglXJguaZ?=
 =?us-ascii?Q?E0e5Z2KQaalPL2spk/+wHp/1jZaa5o5mC0S9NdWVtnsdHECO/4jbK8W0z+58?=
 =?us-ascii?Q?CteraEygOVGcWFBHNlYRlRBwoLjYDR5z1JelCAGJnIwssd1LLe9s7xUCzlVa?=
 =?us-ascii?Q?KCMOCD6t9f2sl+Bxei3toPT73Neaq4c/bD5ZANU86nYvOmnJlHoUYiWSbd8V?=
 =?us-ascii?Q?WINW6hc/DOPar1qc9UZTEnkpE0hVQjfDAiYqXoVYGKTcWA4sSSelCUv84H2/?=
 =?us-ascii?Q?vuqfyKLynXljo1dzkAiRTIzSmv2WlMJIqf2LryWilzTDCx6VmGbHFWP65xXe?=
 =?us-ascii?Q?YvqghWx0siXM7YDLQsZtaC7GoutabloukAYovKQqBR9iwdO4vvb7Hf90+fQY?=
 =?us-ascii?Q?FVhDeCWxsQ8HfBkyXv8P5p4vfvqXGzOJhr2jVx5AsEZ1GKHWKirNYF1NIEIL?=
 =?us-ascii?Q?W/0E0HRnyjPKZTZwUrC8PQsSlYP29uElN7zSiO8QTn8aGFf+AyNFRfTujvrx?=
 =?us-ascii?Q?d9zjJRicL7it96jDOmIX5Bcpy8Ave3piQvUgT5RoelTbMFSwKpARaaY3iHnd?=
 =?us-ascii?Q?MKLPve+mIUhSrH4AQ0RmH2ObgQLtICgagsNONBpOtGZp/1JS4BQlLljXEtIY?=
 =?us-ascii?Q?zdoq8QQwAA/6qhGcHeBqiwtY6VHytumd26b3tqPaJQhI5qghXmzvmk3UwBAA?=
 =?us-ascii?Q?E4LJmWxHJkLJIMP7gWR8GxDQCKyMSVUdk+micHjUD11lyMrWqOxTAHiZCys5?=
 =?us-ascii?Q?2S+G2BkqN/lglfHHxpyvfq/0PAl3pTRj2XRaCT8KYUorMcR8yfnHh0jK3Sc2?=
 =?us-ascii?Q?DCI9LspqOejsL2TaoY7Z5UQmDIZNRRFG00RrKmHSyhXcmyg1YstwF7H7/XdA?=
 =?us-ascii?Q?OYqQCIq3IjMguA+HhWEb+mim?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB5895.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB589517BA3B9BD14644DEF4CE91542AS8PR08MB5895eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7539
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:298::16];domain=AS8PR08MB5895.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6a7bea5a-8783-45d8-2d9a-08dcf8b92d41
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|35042699022|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?Windows-1252?Q?tADq1DT9gxtsJc32vVVlbYDryGXqV7xDO8r5quPdjuNyaLxbcLkcJL6n?=
 =?Windows-1252?Q?RhWo9O33Of1NHkBbaCxQF6HK0vAAjXVRyn3jKlvVgMmNBFuBePBPmbi8?=
 =?Windows-1252?Q?i9afbXYmzC9fwlFVAjHYx8NROuz2RByZRXegXSkLDIOgvanLsv9cUJB6?=
 =?Windows-1252?Q?MOB0vc7cSW65ZqdyBR4VeFX1VYvkWJrJ7sXk9or9xxo6fMH0KvdpfhQp?=
 =?Windows-1252?Q?VLFuwIr2zY2yKZRd+7Gpdr0fxTFLsOaZCxkwGhi9Dg5jSN/AEZthqi54?=
 =?Windows-1252?Q?k7S+MFPULt7T6EOB+bNH3ILiQGmLts3nXBdmWzsMnwqklsnaxg4zz5WX?=
 =?Windows-1252?Q?EnxA92d5LbV4uwBnV3YbJfbUPv53+CzoRo3MEGg/P9Agd9Wo0+F1s091?=
 =?Windows-1252?Q?MCjcJWBgmgqRvJjv92rLQx45Uyg75E1XyurBM339+xew0NKn2+0S0/9c?=
 =?Windows-1252?Q?MNBLk2xerokjl4yQfuZA44p89K+nUnKbVriFUE7QbxW0A3tvZLfBcALQ?=
 =?Windows-1252?Q?fBYJR5m6rqp2UZl4U6F+k7oYv9KZsr4w1go2mLdqXbSlzOET6JT2Yz5B?=
 =?Windows-1252?Q?orMcO5W59fvOFgljgXhExT084ci3VRAsxWICnxmRTM7RYfHp+JGdoxoR?=
 =?Windows-1252?Q?tto3GMGbzMV9rIE6PwZfWTIOtsqSwVdjZp1k/G9oFCdwBDbalxSSSCUJ?=
 =?Windows-1252?Q?PLza22HqNNURT1weIrtGBFqz1q1xIEvcejdZ22JgFQAwnVaPC4rNwWTs?=
 =?Windows-1252?Q?uXeSxUv2ddOBlx7scxTO4azTYUieQ6XXYmM38NBtfRFGHj3UpIMf9g5/?=
 =?Windows-1252?Q?M76ZF5sE3Gi4zKa0/N3PpC6ON62rTNK4I8UO7wbdrpYUZweONt9cObYd?=
 =?Windows-1252?Q?5TGGbRsHXwZk5J9GsllAamPonztZB4MkRX5qMxwzTfu1O7Iwkykjt9g6?=
 =?Windows-1252?Q?qYm5cjlC+vu0n0b+k4oW0Cb5glA/0PQPprKwQTnPIeYpaZ6pzh4IBbgJ?=
 =?Windows-1252?Q?mAu8PHFcXVZ69j40vs9PMyO3yJx4NKQoZw3ZK0j7gcpa7VoM2Zyb9L5o?=
 =?Windows-1252?Q?duEwj1qQQGHy/7COM+1J8iEeSGKCqBpeQgI4I1rwHxCED/sP8JOh3x7I?=
 =?Windows-1252?Q?EJOl3YosXQEJRuCPrF9UNpn1exm2N5Nlzb7X8BeUCb939gz5sqvUN9Tl?=
 =?Windows-1252?Q?+N19Lk4BSdiRHjFhsHvR+QPicgrWdYDEHerOaWLBbjGE6bI7R9NH7LmV?=
 =?Windows-1252?Q?Dg4l1aTXpCJGEznM5DAUnCLy74AOxg2y8O6rkNy+w5p3AMnE4pMA0//f?=
 =?Windows-1252?Q?zyvFQaufGb0ut+pbvCuOeCxeNbuCfyL33eHp4ppUsjhRm7Vn17Tgh5XA?=
 =?Windows-1252?Q?vCeQxWBAtMUF+cU4QMDZWOc89wrhV9/LXICtlPbNOPgEM8nfzbLFonoo?=
 =?Windows-1252?Q?0VZRAjnzV2fJf5UA9Xve/A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(35042699022)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 08:02:30.8426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5470133-6e22-4ecb-8e04-08dcf8b93440
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6026
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Oct 2024 08:02:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6237

--_000_AS8PR08MB589517BA3B9BD14644DEF4CE91542AS8PR08MB5895eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

(Sorry for the delayed reply.)

Another way to address this would be to use PkgConfig from CMakeLists.txt (=
see [1]). This might be considered a nicer solution as the yocto recipe wou=
ld not have to correct the install location, and thus there would be a sing=
le source of truth. (Kudos for Ross for the suggestion.)
Something like (code is not tested):

Include(FindPkgConfig)
If (PKG_CONFIG_FOUND)
                # TODO: there are other variables. Doublecheck if systemdsy=
stemconfdir is the right one to be used. On X86 Ubuntu this returns /etc/sy=
stemd/system. Yocto might define distro specific values.
                pkg_get_variable(UNIT_DIR systemd systemdsystemconfdir)
                # TODO: check the value to see if pkgconfig successfully fo=
und the value. Behavior is not documented, probably if (UNIT_DIR) would wor=
k.
                # TODO: UNIT_DIR is a string list, use only the first or la=
st value? Rewrite the line below accordingly
set(CMAKE_INSTALL_SYSTEMDSYSCONFDIR =93${ UNIT_DIR }=94 CACHE PATH =93Targe=
t directory for system config files=94)
endif()
# By default, use LIBDIR
# TODO: CMAKE_INSTALL_SYSCONFDIR might be a better default base dir.
set(CMAKE_INSTALL_ SYSTEMDSYSCONFDIR =93${ CMAKE_INSTALL_LIBDIR}}/systemd/s=
ystem=94 CACHE PATH =93Target directory for system config files=94)

install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.service D=
ESTINATION ${ CMAKE_INSTALL_SYSTEMDSYSCONFDIR})


The above code would default to the current install location under LIBDIR, =
 and would use PkgConfig if available. Setting CMAKE_INSTALL_ SYSTEMDSYSCON=
FDIR from the command line allows manual override.

1: https://cmake.org/cmake/help/latest/module/FindPkgConfig.html

/George

On 2024-10-29, 18:03, "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoc=
toproject.org> wrote:

On 10/23/2024 9:54 AM, Mikko Rapeli wrote:
> Ok got it now.
>
> ${nonarch_base_libdir} isn't in the CMake toolchain file. We could
> move ${libdir}/systemd unconditionlly to ${nonarch_base_libdir}/systemd
> in the do_install task. Could you test and submit a patch like below?
>
> --- a/meta-arm/recipes-security/optee/optee-client.inc
> +++ b/meta-arm/recipes-security/optee/optee-client.inc
> @@ -23,8 +23,9 @@ EXTRA_OECMAKE:append:toolchain-clang =3D " -DCFG_WERROR=
=3D0"
>
>   do_install:append() {
>       # installed by default
> +    mv ${D}${libdir}/systemd ${D}${noarch_base_libdir}/systemd
>       if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fa=
lse', d)}; then
> -        rm -rf ${D}${libdir}/systemd
> +        rm -rf ${D}${noarch_base_libdir}/systemd
>       fi
>       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fal=
se', d)}; then
>           install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysco=
nfdir}/init.d/tee-supplicant
>
> Cheers,
>
> -Mikko

This works fine in our testing. Sorry for the late response.

Thanks again!

Tom

--_000_AS8PR08MB589517BA3B9BD14644DEF4CE91542AS8PR08MB5895eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-HU" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">(Sorry for the delayed reply.)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">Another way to address this would be to use PkgConfi=
g from CMakeLists.txt (see [1]). This might be considered a nicer solution =
as the yocto recipe would not have to
 correct the install location, and thus there would be a single source of t=
ruth. (Kudos for Ross for the suggestion.)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">Something like (code is not tested):<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">Include(FindPkgConfig)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">If (</span><span style=3D"font-size:11.0pt;mso-farea=
st-language:EN-US">PKG_CONFIG_FOUND</span><span lang=3D"EN-US" style=3D"fon=
t-size:11.0pt;mso-fareast-language:EN-US">)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # TODO: there are other variables. D=
oublecheck if
</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">systemds=
ystemconfdir</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-=
US">
<span lang=3D"EN-US">is the right one to be used. On X86 Ubuntu this return=
s /etc/systemd/system. Yocto might define distro specific values.<o:p></o:p=
></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">pkg_get_=
variable(UNIT_DIR systemd systemdsystemconfdir)</span><span lang=3D"EN-US" =
style=3D"font-size:11.0pt;mso-fareast-language:EN-US"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # TODO: check the value to see if pk=
gconfig successfully found the value. Behavior is not documented, probably =
if (</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">UNIT=
_DIR</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-fareast-langu=
age:EN-US">)
 would work.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # TODO:
</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">UNIT_DIR=
</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">
<span lang=3D"EN-US">is a string list, use only the first or last value? Re=
write the line below accordingly<o:p></o:p></span></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;mso-fareast-language:EN-US">set(</span><span style=
=3D"font-size:11.0pt;mso-fareast-language:EN-US">CMAKE_INSTALL_</span><span=
 lang=3D"EN-US" style=3D"font-size:11.0pt;mso-fareast-language:EN-US">SYSTE=
MDSYSCONFDIR
 =93${</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-fareast-lan=
guage:EN-US">
</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">UNIT_DIR=
</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">
<span lang=3D"EN-US">}=94 CACHE PATH =93Target directory for system config =
files=94)<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">endif()<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"># By default, use LIBDIR<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"># TODO:
</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">CMAKE_IN=
STALL_SYSCONFDIR</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"> might be a better default base dir.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">set(</span><span style=3D"font-size:11.0pt;mso-farea=
st-language:EN-US">CMAKE_INSTALL_</span><span style=3D"font-size:11.0pt;mso=
-fareast-language:EN-US">
<span lang=3D"EN-US">SYSTEMDSYSCONFDIR =93${</span></span><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;mso-fareast-language:EN-US">
</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">CMAKE_IN=
STALL_</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-fareast-lan=
guage:EN-US">LIBDIR}</span><span style=3D"font-size:11.0pt;mso-fareast-lang=
uage:EN-US">}/systemd/system</span><span lang=3D"EN-US" style=3D"font-size:=
11.0pt;mso-fareast-language:EN-US">=94
 CACHE PATH =93Target directory for system config files=94)<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.s=
ervice DESTINATION ${</span><span style=3D"font-size:11.0pt;mso-fareast-lan=
guage:EN-US">
</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">CMAKE_IN=
STALL_</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-fareast-lan=
guage:EN-US">SYSTEMDSYSCONFDIR}</span><span style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">The above code would default to the current install =
location under LIBDIR, &nbsp;and would use PkgConfig if available. Setting
</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">CMAKE_IN=
STALL_</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">
<span lang=3D"EN-US">SYSTEMDSYSCONFDIR from the command line allows manual =
override.
<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">1:
<a href=3D"https://cmake.org/cmake/help/latest/module/FindPkgConfig.html">h=
ttps://cmake.org/cmake/help/latest/module/FindPkgConfig.html</a><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">/George<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<div>
<p class=3D"MsoNormal">On 2024-10-29, 18:03, &quot;meta-arm@lists.yoctoproj=
ect.org&quot; &lt;meta-arm@lists.yoctoproject.org&gt; wrote:<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">On 10/23/2024 9:54 =
AM, Mikko Rapeli wrote:<br>
&gt; Ok got it now.<br>
&gt; <br>
&gt; ${nonarch_base_libdir} isn't in the CMake toolchain file. We could<br>
&gt; move ${libdir}/systemd unconditionlly to ${nonarch_base_libdir}/system=
d<br>
&gt; in the do_install task. Could you test and submit a patch like below?<=
br>
&gt; <br>
&gt; --- a/meta-arm/recipes-security/optee/optee-client.inc<br>
&gt; +++ b/meta-arm/recipes-security/optee/optee-client.inc<br>
&gt; @@ -23,8 +23,9 @@ EXTRA_OECMAKE:append:toolchain-clang =3D &quot; -DCF=
G_WERROR=3D0&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; do_install:append() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # installed by default<br>
&gt; +&nbsp;&nbsp;&nbsp; mv ${D}${libdir}/systemd ${D}${noarch_base_libdir}=
/systemd<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ! ${@bb.utils.contains('DISTRO_=
FEATURES', 'systemd', 'true', 'false', d)}; then<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -rf ${D}${libdir}/syste=
md<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -rf ${D}${noarch_base_l=
ibdir}/systemd<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ${@bb.utils.contains('DISTRO_FE=
ATURES', 'sysvinit', 'true', 'false', d)}; then<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -D=
 -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supp=
licant<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; -Mikko<br>
<br>
This works fine in our testing. Sorry for the late response.<br>
<br>
Thanks again!<br>
<br>
Tom<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AS8PR08MB589517BA3B9BD14644DEF4CE91542AS8PR08MB5895eurp_--

