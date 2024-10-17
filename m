Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FDFD21279
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 10:55:04 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.53])
 by mx.groups.io with SMTP id smtpd.web11.46353.1729162500802909883
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 03:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=h0YglE7f;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=h0YglE7f;
 spf=pass (domain: arm.com, ip: 40.107.247.53, mailfrom: gyorgy.szing@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tZuDZRpw85v9UQRtf8sqySZQcBz5kE4GuEBA16FiFH4zHQ2ndN+5vQTeeozG9y+jkKn9W3SIQm1QJrKxtLQd2c1L3EulIYJjZs1c3l8I7k4Y4glNPS4aas13aRqwW8Qw7F/Sj1V3L5mLcCGPSK2WuL3jG3MutPc/LUffu5nA4ff44CPg7GmUP5LnEihQhidipF1WxdQ5zS1g0jwZW7Nf+gHjTdzcO8HQg5sHIkZeGyZVpeEC27aqUDVQ4zg6PfI469PD02dqYVv/yNeBUgLk2Ds0mwOvN/967Dc6O798PkH0PpBYUVVBAvuHousBEx310MDI/B+s8hOoS3wYkkzl+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VTI2U0jzCdii/FMaThnO/jFcNFguSnZ+dyj6R5qcqA=;
 b=dIxOaHngeuqOQzyjzFYzfKgsVSChKF/jASG0Gg2+aq5BU5skNszNbqsBLIUjdAmC3G6n4K88uTaHFf36qQq7YThYLLTiAjdohpf87x3sFizTdBL0ysn9D8e479i8WUVvYO/Xc4kP7J24LmhzwxI1+md4JDIqjunYucAdfH7wGLkC2ShuJckJq3HqYnIp65tsHzmdNvrpe3tEIQpQjTs3m3BVQh7/PLlwfCSXwHP03Z67HQjjdnPrh/VNiMGlAnlEvqOlEyl67bIjeNSe+OBzu09YB9NEfYXTEneB4+SMEzJZQp6a2GEkPKqSWwwln95MyEfiwK+NCbDZPP+uhlcg1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VTI2U0jzCdii/FMaThnO/jFcNFguSnZ+dyj6R5qcqA=;
 b=h0YglE7fSMcIfZSZk2aCkxBuTOxklUce0glvRpHwaD9yf6UdLJ1VY4W71DtqpTq08Bdk1mQsFZPavc5Kj+KkRbLncVjC/eXzuxLS6APSm76CFkB9CvFJt158k2rj3fB/m7Ln3hLiXpF6SBUDEIRMqugoHF1SMbjHpWod0n9sOVY=
Received: from AM5PR0301CA0026.eurprd03.prod.outlook.com
 (2603:10a6:206:14::39) by DB9PR08MB6572.eurprd08.prod.outlook.com
 (2603:10a6:10:252::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Thu, 17 Oct
 2024 10:54:55 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:206:14:cafe::6e) by AM5PR0301CA0026.outlook.office365.com
 (2603:10a6:206:14::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20 via Frontend
 Transport; Thu, 17 Oct 2024 10:54:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8069.17
 via Frontend Transport; Thu, 17 Oct 2024 10:54:53 +0000
Received: ("Tessian outbound cd6aa7fa963a:v473"); Thu, 17 Oct 2024 10:54:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 436b42beaa4ebc90
X-TessianGatewayMetadata: jmTPeD87MDa0bi2cMfQtLqnq8nhD7gaarTfvr3/tK+igPq8k/tNFJcaOBYWUW1NUAY993j6A0xDcUNEIpJ1Wb1mHbAyv96dW3GYN8gs5cSNf48poFcdvEAa8N6IrsY++bLiNAou5RfUvvPDMBn9fgdz+lNXF/CShb2iNJq3CKhucJJ3gN+1eWeprirgrTykwq+oRWr4pkInA3VsyLphVHw==
X-CR-MTA-TID: 64aa7808
Received: from L3bb662cd718a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 04FF026E-FB8F-418B-884F-7DB276C80153.1;
	Thu, 17 Oct 2024 10:54:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L3bb662cd718a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 17 Oct 2024 10:54:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJNoN5YXaq3LI/MzD2Ukx+y8CDkYQ7MMLTJeJHNWvOeubAtGFNPTeRqZcMDJFj12rTvRjkD5nvuPF8Kdx9zOClOTBCUjMYleL54MAVJ+ilUICznbI+bV2N25kJBsvO6Hv309WOQ9aBIms5aNlcP6ZQZNx4X4WbKjp03WBDV4iH+6vYvrKaG42mcI5lCDdDjkGpEtnL5LtTGU1qzEbvXO5w0Z8CyocjjEV0hm3n2qTi3EkpGUaCi8w7E1dHQKFWg1TR2lR6Qj+HcrJxN7u4adc6SZsI95chwRFCED7OnLvs84jsPUsUw+glnZTJkIcKWVFKGbrSNCwedDzi3gVVMGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VTI2U0jzCdii/FMaThnO/jFcNFguSnZ+dyj6R5qcqA=;
 b=q0SOAcVwuNFo1KIIpvrxrrSs+JyrhpYVDkyrgBtvqEZSKkdB7zcGLOGle52C9ORuW4CPOySi/hayBITZP+jd5ZeJBW6soyXlQGH0sWEuARv3MgdkKwblIa9bmiztXXkSEvpG1O0Q7c7axOTPdu79y3bJVkw8/D5jEMyKjxIcwAAPHgvYvfEtclvv+g0wb5/wbigz368sguJSL2vUgZA4srGiQ8qy4tfV7ulCpOUkyPo589fziJaZgs8O6KSgOYfuvj9xenUrg5CoUgYB/aHL+j+/Xa0gB5jraG6tDHUFREORLQ3nVb+e8+drx67pPLiwdkt3R9ATwGcuecRLqxMR/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VTI2U0jzCdii/FMaThnO/jFcNFguSnZ+dyj6R5qcqA=;
 b=h0YglE7fSMcIfZSZk2aCkxBuTOxklUce0glvRpHwaD9yf6UdLJ1VY4W71DtqpTq08Bdk1mQsFZPavc5Kj+KkRbLncVjC/eXzuxLS6APSm76CFkB9CvFJt158k2rj3fB/m7Ln3hLiXpF6SBUDEIRMqugoHF1SMbjHpWod0n9sOVY=
Received: from AS8PR08MB5895.eurprd08.prod.outlook.com (2603:10a6:20b:298::16)
 by GV1PR08MB10719.eurprd08.prod.outlook.com (2603:10a6:150:16f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Thu, 17 Oct
 2024 10:54:41 +0000
Received: from AS8PR08MB5895.eurprd08.prod.outlook.com
 ([fe80::bac5:353d:9e15:e4d8]) by AS8PR08MB5895.eurprd08.prod.outlook.com
 ([fe80::bac5:353d:9e15:e4d8%5]) with mapi id 15.20.8026.017; Thu, 17 Oct 2024
 10:54:41 +0000
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
Thread-Topic: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
Thread-Index: AQHbIGJjaIhpu//Lm0aPbjb1+Fzi/7KKmFWRgAAFrQCAAA3wIoAAB+IAgAAJQFw=
Date: Thu, 17 Oct 2024 10:54:41 +0000
Message-ID: 
 <AS8PR08MB58951A0CBE556C313695963291472@AS8PR08MB5895.eurprd08.prod.outlook.com>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <20241017065907.172504-2-mikko.rapeli@linaro.org>
 <AS8PR08MB589563A608DE289457643CA991472@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <ZxDMGLYsOSe9rPFO@nuoska>
 <AS8PR08MB589512524CBB7BFB377101C391472@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <ZxDeZvHXRUmITGKd@nuoska>
In-Reply-To: <ZxDeZvHXRUmITGKd@nuoska>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB5895:EE_|GV1PR08MB10719:EE_|AMS0EPF000001AE:EE_|DB9PR08MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 3219360b-61cd-44b4-8fb6-08dcee9a21d0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?xhWTA4fMVJuy5Bm14tM9HeQQ8nyMcSBt4R4DRkZRY+VbU98DaMjRG9+KUB6u?=
 =?us-ascii?Q?ykm7nmwNKLOB1t5fhGK6YSoKP4N072p+L9dqky/aYoctgo6NKmCHMWGj2V5v?=
 =?us-ascii?Q?p+B9C6WyymAQZWmOlL6Axya+lBl80XztExCH0ojNulO/+iawXAXoYNsYP+2c?=
 =?us-ascii?Q?KWx00/WbV3CrbFHzghLJehSNA3+SBMqi7EBA3xlUU9EfGbTOo5fkiyHBdyqc?=
 =?us-ascii?Q?JvW8Seepaw/Tv8U21ePhJf4uZ8jo8r5zuE9wiIkIgMLA3zA6/uzr6GF7pruk?=
 =?us-ascii?Q?/x2uq1kcvrgmb/iFttFHGQjqHzuFxmgXrEgtiMtAg49p1JolrKW8SQ1Ix69m?=
 =?us-ascii?Q?AT78mbHMLZ2Ds/FyYGtguPpThK0p056E7c9zx48mQftEkuMKonmTnkrjTBza?=
 =?us-ascii?Q?PBgwS0B7vNgjOmbrrkEk2CaueE9kFWXwdokZGtGVD8b1TUe7mnreDKkuCqSM?=
 =?us-ascii?Q?hqrmMk/CQPqawbc50ifkDSw2OElW3vhUQhQ9qaAuzEwizy1MyuoaO/cWkAg2?=
 =?us-ascii?Q?Je2O9+O3d2DVyc4dhRfGyhueI2qWnQfbBGobxCoTFlT585otymY0xLYgWbEH?=
 =?us-ascii?Q?vv7jTI8C1EJlE0I4pMnjXxYXsmQfoqYAGfojGLzdvQ5hxJpXTnXZ4agGf3yK?=
 =?us-ascii?Q?p/ZvtfZK9iMo2cQz7OMnY1O59vfp6E86fw8crtWc5oY3NCcJZmGKMHsWdSRy?=
 =?us-ascii?Q?gxEl4txQAGrigjnnKoBuNrm2Y1ucN0+PDQ1Ifnmu6AD7dqQcEzsjMmU4q/ZI?=
 =?us-ascii?Q?Ijv9Z3knPRWFL2M4TkaK/wculNcGwltmZp9XIK2NEX41wi6T5jdyxrepnR+a?=
 =?us-ascii?Q?3zycU3fUDwBRHgb3+lsSz9+lBSjxt1iUoLtQmn4iJiup8KqRSz6Xo9i+aV4s?=
 =?us-ascii?Q?Cml31oOUO9qzcNUYAqrk3LnqTNkhL1eoFE3Poukk3sVzxFwJ29kBPDELGZxL?=
 =?us-ascii?Q?0RhL1rT8vo+rku5j/4NTa9FB5Kw0iI39P8+Hyd9emmSt1nG2+6QDNFKmeltw?=
 =?us-ascii?Q?fsLGDJnd4p+xDV8Driw+ZzZXT8dkqpgnHmBXqIuL9UCjaTVjaR8qJbg94lCV?=
 =?us-ascii?Q?xfwZnwLB3qKK8EqmgFKS+DIqe40aJcway51klSNQaIYIzuUfSgbl33AR7D9m?=
 =?us-ascii?Q?2B43gZ8VtfCqsvbKnyiJoiIXDyLhVutqjztF+XBSF/zwkJ0a8eQUJF1oaweK?=
 =?us-ascii?Q?OOP1fAQ6HXfxqH8mEwkiBFYb5cYTr040f2tZkdO1XE46xEJMezPlSPFp57Vm?=
 =?us-ascii?Q?ueUafPVaw0waDBd+jOg8Dz5yTn/19PmN0SUmulPuhOui642HJHBZdAiWACnI?=
 =?us-ascii?Q?H6QTUVeBwb33wB2m0kp11aXMfwH6lOeMikU6RVJvJQX5NmvS+YSXCQpqHMO+?=
 =?us-ascii?Q?UdmZV+o=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB5895.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB58951A0CBE556C313695963291472AS8PR08MB5895eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10719
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:298::16];domain=AS8PR08MB5895.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b01963bc-d4fe-42df-be33-08dcee9a1a9e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|35042699022|36860700013|82310400026|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?Windows-1252?Q?ieBsr1jLALi/FpBB6a/N66rBVky7I1VqvmGpxgKtFzFKJe0qgo32uw+r?=
 =?Windows-1252?Q?bKF8k28Yk8aF0aZo4ZZ6/8BFCPBah60LYdVF9AULNHIyANz6xMCHDhuA?=
 =?Windows-1252?Q?0SovhnaU7pkVA3UT/yJExUJd6H7ujJiboFFSJ9wMnvGK1VKi/dpBbs+L?=
 =?Windows-1252?Q?E45I0fYJlftkXh2qgSC0gcIhHDUxOOPwepI6kKpC4WxqcC7aUB+mZidz?=
 =?Windows-1252?Q?2RbWKAqjcPpBGLqzlpvEc4SYGNbzXSQQbNLtGvZqMKpQO4YeSVCiy3f5?=
 =?Windows-1252?Q?PJDzFR5JmK8UhpMIdvwcQrMjWnIc4DAOyKOV1FtoBfK2X432Zf6TNzNG?=
 =?Windows-1252?Q?/WjPnjc0RwE1dWEzYU/bK3pxtPancC4l3zRZU0TyJkKb67eLzCIc+V7H?=
 =?Windows-1252?Q?Yhy1Ar6n9EkT8jmX/RW5A+Yu5yQuSoO87/HxUzNvnSX8udL2/r/KZLiJ?=
 =?Windows-1252?Q?ln7jy6qJHUrc88MjMfcRF7QDmYo+64OKKuM8Oj3TP7u1ERHA5DcTwETV?=
 =?Windows-1252?Q?E30kT8p85snqMtZ3yFbo/uYrlewVWiWT1Je6PhjpuwZZCEOkIpHylOTf?=
 =?Windows-1252?Q?gwNYZLemJpXa1ED3AYB6m2gPII3yI2YclangWd71SSBCAo+VTAzrV+la?=
 =?Windows-1252?Q?ubL44N0EY/Dng73dOtLImLcuVCOPL9nudZqYv/+JKK3LTnpM0gnbYGfT?=
 =?Windows-1252?Q?9AhJ3ZVBQ4DAeADno715KAYs0MsRKRik3HxxHsV0AruK6S9D8tKOg7H0?=
 =?Windows-1252?Q?aoxdml47NaCi8WtnaGnLgTxcv8MSxh3P9aw5VHbuzuXZShIHYJi05F/f?=
 =?Windows-1252?Q?W8DA3vftdwB6JO3vdz7gpTfo1KC8jQTYF8Tru9b3LHGCZliWGOqNNn9x?=
 =?Windows-1252?Q?Ji1RyC84ZO087EelOCtFPBPvVBBGVBJeRY9ojMm0cKBIK3RBARw9l77C?=
 =?Windows-1252?Q?nw4ZvmIx/Ay1mPrj/0ERsmzX1KrnjCAfqh4mjG+2Q8e1DztTF+axqgI0?=
 =?Windows-1252?Q?uoVyUdl3yyRT/Q2R85d36k9UWst3wxWCbCX+dEe+wcqjlWP3EUhqyhb0?=
 =?Windows-1252?Q?Rti/mxDI2PH5kmh73fTFLo3Yk5v7oRDqK/zzbdXf2V7sWQUsjLcqdVFE?=
 =?Windows-1252?Q?GMf73FP0GAfbYAvbFqZX7TdauVNBTx6Xd8Bnfyrk5EukGlpnQhE50pc9?=
 =?Windows-1252?Q?Xb3nTYaNHb7sJuV9icpeeEoD8jyE+n2FCXZ0nYHEC2/cqBNLHgPQbTsp?=
 =?Windows-1252?Q?2ULpw1bJrRy6a6Jt/9jqzMifv3hKtJYWyAP5Y10BO+5Zd4+hKgVO1RyL?=
 =?Windows-1252?Q?DGU4FivsAwoV8Bg7BlbdPS/eyfbrCf6UpPnkOgBE1IlRDfJUkCCyHrYj?=
 =?Windows-1252?Q?hq5WvUrqajEXb/opj1+WM9v3YujB0zQpVVi9F7Uoub1bDOkw5sM5s+Nz?=
 =?Windows-1252?Q?VcczPW9LGOGBNyL1Qj86W7SiCX3Y/zf85uTKV1jGolcpdMpFLZ6Fb0+r?=
 =?Windows-1252?Q?3f0L+r63r9Az1ESfd7dE8qOxQxx5oQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(36860700013)(82310400026)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 10:54:53.8833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3219360b-61cd-44b4-8fb6-08dcee9a21d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6572
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 10:55:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6209

--_000_AS8PR08MB58951A0CBE556C313695963291472AS8PR08MB5895eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

=93But optee and optee-client are part of the TS images and configs so ther=
e is a link.=94
=93I don't see any user being added to the previously used "teeclnt" group.=
 So which non-root users are there? If the users are in Cassini, I have pro=
posed fixes there.=94
I am not saying the TS recipes are perfect and there might be a dependency,=
 which is an error. Except for the OP-TEE SPMC tests SPs which indeed depen=
d on op-tee and xtest.

=93What is the proper way to fix this?

I don't think duplicating optee/tee-supplicant udev rules is the answer.
I could move optee-client recipe udev rules to a separate binary package
to enable installing without tee-supplicant.=94
I think a dedicated recipe on which both libts and optee-client depends is =
one way to fix.

=93But I'd like to see the users and have a test case, preferably in meta-a=
rm.=94
Well, I cannot provide a setup where TS is used without OP-TEE currently, b=
ut your config can and will be tested in the CI. Yes, TS only world might s=
till be broken, but the change at least would make a step in the right dire=
ction.

/George

From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Thursday, 17 October 2024 at 11:52
To: Gyorgy Szing <Gyorgy.Szing@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev a=
nd group settings
Hi,

On Thu, Oct 17, 2024 at 09:44:07AM +0000, Gyorgy Szing wrote:
> Hi,
>
> The Trusted Services protocol is implemented by the tstee driver and libt=
s.  This means there are multiple drivers using the tee subsystem and multi=
ple ecosystems relying on the /dev/tee devices.
> Your changes move the tee driver access configuration to the op-tee clien=
t only and this adds a dependency between the two ecosystems. The TS ecosys=
tem will not work without the op-tee client, but op-tee client is not part =
of that ecosystem.

But optee and optee-client are part of the TS images and configs so there i=
s a link.

> Yes, the /dev/tee* devices will be still there, but only accessible with =
root privileges which is kind of a feature degradation.

I don't see any user being added to the previously used "teeclnt" group.
So which non-root users are there? If the users are in Cassini, I have
proposed fixes there.

> =93If this impacts libts users, then IMO they need to install optee-clien=
t orsetup the udev rules etc in some other way.=93
> Yes, this =93some other way=94 is the udev rules config you are removing.
>
> =93Is there some problem I missed or a setup which is not covered in meta=
-arm testing?=94
> AFAIK currently there is no meta-arm config which enables FF-A but does n=
ot use the OP-TEE SPMC. But this will change soon. So why not do this prope=
rly now?

What is the proper way to fix this?

I don't think duplicating optee/tee-supplicant udev rules is the answer.
I could move optee-client recipe udev rules to a separate binary package
to enable installing without tee-supplicant. But I'd like to see the
users and have a test case, preferably in meta-arm.

Cheers,

-Mikko

--_000_AS8PR08MB58951A0CBE556C313695963291472AS8PR08MB5895eurp_
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
areast-language:EN-US"><br>
=93</span><span style=3D"font-size:11.0pt">But optee and optee-client are p=
art of the TS images and configs so there is a link.</span><span lang=3D"EN=
-US" style=3D"font-size:11.0pt">=94<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-fareast-language:=
EN-US">=93</span><span style=3D"font-size:11.0pt">I don't see any user bein=
g added to the previously used &quot;teeclnt&quot; group.</span><span style=
=3D"font-size:11.0pt">
</span><span style=3D"font-size:11.0pt">So which non-root users are there? =
If the users are in Cassini, I have</span><span style=3D"font-size:11.0pt">
</span><span style=3D"font-size:11.0pt">proposed fixes there.</span><span l=
ang=3D"EN-US" style=3D"font-size:11.0pt">=94<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">I am=
 not saying the TS recipes are perfect and there might be a dependency, whi=
ch is an error. Except for the OP-TEE SPMC tests SPs which indeed depend on=
 op-tee and xtest.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">=93<=
/span><span style=3D"font-size:11.0pt">What is the proper way to fix this?<=
br>
<br>
I don't think duplicating optee/tee-supplicant udev rules is the answer.<br=
>
I could move optee-client recipe udev rules to a separate binary package<br=
>
to enable installing without tee-supplicant.</span><span lang=3D"EN-US" sty=
le=3D"font-size:11.0pt">=94
<br>
I think a dedicated recipe on which both libts and optee-client depends is =
one way to fix.</span><span style=3D"font-size:11.0pt"><br>
<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">=93</span><span styl=
e=3D"font-size:11.0pt">But I'd like to see the</span><span style=3D"font-si=
ze:11.0pt">
</span><span style=3D"font-size:11.0pt">users and have a test case, prefera=
bly in meta-arm.</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">=94<=
br>
Well, I cannot provide a setup where TS is used without OP-TEE currently, b=
ut your config can and will be tested in the CI. Yes, TS only world might s=
till be broken, but the change at least would make a step in the right dire=
ction.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">/Geo=
rge</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-fareast-langua=
ge:EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"col=
or:black">From:
</span></b><span style=3D"color:black">Mikko Rapeli &lt;mikko.rapeli@linaro=
.org&gt;<br>
<b>Date: </b>Thursday, 17 October 2024 at 11:52<br>
<b>To: </b>Gyorgy Szing &lt;Gyorgy.Szing@arm.com&gt;<br>
<b>Cc: </b>meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Subject: </b>Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee=
 udev and group settings<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi,<br>
<br>
On Thu, Oct 17, 2024 at 09:44:07AM +0000, Gyorgy Szing wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; The Trusted Services protocol is implemented by the tstee driver and l=
ibts.&nbsp; This means there are multiple drivers using the tee subsystem a=
nd multiple ecosystems relying on the /dev/tee devices.<br>
&gt; Your changes move the tee driver access configuration to the op-tee cl=
ient only and this adds a dependency between the two ecosystems. The TS eco=
system will not work without the op-tee client, but op-tee client is not pa=
rt of that ecosystem.<br>
<br>
But optee and optee-client are part of the TS images and configs so there i=
s a link.<br>
<br>
&gt; Yes, the /dev/tee* devices will be still there, but only accessible wi=
th root privileges which is kind of a feature degradation.<br>
<br>
I don't see any user being added to the previously used &quot;teeclnt&quot;=
 group.<br>
So which non-root users are there? If the users are in Cassini, I have<br>
proposed fixes there.<br>
<br>
&gt; =93If this impacts libts users, then IMO they need to install optee-cl=
ient orsetup the udev rules etc in some other way.=93<br>
&gt; Yes, this =93some other way=94 is the udev rules config you are removi=
ng.<br>
&gt; <br>
&gt; =93Is there some problem I missed or a setup which is not covered in m=
eta-arm testing?=94<br>
&gt; AFAIK currently there is no meta-arm config which enables FF-A but doe=
s not use the OP-TEE SPMC. But this will change soon. So why not do this pr=
operly now?<br>
<br>
What is the proper way to fix this?<br>
<br>
I don't think duplicating optee/tee-supplicant udev rules is the answer.<br=
>
I could move optee-client recipe udev rules to a separate binary package<br=
>
to enable installing without tee-supplicant. But I'd like to see the<br>
users and have a test case, preferably in meta-arm.<br>
<br>
Cheers,<br>
<br>
-Mikko<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AS8PR08MB58951A0CBE556C313695963291472AS8PR08MB5895eurp_--

