Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AA2D1AD36
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:18:13 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.55])
 by mx.groups.io with SMTP id smtpd.web11.44299.1729153076625649529
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 01:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qVW4QazM;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qVW4QazM;
 spf=pass (domain: arm.com, ip: 40.107.104.55, mailfrom: gyorgy.szing@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VQT7wtmyZ+L4ayN+RdT3jgBwGl/1AIM67YQRfqZd4jwYdb3zEWZNLp/JjV4Dafc+hGsvG/nrDZH5uIRPqcR0nmc4Zro2nkRopKhxm5XXcXziDsDJxZtexqjZ+0RTNVJ/AnIAgLogRvJcvLJH62z0Dy97ljO++YzKhgkmkCBcMk0K+gJg/3MVMKck8DIv0AM7x2IcZRWzg8dagDI+0b3PIOhFZIR+0gjDwp3bIvFD1Srro26dDSS9rzL6DlqrzuOeTmVhgYadFrpg7XMoopuyfpJ1KHX9fOll4UzIFz+c7+1u3PbSLMuKihYvYyHBqQCWfxIn272dihMVNsnQ5esPew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwLZorQQPzQ2ELfjnpa9hj/AqZV0UpuHnWIC7E/39Ks=;
 b=hMcne7yJwVrB016OJZKpfZbDK5B/6wxTQodhFDD4wuW+vu9EazfNzNDF5OiPR5iyJQPucmg8qqxCmWWcLqoZo6jAXAEbIsoHsoRl5Q4WXWgbzgLIcUA8ftBzVZJ/krLwD9mgQTJGWFsJn1HITUfNiSExK6spYEFoaTT8Cp9PFVI26lRSr0sgxSCljwtGeYlVnhPiTPyfKAb9p2GSMsJ7f487Zc7G8beHWXflRccFRJKox3j+ERqWICTAjMqlnARUw7uDfwvnemrKYbwa6nB0tZyjGeCYleTiAaMFkEwfl7d2kd2U4gp9vspBE1hKgqKn7Wk9PatXteX+EA+FI1qNIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwLZorQQPzQ2ELfjnpa9hj/AqZV0UpuHnWIC7E/39Ks=;
 b=qVW4QazMr6xdn00ZjY3Lm16P3+Sc0S4TNSzWOR8Oz1JtzonNob8lxbXMjNCI8iEKVEhS+rWW2oPaoN7B6O1ZUPXZWOY5PMiSje+uCyBdEYP7l14M1KlYWIYlpxhk0N07aTI32Qjutb/Plendt9J10c54n9R8fCcWZLpx0Gub5cQ=
Received: from AS9PR05CA0208.eurprd05.prod.outlook.com (2603:10a6:20b:495::34)
 by PAWPR08MB9567.eurprd08.prod.outlook.com (2603:10a6:102:2f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 08:17:45 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:20b:495:cafe::1f) by AS9PR05CA0208.outlook.office365.com
 (2603:10a6:20b:495::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Thu, 17 Oct 2024 08:17:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8069.17
 via Frontend Transport; Thu, 17 Oct 2024 08:17:44 +0000
Received: ("Tessian outbound 60a4253641a2:v473"); Thu, 17 Oct 2024 08:17:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 910f3c9b7b368a05
X-TessianGatewayMetadata: u37tTF2geHIfuRcuHXr5crvGLWS9i49Er7ltOhjtaGL5OQLMjqsI80yOKh0CYF6ixE9gND/9sHoMu6Qu/lXdQoeKYPfxKsfgjC/ksWAuakjdRxvs03LBMPLLnY0Bg1ymzZN32NjXbwv/3aU3PR5Gd6dh4UOTkAqXAi+xhJRYM3JYPYwQ2Bz7TL3SSvXQyJwKPZI3TKOejwZbGBQUR1Ae4g==
X-CR-MTA-TID: 64aa7808
Received: from Laa6e9dc50e92.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 293BE0DD-C458-4AFC-82CC-77AB7527F52D.1;
	Thu, 17 Oct 2024 08:17:37 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Laa6e9dc50e92.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 17 Oct 2024 08:17:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXzT9eglRjsbOfkkNfKs0Jz/TKyIiZ9jqG2uu/bShzAoo7T8uZ7Hd+jLsMWAEoT80l684IC19VrPmR4LggMm9R0wZCiNQowIJlpknXb7ZK6MINas8z+EoYlDnKHaYvIWvApR4ADYlHqsf8961iYTBOSJJp5Pb+FCUXTO1Iarx1rOJWSBhEcx6YjecWq4Oa2oQDH6ptVHiUnoIQR5KUutzq15W4CivW7RL1FecrY4H+X3R9KRjMgZr51E7KhEYQ2asI3x/Xq7xA2779qmbQsq+akpUFF9jhNaetGrYx3oWobMd4ObNHy5j+2W/SKXsqn7Y+AKFqe5kGFTjhbzResTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwLZorQQPzQ2ELfjnpa9hj/AqZV0UpuHnWIC7E/39Ks=;
 b=PxPzYg46TBv/B3NV1UIefbPdaSUQPAmPITMHJmcTUWD6t2AghM+TavTUBkMo2SID7Nb+m5fjoGhZltHAr7+lcvyJQ/ZTqjb5ocOYMIuwxLHTNhv9gJRvaxgaOVCIOyHm1Avny3J/JcCfVU8rbO7ucPxspGIgOAReNDdcGsb9VMYfhtrdVdzcOA7p4yS9SA0taLWDDNVc3Op6eJsZUYZuQnvZ4cA9zg3IRQCQrsSBi94US8LvB7/GCOo7MVhWaTerTKe2DaAkodqzwaVCu8qvcsYMMVU7B5QlRfs/r9cQqp4hanjhSvTLURwRaZ3yAbPCL0siX03jY+DTB3w7Hs0VIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwLZorQQPzQ2ELfjnpa9hj/AqZV0UpuHnWIC7E/39Ks=;
 b=qVW4QazMr6xdn00ZjY3Lm16P3+Sc0S4TNSzWOR8Oz1JtzonNob8lxbXMjNCI8iEKVEhS+rWW2oPaoN7B6O1ZUPXZWOY5PMiSje+uCyBdEYP7l14M1KlYWIYlpxhk0N07aTI32Qjutb/Plendt9J10c54n9R8fCcWZLpx0Gub5cQ=
Received: from AS8PR08MB5895.eurprd08.prod.outlook.com (2603:10a6:20b:298::16)
 by AM0PR08MB5459.eurprd08.prod.outlook.com (2603:10a6:208:186::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Thu, 17 Oct
 2024 08:17:32 +0000
Received: from AS8PR08MB5895.eurprd08.prod.outlook.com
 ([fe80::bac5:353d:9e15:e4d8]) by AS8PR08MB5895.eurprd08.prod.outlook.com
 ([fe80::bac5:353d:9e15:e4d8%5]) with mapi id 15.20.8026.017; Thu, 17 Oct 2024
 08:17:32 +0000
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
Thread-Topic: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
Thread-Index: AQHbIGJjaIhpu//Lm0aPbjb1+Fzi/7KKmFWR
Date: Thu, 17 Oct 2024 08:17:32 +0000
Message-ID: 
 <AS8PR08MB589563A608DE289457643CA991472@AS8PR08MB5895.eurprd08.prod.outlook.com>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <20241017065907.172504-2-mikko.rapeli@linaro.org>
In-Reply-To: <20241017065907.172504-2-mikko.rapeli@linaro.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB5895:EE_|AM0PR08MB5459:EE_|AM1PEPF000252DB:EE_|PAWPR08MB9567:EE_
X-MS-Office365-Filtering-Correlation-Id: daa02831-1d83-4892-6402-08dcee842d35
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?TsDl3G910x2YRB8TxtPhG500XwnHwbW+UDXj2Mn+q6TdiqQjsQuYquQfpRra?=
 =?us-ascii?Q?klmoN5PNey1S2qYY0bRPs2upauHMUNz50HVwMqo92C23wwpuk8ietPCr+Gxt?=
 =?us-ascii?Q?J0NTNhlfQKSPL9l/ovxqv2xUeT9r5KFhXEiXSjW8j6k6wLgcnWtlsu2AlaRz?=
 =?us-ascii?Q?qieb3P1eGwelZZaPj34PMWQS2QQjIP73fDpqqEWeeCErD+6efcui9b2WwvP9?=
 =?us-ascii?Q?RP2+Ttsd8H1Uw12c+UbSw+JTZaPJ3K6R6FRUwr84xqyDAQfj/sCZhQwl2Wfh?=
 =?us-ascii?Q?e6rIM9WxttNF8cpMi+3GOp9sXX0zPaVNmwR1EWj3AVd+jQN1e9erHcy7kZRs?=
 =?us-ascii?Q?QMcXJi89MbET3+c2JFcd6kuc/diQa+HJLuY7jH0tZFaEwO8BYfFlWyfN9/lK?=
 =?us-ascii?Q?ZXWfxa+gc1i9+WFPTYLqGvB/jeVuwPf02ERi7juUNe+e5ft6OUB+8QkT2vXk?=
 =?us-ascii?Q?yPyK3reMHoELme7jA2bLqcnT9hrKzal9g3OkdxDagom10aHdgFuPPTz2wscH?=
 =?us-ascii?Q?45k46C5U+LnSw37KUf5gq3TciSGLbIrzvdyeokfi91Ufmsj4sBmmOwpGPZt7?=
 =?us-ascii?Q?KUNEK12BxswP7h/xwhV5WiRfzHtzoJp5SRdVR2ZTiDg0jR+3FqE+S6TH9K4Z?=
 =?us-ascii?Q?BxPLMZVvexR6/e99lw+1EXr1Uuccw5F0LNsLIogs7MVMW0neHa/PSwZNdp2p?=
 =?us-ascii?Q?7oH4PAjTNME2AMHNQ3Z8BgkDmKKEVDevxirpTqfzVJb2O8YtudospkwOWs5d?=
 =?us-ascii?Q?cppsobELMSkvgY7M1OlgQVAlzw4zOsUO+3bmW8R1DAT+suoXAdZft3Q+Ewdd?=
 =?us-ascii?Q?gWQ7GUX3oeV1Pa8iRGc/q4LlwgFUT6qfl1p0R3KkyvuT4CTyYhQfdhtC5C8K?=
 =?us-ascii?Q?FOZFFModYsGLAy6BGtbPskbaox8JJCJayWJLXm/sL7gbSJgvTSAe8p3QAH3k?=
 =?us-ascii?Q?GXwn3XcgOrUPxEYMa6zjsb5cCIwFMeokGY1H9Fv+g25z5oOHSgZodDEhKfXi?=
 =?us-ascii?Q?iVRbqeOQvl8qpdxdQXxYXwPmQeOco8Z5bcYllYYZqijto6cNUaIyEkBiPj5V?=
 =?us-ascii?Q?2/CMfPhbhhshim0hErHiNPpM86ZVlHtZIqsnWBbUK3InuGTx+EBsD83mtPPt?=
 =?us-ascii?Q?Nc2gJigTTwC1YkXAL75KcBczHBFCttm4VlzEm650g/sBdHdOKUXVDlKqzP0Q?=
 =?us-ascii?Q?OPUpgPLOLM1pmuw/wbAidydfGxekfpI1hZEhNFt/SJ4cto4UnpYS3hoxbMtL?=
 =?us-ascii?Q?wbeRWplPCQt0/huJZXZYiBIBu0qREDakik6MkszrNGgTjTNCHZ0kG9VFKzp4?=
 =?us-ascii?Q?3qG3jOdJmvNTr4SW8tzLeVm+u+cHvxjpOqJcVmfj1eO1GIOHfJQYc5EkrxKt?=
 =?us-ascii?Q?lFmFTBw=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB5895.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB589563A608DE289457643CA991472AS8PR08MB5895eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5459
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:298::16];domain=AS8PR08MB5895.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	432f6d81-6aec-4354-2d1b-08dcee84260d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|35042699022|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wUM/VtADpVyHYI9YCbNJ6q6J24siNY+1cobhk48LwzaBIMj2//0HYJJweHMh?=
 =?us-ascii?Q?qPPhlc/jyBrt8W54bsrhOC99SEnq9aGiJT5s2dtWq4zcY3zqZiPkb4Mww5qw?=
 =?us-ascii?Q?lMtjHLvXpui6HBlU6L6dRDBysMDXrqbdzQjCSsW9b/6ja3RLra3DnbUyrQCd?=
 =?us-ascii?Q?QEd01URt/vtksjj3OiPAg95dPnpbb197OmiscY90aJetuIkB+LjSigq5wlDg?=
 =?us-ascii?Q?JvAsE7ArlxqdiRvVxqUy3F9+DIewz/Ko0ng6Dkrsdb/BtDLLNE09fHkCGCw4?=
 =?us-ascii?Q?P7kkyh4hB8DY4glTDIC+AHYAYfko11b+Ys+YtCW1a8oeKGyd0r4SzCcxfGMp?=
 =?us-ascii?Q?JqU/tjrUq5CeEIOOYI2rg27wQDvV+FA9WERehuBgB09p20ufr0vexKHtOuJ1?=
 =?us-ascii?Q?nLN3UuWCgk6QtQtrjEZBRfkNvo7MIwkpWUjpMKb/MuoasDYULf1ANq3x8EFF?=
 =?us-ascii?Q?fXWmx2bYZBYkpJjBfoVOpnzAtnQJtdM+AZyjeN5S+1cdMgD7wa3OG4OqAgq+?=
 =?us-ascii?Q?Wn+YXjG7Qkhi3anuurEpiasuZAiNJ9bCVlVKATg1/6APzbi7Rpby3IGWxBB/?=
 =?us-ascii?Q?uTR818YOf2gkUF8ZQOgI05BtIYLb1TvqygS/PlssyP5xh1EFEtggxluHXZvL?=
 =?us-ascii?Q?VWAsPjRrOq5t/nnk/0cqp04qUK74BxT3yFUfGdgs51VorN4gxHoWE43SzGGE?=
 =?us-ascii?Q?Ab4jK6LPwcJygoyXgCj5eh17fWJLF4N/pVa3u0czCDH8Y0zxyTZMPn75iLjj?=
 =?us-ascii?Q?7SiZ2mvV7XeploxK1FYSJ33LWmkFiYEu2UrvH/fojeWyxNUPDaYefGwuzZQI?=
 =?us-ascii?Q?zQVm8hQ2ZhHtEzabxuQz/i1RJe/opuoIKz07wHA0zzj7UCmqqbVHeKg0FTgt?=
 =?us-ascii?Q?05iQYjnJ5KqDZHbTzxgd4ToMEyj+xA9frZzIjAHu761fpCk31MMpuYyrsIUl?=
 =?us-ascii?Q?MpIiDquSwRelxOF/c1ZpeoHPZivhXw7SFNlGUNU3JTE/nSZ/R7ohrGXQRvp3?=
 =?us-ascii?Q?UqGa/MQwbrcUttQ1R9pvjHtox+Gv4mDPRh2cxnGVO4+nyqdgR03zypRVWyfJ?=
 =?us-ascii?Q?2/UoPq5cOjoZBCJGFovcLjESDQnZSVm/RQWom+t+nY48ucHWjhyo6kR6gM39?=
 =?us-ascii?Q?/dyFA8iCmSIRJ75BU8ygKTmXTWjKcFwMrvHwvU3yDbcXJkg4By1ghOaIVB8M?=
 =?us-ascii?Q?78RGpGbmCfBfpZ2pPAx2wEZlMnycbIpdmtiam+OJ2Rrw6QTJiU7Pouk3t/SV?=
 =?us-ascii?Q?r2ppwleccggv0k3xTc/dLgleSLc9A47MGa6IljJCEO7rxGDuoIw6cr6GanQ/?=
 =?us-ascii?Q?8MYZxrnUYzS+7HkO9hY3pcyRPfYHCok5IpP0lAW80gQfwEbb3kNr9py39LEo?=
 =?us-ascii?Q?rRM5okQ50xEX3rE91IXO1oWtK8EBWwsu1Pfbf0if93wIwdEB+A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(35042699022)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 08:17:44.0710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daa02831-1d83-4892-6402-08dcee842d35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9567
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 08:18:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6205

--_000_AS8PR08MB589563A608DE289457643CA991472AS8PR08MB5895eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

How is the system going to work if op-tee client is not deployed, but libts=
 is? E.g. if the SPMC is Hafnium and no S-EL1 OP-TEE SP is needed, but the =
FWU SP is used?

/George

From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Mikko Rapeli via lists.yoctoproject.org <mikko.rapeli=3Dlinaro.or=
g@lists.yoctoproject.org>
Date: Thursday, 17 October 2024 at 09:01
To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and g=
roup settings
optee-client now provides them and sets "tee" group for
/dev/tee* and "teepriv" group for /dev/teepriv* access.
tee-supplicant runs as "teesuppl" user account.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../trusted-services/libts/tee-udev.rules     |  7 -------
 .../trusted-services/libts_git.bb             | 19 ++-----------------
 2 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 100644 meta-arm/recipes-security/trusted-services/libts/tee-ud=
ev.rules

diff --git a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rule=
s b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
deleted file mode 100644
index 43fafd8c..00000000
--- a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
+++ /dev/null
@@ -1,7 +0,0 @@
-# tee devices can only be accessed by the teeclnt group members
-KERNEL=3D=3D"tee[0-9]*", TAG+=3D"systemd", MODE=3D"0660", GROUP=3D"teeclnt=
"
-
-# If a /dev/teepriv[0-9]* device is detected, start an instance of
-# tee-supplicant.service with the device name as parameter
-KERNEL=3D=3D"teepriv[0-9]*", MODE=3D"0660", OWNER=3D"root", GROUP=3D"tee",=
 \
-    TAG+=3D"systemd", ENV{SYSTEMD_WANTS}+=3D"tee-supplicant@%k.service"
diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/meta=
-arm/recipes-security/trusted-services/libts_git.bb
index 635e4769..9d0e7373 100644
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -5,24 +5,13 @@ TS_ENV =3D "arm-linux"

 require trusted-services.inc

-SRC_URI +=3D "file://tee-udev.rules \
-            file://0001-Remove-TEE-driver-external-component.patch<file://=
/0001-Remove-TEE-driver-external-component.patch> \
-           "
+SRC_URI +=3D "file://0001-Remove-TEE-driver-external-component.patch<file:=
///0001-Remove-TEE-driver-external-component.patch>"

 OECMAKE_SOURCEPATH=3D"${S}/deployments/libts/${TS_ENV}"

 DEPENDS           +=3D "arm-ffa-user"

-# Unix group name for dev/tee* ownership.
-TEE_GROUP_NAME ?=3D "teeclnt"
-
 do_install:append () {
-    if ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-mde=
v', 'false', 'true', d)}; then
-        install -d ${D}${nonarch_base_libdir}/udev/rules.d/
-        install -m 755 ${UNPACKDIR}/tee-udev.rules ${D}${nonarch_base_libd=
ir}/udev/rules.d/
-        sed -i -e "s/teeclnt/${TEE_GROUP_NAME}/" ${D}${nonarch_base_libdir=
}/udev/rules.d/tee-udev.rules
-    fi
-
     # Move the dynamic libraries into the standard place.
     install -d ${D}${libdir}
     mv ${D}${TS_INSTALL}/lib/libts* ${D}${libdir}
@@ -34,9 +23,5 @@ do_install:append () {
     fi
 }

-inherit ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-md=
ev', '', 'useradd', d)}
-USERADD_PACKAGES =3D "${PN}"
-GROUPADD_PARAM:${PN} =3D "--system ${TEE_GROUP_NAME}"
-
-FILES:${PN} =3D "${libdir}/libts.so.* ${nonarch_base_libdir}/udev/rules.d/=
"
+FILES:${PN} =3D "${libdir}/libts.so.*"
 FILES:${PN}-dev =3D "${TS_INSTALL}/lib/cmake ${TS_INSTALL}/include ${libdi=
r}/libts.so"
--
2.34.1

--_000_AS8PR08MB589563A608DE289457643CA991472AS8PR08MB5895eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
	color:blue;
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
<body lang=3D"en-HU" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">How is the system going to work if op-tee client is =
not deployed, but libts is? E.g. if the SPMC is Hafnium and no S-EL1 OP-TEE=
 SP is needed, but the FWU SP is used?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">/George<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"col=
or:black">From:
</span></b><span style=3D"color:black">meta-arm@lists.yoctoproject.org &lt;=
meta-arm@lists.yoctoproject.org&gt; on behalf of Mikko Rapeli via lists.yoc=
toproject.org &lt;mikko.rapeli=3Dlinaro.org@lists.yoctoproject.org&gt;<br>
<b>Date: </b>Thursday, 17 October 2024 at 09:01<br>
<b>To: </b>meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Cc: </b>Mikko Rapeli &lt;mikko.rapeli@linaro.org&gt;<br>
<b>Subject: </b>[meta-arm] [PATCH v3 2/2] trusted-service: remove optee ude=
v and group settings<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">optee-client now provides them and sets &quot;tee&quot; group f=
or<br>
/dev/tee* and &quot;teepriv&quot; group for /dev/teepriv* access.<br>
tee-supplicant runs as &quot;teesuppl&quot; user account.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;mikko.rapeli@linaro.org&gt;<br>
---<br>
&nbsp;.../trusted-services/libts/tee-udev.rules&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 7 -------<br>
&nbsp;.../trusted-services/libts_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 19 ++-----------------<br>
&nbsp;2 files changed, 2 insertions(+), 24 deletions(-)<br>
&nbsp;delete mode 100644 meta-arm/recipes-security/trusted-services/libts/t=
ee-udev.rules<br>
<br>
diff --git a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rule=
s b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules<br>
deleted file mode 100644<br>
index 43fafd8c..00000000<br>
--- a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules<br>
+++ /dev/null<br>
@@ -1,7 +0,0 @@<br>
-# tee devices can only be accessed by the teeclnt group members<br>
-KERNEL=3D=3D&quot;tee[0-9]*&quot;, TAG+=3D&quot;systemd&quot;, MODE=3D&quo=
t;0660&quot;, GROUP=3D&quot;teeclnt&quot;<br>
-<br>
-# If a /dev/teepriv[0-9]* device is detected, start an instance of<br>
-# tee-supplicant.service with the device name as parameter<br>
-KERNEL=3D=3D&quot;teepriv[0-9]*&quot;, MODE=3D&quot;0660&quot;, OWNER=3D&q=
uot;root&quot;, GROUP=3D&quot;tee&quot;, \<br>
-&nbsp;&nbsp;&nbsp; TAG+=3D&quot;systemd&quot;, ENV{SYSTEMD_WANTS}+=3D&quot=
;tee-supplicant@%k.service&quot;<br>
diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/meta=
-arm/recipes-security/trusted-services/libts_git.bb<br>
index 635e4769..9d0e7373 100644<br>
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb<br>
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb<br>
@@ -5,24 +5,13 @@ TS_ENV =3D &quot;arm-linux&quot;<br>
&nbsp;<br>
&nbsp;require trusted-services.inc<br>
&nbsp;<br>
-SRC_URI +=3D &quot;file://tee-udev.rules \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///0001-Remove-TEE-driver-external-component.patch">file://0001-Re=
move-TEE-driver-external-component.patch</a> \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
+SRC_URI +=3D &quot;<a href=3D"file:///0001-Remove-TEE-driver-external-comp=
onent.patch">file://0001-Remove-TEE-driver-external-component.patch</a>&quo=
t;<br>
&nbsp;<br>
&nbsp;OECMAKE_SOURCEPATH=3D&quot;${S}/deployments/libts/${TS_ENV}&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +=
=3D &quot;arm-ffa-user&quot;<br>
&nbsp;<br>
-# Unix group name for dev/tee* ownership.<br>
-TEE_GROUP_NAME ?=3D &quot;teeclnt&quot;<br>
-<br>
&nbsp;do_install:append () {<br>
-&nbsp;&nbsp;&nbsp; if ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager=
', 'busybox-mdev', 'false', 'true', d)}; then<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${nonarch_base_l=
ibdir}/udev/rules.d/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 755 ${UNPACKDIR}/tee=
-udev.rules ${D}${nonarch_base_libdir}/udev/rules.d/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e &quot;s/teeclnt/${TEE=
_GROUP_NAME}/&quot; ${D}${nonarch_base_libdir}/udev/rules.d/tee-udev.rules<=
br>
-&nbsp;&nbsp;&nbsp; fi<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp; # Move the dynamic libraries into the standard pla=
ce.<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${libdir}<br>
&nbsp;&nbsp;&nbsp;&nbsp; mv ${D}${TS_INSTALL}/lib/libts* ${D}${libdir}<br>
@@ -34,9 +23,5 @@ do_install:append () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-inherit ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-md=
ev', '', 'useradd', d)}<br>
-USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
-GROUPADD_PARAM:${PN} =3D &quot;--system ${TEE_GROUP_NAME}&quot;<br>
-<br>
-FILES:${PN} =3D &quot;${libdir}/libts.so.* ${nonarch_base_libdir}/udev/rul=
es.d/&quot;<br>
+FILES:${PN} =3D &quot;${libdir}/libts.so.*&quot;<br>
&nbsp;FILES:${PN}-dev =3D &quot;${TS_INSTALL}/lib/cmake ${TS_INSTALL}/inclu=
de ${libdir}/libts.so&quot;<br>
-- <br>
2.34.1<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AS8PR08MB589563A608DE289457643CA991472AS8PR08MB5895eurp_--

