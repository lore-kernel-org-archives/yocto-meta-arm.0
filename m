Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997D2D6555A
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 21:06:05 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.57])
 by mx.groups.io with SMTP id smtpd.web11.57418.1732655162563644556
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Nov 2024 13:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jsRkYFGo;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jsRkYFGo;
 spf=pass (domain: arm.com, ip: 40.107.21.57, mailfrom: gyorgy.szing@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EReKcprUExiFhracNQZb0DmAvBVxONv9SuLpXN+V9JLjq7xRkbz8AQk0Is6Yk7UutsvLHp79kLDWOTJJQZdVGuXH52PkXauVILw3ipmuRw6/qIroVLJfD29YrWzbDHIMOZIIrSAc1uShLKlCTx5okF5X4+a9SZMJNdvLcI99HKMut36TPODLvcmqXs+StKlHJ1ZzGD9JN+ynl1ulpU5A+A9wP5WxKSVVgJ6XAEk/upDTQAMcaD4zJWunVHxjpv9iOR6q41XmHXDWEEc1ONy/H1bUCAvHWDJpLx/G0Rw4SwAxaKP3wUnGThj4e3SaUvvvBgQNQMtpvyrDh3G21pz/Bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOLcJgk8Q5MtFV/LDZ19SoGD1EXB86fnmLuE2jUsvtU=;
 b=tB4O/oA6tJ32AW0G6WBrU7fCMv/fd7BQYfHDLfsPXpeEeRh9BEvTN37Bp5tmH+HgGCVeNBTYRAOpMklXsuyjrtOXHcoRVk5aY+mbhewE6nX1ut5+UFty7SoyZ5dbvMHXM4jUi3SRnirquNYmYzMfG6XKZ88xrVG9CDq2O/k5XolM5MthTlPCl4nQ+RgG/46pxCM9nxxi4C9STTbvp8ISu6VOZZ87FGfktuLhxXwxl1z8SikNLC6aDpywLUj545vCwFYo8GXQD7s8Ml26fR2CwHBuyMaJzONi2tkyl/jW+GU47WHxEWz6pabvBc7ZjvRz5CU/J+BgUUFUC38vm6h/PA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOLcJgk8Q5MtFV/LDZ19SoGD1EXB86fnmLuE2jUsvtU=;
 b=jsRkYFGoj4kNjlBpBXo8l0VgztrtMc+Smqf+i7SJke45KcubJ3wCrEzCYG8wx6PmyMGZcBemrlH66PxevMtbxi073EiboOM0xXb5NnzrH84hfVfypqRNPHCsAufQFNmuMNHJGLS/J7cdHlBGWvs7BTPMyuoGBJfqdE9bWiq4+ME=
Received: from DB8P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::39)
 by AS8PR08MB9119.eurprd08.prod.outlook.com (2603:10a6:20b:5b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 21:05:54 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::51) by DB8P191CA0029.outlook.office365.com
 (2603:10a6:10:130::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Tue,
 26 Nov 2024 21:05:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via
 Frontend Transport; Tue, 26 Nov 2024 21:05:40 +0000
Received: ("Tessian outbound 206fab1c37e0:v514"); Tue, 26 Nov 2024 21:05:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa441faa12dea3f0
X-TessianGatewayMetadata: zsitYFD1/0MWM+RfXq9JV2hH7DFzB1XmKE5Afv/+UydZP0llEkv5XXWUtrYMzZRv7ha1XOpQhMJzfdWk1k3+Z4ezShJLbHeebprZZ7tqUuFcO245V7LxX6USIzOl9wxQWtmRdMsi4Wy3wJuYCEmskchZFhECIAR5zNHmoqqEv53goiLOX2ncxCVb7VrRfzhLDfS9fLR7QvBeNJDdtiL+ow==
X-CR-MTA-TID: 64aa7808
Received: from Lab1e90b5b31f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D9E209D1-F7B3-4253-91AD-99E438DC3ECD.1;
	Tue, 26 Nov 2024 21:05:17 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lab1e90b5b31f.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 26 Nov 2024 21:05:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmvgWljACgNeErIyx7wutGnvOc1Ch0gho3ORZApEmxRX7K6fkCBCnSt22CQ+IbVM8T/J/KiQTM3BGIGtrUN4WDvVlGbhG/nTHdB2h2mf9A6VFAeJZzXdO/MxqVIiSjAE+4+84BSZvF0h3e2LT+xEfij6AsTk79a122o7xfvUCyX9gQwvASGVe+mdcrQ+xo0j5ojSt9juwMnOh+Q9jHqWEn2XqdKw4dobgRNMDQS6gqCUbLUPdMFeytEu0PAdi9ay4lSxoVQTwCzVV8Uo+ld69KEw4Zdk0rYSkHDUZbq6/vLGxBwde5Wsn1UIamUelL1k+xYlq9KdJ3+Aayde4ANYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOLcJgk8Q5MtFV/LDZ19SoGD1EXB86fnmLuE2jUsvtU=;
 b=r/vmxgc2v8hxUB5E/ooWY3E6YsXP6rHbPCRiCtwB4//AC0dRq28YoAUrSZFnUyXDKQHdRZ2NFPR2MG7QBCWPwcgDyV9gt2ryIA9Guciw22BNkHibsO9gUzt/2HZPC2V+PD0T2PiLDbiM8Uck7lxVRpQQ7msq8b2xn/xPW/AaeCGNJ5iPakbefbCeTb1B3Pja9neEs0uwv26pvHXJXTzy8/eXMC/G99Z+WAPs8KLQMjZ537K4kPyv8Cn6CjXP5/t4MTT2IPzDJ66xzwl1ziFdby5mQR4bR4EY+HKoB93NC6UCYzEKLN1G6I9rRKeKZZX5A9FD6XqyWJK06lr7mHBbVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOLcJgk8Q5MtFV/LDZ19SoGD1EXB86fnmLuE2jUsvtU=;
 b=jsRkYFGoj4kNjlBpBXo8l0VgztrtMc+Smqf+i7SJke45KcubJ3wCrEzCYG8wx6PmyMGZcBemrlH66PxevMtbxi073EiboOM0xXb5NnzrH84hfVfypqRNPHCsAufQFNmuMNHJGLS/J7cdHlBGWvs7BTPMyuoGBJfqdE9bWiq4+ME=
Received: from AS8PR08MB5895.eurprd08.prod.outlook.com (2603:10a6:20b:298::16)
 by DU0PR08MB8256.eurprd08.prod.outlook.com (2603:10a6:10:410::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 21:05:15 +0000
Received: from AS8PR08MB5895.eurprd08.prod.outlook.com
 ([fe80::bac5:353d:9e15:e4d8]) by AS8PR08MB5895.eurprd08.prod.outlook.com
 ([fe80::bac5:353d:9e15:e4d8%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 21:05:15 +0000
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "tom.hochstein@oss.nxp.com" <tom.hochstein@oss.nxp.com>, Tom Hochstein
	<tom.hochstein@nxp.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, Sahil Malhotra <sahil.malhotra@nxp.com>
Subject: Re: [meta-arm] [PATCH v3 1/2] optee-client: use udev rule and systemd
 service from upstream
Thread-Topic: [meta-arm] [PATCH v3 1/2] optee-client: use udev rule and
 systemd service from upstream
Thread-Index: 
 AQHbIGJP6ZsFad4JT0yVYVTYOI8k2LKUbTcAgAACK4CAAAcQcYAJkVSAgADzSSCAKuqYgIAAGIQA
Date: Tue, 26 Nov 2024 21:05:15 +0000
Message-ID: 
 <AS8PR08MB58955003C2B8CF01CDE7EA54912F2@AS8PR08MB5895.eurprd08.prod.outlook.com>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <PAXPR04MB9448F0D1DE0F84A6634EFBC5E24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkId04rSl5ykKCJ@nuoska>
 <PAXPR04MB9448DC39953E357F3E73D07EE24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkOI7vA6YDQZewJ@nuoska> <7c3c9ad1-a1e0-474f-8710-9b77d2a2ea17@oss.nxp.com>
 <AS8PR08MB589517BA3B9BD14644DEF4CE91542@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <Z0XhVyhlU8uIU1W8@nuoska>
In-Reply-To: <Z0XhVyhlU8uIU1W8@nuoska>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB5895:EE_|DU0PR08MB8256:EE_|DU6PEPF0000A7DE:EE_|AS8PR08MB9119:EE_
X-MS-Office365-Filtering-Correlation-Id: d955603a-1988-4525-aa5a-08dd0e5e154b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?I8RoyrIYOZ5ClI1PE405UHgVoDbvrAACizDBkElLAy2zke6wAR+wmioTPjt2?=
 =?us-ascii?Q?jwXA307OX1mrBf+HfOn3QLb7PFcci4Ur2hHylsl6OA6yMlR+xbs5tKzg3EwD?=
 =?us-ascii?Q?32V2jlglDLbFauqEKUjj5CycxWOOrIo2Epiggn+Ql7WCyOlUs+eJST086IZY?=
 =?us-ascii?Q?fUJJeeKyWID8R80lWacGzZSi+IgDPsdsF3EwbDmxj+msMcB0JX2agJN2Ota5?=
 =?us-ascii?Q?OL/QOqtX4+BxPX7i7kMuTd1nvmyw/WK3JqfVnmhYLlyE/O061qYssxtR2NB1?=
 =?us-ascii?Q?7qVU9BTBvo72CVnnqG71x/yzDjbuo/RE2kDCmcGur7F9E1FsR4byDcY+ZoHw?=
 =?us-ascii?Q?D3B5lc6QKIGIhAgPK9/jW+HxGpsEFVnRR+3ra3EX4CdUG4ia7sYq0IoWsyXa?=
 =?us-ascii?Q?cl2XFYque0RK4cU9NFRQpr6A6wSEyIE4GoBMa/CYsxwMQHGgdnoRalR5N3QH?=
 =?us-ascii?Q?K5jY2qnDntNhUbhB4yopUc6ZdqQcTbJEkAL88VI1KlpReR9BVz+RSoFcqAaY?=
 =?us-ascii?Q?0PDvURbfXr+Rm6IILcRdIlAs7D1Lw9naAi9mEIJ6RvODUvpuEzpPAPpXG7WY?=
 =?us-ascii?Q?12WUab1V+M2rZBY9y6FQ5lLLTtbIDu6SMqifKO18T7eZ5NtLNunKYijo4FnS?=
 =?us-ascii?Q?lHC9IQ9hHnB11sdfgcALK60OqH3lTc4hsDDb9C3lyN3t5H6kDPl/gHwLp4XQ?=
 =?us-ascii?Q?Su8nECKJ27ViDhRGsYKY5Gho5ijatHi3dyxlNSt+o45g/Kjxczq74eFfKcm8?=
 =?us-ascii?Q?9p5c/dWvgxOz1JcKsMGMOxnU0Z4W7iR36IF2BWQT5ptZss8qztTr7zHVrp8U?=
 =?us-ascii?Q?bGL1cMZ+qhqRzoEolj63RgK5KFM8gXam65gTOlQqs3K7AXjf3q4VNHO8/EV8?=
 =?us-ascii?Q?CcYD02YJJjniYeLF5wfheymsAfPfTqSIJzClLB7mZmsi3tUOXzxpo7eBCsOM?=
 =?us-ascii?Q?xmNqKYLMKpOEPPZGfmXvTEiTTap9us92dg2tQ+YVRwduHUkaz0Chz7s2HjQY?=
 =?us-ascii?Q?ywre13Nzj3Bpc39HPIEIEDvhF9dkBbvZfLggGS3CyiqD8fyjQKVKaNiTFjaD?=
 =?us-ascii?Q?3Vd3ecKZ8jehotFWl84821LI+j0a0sZyy2KaAyWXNVh6thJe08EQ/gd4BMhR?=
 =?us-ascii?Q?bzjbM2eN8zRNlae5TPaUa8cMZXUyRPYrgMLG5A3OkNga6IyKRSnoQ8nAxA2W?=
 =?us-ascii?Q?wK9I5ZTtuBK3Xp6d8K84qQ8otUbKMhocPrY7aiFn/tCDCL3KSvbKJ8kikxat?=
 =?us-ascii?Q?3PMidSHoyTDwnzg9SXzCrDQ4nSti7d3s3N51Cdm2vOlFoNhZ0GHDzKJ/t6W5?=
 =?us-ascii?Q?ao1SJDildoUkjcIIR8GppOv9UuTFu8bOcu3bDv78ivKs4BdTJY7YGEllPJwV?=
 =?us-ascii?Q?mmEXv64=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB5895.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/mixed;
	boundary="_004_AS8PR08MB58955003C2B8CF01CDE7EA54912F2AS8PR08MB5895eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8256
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:298::16];domain=AS8PR08MB5895.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7ff386fb-a7f8-4374-a497-08dd0e5e0648
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|1800799024|14060799003|36860700013|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?Windows-1252?Q?tK+rL94X+Ncv6GuLARRDfxXgeIv1rlqHXv3lkz2UyppjTwVaDYMFnE4d?=
 =?Windows-1252?Q?BuYPdze4qWFA93UhdFbVrbmXrhSCaRe88+FohTeUtjaYlWCSYj97AEC2?=
 =?Windows-1252?Q?+Iwz9UjR3cwA1bdGx1rjL9lPCvq85jzH+0gr18LcByUQU/vUl4nFcfvC?=
 =?Windows-1252?Q?vKa2HBYNvcp5l1jjYCdTccfn8ea9NIr02ABVNKhQKpaFMNecseAThun/?=
 =?Windows-1252?Q?k/bfgBAZJ729rI99A8NO5taq3iNhYtrdGe2FYk5qwwvTUgAqmFzKpx/c?=
 =?Windows-1252?Q?gkH42cZbawdIB/4LS3qLreshvm5aEwBN9nQSaeZU37IGZoNtaRB6z82J?=
 =?Windows-1252?Q?91W28ZsoBoMWBiQmZrTs6S5p0IvuLR3jbiuUi76mdmpW4z019y3RdtCB?=
 =?Windows-1252?Q?bi3f62NcMkq7o1FOap5+I3YoUq3va8XUtZtBC5P2jETJQ/Tldmx2a9uF?=
 =?Windows-1252?Q?6OTybC8Mc2gFaDg51eJT1hUxCw2mnwjLh38teZXoAAnCCY3uDD5ntujc?=
 =?Windows-1252?Q?e4vS6DlKsoheGu9rsMOva4lECx7h0JwkB6TSDI/DPi8e8RlBhg/Yybeg?=
 =?Windows-1252?Q?PtNWExqfPUXgb9R7uMFX75309BrgOmYlVc9tFC2XmraDGcIU9YzDAYyv?=
 =?Windows-1252?Q?45Jh+xSDQSrWYfOSBeQ/0tmznfzAJhjwnLvGldPVN2g6D/QCvFwZGH08?=
 =?Windows-1252?Q?q92QHY5jwphHwNX3JSX5CS4wCX9QuH1JSiq/92T9Tmap3OH+8COwhmuD?=
 =?Windows-1252?Q?Y0Q/QAO8zVqx65I0blCt7cg6e9naVSFVBigSnko+UYsVnqgGxt3zEKFs?=
 =?Windows-1252?Q?XvK09ZYj7zGF7lbfMl3CHVmSW01izfeDLuRhoRz5UMnm9hv4cSdW04LP?=
 =?Windows-1252?Q?3Nzbx4WlNhQ1JrtryKoCCgSvLqsnhzEhtGRD2YDrrRkGjYQY9s/nNcnL?=
 =?Windows-1252?Q?ex8gdtwN8BcmYeaP85d/CMbzkxY5vnD5fIV/bp/n/DkxTlEQeBYWYKM1?=
 =?Windows-1252?Q?+aS0iXHFPEkCV8/aYXG16XnMYuVVXrdaRe7dJOA3dY5VPsyI3tm7GARF?=
 =?Windows-1252?Q?vvx80GGp9W5BUchsk8x9JSSfVCDJGcRahH5iYtYAfu2EdUfwFqG66yYf?=
 =?Windows-1252?Q?PaWXF56D0tsWWRbzOU6geyNL3QKehH+1E0YK2WGlUAb9s29KhSJ7aCyf?=
 =?Windows-1252?Q?1Sp8aitUlJEN6kopwnnuwbGCQTfsrG17syQ55g47XBomIWeV9mlhR3zl?=
 =?Windows-1252?Q?5NPOcLLoLjQP5dMNoIMojyj2/IvZ/GVCHjQXg6otNaAF0Zs+cQmuzQBD?=
 =?Windows-1252?Q?WzN0kASSAof4bvjlyUgzbCgKdppp/2V+s/fGUlwreGFaqJy75tlzyUDS?=
 =?Windows-1252?Q?MUFWZLRz4G/r33UVWx8oAPZJRTLN0/YOjb87JiE6s1d6X4/L0PZena3R?=
 =?Windows-1252?Q?63KOgHshmm/6rwntTW1m2IHnTSwQ6EgsRdrywiI1+278FKS8e1Vd3z6/?=
 =?Windows-1252?Q?CvMQCQ+2fq9jx3qOB1rmHmAVe1nkSQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(1800799024)(14060799003)(36860700013)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 21:05:40.3317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d955603a-1988-4525-aa5a-08dd0e5e154b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9119
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Nov 2024 21:06:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6258

--_004_AS8PR08MB58955003C2B8CF01CDE7EA54912F2AS8PR08MB5895eurp_
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB58955003C2B8CF01CDE7EA54912F2AS8PR08MB5895eurp_"

--_000_AS8PR08MB58955003C2B8CF01CDE7EA54912F2AS8PR08MB5895eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> Hi,
>
> On Wed, Oct 30, 2024 at 08:02:19AM +0000, Gyorgy Szing wrote:
> > Hi,
> >
> > (Sorry for the delayed reply.)
> >
> > Another way to address this would be to use PkgConfig from CMakeLists.t=
xt (see [1]). This might be considered a nicer solution as the yocto recipe=
 would not have to correct the install location, and thus there would be a =
single source of truth. (Kudos for Ross for the suggestion.)
> > Something like (code is not tested):
> >
> > Include(FindPkgConfig)
> > If (PKG_CONFIG_FOUND)
> >                 # TODO: there are other variables. Doublecheck if syste=
mdsystemconfdir is the right one to be used. On X86 Ubuntu this returns /et=
c/systemd/system. Yocto might define distro specific values.
> >                 pkg_get_variable(UNIT_DIR systemd systemdsystemconfdir)
> >                 # TODO: check the value to see if pkgconfig successfull=
y found the value. Behavior is not documented, probably if (UNIT_DIR) would=
 work.
> >                 # TODO: UNIT_DIR is a string list, use only the first o=
r last value? Rewrite the line below accordingly
> > set(CMAKE_INSTALL_SYSTEMDSYSCONFDIR =93${ UNIT_DIR }=94 CACHE PATH =93T=
arget directory for system config files=94)
> > endif()
> > # By default, use LIBDIR
> > # TODO: CMAKE_INSTALL_SYSCONFDIR might be a better default base dir.
> > set(CMAKE_INSTALL_ SYSTEMDSYSCONFDIR =93${ CMAKE_INSTALL_LIBDIR}}/syste=
md/system=94 CACHE PATH =93Target directory for system config files=94)
> >
> > install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.servi=
ce DESTINATION ${ CMAKE_INSTALL_SYSTEMDSYSCONFDIR})
> >
> >
> > The above code would default to the current install location under LIBD=
IR,  and would use PkgConfig if available. Setting CMAKE_INSTALL_ SYSTEMDSY=
SCONFDIR from the command line allows manual override.
> >
> > 1: https://cmake.org/cmake/help/latest/module/FindPkgConfig.html
>
> This would only work if optee-client has "systemd" build time dependency =
in DEPENDS.
> I don't think we should add this dependency. The sd_notify() support for =
example
> dlopen()'s systemd libs at runtime to avoid making systemd a hard build t=
ime
> dependency. I don't think we should add this dependency due to systemd
> service file install paths.

DISTRO_FEATURES seem to reflect if systemd is deployed and this allows the =
recipe to behave accordingly. Not sure if this is the case for all distros,=
 but poky and meta-arm already depend on DISTRO_FEATURES based systemd conf=
iguration and thus might be an acceptable risk.
AFAIK systemd was added part of uefi-secure boot enablement. If this featur=
e is enabled the native sysroot of the optee-client recipe has systemd alre=
ady because of some uefi-secureboot specific transitive dependency. Might n=
ot be bulletproof but if systemd is needed, things seem to be ok as is. On =
the other hand, adding systemd conditionally to DEPENDS might not make thin=
gs much worse since it is included already.

Please check the attached patch file. I cherry-picked you commit =93optee-c=
lient: use udev rule and systemd service from upstream=93 to my topic branc=
h and added the attached patch on top (among other patches which are hopefu=
lly have no effect on optee-client).
I did some manual testing by hacking DISTRO_FEATURES and running bitbake-ge=
tvar, plus testing fvp_base and quemuarm64-secureboot configurations. It=92=
s not 100% tested as e.g. I did not check how the cmake modification behave=
s if pkg-config is enabled, but the executable is not available or is avail=
able but either system or udev package is missing. The cmake code is there =
to handle these cases though. Anyways these scenarios seem to be out of sco=
pe for yocto.

I added a dependency on udev to the optee-client recipe, to make udevs pkg =
config data available. This might be considered similar =93unwanted bloat=
=94 you mentioned related to systemd. I tried to make this conditional but =
could not find a safe way. According to [1] there is a variable called USE_=
DEVFS which tells if a device manager is available, but the variable is not=
 visible to the recipe. AFAIK the image class would need to be inherited to=
 get access to it, but that does not seem to be a good idea.

The op-tee client patch:
  - adds build options to control if the system service file shall be insta=
lled or not. The default value is on, to keep backwards compatibility.
  - another option is added to enable using pkg-config. This is by default =
off, and the op-tee client recipe enables it for yocto. If enabled both sys=
tem and/or udev specific directories are discovered with pkg-config.
  - the intention was to implement option and pkg-config processing in a fl=
exible way. There are hard-coded default values which keep existing behavio=
r and will be used if pkg-config is disabled or failing.

Note: I missed the systemd dependency issue and conditional appending to DE=
PENDS is not implemented.

1: https://docs.yoctoproject.org/dev/dev-manual/device-manager.html

/George

> Cheers,
>
> -Mikko
>
> > /George
> >
> > On 2024-10-29, 18:03, "meta-arm@lists.yoctoproject.org" <meta-arm@lists=
.yoctoproject.org> wrote:
> >
> > On 10/23/2024 9:54 AM, Mikko Rapeli wrote:
> > > Ok got it now.
> > >
> > > ${nonarch_base_libdir} isn't in the CMake toolchain file. We could
> > > move ${libdir}/systemd unconditionlly to ${nonarch_base_libdir}/syste=
md
> > > in the do_install task. Could you test and submit a patch like below?
> > >
> > > --- a/meta-arm/recipes-security/optee/optee-client.inc
> > > +++ b/meta-arm/recipes-security/optee/optee-client.inc
> > > @@ -23,8 +23,9 @@ EXTRA_OECMAKE:append:toolchain-clang =3D " -DCFG_WE=
RROR=3D0"
> > >
> > >   do_install:append() {
> > >       # installed by default
> > > +    mv ${D}${libdir}/systemd ${D}${noarch_base_libdir}/systemd
> > >       if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',=
 'false', d)}; then
> > > -        rm -rf ${D}${libdir}/systemd
> > > +        rm -rf ${D}${noarch_base_libdir}/systemd
> > >       fi
> > >       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', =
'false', d)}; then
> > >           install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${s=
ysconfdir}/init.d/tee-supplicant
> > >
> > > Cheers,
> > >
> > > -Mikko
> >
> > This works fine in our testing. Sorry for the late response.
> >
> > Thanks again!
> >
> > Tom
>


--_000_AS8PR08MB58955003C2B8CF01CDE7EA54912F2AS8PR08MB5895eurp_
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
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; Hi,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; On Wed, Oct 30=
, 2024 at 08:02:19AM +0000, Gyorgy Szing wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; Hi,<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; (Sorry fo=
r the delayed reply.)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; Another w=
ay to address this would be to use PkgConfig from CMakeLists.txt (see [1]).=
 This might be considered a nicer solution as the yocto recipe would not ha=
ve to correct the install location, and thus
 there would be a single source of truth. (Kudos for Ross for the suggestio=
n.)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; Something=
 like (code is not tested):<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; Include(F=
indPkgConfig)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; If (PKG_C=
ONFIG_FOUND)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; # TODO: there are other variables. Doublecheck if systemdsystem=
confdir is the right one to be used. On X86 Ubuntu this returns /etc/system=
d/system. Yocto might define distro specific values.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; pkg_get_variable(UNIT_DIR systemd systemdsystemconfdir)<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; # TODO: check the value to see if pkgconfig successfully found =
the value. Behavior is not documented, probably if (UNIT_DIR) would work.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; # TODO: UNIT_DIR is a string list, use only the first or last v=
alue? Rewrite the line below accordingly<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; set(CMAKE=
_INSTALL_SYSTEMDSYSCONFDIR =93${ UNIT_DIR }=94 CACHE PATH =93Target directo=
ry for system config files=94)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; endif()<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; # By defa=
ult, use LIBDIR<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; # TODO: C=
MAKE_INSTALL_SYSCONFDIR might be a better default base dir.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; set(CMAKE=
_INSTALL_ SYSTEMDSYSCONFDIR =93${ CMAKE_INSTALL_LIBDIR}}/systemd/system=94 =
CACHE PATH =93Target directory for system config files=94)<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; install(F=
ILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.service DESTINATIO=
N ${ CMAKE_INSTALL_SYSTEMDSYSCONFDIR})<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; The above=
 code would default to the current install location under LIBDIR,&nbsp; and=
 would use PkgConfig if available. Setting CMAKE_INSTALL_ SYSTEMDSYSCONFDIR=
 from the command line allows manual override.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; 1: https:=
//cmake.org/cmake/help/latest/module/FindPkgConfig.html<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; This would onl=
y work if optee-client has &quot;systemd&quot; build time dependency in DEP=
ENDS.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; I don't think =
we should add this dependency. The sd_notify() support for example<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; dlopen()'s sys=
temd libs at runtime to avoid making systemd a hard build time<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; dependency. I =
don't think we should add this dependency due to systemd<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; service file i=
nstall paths.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">DISTRO_FEATURES see=
m to reflect if systemd is deployed</span><span lang=3D"EN-US" style=3D"fon=
t-size:11.0pt"> and this allows the recipe to behave accordingly. Not sure =
if this is the case for all distros, but
 poky and meta-arm already depend on DISTRO_FEATURES based systemd configur=
ation and thus might be an acceptable risk.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">AFAI=
K systemd was added part of uefi-secure boot enablement. If this feature is=
 enabled the native sysroot of the optee-client recipe has systemd already =
because of some uefi-secureboot specific
 transitive dependency. Might not be bulletproof but if systemd is needed, =
things seem to be ok as is. On the other hand, adding systemd conditionally=
 to DEPENDS might not make things much worse since it is included already.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Plea=
se check the attached patch file. I cherry-picked you commit =93</span><spa=
n style=3D"font-size:11.0pt">optee-client: use udev rule and systemd servic=
e from upstream</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">=93
 to my topic branch and added the attached patch on top (among other patche=
s which are hopefully have no effect on optee-client).<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">I di=
d some manual testing by hacking DISTRO_FEATURES and running bitbake-getvar=
, plus testing fvp_base and quemuarm64-secureboot configurations. It=92s no=
t 100% tested as e.g. I did not check how
 the cmake modification behaves if pkg-config is enabled, but the executabl=
e is not available or is available but either system or udev package is mis=
sing. The cmake code is there to handle these cases though. Anyways these s=
cenarios seem to be out of scope
 for yocto.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">I ad=
ded a dependency on udev to the optee-client recipe, to make udevs pkg conf=
ig data available. This might be considered similar =93unwanted bloat=94 yo=
u mentioned related to systemd. I tried to
 make this conditional but could not find a safe way. According to [1] ther=
e is a variable called
</span><span style=3D"font-size:11.0pt">USE_DEVFS</span><span lang=3D"EN-US=
" style=3D"font-size:11.0pt"> which tells if a device manager is available,=
 but the variable is not visible to the recipe. AFAIK the image class would=
 need to be inherited to get access to
 it, but that does not seem to be a good idea.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">The =
op-tee client patch:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">&nbs=
p; - adds build options to control if the system service file shall be inst=
alled or not. The default value is on, to keep backwards compatibility.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">&nbs=
p; - another option is added to enable using pkg-config. This is by default=
 off, and the op-tee client recipe enables it for yocto. If enabled both sy=
stem and/or udev specific directories are discovered
 with pkg-config.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">&nbs=
p; - the intention was to implement option and pkg-config processing in a f=
lexible way. There are hard-coded default values which keep existing behavi=
or and will be used if pkg-config is disabled
 or failing.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><br>
Note: I missed the systemd dependency issue and conditional appending to DE=
PENDS is not implemented.<br>
<br>
1: <a href=3D"https://docs.yoctoproject.org/dev/dev-manual/device-manager.h=
tml">https://docs.yoctoproject.org/dev/dev-manual/device-manager.html</a><o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">/George<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; Cheers,<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; -Mikko<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; /George<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; On 2024-1=
0-29, 18:03, &quot;meta-arm@lists.yoctoproject.org&quot; &lt;meta-arm@lists=
.yoctoproject.org&gt; wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; On 10/23/=
2024 9:54 AM, Mikko Rapeli wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt; Ok g=
ot it now.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt; ${no=
narch_base_libdir} isn't in the CMake toolchain file. We could<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt; move=
 ${libdir}/systemd unconditionlly to ${nonarch_base_libdir}/systemd<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt; in t=
he do_install task. Could you test and submit a patch like below?<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt; --- =
a/meta-arm/recipes-security/optee/optee-client.inc<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt; +++ =
b/meta-arm/recipes-security/optee/optee-client.inc<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt; @@ -=
23,8 +23,9 @@ EXTRA_OECMAKE:append:toolchain-clang =3D &quot; -DCFG_WERROR=
=3D0&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt;&nbsp=
;&nbsp; do_install:append() {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # installed by default<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt; +&nb=
sp;&nbsp;&nbsp; mv ${D}${libdir}/systemd ${D}${noarch_base_libdir}/systemd<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ! ${@bb.utils.contains('DISTRO_FEATURES'=
, 'systemd', 'true', 'false', d)}; then<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt; -&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -rf ${D}${libdir}/systemd<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt; +&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -rf ${D}${noarch_base_libdir}/sy=
stemd<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ${@bb.utils.contains('DISTRO_FEATURES', =
'sysvinit', 'true', 'false', d)}; then<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -D -p -m075=
5 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt; Chee=
rs,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; &gt; -Mik=
ko<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; This work=
s fine in our testing. Sorry for the late response.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; Thanks ag=
ain!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; Tom<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AS8PR08MB58955003C2B8CF01CDE7EA54912F2AS8PR08MB5895eurp_--

--_004_AS8PR08MB58955003C2B8CF01CDE7EA54912F2AS8PR08MB5895eurp_
Content-Type: application/octet-stream;
	name="0001-optee-client-fix-udev-and-systemd-handling.patch"
Content-Description: 0001-optee-client-fix-udev-and-systemd-handling.patch
Content-Disposition: attachment;
	filename="0001-optee-client-fix-udev-and-systemd-handling.patch"; size=7267;
	creation-date="Tue, 26 Nov 2024 16:57:09 GMT";
	modification-date="Tue, 26 Nov 2024 16:57:09 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5NTA5YTZlMzdmMTdkYjEwZDEzMWNmNGMzMzM0ODcxMDZkNmY5YjhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHeW9yZ3kgU3ppbmcgPGd5b3JneS5zemluZ0Bhcm0uY29tPgpE
YXRlOiBNb24sIDI4IE9jdCAyMDI0IDIzOjQ4OjIxICswMTAwClN1YmplY3Q6IFtQQVRDSCAxLzFd
IG9wdGVlLWNsaWVudDogZml4IHVkZXYgYW5kIHN5c3RlbWQgaGFuZGxpbmcKCkVsaW1pbmF0ZSB0
aGUgc3lzdGVtZCBzcGVjaWZpYyBpbnN0YWxsIGNvbnRlbnQgZml4LXVwIGNvbW1hbmRzIGFwcGVu
ZGVkCnRvIGRvX2luc3RhbGwuCkZvciB0aGlzIHBhdGNoIHRlZS1zdXBsaWNhbnQgdG8gdXNlIHBr
Zy1jb25maWcgZm9yIGRpc2NvdmVyaW5nIHVkZXYgYW5kCnN5c3RlbWQgc3BlY2lmaWMgaW5zdGFs
bCBsb2NhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBHeW9yZ3kgU3ppbmcgPGd5b3JneS5zemluZ0Bh
cm0uY29tPgotLS0KIC4uLi9yZWNpcGVzLXNlY3VyaXR5L29wdGVlL29wdGVlLWNsaWVudC5pbmMg
ICB8IDExICstLQogLi4ucGRhdGUtdWRldi1ydWxlLWFuZC1zeXN0ZW1kLXNlcnZpY2UtLnBhdGNo
IHwgNzEgKysrKysrKysrKysrKysrKysrKwogLi4uL29wdGVlL29wdGVlLWNsaWVudF80LjMuMC5i
YiAgICAgICAgICAgICAgIHwgIDMgKy0KIC4uLi9vcHRlZS9vcHRlZS1jbGllbnRfNC40LjAuYmIg
ICAgICAgICAgICAgICB8ICAxICsKIDQgZmlsZXMgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLWFybS9yZWNpcGVzLXNlY3Vy
aXR5L29wdGVlL29wdGVlLWNsaWVudC8wMDAxLXRlZS1zdXBwbGljYW50LXVwZGF0ZS11ZGV2LXJ1
bGUtYW5kLXN5c3RlbWQtc2VydmljZS0ucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhLWFybS9yZWNp
cGVzLXNlY3VyaXR5L29wdGVlL29wdGVlLWNsaWVudC5pbmMgYi9tZXRhLWFybS9yZWNpcGVzLXNl
Y3VyaXR5L29wdGVlL29wdGVlLWNsaWVudC5pbmMKaW5kZXggZmM0OGMzMDIuLjBmODY2NWFkIDEw
MDY0NAotLS0gYS9tZXRhLWFybS9yZWNpcGVzLXNlY3VyaXR5L29wdGVlL29wdGVlLWNsaWVudC5p
bmMKKysrIGIvbWV0YS1hcm0vcmVjaXBlcy1zZWN1cml0eS9vcHRlZS9vcHRlZS1jbGllbnQuaW5j
CkBAIC0xNiwxNiArMTYsMTkgQEAgVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiXig/UDxw
dmVyPlxkKyhcLlxkKykrKSQiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKK0RFUEVORFMgKz0g
InVkZXYiCisKIEVYVFJBX09FQ01BS0UgPSAiIFwKICAgICAtREJVSUxEX1NIQVJFRF9MSUJTPU9O
IFwKKyAgICAtRENGR19VU0VfUEtHQ09ORklHPU9uIFwKICIKKworRVhUUkFfT0VDTUFLRSArPSAi
JHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdzeXN0ZW1kJywgXAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICctRENGR19FTkFCTEVfU1lTVEVN
RD1PbicsICcgLURDRkdfRU5BQkxFX1NZU1RFTUQ9T2ZmJyAsIGQpfSIKKwogRVhUUkFfT0VDTUFL
RTphcHBlbmQ6dG9vbGNoYWluLWNsYW5nID0gIiAtRENGR19XRVJST1I9MCIKIAogZG9faW5zdGFs
bDphcHBlbmQoKSB7Ci0gICAgIyBpbnN0YWxsZWQgYnkgZGVmYXVsdAotICAgIGlmICEgJHtAYmIu
dXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdzeXN0ZW1kJywgJ3RydWUnLCAnZmFs
c2UnLCBkKX07IHRoZW4KLSAgICAgICAgcm0gLXJmICR7RH0ke2xpYmRpcn0vc3lzdGVtZAotICAg
IGZpCiAgICAgaWYgJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdzeXN2
aW5pdCcsICd0cnVlJywgJ2ZhbHNlJywgZCl9OyB0aGVuCiAgICAgICAgIGluc3RhbGwgLUQgLXAg
LW0wNzU1ICR7VU5QQUNLRElSfS90ZWUtc3VwcGxpY2FudC5zaCAke0R9JHtzeXNjb25mZGlyfS9p
bml0LmQvdGVlLXN1cHBsaWNhbnQKICAgICAgICAgc2VkIC1pIC1lIHM6QHN5c2NvbmZkaXJAOiR7
c3lzY29uZmRpcn06ZyBcCmRpZmYgLS1naXQgYS9tZXRhLWFybS9yZWNpcGVzLXNlY3VyaXR5L29w
dGVlL29wdGVlLWNsaWVudC8wMDAxLXRlZS1zdXBwbGljYW50LXVwZGF0ZS11ZGV2LXJ1bGUtYW5k
LXN5c3RlbWQtc2VydmljZS0ucGF0Y2ggYi9tZXRhLWFybS9yZWNpcGVzLXNlY3VyaXR5L29wdGVl
L29wdGVlLWNsaWVudC8wMDAxLXRlZS1zdXBwbGljYW50LXVwZGF0ZS11ZGV2LXJ1bGUtYW5kLXN5
c3RlbWQtc2VydmljZS0ucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAu
LjllODA5OWJmCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1hcm0vcmVjaXBlcy1zZWN1cml0eS9v
cHRlZS9vcHRlZS1jbGllbnQvMDAwMS10ZWUtc3VwcGxpY2FudC11cGRhdGUtdWRldi1ydWxlLWFu
ZC1zeXN0ZW1kLXNlcnZpY2UtLnBhdGNoCkBAIC0wLDAgKzEsNzEgQEAKK0Zyb20gZWQ3ZDE4YWUx
NzRmNjQ4ZGI1Y2NkYzIwZjA3YWE4NmViZjE0MTBjZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb206IEd5b3JneSBTemluZyA8Z3lvcmd5LnN6aW5nQGFybS5jb20+CitEYXRlOiBUaHUsIDE0
IE5vdiAyMDI0IDIzOjA4OjM1ICswMTAwCitTdWJqZWN0OiBbUEFUQ0ggMS8xXSB0ZWUtc3VwcGxp
Y2FudDogdXBkYXRlIHVkZXYgcnVsZSBhbmQgc3lzdGVtZCBzZXJ2aWNlIGZpbGUKKyBoYW5kbGlu
ZworCitBbGxvdyBvcHRpb25hbGx5IHVzaW5nIHBrZy1jb25maWcgdG8gZGlzY292ZXIgaW5zdGFs
bCBsb2NhdGlvbiBvZgorc3lzdGVtZCBzZXJ2aWNlIGFuZCB1ZGV2IHJ1bGUgZmlsZXMuCitNYWtl
IHN5c3RlbWQgc2VydmljZSBmaWxlIGdlbmVyYXRpb24gYW5kIGluc3RhbGxhdGlvbiBvcHRpb25h
bC4KKworVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCisKK1NpZ25lZC1vZmYtYnk6IEd5b3JneSBT
emluZyA8Z3lvcmd5LnN6aW5nQGFybS5jb20+CistLS0KKyB0ZWUtc3VwcGxpY2FudC9DTWFrZUxp
c3RzLnR4dCB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KKyAxIGZpbGUg
Y2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBh
L3RlZS1zdXBwbGljYW50L0NNYWtlTGlzdHMudHh0IGIvdGVlLXN1cHBsaWNhbnQvQ01ha2VMaXN0
cy50eHQKK2luZGV4IDhkZjliZWYuLmE4NzcxNzEgMTAwNjQ0CistLS0gYS90ZWUtc3VwcGxpY2Fu
dC9DTWFrZUxpc3RzLnR4dAorKysrIGIvdGVlLXN1cHBsaWNhbnQvQ01ha2VMaXN0cy50eHQKK0BA
IC03LDYgKzcsOCBAQCBvcHRpb24oUlBNQl9FTVUgIkVuYWJsZSB0ZWUtc3VwcGxpY2FudCB0byBl
bXVsYXRlIFJQTUIiIE9OKQorIG9wdGlvbihDRkdfVEFfR1BST0ZfU1VQUE9SVCAiRW5hYmxlIHRl
ZS1zdXBwbGljYW50IHN1cHBvcnQgZm9yIFRBcyBpbnN0cnVtZW50ZWQgd2l0aCBncHJvZiIgT04p
Cisgb3B0aW9uKENGR19GVFJBQ0VfU1VQUE9SVCAiRW5hYmxlIHRlZS1zdXBwbGljYW50IHN1cHBv
cnQgZm9yIFRBcyBpbnN0cnVtZW50ZWQgd2l0aCBmdHJhY2UiIE9OKQorIG9wdGlvbihDRkdfVEVF
X1NVUFBfUExVR0lOUyAiRW5hYmxlIHRlZS1zdXBwbGljYW50IHBsdWdpbiBzdXBwb3J0IiBPTikK
KytvcHRpb24oQ0ZHX0VOQUJMRV9TWVNURU1EICJFbmFibGUgc3lzdGVtZCBzZXJ2aWNlIHVuaXQg
ZmlsZSBnZW5lcmF0aW9uLiIgT04pCisrb3B0aW9uKENGR19VU0VfUEtHQ09ORklHICJVc2UgcGtn
LWNvbmZpZyBmb3IgZGlzY292ZXJpbmcgaW5zdGFsbCB0YXJnZXQgZGlyZWN0b3J5IGZvciBzeXN0
ZW1kIGFuZCB1ZGV2IGZpbGVzLiIgT0ZGKQorIAorIHNldChDRkdfVEVFX1NVUFBfTE9HX0xFVkVM
ICIxIiBDQUNIRSBTVFJJTkcgInRlZS1zdXBwbGljYW50IGxvZyBsZXZlbCIpCisgIyBGSVhNRTog
UXVlc3Rpb24gaXMsIGlzIHRoaXMgcmVhbGx5IG5lZWRlZD8gU2hvdWxkIGp1c3QgdXNlIGRlZmF1
bHRzIGZyb20gIyBHTlVJbnN0YWxsRGlycz8KK0BAIC0xMTcsOCArMTE5LDM0IEBAIGVuZGlmKCkK
KyAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworICMgSW5zdGFsbCB0YXJnZXRzCisgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKKysjIERpc2NvdmVyIHRhcmdldCBpbnN0YWxsIGxvY2F0aW9uIG9mIHRo
ZSBzeXN0ZW1kIGFuZCB1ZGV2IGZpbGVzIHVzaW5nIHBrZy1jb25maWcKKytpZiAoQ0ZHX1VTRV9Q
S0dDT05GSUcpCisrCSMgTm90ZTogcGtnLWNvbmZpZyBzaG91bGQgcmV0dXJuIHNldHRpbmcgdmFs
aWQgZm9yIHRoZSB0YXJnZXQgcGxhdGZvcm0gYW5kIG5vdCB0aGUgaG9zdC4KKysJaW5jbHVkZShG
aW5kUGtnQ29uZmlnKQorKwlpZiAoUEtHX0NPTkZJR19GT1VORCkKKysJCXBrZ19zZWFyY2hfbW9k
dWxlKFNZU1RFTUQgc3lzdGVtZCkKKysJCWlmIChTWVNURU1EX0ZPVU5EIEFORCBDRkdfRU5BQkxF
X1NZU1RFTUQpCisrCQkJcGtnX2dldF92YXJpYWJsZShVTklUX0RJUiBzeXN0ZW1kIHN5c3RlbWRf
c3lzdGVtX3VuaXRfZGlyKQorKwkJCXNldChTWVNURU1EX1VOSVRfRElSICIke1VOSVRfRElSfSIg
Q0FDSEUgUEFUSCAiTG9jYXRpb24gb2Ygc3lzdGVtZCB1bml0IGZpbGVzLiIpCisrCQkJdW5zZXQo
VU5JVF9ESVIpCisrCQllbmRpZigpCisrCQlwa2dfc2VhcmNoX21vZHVsZShVREVWIHVkZXYpCisr
CQlpZiAoVURFVl9GT1VORCkKKysJCQlwa2dfZ2V0X3ZhcmlhYmxlKFVERVZfRElSIHVkZXYgdWRl
dl9kaXIpCisrCQkJc2V0KFVERVZfVURFVl9ESVIgIiR7VURFVl9ESVJ9IiBDQUNIRSBQQVRIICJM
b2NhdGlvbiBvZiB1ZGV2IGZpbGVzLiIpCisrCQkJdW5zZXQoVURFVl9ESVIpCisrCQllbmRpZigp
CisrCWVuZGlmKCkKKytlbmRpZigpCisrCisrIyBTb21lIHNhbmUgZGVmYXVsdHMgaXMgZGlzY292
ZXJpbmcgdGhyb3VnaCBwa2djb25maWcgZmFpbHMgb3IgaXMgZGlzYWJsZWQuCisrc2V0KFNZU1RF
TURfVU5JVF9ESVIgIiR7Q01BS0VfSU5TVEFMTF9MSUJESVJ9L3N5c3RlbWQvc3lzdGVtIiBDQUNI
RSBQQVRIICJMb2NhdGlvbiBvZiBzeXN0ZW1kIHVuaXQgZmlsZXMuIikKKytzZXQoVURFVl9VREVW
X0RJUiAiJHtDTUFLRV9JTlNUQUxMX1NZU0NPTkZESVJ9L3VkZXYiIENBQ0hFIFBBVEggIkxvY2F0
aW9uIG9mIHVkZXYgZmlsZXMuIikKKysKKyBpbnN0YWxsKFRBUkdFVFMgJHtQUk9KRUNUX05BTUV9
IFJVTlRJTUUgREVTVElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX1NCSU5ESVJ9KQorLWNvbmZpZ3Vy
ZV9maWxlKHRlZS1zdXBwbGljYW50QC5zZXJ2aWNlLmluIHRlZS1zdXBwbGljYW50QC5zZXJ2aWNl
IEBPTkxZKQorLWluc3RhbGwoRklMRVMgJHtDTUFLRV9CSU5BUllfRElSfS8ke1BST0pFQ1RfTkFN
RX0vdGVlLXN1cHBsaWNhbnRALnNlcnZpY2UgREVTVElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX0xJ
QkRJUn0vc3lzdGVtZC9zeXN0ZW0pCisraWYgKENGR19FTkFCTEVfU1lTVEVNRCkKKysJY29uZmln
dXJlX2ZpbGUodGVlLXN1cHBsaWNhbnRALnNlcnZpY2UuaW4gdGVlLXN1cHBsaWNhbnRALnNlcnZp
Y2UgQE9OTFkpCisrCWluc3RhbGwoRklMRVMgJHtDTUFLRV9CSU5BUllfRElSfS8ke1BST0pFQ1Rf
TkFNRX0vdGVlLXN1cHBsaWNhbnRALnNlcnZpY2UgREVTVElOQVRJT04gJHtTWVNURU1EX1VOSVRf
RElSfSkKKytlbmRpZigpCisgY29uZmlndXJlX2ZpbGUob3B0ZWUtdWRldi5ydWxlcy5pbiBvcHRl
ZS11ZGV2LnJ1bGVzIEBPTkxZKQorLWluc3RhbGwoRklMRVMgJHtDTUFLRV9CSU5BUllfRElSfS8k
e1BST0pFQ1RfTkFNRX0vb3B0ZWUtdWRldi5ydWxlcyBERVNUSU5BVElPTiAke0NNQUtFX0lOU1RB
TExfU1lTQ09ORkRJUn0vdWRldi9ydWxlcy5kKQorK2luc3RhbGwoRklMRVMgJHtDTUFLRV9CSU5B
UllfRElSfS8ke1BST0pFQ1RfTkFNRX0vb3B0ZWUtdWRldi5ydWxlcyBERVNUSU5BVElPTiAke1VE
RVZfVURFVl9ESVJ9L3J1bGVzLmQpCistLSAKKzIuNDMuMAorCmRpZmYgLS1naXQgYS9tZXRhLWFy
bS9yZWNpcGVzLXNlY3VyaXR5L29wdGVlL29wdGVlLWNsaWVudF80LjMuMC5iYiBiL21ldGEtYXJt
L3JlY2lwZXMtc2VjdXJpdHkvb3B0ZWUvb3B0ZWUtY2xpZW50XzQuMy4wLmJiCmluZGV4IGVkYWI0
NTgzLi45ZGMzMDFmNCAxMDA2NDQKLS0tIGEvbWV0YS1hcm0vcmVjaXBlcy1zZWN1cml0eS9vcHRl
ZS9vcHRlZS1jbGllbnRfNC4zLjAuYmIKKysrIGIvbWV0YS1hcm0vcmVjaXBlcy1zZWN1cml0eS9v
cHRlZS9vcHRlZS1jbGllbnRfNC4zLjAuYmIKQEAgLTIsNyArMiw4IEBAIHJlcXVpcmUgcmVjaXBl
cy1zZWN1cml0eS9vcHRlZS9vcHRlZS1jbGllbnQuaW5jCiAKIFNSQ1JFViA9ICJhNWIxZmZjZDI2
ZTMyOGFmMGJiZjE4YWI0NDhhMzhlY2Q1NThlMDVjIgogCi1TUkNfVVJJICs9ICJmaWxlOi8vMDAw
MS10ZWUtc3VwcGxpY2FudC1hZGQtdWRldi1ydWxlLWFuZC1zeXN0ZW1kLXNlcnZpY2UtZmlsLnBh
dGNoIgorU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtdGVlLXN1cHBsaWNhbnQtYWRkLXVkZXYtcnVs
ZS1hbmQtc3lzdGVtZC1zZXJ2aWNlLWZpbC5wYXRjaCBcCisgICAgICAgICAgICBmaWxlOi8vMDAw
MS10ZWUtc3VwcGxpY2FudC11cGRhdGUtdWRldi1ydWxlLWFuZC1zeXN0ZW1kLXNlcnZpY2UtLnBh
dGNoIgogCiBpbmhlcml0IHBrZ2NvbmZpZwogREVQRU5EUyArPSAidXRpbC1saW51eCIKZGlmZiAt
LWdpdCBhL21ldGEtYXJtL3JlY2lwZXMtc2VjdXJpdHkvb3B0ZWUvb3B0ZWUtY2xpZW50XzQuNC4w
LmJiIGIvbWV0YS1hcm0vcmVjaXBlcy1zZWN1cml0eS9vcHRlZS9vcHRlZS1jbGllbnRfNC40LjAu
YmIKaW5kZXggZmE3Yjk1NjQuLmZhNjQ5MTQzIDEwMDY0NAotLS0gYS9tZXRhLWFybS9yZWNpcGVz
LXNlY3VyaXR5L29wdGVlL29wdGVlLWNsaWVudF80LjQuMC5iYgorKysgYi9tZXRhLWFybS9yZWNp
cGVzLXNlY3VyaXR5L29wdGVlL29wdGVlLWNsaWVudF80LjQuMC5iYgpAQCAtMiw2ICsyLDcgQEAg
cmVxdWlyZSByZWNpcGVzLXNlY3VyaXR5L29wdGVlL29wdGVlLWNsaWVudC5pbmMKIAogIyB2NC40
LjAKIFNSQ1JFViA9ICJkMjIxNjc2YTU4YjMwNWJkZGJmOTdkYjAwMzk1MjA1YjMwMzhkZThlIgor
U1JDX1VSSSArPSAiZmlsZTovLzAwMDEtdGVlLXN1cHBsaWNhbnQtdXBkYXRlLXVkZXYtcnVsZS1h
bmQtc3lzdGVtZC1zZXJ2aWNlLS5wYXRjaCIKIAogaW5oZXJpdCBwa2djb25maWcKIERFUEVORFMg
Kz0gInV0aWwtbGludXgiCi0tIAoyLjQzLjAKCg==

--_004_AS8PR08MB58955003C2B8CF01CDE7EA54912F2AS8PR08MB5895eurp_--

