Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BFBC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:01:33 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43712.1784710885583093020
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 02:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WSCfUkdL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WSCfUkdL;
 spf=pass (domain: arm.com, ip: 52.101.70.27, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VWFtDKavg/nGTh1x4XxSx5LMInZf80dwc+EvwucM8BdGjqqQkx415f93OcPd6Geqr85QDfX8L7v7WyLkiUyWrU1CuV2GgVdyR0KsaEu814BqIvK5zTH7cztpqfLBahkO78NUwLsI64H1CPLn79KaIXaY/M2MUX5Leopwj4/iy3YmbuP0iDpiQeJoWROyIgMv0LJxHTWfgg+0WPrcQjIc369xr+SM7QBSPlIlOegz90l5xIKa8wZ9YovEI5DZH8zxHtguCcfIp6DnX+yfzNJrUdD21kOPPvDnNdzrF6xl++EaGOgeR+BFEyWyCAawEIbkOwPCMnBHOKpEh93immp6Ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FICbQPloQmrJiGY3d4tLRNNyncCkCLNBSyV0T1zMrT4=;
 b=P37K5g3FcE+prPLVAOncY9gZSEm39bhdGutLhGbS4RAar54144+5hyVTX5eWC3WK/ALcxUsnpkWZPc1mBVWQdCK/gRN1wyTirSK+6a8ORFsHH4ReMDZGoPKwiLYCilseWtYFjgyJ/nA1qdpy/4j+FsDdKsE1PGnuUNYIngHIwdJD7ImiGzMiivOXPJW8xwmbyEhAK0tW50Qiz7on0/rd7RAYe4HjmeJNl71pUhoDo6/jxmAMur5zlh4xBdM7bomavjOffptcxsmZdrCJRFHLl0njgxgJmlPEJfj2gPy9lp96YRwNlImQzWN4TaObSFccfU91kM+xTJUNDmhBEB3xPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=denix.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FICbQPloQmrJiGY3d4tLRNNyncCkCLNBSyV0T1zMrT4=;
 b=WSCfUkdLaGRPCmpPL312lWB3iwW0aayzJPNnskE0PpHeaPKhx/BDBGxdP9Ej+ftwg8rciUpBJJZKQjj7S444caVsVnUzgdX/mlyksRq42fFFdAXyIIIRZ/5SooPoXQpzLXy3C59ai7P/mp/5D2yz0lTVvVvcFzRRd9fzdTL8s/g=
Received: from DU2PR04CA0347.eurprd04.prod.outlook.com (2603:10a6:10:2b4::27)
 by PAVPR08MB8821.eurprd08.prod.outlook.com (2603:10a6:102:2fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:01:20 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::4) by DU2PR04CA0347.outlook.office365.com
 (2603:10a6:10:2b4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 09:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 09:01:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIRxYaMB7h9jtp2Ai76sg7Isw2TrHlY3hckjiPkOO9TC3fBEgBQmU6JOza3WKl3Y/yjTXijd53NvfK1kQCP4yGQ8WcLbDuVWKkMiVGCLxGY8GC+eb1Buoaa0UCPRCRnagI95kTjaZ8vbFhCXdLmJngJyjMJBxRF7m4rZNarttrJ+838pleMqvvhzt/5SQ6wV1NsqgITxf1iP5Kx67urSAAJW1GhV9magtNkE/CiN2shceGTwkusZiIwpok/nMlNVxlCPLYEWaFGB0BfxqIQFmxU82tHDR1GH2g695eVdxNuHNrWhncKSGqgsyLB31U2uK2kONIiiP1gTNnP6DCLE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FICbQPloQmrJiGY3d4tLRNNyncCkCLNBSyV0T1zMrT4=;
 b=ByaSx7A7yQwI1fefCN82N+/J5zN9v9nUGPiHUFGpPgCsG0ZqYfQ9zG9BxCoOwOTpzt9YOxiDsEDVrap3Ih1QFZgvzfQVKfCPD2r4xB6QrDkcLQhDNcMfQYrKtCL3AQ7Nuy2PE5FF0R0pNoydjPwMudLDrqOlfv8z6TmRwhRMbLZpGTgwf27FkvksEqVGoaLg/0KkfoUaYJtbLpj+yUZM86xCm8QIMMknrqD/qGlXRvmDvqHhzo/Ls89VHTq9lNTmLceYkymQf4fVvwglFwrpNsWJNKKkWzN16WyqLLsOFRIX0DCjEsCwPg03CobC3xmQoiVVDR8owMFl88p2CyqTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FICbQPloQmrJiGY3d4tLRNNyncCkCLNBSyV0T1zMrT4=;
 b=WSCfUkdLaGRPCmpPL312lWB3iwW0aayzJPNnskE0PpHeaPKhx/BDBGxdP9Ej+ftwg8rciUpBJJZKQjj7S444caVsVnUzgdX/mlyksRq42fFFdAXyIIIRZ/5SooPoXQpzLXy3C59ai7P/mp/5D2yz0lTVvVvcFzRRd9fzdTL8s/g=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV2PR08MB8002.eurprd08.prod.outlook.com (2603:10a6:150:aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 09:00:06 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 09:00:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] recipes: port LICENSE to SPDX
Thread-Topic: [meta-arm] [PATCH] recipes: port LICENSE to SPDX
Thread-Index: AQHdGUtYSs6OwgB4EkeQW5R/4XBtObZ4ZPkAgADZXoA=
Date: Wed, 22 Jul 2026 09:00:06 +0000
Message-ID: <29ADCFE3-B13C-40FD-8618-E6F9D85E5138@arm.com>
References: <20260721130159.558910-1-ross.burton@arm.com>
 <CAJdd5GYn6LKUOiA+ZXzRL_V+EB0im6OcQUs5t98yskJ-1hRzXA@mail.gmail.com>
 <20260721200156.GS10186@denix.org>
In-Reply-To: <20260721200156.GS10186@denix.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV2PR08MB8002:EE_|DU2PEPF00028D13:EE_|PAVPR08MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea1e5c1-1014-40d5-3b58-08dee7cfcbb2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 GfTX4bxNQDUjHEaHXKP6Kg98ynmlBGpXMS3BcWdOxJ+HeF6RykdcTITp041x6j2aJvDQ5/Mm6g7cQmVHzWKs91JBsljjfX1Po+lPehNmmgTBTaDXQxVUFST04e6FwvYix/lYRtVuL0PAS5ZpCI1GPXoZF5saZYHB2ph/2tKq+lqjHRLDzCXBo+xv/pS7BEZSELIw4JgrIKC/PXrmwDDdipPQAPkFesTwMUFKJGb+HX32z1GASZh8UXdnsWc/5cEKBHcjp8LEvkNcn4A4yI+CIxOMaA36V5kGwK4YQm9+ix7Uhsa51RaL8rpDgFZhd7nrEvjFMk99QckqLwORGs9XGzKr8a0XfZJSp5r6ye+0fyUDmJdrRSKLksBnxcCI9PxjkpJddX+FVW/zZrqv2stJZ8wxdibWfQq1SRlyR3OEVLClSerriecgwhHVAn7m0yZXESpkc6jvTIxW19sFykb0vYcS9j4Yoes90Kyr4rywP8f3NzAjmBVHoTKcObFlUwDUHOWQOpOUQeRpVx6JG1/auaflSiPKSsYeOb2xSqG2w2xuwpma1TCrY38ZAQAJE99NWdNNidGv4UMfMKnvDVjnCDtO6JZ4+/gPQtkKzJFKDPEm5v2P+T9l9TdkEFkpNErujLWo/mWQdesxWcoVJctwjv1U0RydngBASdAhsrvzDPmHcbYX2t/heFRmsEj20WdvPcmaPNgdzPZAwBKfRYXukPW9dA7NJN2VuQUkch06FSw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5855E655A188D2459CED39A2B7738E25@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 bKAiHRHEuCdT+63Qfz7ZPuzmUMi54FuC5Afq6/Jq89cgr6W9L0lFvm6KH8VGBLtRvHhSph6wn6//0QVuvUOA2s45mPly8Ffo5UTp6VXACoeRJyjWkmE/Oj9+9ktS/Rgh+r4KHLF0sFyikO0MpuH+x2Oi4zdqtYEXFW3oR0yQh9LhviUgkE1FV7OcEHwYhVaLMTgwu8R2y1zoxJTvfHQECxqm3zohUS0vYrLV1S8kDTUPucCpTHGxlGtAW92gWpr560e1CbjEmxi7fiMyVp+U5E2Eg/w5II6t2/C2gvHEBoIT/SzGImBK2j/vK8rcmnR7fm+S52DhKMEUnBbahRa5Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8002
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	040938ff-98e4-4d2a-3eea-08dee7cf9ffb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|376014|23010399003|82310400026|1800799024|36860700016|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	4EOQP0ui8TinGOYGDtnY2dbcIdKm93kB+MRgzYgIF01xQ9KHLRk4CR25x9nWTnHJY8rQBB6oY3eMu6lqyMzmJjDnnCWGHv0tDiEsLNvfpzzpoMvvJdD3lJkFNxe0LTrlaexrd0Oi7TAmGqsdN2GqQzJq/L0z2JHQcD73wPVQ1HLSk8/XkSyob+XHelswrpAB3Wr3U/HpYZpN46Z4F+BRjiELZvCQ03bI1t3fP2q50ovGlXKV20JSCkfgaX1vQKc8N1+OleDe1wEZFZsE4OeB0PY8Ayg1YlZbvjDpJVIAoauyQLjyDXz+sqqRVRKiXThflFh39VTTqeQ/Y7gAY5hENxlD/YNBM3lXyssMD7d4Awz2EOpsqRy89GF8NsCAHXcYFP9aqWd+688ImSnG/Oqa2tW/FsPPHpmi+L75lbUiT98H40y/jSj85rTzMYhK0U1Qsk5pua/AbODoinKaqLKl2TbC4c8YYeGfWtm6nmQwjWejwcHDnB8/8UmyPCf1bdfhBYFIglRKKUQNhg5crLrPe5qOAEB7iYdJT/eU5vzlmvy18gy2dh22OIaRiU3HTGVjYjqAeDJsZMg3ikqHe06KaAfVzOmNbnw1ViJMjrf4B3YYLsnBhTMxIL2btE+oPFiuE9/bHP5ECMXr0CA7Rr6wwEMDdIw8Ov92RK0reuQi4XIRXwBts6EqZ8IFqD5pBR8WL3e9rLfphfsQvq6rGP/zgA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mdXD3IigeJeyXqL3u4+9pQe63aEA6BGBJu5EdDJaiDO2mzwFiAhOb4CFf5lFJBBrGB4v0cCSuXvqvHrKCjT3QF50Lekm3TgQoU5TL37eo/Q0AM94K3NIJp1kOh/SDYQaXLqn5WPOZXMc/GnV0PKsgfiMHrv1pk6a7CTeBQyO5CxhGdP6puac9TQ82OH4blForjZNZJQaumxXf0Ch1VOvHWZVC+A6dW2gDoX/vz/RXFuaYHdEtzvasc018WUlY2WnfCoJ587lVnsTlq7otblkEpLU7+0ZJsCfLgGSH6gySNauitHvL34OTdkLlLafDNTI0KUVl7CFOvvHyzrsraX4szL08JOoRU4MVB2+3gEdASU7Rexw6pO4lki/yPbyZ0NH9g0DUQhcWd62atWgsAQNF8pMRhnnfRvjjCPU1x+xUH6vJLfvgcb2ob6VAKy8OkGt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:01:19.3881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea1e5c1-1014-40d5-3b58-08dee7cfcbb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8821
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jul 2026 09:01:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7124

T24gMjEgSnVsIDIwMjYsIGF0IDIxOjAxLCBEZW55cyBEbXl0cml5ZW5rbyA8ZGVuaXNAZGVuaXgu
b3JnPiB3cm90ZToNCj4gDQo+PiBSb3NzLCBkaWQgdGhlIHNjcmlwdCBhdXRvIGNoYW5nZSB0aGlz
IG9uZSBvciBkaWQgeW91IGhhbmQgZWRpdCBpdD8NCj4gDQo+IFRoZSBzY3JpcHQgZG9lc24ndCBj
aGFuZ2UgdGhpcyBhbmQgSSBrbm93IGl0IGZvciBhIGZhY3QsIGFzIEkgaGFkIHRvIG1ha2UgYSAN
Cj4gc2ltaWxhciBtYW51YWwgY2hhbmdlIGFuZCB3YXMgcXVpdGUgY29uZnVzZWQgYnkgUm9zcycg
Y2hhbmdlLCB3aGljaCBkaWRuJ3QgDQo+IGxvb2sgcmlnaHQgdG8gbWUuDQoNClRoYXQgd2FzIGVu
dGlyZWx5IG15IGZhdWx0LiBUaGUgc2NyaXB0IGxlZnQgYSBkZXByZWNhdGVkIGxpY2Vuc2UgYW5k
IEkgdXNlZCB0aGUgd3JvbmcgbGljZW5zZSB3aGVuIHVwZGF0aW5nIGl0IHRvIHVzZSBXSVRILg0K
DQpJ4oCZbGwgZml4IHVwIG5vdywgdGhhbmtzIGZvciBub3RpY2luZy4NCg0KUm9zcw==

