Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F012C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 12:59:57 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.51])
 by mx.groups.io with SMTP id smtpd.web11.36872.1711544391733142419
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Mar 2024 05:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ul2AipnY;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ul2AipnY;
 spf=pass (domain: arm.com, ip: 40.107.6.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=B2W7jrPx/H0kDJ/hIGK9YN70O+ZfwtnGSC1mWR8IKOUeL04hEcr9THwz+SqW0HDbclQPwkAAZNpyPw4mIIYFohoW1oGVORGtRCWXEz1K9XedVlHecqDm2y43gfAzU6Bw7BK09V6bxhtcHP4UAmHAaTWo3Cc5Px+WPK1V4Tc9n+V9GBinZQDf1WweeV2pgOF3r91SFM+/DcyJAq2zBhHCI5gZNERrtskbT2zptA8pbuA5uUGuKm7l6Ie2NIt3sECik0RpffPSMjja65qyiKjck15giNovR6hu3QKYHfKibVWpIr7NGEkjLMMxwqF9hmlm1pF10NxkYgGoL5PO8Gcg7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pH7672REhlpKbZHPVsf68EfCC6ihZ3MFAUXrwE+460=;
 b=Zgo0lNCKB3cJCvaz/95uRQdn12/+thkb/Eay1Y9+ijtR4a1wy9R/IfJ4mjFKsVGggXLXrhiAlV5z9bh7laBwU0USGObdb4CnxlkD1diOrFFTL7woS61q+B/xPgfseDPlrHliHBRN1g+57n7qvEV9/ub401RUkEeUuanRMiTkEixARGZmM+4iiNuV5g0ZHYSZ2aBI1SYhrlsaylD+0nwqRfPzFzX2aqaG4YDuIZuuL7wdIsG9EwTYfLs/Wo2RUROKi/4xE7dzdDn/5pygmap2zkM5YeE+MeARS2M9UMO6dux+Q9i8mGbHwlyfr6k3xGAnbKsXqFL4iLCO7dUjLlsNdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pH7672REhlpKbZHPVsf68EfCC6ihZ3MFAUXrwE+460=;
 b=ul2AipnYxD0FT6QzXv2OF7Tv9uPnY3kiZJzxwJUZr+4Z0kehmCsxbgx5KbBVqjzSd7a/59GnLxgkVunTH4fb4xxQhN4E+Z/z4xsqMuuBQDLJfQ103EjVqy0fT5tdKMm48HIuxuOoNAUcRGiROnIvCe6hV9HpzRNnjEIxJL6aRek=
Received: from DUZPR01CA0075.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::7) by AM9PR08MB6035.eurprd08.prod.outlook.com
 (2603:10a6:20b:2d9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 12:59:48 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::1d) by DUZPR01CA0075.outlook.office365.com
 (2603:10a6:10:3c2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 12:59:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7409.10 via
 Frontend Transport; Wed, 27 Mar 2024 12:59:48 +0000
Received: ("Tessian outbound 1b0f2681ce6f:v300"); Wed, 27 Mar 2024 12:59:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c459078dc514f727
X-CR-MTA-TID: 64aa7808
Received: from 9075a0310c64.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E5E6394E-12E1-40D8-97DF-B3114CB50DD3.1;
	Wed, 27 Mar 2024 12:59:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9075a0310c64.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Mar 2024 12:59:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APzvQLIq+I1xU7EyvgzKSkPrpP/Z6sObinWIogBRiq8jdVqRirq83Y3iGJxK6sbX3CldRfk+OnHrEUs6cQzqDWoG2NbAfuOvf2+YylZaSuoNaPR/AKszczxyBqCQlTqLbq+sEszP4ZBJwrB38rG0i3JGpjQUQjaq5gwh/va7Vz8WLRz6eyFSWim/LmJ8GYyzEBwdATf2gvIw8/qw69F1DwG4I/NqO+vpxvFiROeCOCBq+jMGrr27fbs46ABvxiPk6KypD8KIXAtb16l/AsRwCxmZgvJxFGLic17U+ksdL3ZWe1l+lqVNpFO7fIQcWxg71Yb3MuU0yoAM61uU/gr2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pH7672REhlpKbZHPVsf68EfCC6ihZ3MFAUXrwE+460=;
 b=nopm90VD3PNjj+91n2+fAmEGIwBZsgc5hbKzanVFYedIKskPP1CdDyDyW7VbEWInL00uRv1SEef37jahZCveze8siXp2e3ioQOeM0o4mevHAOhcMyi6th1yRuK3DoN/PdZLpO5ZTVBu7OJCn+cGFzyaIsW0uX64KSp8G/lVppW4q1e8hVOQ0tHDmogxIWSnk4LSxikoH9KWC1SqyO0XqYSTbndgnu35p1/inYbvuTdOadTof8Bl78nanTNj33LPXDZ1sWKHZIQQQHYKpTKAOG1n2H/hrCSS32mTaM2jVCx7SXKzE/OZh0Mx9UUuBg+RMWTNcu9DsAFIkx3slwic+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pH7672REhlpKbZHPVsf68EfCC6ihZ3MFAUXrwE+460=;
 b=ul2AipnYxD0FT6QzXv2OF7Tv9uPnY3kiZJzxwJUZr+4Z0kehmCsxbgx5KbBVqjzSd7a/59GnLxgkVunTH4fb4xxQhN4E+Z/z4xsqMuuBQDLJfQ103EjVqy0fT5tdKMm48HIuxuOoNAUcRGiROnIvCe6hV9HpzRNnjEIxJL6aRek=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9996.eurprd08.prod.outlook.com (2603:10a6:102:35a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 12:59:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 12:59:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Jon Mason <Jon.Mason@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
Subject: Re: [PATCH v2] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
Thread-Topic: [PATCH v2] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
Thread-Index: AQHaf7sDSdNC+CzmRk6maLephsz8+bFLjbqA
Date: Wed, 27 Mar 2024 12:59:37 +0000
Message-ID: <9A54B0CB-7272-4670-ABFD-9D4E641AD46E@arm.com>
References: <20240326202001.1075940-1-mathieu.poirier@linaro.org>
In-Reply-To: <20240326202001.1075940-1-mathieu.poirier@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9996:EE_|DU2PEPF0001E9C1:EE_|AM9PR08MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2fbc85-9a66-494d-5fae-08dc4e5dc875
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0oQLa3el2RLJXQpYEl/2AvsAYD/wgTtqyB7h/LjLjLK829xbSe+OIgcCq1wLZMISMOBwhfUYUnGmU6d9tivDQ9GRcWltJf+rLvZY/kN4Zxrvap6s6V0xauo4wHOb0VpPfstGAK1bWGFz/DpGUEn+tfNNxucOw38iYGWl1cHoy+RTaMkHIrHhwIsnuzg4GP8EcjolvjBxdVO4wQQf9W4VedP17JPvf9P05CknclcST7nzuuK5qyjTYfu7YnDtDbGWay7+7ZKQvqomT/4AFI7axcq2EhE/QNoRC1k/nSgh5crQO5L6PMBN/YY+tsjvi3kETYJeG6Xa2UV3Q0YrCPWejX1IXd2vzIw+aX1EKI8toD4ma6Ix6jANlv8LPKfvDE8BQyud2TvT8IIkhvcs8bovGY4nCt6g3Q6HbaxUDd2dI6FKjGW34WxAhwdUCBqhuPrSmieNCluf98hOYm8ZesjDq5LG2zeT5+RTZMqOOZjepTUUWnpAI32DnyeA/u2NuIVeyW3ks6M/vjyNNPKHGl6Yhi2yvJTmAyw+KC2yBlzv+Pds4NUxKh/HgxtVHvr+qXEWR7JkD/Z6lTb9XHnuVZOU1SWQoXw0CCkruQxLpbLCkGgABMerIaEiKxCXoR0SM9jNo/4slxIhp2T+lPZBYPfsYs/G1UsojZ4jr6hvcwnB8PdX6JOlkUkbP5rYM1icvUGWij9bx8mu/hb2qf+7OimtvcUwC4fx7VmP5u82c7KEe8g=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D53668CBBB936A4A9E81F7EFA5DCC732@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9996
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5c72a944-e28c-47b9-2f8b-08dc4e5dc218
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pwOBSWGf2Q9rMH/dG1lDcCwlMVv6Rqto6DOoHIrt6rwhICWVN9NhxMOB3Lw6FpE9bVIfzY4YN9Q92vI3bnHTJ9k7wD07MjddAVPv1ftZGEahbsA6/qCySYLScd30u5SFoyMohM9lkrj9Tj1AfQHTLrxRbvFXcc3kKwMDMdhUVEYXTThmDYpRDgGtrP0VbQusNpN2NAF/OFBLPjQUkCdlSDm4TmrKh/aF/8s9G1Z5r4sk4gunMB3iQMZbya1lWu/tu16/NNCpWcH4RulRR1/K6qv2Uvn2INR685QobsnnC/mruAIKl1TjxbtlGKmkK2qB+pSXIpOgbNa82E5rp7eZUlPo8LPTb/okAxyNQKspCHqsoTY0JTqiGr2W6YSapV+d3EUAXXycpRV6ZJ3nShgernB/HDC3Af/SQF6xsYwLkRWUzH2rsAauoLVZeV6mbOdYY6vCEteTayHEJSEClnul8cr7CFcBM/dK+jR80nvvHoYVEK6WIN75J8EtSc2LmykB6zUUsE49HGifn2382ZZBy4kS1dfkjyCBh/7LsiECO1WCzBY0kfGO9N/FYcEChDxtMNrApL4jf0aR8NDcTx18Sisql+1KQ17gFWm/hUMBLQbj5dzMHNRqRmibHsm1pUWvcEfu2JmvEmZiZAZdx9Dr+s8GfkUTCaZlYP8bA6GMEx86N/7zdc3V6wnw+2h7FbrdckV43Zm5fFbfnwMPTsq4hb7CboIn6YcY5A44IZjirJrGoeSk/0tJ8hvvl52N8VVU
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 12:59:48.1672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2fbc85-9a66-494d-5fae-08dc4e5dc875
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6035
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Mar 2024 12:59:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5491

SGkgTWF0dGlldSwNCg0KT24gMjYgTWFyIDIwMjQsIGF0IDIwOjIwLCBNYXRoaWV1IFBvaXJpZXIg
PG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gK1NSQ19VUklfUk1NICAgICA/
PSAiZ2l0c206Ly9naXQudHJ1c3RlZGZpcm13YXJlLm9yZy9URi1STU0vdGYtcm1tLmdpdDtwcm90
b2NvbD1odHRwcyINCj4gK1NSQ1JFVl9ybW0gICAgID89ICIwYTAyNjU2OTQ1ZDY5NzU3YjA3Nzkx
OTJjZWJiOWI0MWRkOTAzN2QxIg0KPiArU1JDQlJBTkNIX3JtbSAgICAgPz0gIm1haW4iDQo+ICsN
Cj4gK1NSQ19VUkkgPSAiJHtTUkNfVVJJX1JNTX07bmFtZT1ybW07YnJhbmNoPSR7U1JDQlJBTkNI
X3JtbX0gXA0KPiArICAgZmlsZTovLzAwMDEtYnVpbGQtbGliLUFkZC1leHRyYS1yZXBvc2l0b3Jp
ZXMtZm9yLXN5c3RlbS1pbmNsdWRlcy5wYXRjaCBcDQo+ICsgIg0KDQpJcyB0aGVyZSBhIGdvb2Qg
cmVhc29uIGZvciBhbGwgb2YgdGhpcyBpbmRpcmVjdGlvbj8gIElmIHlvdSB3YW50IHRvIHN1cHBv
cnQgYnVpbGRpbmcgZnJvbSBhIGxvY2FsIHNvdXJjZSB0cmVlL2ZvcmssIHRoZXJl4oCZcyBhIGNs
YXNzIHRoYXQgZG9lcyB0aGF0IGdlbmVyYWxseSAoZXh0ZXJuYWxzcmMpLg0KDQo+ICtSTU1fQ09O
RklHID89ICJxZW11X3ZpcnRfZGVmY2ZnIg0KDQpUaGUg4oCcZGVmYXVsdOKAnSBpc27igJl0IHFl
bXUsIGFzIHRoYXQgaXNu4oCZdCB1c2VmdWwgZm9yIGFueXRoaW5nIGJ1dCBxZW11LiAgQSBiZXR0
ZXIgc29sdXRpb24gd291bGQgYmU6DQoNClJNTV9DT05GSUcgPz0g4oCcIg0KUk1NX0NPTkZJRzpx
ZW11YXJtNjQgPSDigJxxZW11X3ZpcnRfZGVmY2Zn4oCdDQoNCkFsc28gdGhpcyByZWNpcGUgbmVl
ZHMgc29tZSBDT01QQVRJQkxFX01BQ0hJTkUgc3RhdGVtZW50cywgc28gdGhhdCBhIHdvcmxkIGJ1
aWxkIHdvbuKAmXQgdHJ5IGFuZCBidWlsZCBpdCBmb3IgZWcgcWVtdXg4Ni02NC4NCg0KPiArQiA9
ICIke1dPUktESVJ9L2J1aWxkIg0KDQpjbWFrZSBjbGFzcyBzZXRzIEIgYWxyZWFkeSwgcmVtb3Zl
Lg0KDQo+ICsjIFN1cHBsZW1lbnQgaW5jbHVkZSBwYXRoDQo+ICtFWFRSQV9PRUNNQUtFICs9ICIt
RENNQUtFX0lOQ0xVREVfUEFUSD0ke1dPUktESVJ9L3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRl
Ig0KDQotRENNQUtFX0lOQ0xVREVfUEFUSD0ke1NUQUdJTkdfSU5DRElSfSB3b3VsZCBiZSBuZWF0
ZXIsIGJ1dCB0aGlzIHJlYWxseSBkb2VzIGZlZWwgbGlrZSBhIGJ1ZyBpbiB0aGUgQ01ha2VMaXN0
cy50eHQuICBXaHkgZG9lc27igJl0IGl0IHJlc3BlY3QgdGhlIHN5c3Jvb3QgdGhhdCB0aGUgY29t
cGlsZXIgaXMgdG9sZCB0byB1c2U/ICBXZSBjYXJlZnVsbHkgY29uZmlndXJlIGEgdG9vbGNoYWlu
IHRoYXQgc3BlY2lmaWVzIGV4YWN0bHkgd2hhdCBjb21waWxlciwgc3lzcm9vdCwgZmxhZ3MsIGV0
YyB0byB1c2UuDQoNCj4gK2V4cG9ydCBDUk9TU19DT01QSUxFPSIke1RBUkdFVF9QUkVGSVh9Ig0K
PiArZXhwb3J0IENNQUtFX0JVSUxEX1BBUkFMTEVMX0xFVkVMID0gIiR7QG9lLnV0aWxzLnBhcmFs
bGVsX21ha2UoZCwgRmFsc2UpfSINCg0KQ01ha2UgY2xhc3Mgc2hvdWxkIGJlIGRvaW5nIHRoaXMs
IHJlbW92ZS4NCg0KUm9zcw==

