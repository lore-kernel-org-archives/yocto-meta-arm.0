Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC95C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 15:06:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web10.40252.1711551996516704673
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Mar 2024 08:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UDgtHuLR;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UDgtHuLR;
 spf=pass (domain: arm.com, ip: 40.107.21.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iqEH2CGkCGyom75E49WbRpQ2dk6mv1tp2t+vY4g0rAbVtEYKVeTqjLZ7G/MMK+jKySwqi8ig/WYjlPJ97kxPqk0E1YBQQfzUhEicNxYd5UgWJHRK+mocWnch7ydjIymScpswXvOA7/C/MVQ46VHvjrS0O0jguTthjb60RI8D9bMECdjhGmv6l+IOUQDClOqrRAEhqrBkfmL8bWeB9/+Ri2b5O7mz5PXQN/cK+r9XrS+shKxH6n08av8PzxLmkUUoxHZmHMOjtcJHH/q6eVHMkpgILltznmc502DjLidC99rVGzuDX3wEGAtjoQbPQPaIZkEd4D2ahv0GAayt1JYHbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snfrflnl6djigPuC2QGYaDSlaXvTgZd1n6UaCc9tDJ0=;
 b=UelgXjUxQQWJbxo/D+9jUeq10qE2XwiD4m2u2OUbhQF10imOanyKzE55G7PtKOpPIg9w1PszYdiLN4OwgkrPyAcgU1LmbzfiVHFqzL7R6N2nBDbFAfKvcZ5g467mTOMUvOD6LPh6vnBVpoIGrahGAMpCW192TaTUnQzWEOvHQCd+1roePZ3St6oQBrXdew2NP+a/fNNuX6xClzd9IFh2AW7r5ICiCcWmpCZqhSMEvd01Pw9b58Jy6hCVzaqlS+VeyWs1bi/DVyys6eQwSBJDYh7adc3t+80sqFH2WT0ghM9k+KkNkWmOvSGJKvBJRECM3BnnYnsTEABB7/vNkrMjAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snfrflnl6djigPuC2QGYaDSlaXvTgZd1n6UaCc9tDJ0=;
 b=UDgtHuLRfa6Rc55rS6vVi41AxPbvSkWFLF486lTbTVwZzAXyhpXt2Lq1eP6YxjdGA6LzR+2YyzRfOoh0qEDnT4/ZPEht3LYiHIcKz01VWfzDcMrLnbClWOIMjmXpxX/7ivl7PzujUdEVEQS0E8qh3wSx0flXQKGYOnER5ounoW8=
Received: from DBBPR09CA0007.eurprd09.prod.outlook.com (2603:10a6:10:c0::19)
 by PAXPR08MB6509.eurprd08.prod.outlook.com (2603:10a6:102:12e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 15:06:33 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::9b) by DBBPR09CA0007.outlook.office365.com
 (2603:10a6:10:c0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 15:06:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7409.10 via
 Frontend Transport; Wed, 27 Mar 2024 15:06:32 +0000
Received: ("Tessian outbound 1b0f2681ce6f:v300"); Wed, 27 Mar 2024 15:06:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5bfd83b6a4f399b7
X-CR-MTA-TID: 64aa7808
Received: from c4a863c5356e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81048487-AA21-4878-A205-40E3A3932934.1;
	Wed, 27 Mar 2024 15:06:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c4a863c5356e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Mar 2024 15:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mm4PKGRCZwFLYBpemKFfticjaljCK3MeS2ng4S/MA4a1qcriET2SnaMlQkzoGu1zdXgoN71K8S/LZWj9auhcpV9Bpr2NPY/NSWy5MSaWHBUQaw4xncxeQu4c91zsgkQAxsxhf+pheHH2zH2djnXzD8/aRIShIJ9tmiDbRA4QWcOJVUQ8lI8ZLzmL8S8g/DbighCKi8KT3NB3px1cfm8Ph6PABNNMDZSEy27fnX6vw/ynMKFNcY7Vu5OE94FyR6sXDpIRuMeEkKhYwiJveZAM8XCUT5mUUIrGHLr43dxi1jcu/yV+htltN06qJLmX1b2kFlFJG4hghqRbKIqJcv+GCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snfrflnl6djigPuC2QGYaDSlaXvTgZd1n6UaCc9tDJ0=;
 b=kap8ngah82TXCmvNcAp/7OX/XMg8aZBZCqBBFxy50RGmeEMd1hXQMpu2spCkeXSDo3RuPbDWgjR54Q9JbokrtUdcF1osVt1ZRpu8A58EingK0+kpPJIlvBf/IykKR7sYV3CtFWtIl5/qEFYGVEcJDIfmuFAzSEcdq7wWpejgTarJmz85fCthZ/pdls+AZWSuW+l1VXEY+GyFHUtMUikD7AZKtvBsvA91LA3pwcedBSIz1Y6I1ltRh7jHG/YKyUJmy2yHch02FgMzyBwy/RoUOGKGc0AH6XHcDXXlAIa4qMN/lLZS+DMX0YRy+hqM4IQMjh6DKt6x09cIgR24TvZdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snfrflnl6djigPuC2QGYaDSlaXvTgZd1n6UaCc9tDJ0=;
 b=UDgtHuLRfa6Rc55rS6vVi41AxPbvSkWFLF486lTbTVwZzAXyhpXt2Lq1eP6YxjdGA6LzR+2YyzRfOoh0qEDnT4/ZPEht3LYiHIcKz01VWfzDcMrLnbClWOIMjmXpxX/7ivl7PzujUdEVEQS0E8qh3wSx0flXQKGYOnER5ounoW8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB10706.eurprd08.prod.outlook.com (2603:10a6:102:3cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 15:06:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 15:06:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>, Jon Mason
	<Jon.Mason@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v2] arm/trusted-firmware-rmm: Add bitbake,
 include and patch file for RMM
Thread-Topic: [meta-arm] [PATCH v2] arm/trusted-firmware-rmm: Add bitbake,
 include and patch file for RMM
Thread-Index: AQHaf7sDSdNC+CzmRk6maLephsz8+bFLjzYAgAAKbYCAABeEgA==
Date: Wed, 27 Mar 2024 15:06:24 +0000
Message-ID: <2D90A79C-0BA3-453F-928D-8D132515F474@arm.com>
References: <20240326202001.1075940-1-mathieu.poirier@linaro.org>
 <86E1B306-3BC6-45B7-821B-D24DA64F42B5@arm.com> <ZgQiK6tpa8RdI_cy@nuoska>
In-Reply-To: <ZgQiK6tpa8RdI_cy@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB10706:EE_|DU2PEPF0001E9C0:EE_|PAXPR08MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2f9a5b-d86c-415b-36bf-08dc4e6f7d12
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WRiyZiCH1i82+qysq8NHV+Shc9jtVXFNtdwXR6NtAy9VY6HBDEos/y/NobbuvoqsWNyALT6oxvYcDKnG8/bZYqAZUjZh5BPuY1Xsp5IfJHaIE8pGm5M1ocIypTjDRtrXgDaC6G1c0+cA4okMtXKqECF94EgnCJidnh1ii4Y93VlX8xrZ4VwnWtNqVMPTYgP6d9/Nw8/8s44aExZwkYWiwpK1y2dwpwhIE5x5C6fmsrfPisCfEVEW4FKYjZnZMZrx2k2Cf+XTkmTks41sSqwjWyZmjnAz8FsCUM/VJQ5WdUIiO2z/2Jft8IsRDyjKUu5mt1B+ByerwU+7aB6WSGS1NIJqzauFxmSRQ+TiJqfGveC9FSIlV/o12iiYJ2pKsISuBhRNEJ74E344FlLmUYVtKyQJgqIlCTnOFV4hkvfbq/yjNN2cwdxisvrusRnEoraqxAn9arWjHUQ8PqOSKR2q8697AyGhMVOU72Xg+7QUcujAOpwhxSJ7uvlMM/pe+YbktapLb9dIXhdIONoo/FNuVLVqQcIeGcZ2zy+u4zwjQCm64j1Oc7YAzSbwEMp0xXpR+v5cxQZ+klplsyJxQ+dqBdGDDAdDi5S+Ys4LPubG2Q9oZzkWRWml9+2nebnGVuDCx+MBSGW289sN2m0fzbMe2N6rnctmcPC3oET3RlNRnbRJNVKMWeerWflu9W8f1dZbqsUPz7IJbjOref8tmJt+MF+CwW5UL+K9aaDaMwkTy7E=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C17B14061B17304D814C52E4788178EA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10706
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bc4b0694-e4e5-4f43-fc93-08dc4e6f77ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SxdAVvOG1Njx0IIUbo0uz3w3I2skfL1LF3dBgZ0IL3K4NWClSX5QPhlT1fvKdKqukeXUDQkF8fUs0cDNxpkNzM9DFr+HU0M1LBas1SMVJ4VGI0X4cDQXZY2dZZG9+h4oRH+i6EceQy96NYqOqbo4JFKcyik0SKtG+oYs1nR3uK63T0p8LIGhZL7l/SPG/rxiV246Lq58CjVIrXDvJwD5N7PGx910l89x237qlxNUwb9XHBj49IPF9T3tR948fDiQ8SuXt2CfCyelyvzkDOYSlU6w9IPYDG/Y0V0fowLl21Lr9LNCUHxut1xDTNnJ//D8iI1oefnQhWF5cl+Yl4I/oSODAZwesAbrg3Zp9XJb3KTH62KcgsiUjXpIWvf0cPJcrLAFWcrDMhwVKHTeWGZKfiJtmkd1qUnGGLa5BblRXPgIwxjRfziRaOaB2Qp1eCB6Yz8mNWBlLr+bAbUe4DrpXRM5a3xlQzEHbqXx45lv1juwepmqS+/BFapUsu/r9z8SdF3sqhcQbq6uJRZ8mpQzIldXsJkPGJMdzGrOnBUIxwI3cx92o4GvU60yfUjIbhfEIIqJZ5sxSR6vsPe7ykGLSNEmHg5sTYuzWUdfHugKZI/8yJBRoer2140fNl/z1lWN1jn4fnK3DRxJVvCpRgyM1ieH3YmNOmjBrMb5v2BI0fiONG7jqT5l0Bnf9rlttmhclCYL2i95eZ8Ug1ihNDqhvfBfogjSIRMGKjjNUaeTpFtnb7jcqMIDV8XQ+kq+sMTt
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 15:06:32.6293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2f9a5b-d86c-415b-36bf-08dc4e6f7d12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6509
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Mar 2024 15:06:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5495

T24gMjcgTWFyIDIwMjQsIGF0IDEzOjQyLCBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5h
cm8ub3JnPiB3cm90ZToNCj4+IENNYWtlIGNsYXNzIHNob3VsZCBiZSBkb2luZyB0aGlzLCByZW1v
dmUuDQo+IA0KPiBTYWRseSBSTU0gYnVpbGQgc2NyaXB0cyByZWFsbHkgZG9uJ3Qgd2FudCB0byBz
dXBwb3J0IGNvbXBpbGluZw0KPiB3aXRoIGFuIGV4dGVybmFsIENNYWtlIHRvb2xjaGFpbiBmaWxl
Og0KDQpKb3kuDQoNCk9uZSBkYXkgSSBuZWVkIHRvIHNpdCBkb3duIHdpdGggYSBDTWFrZSBleHBl
cnQgYW5kIGRlc2lnbiB0aGUgb25lIHRydWUgd2F5IGZvciBlZyBmaXJtd2FyZSB0byBidWlsZCB1
c2luZyByZWxhdGl2ZWx5IHN0YW5kYXJkaXNlZCB0b29sY2hhaW4gZmlsZXMuICBURi1NIGRvZXMg
dXNlIGl0cyBvd24gdG9vbGNoYWluIGZpbGVzIGJ1dCBtaXhlcyBiYXNpYyBsb2dpYyBsaWtlIOKA
nHdoZXJlIHRoZSBjb21waWxlciBpc+KAnSB3aXRoIGlubmF0ZSBURi1NIGtub3dsZWRnZSwgd2hp
Y2ggZG9lc27igJl0IGhlbHAuDQoNCk1heWJlIGluIHRoaXMgY2FzZSB0aGUgc29sdXRpb24gaXMg
dG8gbm90IGluaGVyaXQgY21ha2UgYW5kIHJlaW52ZW50IHRoZSB3aGVlbDogdGhlIGNsYXNzIHdp
bGwgYmUgZG9pbmcgYSBsb3Qgb2YgdGhpbmdzLCBidXQgbW9zdCBvZiB0aGVtIGFyZSBiZWluZyBp
Z25vcmVkLg0KDQpSb3Nz

