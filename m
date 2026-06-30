Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39383C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:34:13 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21154.1782826446466656567
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 06:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=epwh1zCx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=epwh1zCx;
 spf=pass (domain: arm.com, ip: 52.101.83.15, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uKoODc5zitwu3E3rbO9puwNn436T7kFwPPYNSRIOfJtSINa9jV67RjFvfGpVjl07XK0kESkuu3ev888sLh7VpovN7KS9SytV6G7ukqKhgFhF3ym5XpeWZwOKSTCVmmZTM/12uip0mElKu0wuLTon81rrCnTDQ0KzWal2rzMRp/SE5T9qWSd0IJh4FPCoKBgL/MZsVs4W6xQz50V+U8cYinypbpRJoZvkxuPbBz7tzZj6CuZJuiH6jNrdaNK9CHidszqlBV6ELrDBJ00wQcHA/OsQEaRE616u6ziV8S2HK30xWU4yyOaYbn5bGxczGsf4tWqJVzfBIvCXW7E5uhkJJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYzmnifVEYWrmlt6/qsKxebCtprcrexCIyhtNM0N9lc=;
 b=snT40axw7VN82imYJWOM5XHqYdGneDXPUvXNx9C6SEF970dxixR/52gunsfn/+c0CNAAoj/SSNnQF9IezGs7eVCE4Q1qYnEehvXenMKkMdFWzz8D/Ra7iC+Ke1M6EtpT3oEkpKeEpO+Y/Soudt/koc1gE5k6jENUEZ+El0wjrVIiKCSGLR7toTllT/OSEcTcTTGDFjBp7CozotQ6ZBYHcMBi86qk2UaWEob3v9ZDIRekcIFD1MvwxAyP3uE891vN4BCnG9pikATY3tFUXdfnEJ+CtG1tLeNn7HQRKyiZURVjbR1uLPa47hlFj9DBRU+KpwNoLZpFH0w3y+7+SdMyLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kudzu.us smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYzmnifVEYWrmlt6/qsKxebCtprcrexCIyhtNM0N9lc=;
 b=epwh1zCxvizOYIqadmAqpSxO6P7UGu5jef5UIZGidcsdjIftcHETMQ2teplryybE5995z9EBjsLyz5PG1BdI1ROkj+6KIvWfNt2dx2Nk+xAKUtZWQegbJkZLcZAg8/Qj1ywl9rJ1re+qR+mGmNzaGHtB5OyWpPGpEQYpv84dSTo=
Received: from AS4PR10CA0024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::16)
 by DBAPR08MB5829.eurprd08.prod.outlook.com (2603:10a6:10:1a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 13:33:57 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::aa) by AS4PR10CA0024.outlook.office365.com
 (2603:10a6:20b:5d8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 13:33:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Tue, 30 Jun 2026 13:33:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsnpJ4oxHom0MhSI0sW6duqjgfDMeYJQlRhEcFOKDU5wlc5Q5mLpCBhrv/OKJnFBqv15Ozzhue0pRpgTZwyFlaJj4yterVEVYTitrTZ0RbW8YfT6g7GcK0RA4O6tEyjMAyg0yY7KWewEQAcp9/hF+HyFr9lIJCi2DFr5yJt7m0hME3Xba+veycpWCkVefWMjVzGgv2Bjwn/XsOcgZob54sxpRowCuOlAG+E7UXgj6H0OJx9Lo2h/cpn6d9BI4O1Ab9iv7d3UKwMt2EucqnwvwoRFOgWyOnjE86I41j2Ag/FX4JyeXq/iEvjEizP8XAxkxJXDt17u4Ah4fvbGd5BlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYzmnifVEYWrmlt6/qsKxebCtprcrexCIyhtNM0N9lc=;
 b=eINnKs32RrwxtjY3lMTQS9nqy6Y2pXE3sJoQW3g98Ox+9VybW2rlRcJO+3MyeCwL3mUUGYbCPh52qwHTgTqaf0uZJGfi0qaBgoRaKkFkdxGV+hN9NaS5hI02w4X5xGi12RPmNy6azqQdIBf9XDLz3tYsIbj2o+JCrdZTqSxWU/R6u9XYeCqwEngkaivSvfgneGN+1rwoBPjGR7XN6gg0g0BN6w5LPan6gGPycHu5qNJgmQ+2AjLcA3toJycop/np4tj5UJ5B/cMWCACbrsXr0HXW344Qi/LrQ9rELa58b3HdKHXSt3s9IK4CnKKC4vkgZZefNgPkWCBgMYBnF3qPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYzmnifVEYWrmlt6/qsKxebCtprcrexCIyhtNM0N9lc=;
 b=epwh1zCxvizOYIqadmAqpSxO6P7UGu5jef5UIZGidcsdjIftcHETMQ2teplryybE5995z9EBjsLyz5PG1BdI1ROkj+6KIvWfNt2dx2Nk+xAKUtZWQegbJkZLcZAg8/Qj1ywl9rJ1re+qR+mGmNzaGHtB5OyWpPGpEQYpv84dSTo=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV2PR08MB8632.eurprd08.prod.outlook.com (2603:10a6:150:b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:30:41 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:30:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>
CC: Jon Mason <jdmason@kudzu.us>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, "yocto@pengutronix.de"
	<yocto@pengutronix.de>
Subject: Re: [meta-arm] [PATCH] arm/optee: upate to 4.10.0
Thread-Topic: [meta-arm] [PATCH] arm/optee: upate to 4.10.0
Thread-Index: AQHc93ZYsomqK/1ftEeRAzU10m+qNrY+IeOAgBju+QCAACl1gA==
Date: Tue, 30 Jun 2026 13:30:41 +0000
Message-ID: <3C687473-6176-4197-8263-A5A44A966390@arm.com>
References: <20260608-mfe-optee-4-10-0-v1-1-83f4f4119c71@pengutronix.de>
 <CAPoiz9xpqaWrJhQfsyxigDt+arTtqQ508iE1m06FBPyAnY6kEg@mail.gmail.com>
 <qfi575bkmnjx76usxmbnfnelahe6brhxiwo4bcor3eaevrjw6s@6ozy5ubsfvnz>
In-Reply-To: <qfi575bkmnjx76usxmbnfnelahe6brhxiwo4bcor3eaevrjw6s@6ozy5ubsfvnz>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV2PR08MB8632:EE_|AMS1EPF00000044:EE_|DBAPR08MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 04598638-cde1-4e8d-2df2-08ded6ac3c50
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|4143699003|18002099003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 tIvtKl3/0Ia/b/Ug2EqsU6alkFviHDCdztNCILlrjKFV4YpnoimRcIwj+pHB/2OXlSojcKQMW7eQi8c5e7EnoQ5aTZhJ/z5rmJgEZ7vTcqB2AJmvoajitxQWT3IWEU41rZrXsK6CpZY9JbUHSZyIuTSkRbAPHUjFMoggd2Bn5rBtmhEy1izEJe0WdpfqBJ1Gobp6Pjs4yit7pqWEf7tyCwQRqWnSWMCDSVcTcm/j7scQyBpXebz6JmiQYt1eOsyQeXipSC8kqff7YUiTRgnd0L0NLPNo0VTX3bopbLj6q2YJiXCNDbLIu/Bg29V43nWatjZBpWVOTgSYEO/yhM7zXvzAMeD/qgK5MiKGkUgAfT7ta7hnYK0/uQDdMY4+3qGeLoT/ArCQ1CzMVDwI8mDsvn6814fkRV/nclnKMbgAp3NHmKrxyvKIMoCRomaZvdjYYf6qIrHCac341PyVxrBk59FA+ccKqr4Dr7kz/ZnfYYM0w02peYA4Mgx+uYDwuMktR/DkYhepL0RvRus6Gtl/GSrlpBWV4PUoVybQhmEIVB7GmyVlx5GXiqa3KyPRn93c5BND6ofcrhpICDNyBMSQFhczjyDkZ7ca0t4qfpa94d+LDGDFp3Uq41gjjcibGqak9ulf4oiuH9Xr2gp94K8fWoqWq0I6/zlvkcI2kFBWd3AX7Fj/vzas546cTPsauP6TYhNWXq1wKUhIcx6KSJKWew==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(4143699003)(18002099003)(11063799006)(22082099003)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4AED04B54B48047B6F8F4F883100871@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 SZpMc9XMCdUCbk5ZYWXPPw31EH+EOJP2wNpzHIpIVy6yZd5uuQZnBfRpkk0fX/xSUIBvX4tW0J1aGCA+plgcHQ3jM1heGXSRSLdfVH0C4iF7HBeEVEn7diG0AFO8j0iFJSct6mbUB+UXQf43XrCICke9nwmD5RfxfPslW6qFMqv7AWkWO3LgSyUWuX0xk7rj5CfTGJIOCtayDHeg/qlAcc1r1N6JpzmlFirGbdcMH3EjEWIgq3qCzJ+ysLwg784jxO08bOhsS/EnQCpoexwUQu/RLnr+22PQNQIxPpwDd0effB5C+7STcdUBmOLYvDquHOD9udwTkdFZW81mOmUINQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8632
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d96ba5a3-9a60-43fe-5065-08ded6abc808
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|14060799003|1800799024|82310400026|36860700016|35042699022|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Ac5RZhMFdeLxG/24axIGGjwRM65TM15es+u7ueZSS3ZAqXccThV/qZ0oqmlR9/4T+4Gp9TGj2KRv/KywUur8I9MX6ywf1gDX0z1YdTDtlDYBwTrQ+boJud7kK68fWEjiU/BNvqoTy1Qc2yUO5mzKl7meGZHhfR9TyK9uL6WlKaorawQ2YwvcO7fkJdJGnCNTuCO/U8pngkXVNqlKw8yo4AQh3LUuVmDi9drVpiKL8fSpaS2RRy4rYn/WcB9QdSSNYIgnulYf8VCEpawAVYkAL/fEusLrtijkwiNeyVXVLlXexoczuoD1lE0TTiz+oUe+b2IvpA1CKGBl0l0Ezkvm2jQjgifmKbkPoW19nLmPx52mBLh3YPENYMXCF1PkOl7jfJ83jU/Xi/gomjVbkwVDOZoLWSIx+Eq7PQzj4v67O5+fiC4Gi9V9Q6KfwldZdN3JoF9uKjXZWnGHA0U+0MdfmvrRm1xmGZlYyJyAX6ElFd+efW8OU0nMN7nYycvCnLssxjKJVMyxkpJzbZRPniHwy3TS38Nq6MAuJx4YOIsZryWSdG+YAQ80zHsZVnVcbnjVnJWiGcLj9aQIg8HlrJLhevkz527UNx2qYavRlezigGkq7X9+WGGRY2tLx9o2xQboLlvIXCAE8AWk70MChAfbJ6D1UBdXdWGvsZe4w/V9yZC1MFbtJE3xuB4ORVGy1+3o6NdqVZs5NlRa+UPo0yEqXA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(14060799003)(1800799024)(82310400026)(36860700016)(35042699022)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uWgT0GBvBEX5LCAkeJc/m61TAi5o6EB10TCygQf3iLn9/4wu8XuOaWIfdXnGKngQb5F4KlosTEDXfr57YOC7e1+2fFLlHdb3A8VEnmkjS57gTBX4vBeWyfhzgXbBnBk7q7GfkXUp1kio3/NhsDJwWtfJbivMRda+Q8XuRkdi9hdPneD0kcycJEeF563APBhV0dd9LyTjD4CNFx4CABWn82DdZ5mGHslgS85iZhBVo4nE/cJirkmNVWFHixSiU4ROJMArN15ApNw7i/NXNnMffqGbO6CO61OMM7hC7C0QP6i8hGwo8gkpsfwGU3iTznDqlzWILc7+zEw3PrQ0bXKYIvtPVQQgDKohahCGc4L7Vbw0mgUsHV+Z33xAe7tD7vkn64MKl0UEHvP1RqztqmNsU8edlKt3ancL3aJBbQnr9I0oXQHT7HE9TAEAI5cZzpOb
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:33:56.6881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04598638-cde1-4e8d-2df2-08ded6ac3c50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5829
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jun 2026 13:34:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7110

T24gMzAgSnVuIDIwMjYsIGF0IDEyOjAyLCBNYXJjbyBGZWxzY2ggdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgPG0uZmVsc2NoPXBlbmd1dHJvbml4LmRlQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
IHdyb3RlOg0KPiBXb3VsZCBiZSBuaWNlIGlmIG1ldGEtYXJtIHdvdWxkIHVwZGF0ZSB0aGUgY29t
cG9uZW50cyBtb3JlIHJlZ3VsYXJseS4NCg0KVGhlIDQuMTAgcmVsZWFzZSBjYW1lIG91dCBhIGJp
dCB0b28gbGF0ZSBmb3IgdGhlIHdyeW5vc2UgcmVsZWFzZSwgYW5kIHRoZW4gd2Ugd2VyZSBidXN5
IHdpdGggd3J5bm9zZSBpdHNlbGYuICBBbmQgYXMgSm9uIHNhaWQsIG9uZSBkb2VzIG5vdCBqdXN0
IHVwZ3JhZGUgb3B0ZWUgd2l0aG91dCBmYWxsb3V0Lg0KDQpUaGVyZeKAmXMgYmVlbiB0YWxrIG9m
IG1vdmluZyBvcHRlZSBmcm9tIG1ldGEtYXJtIGludG8gb2UtY29yZSwgb24gdGhlIGJhc2lzIHRo
YXQgaXTigJlzIG5vdCBBcm0tc3BlY2lmaWMgYW55bW9yZS4gIEkgYW0gYWJzb2x1dGVseSBub3Qg
YSBzdWl0YWJsZSBtYWludGFpbmVyIGZvciB0aGUgcmVjaXBlLCB3b3VsZCB5b3UvUGVuZ3V0cm9u
aXggYmUgd2lsbGluZyB0byBjby1tYWludGFpbiB0aGUgcmVjaXBlIGluIG9lLWNvcmU/IA0KDQpD
aGVlcnMsDQpSb3Nz

