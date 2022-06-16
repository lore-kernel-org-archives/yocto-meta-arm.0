Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2909C43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 13:25:33 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.73])
 by mx.groups.io with SMTP id smtpd.web12.17883.1655385923883176730
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 06:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=4YjmYMXH;
 spf=pass (domain: arm.com, ip: 40.107.6.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bMg1QhEy9MxgY2yTNwZB0Ts0K27oETcKsIL9YeqKuHxS4RYkBcaPmiMOM/xUwufRwvKfe7Wj7s9/zmdtgnJTdRCxwLS7hFCQkNIxH54vpH4rItzWna6NQZ06/nYKgXeP5ca6S2meWSLJqLOPM4Oi/bCv1v7fyvLihvCCvTT572VFiiaDz33alyCEjmckydInpqZ+GM6ozHpGiBMQg7bNcLsq12D4Z8RKd3e65Yv0QQQSA1sE4doUMAMGY40SwkBo8Zf2raaJ+z3FkX81QrY5QmK3uylvnsMoqIJR/zlQuvjpIa5SLiV6XqBG0fXqw+SXiYXZxzfVmKZDbLSNBCN1bA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tn1Q80jxWYeO3syn4QoUDm/zBGe7DFrtTQSrSo1n+ac=;
 b=gasD/ltGsYzjrBohFM/S+g/HfnsiZcpd/mbUdIkVZoeGgeVaKfPLkZ4bX4eUy+UlUegb04vmrrRYbQ5mG0dZp8jGSpLMapk1EOr+RMY+1AaACZXXjI4HmbeCD6TVoT9t5zvv0Hy+IbaM/ZuX95ckMHc173gmsX986MvYWGiJ/nu9haCDYv+Xcd6uHVuTHZL6XDDsWsbAXHs0YuWA2Xb80KGioJXDle49zRrw1+oS6NQqquZ0vjx3a6rvrINspf98+BWKu0OWJoXQvdt8U3SR7sttFuOeT0VCZmhAbmlvDBAw5bzCvT2uTWG38WMFZWjymRZ4DEcVu7+Ad1MyUBc11g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tn1Q80jxWYeO3syn4QoUDm/zBGe7DFrtTQSrSo1n+ac=;
 b=4YjmYMXH1ZCxWbEV6+KKliDt53WkIrhO5PQ5FEAeRttzFj/ciQyhrYiUHc3JC/zBauSH0aSujznlQzwV+FkCvhkNkMAdJZqTzfJDYgJlmHhudSf079BMw9xQbavUAolHDH4MntsKTytyZWas/8Lkmm5Pmj53ACycSwedFbud0Uo=
Received: from AS8PR04CA0147.eurprd04.prod.outlook.com (2603:10a6:20b:127::32)
 by DB7PR08MB3497.eurprd08.prod.outlook.com (2603:10a6:10:48::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Thu, 16 Jun
 2022 13:25:20 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::87) by AS8PR04CA0147.outlook.office365.com
 (2603:10a6:20b:127::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Thu, 16 Jun 2022 13:25:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Thu, 16 Jun 2022 13:25:20 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Thu, 16 Jun 2022 13:25:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c8a3f9e453734ded
X-CR-MTA-TID: 64aa7808
Received: from 6c62ea6e7f5b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FB76921D-58AB-409D-A1BA-EC092475C6C0.1;
	Thu, 16 Jun 2022 13:25:13 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 6c62ea6e7f5b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Jun 2022 13:25:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXVi0UmUrqnlO+Aha3fWEYCt0Q9O8mH4pjbbHXi9jROfA82byGUl8pxHyYITEOHLa8STLmIGeqAEz7KMQLTUYRVO5eEnaBG2hf9NQMkRYeXQbY/XNZeN67vlp2iZqUth2qdnOVW1IHLNMf5sKa4NloaRszZX7P4Xxh7beIAVIRdvnl1houk4GRIEw0XVwjOgcX+42iMe1BRPS34i5kNARlr46XA8px1bV4Y3po34poSzs2ICK1E8r9fi2rquJMbzz7kxvPdcgRKkyyb6p8zlt/nH7I8GTR5GIWIxBmo2OKw6zwsUKbS0pwJxThm9BLI6ZL5NGhKXRxa2Obo74ZEwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tn1Q80jxWYeO3syn4QoUDm/zBGe7DFrtTQSrSo1n+ac=;
 b=eNClmPTnY5wGLeYcT6MJ7YXt8u3FyqgmrZskIxdaeghat7VCJqxId/tee+yU+RcAXLwpUhp5mOchKuAqNEqp6dj5lpjQ73FHAuKcOoIDYYmXkDar1KAXiOH6y0oZd8RdCMm/BOtOKdxSW7rSAhjj4XzZj0K9j9lb/AikKTzby4Wk7WKfHWSmPThDl57+TtgZzS0uYX46A5xefGZCS7w0EpapHpYOvIQtX77jfbXe3ZceAfaxR84iiQaZzXUwakkern4VbDH8f80KIdzfIabeVgNblvf6dwBiBiqUDJwZXYNTD6ai0+K0ocqNet3OOsmJWrOVaWK9hSW5CaKwGlA1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tn1Q80jxWYeO3syn4QoUDm/zBGe7DFrtTQSrSo1n+ac=;
 b=4YjmYMXH1ZCxWbEV6+KKliDt53WkIrhO5PQ5FEAeRttzFj/ciQyhrYiUHc3JC/zBauSH0aSujznlQzwV+FkCvhkNkMAdJZqTzfJDYgJlmHhudSf079BMw9xQbavUAolHDH4MntsKTytyZWas/8Lkmm5Pmj53ACycSwedFbud0Uo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6676.eurprd08.prod.outlook.com (2603:10a6:20b:2ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Thu, 16 Jun
 2022 13:25:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405%3]) with mapi id 15.20.5353.014; Thu, 16 Jun 2022
 13:25:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 3/3] arm-toolchain/external-arm-toolchain:
 remove pointless SUPPORTED file
Thread-Topic: [meta-arm] [PATCH 3/3] arm-toolchain/external-arm-toolchain:
 remove pointless SUPPORTED file
Thread-Index: AQHYgXOsig8jf5i500+KqWKfVc5v2q1SBhkA
Date: Thu, 16 Jun 2022 13:25:10 +0000
Message-ID: <1F2057B8-96BE-4608-B888-05894F284C72@arm.com>
References: <20220616112252.3326107-1-ross.burton@arm.com>
 <16F9160B98D7665E.15597@lists.yoctoproject.org>
In-Reply-To: <16F9160B98D7665E.15597@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7ec91ef4-8f85-48c7-a456-08da4f9ba937
x-ms-traffictypediagnostic: 
	AM9PR08MB6676:EE_|VE1EUR03FT038:EE_|DB7PR08MB3497:EE_
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3497FDD809EF077ECD7E11ABE8AC9@DB7PR08MB3497.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EHJ0u5PONIw9q4s3kAVN99DzqggTtXZaHmx/El5AVwomTmVgb9w4e0/oyBm/AErxVE65+MZ0EikfjRaTJOqsDlGEghJmEyEMVEF8EZ9tnGJbqVRODftItz2aWie+9tBqUJLMmIf6LFLuPvgohZPZ/ZS7RFQYHwiU0iS9QUj7ftLdI0xZ2xEA9mTzOnkaq78ZkfjCBeMiL2BhIZ0xTEMl8JEE9ACcSlcE/Yhy3kMlR4fQ0JdZ/oKPPRzKIr1HOr8lvEMwAOJNbi5V/xf043m/FDn92IBrCBhltvd+TSfGJSNv3wG5KXthYroDWVImvWb7ZsIlIX3ks7A+riEhtfT+i+s8Raib3Lc4Q7LqkE9g9yj1eHli6PaGDqhA2P+/KBvSEPbBhHwBH1QsidWsJWqtd0cfo5V6y2dbfEu9L9gZ7V7UoJA8bZFMxe2aadal+Zvl3ROziMIO9Uu4uBez2swYMc/5vbijHc5j15K0lQKLulIXN0CIe8yVppvx/0azgqS/Ye4xSFfBuXm8wWK1YUD8m6DoC3K1g61C86fradcx6jkcAoAK9Ow8128t8rGVC63f/RRfkZyIWLsVHsWX4tvSnv4mJK3fnUEVzhAkPWYFF0tkiK/DQuwFeIhvARSNpiyxCCrKbNRhgG6TSPCkNxTK+YxeXyuV8x3LLEf3TtrJnCJ53UX02P2v8mhcb4+wx0WczWxq7AzGBLDWInziWXsuaXq3TGkaW27kfGpeNf00QTqEk2OfIi2PPyhfO0rQOFevId9ASSD3Smj5aPp13Mg7uupQs6VxNobc1MYLaGn3L8SnXGdoMuhuKEdq4pMb5yfQ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66446008)(2906002)(6200100001)(66556008)(66476007)(6512007)(64756008)(8676002)(83380400001)(122000001)(86362001)(66946007)(54906003)(6506007)(76116006)(37006003)(71200400001)(4326008)(53546011)(38100700002)(26005)(5660300002)(91956017)(8936002)(6862004)(186003)(38070700005)(36756003)(508600001)(33656002)(316002)(6486002)(966005)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2FB21E5A7C260D47A4491B2005C7BC34@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6676
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d54d430b-a1b0-48cd-26e3-08da4f9ba38a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E2arsLazkyz5rRywQWpoxiTDoUjRUCqZHMOwpHAC4WnXWMGpNPzfOdoqKptfYtRerhHl8kZ7tcJ3jczg1scnOZwRtNP1y1gXArGSKqXE8KbDpBaN+5rsV5YzknNI4htgfk4roRctjxm8GBSKo14LTMZQWlr0zg9wTOiGt5TpYFLNtFgl/raggnzyse2WPFDY9JJRcFn/VcP8aHXtvQGmMweo5QM50dK8LqV077nZgT7bod/lXwLCDGyXLHW1dP4MZfaaB7lrQo97Wjq9uMmk+tsq/uzRW/A28dy+pboHb2Sflk/9WsJBktiWKhcr959Bgy7zSVCkqAl2hFCcT2vwm2EeYpO95JUPgMJuVduZU6+EhvtcJa+V1kwKX6lDtqkx/rsyFlSc8oSXauE7Zig9UlHvavZAEhQZ2/BymX/Vzc/lMhSrSnrusMQQf/f4mG2kMa0yL5T6b8KhJcd+FXqAgEOVM5ZD3NqSi/Ha21p9BNBB60OWNLq6Lb0L9h5C9dIbX1f3fpodzgQItRTBKnsdHXCUH45vsO9v7fWCagQz9l9KJTA67k6C8Tga6eQn7hhso+hIEOR6A3NIHvrprT5lizj0qMr9WPOP10lUK7fNsXX/Mp/wWzEfieVZ4KBodk40A7lsIBUjfgJvrZMHxrsbXfEus5GfLmt25MPi4nyDHSZqVhiEcmorpoeYlITo+J2KCYDAw9gICgJqMnE8IuBSjWQze/bya6PNIBqeWGkVKdHy4YwY6YcRZ0aTRGXjfJeo
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(36840700001)(40470700004)(81166007)(86362001)(33656002)(70586007)(2616005)(5660300002)(356005)(6512007)(6862004)(53546011)(6200100001)(6506007)(8936002)(508600001)(83380400001)(2906002)(6486002)(36860700001)(70206006)(82310400005)(4326008)(336012)(36756003)(26005)(316002)(54906003)(8676002)(47076005)(40460700003)(966005)(186003)(37006003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 13:25:20.2759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ec91ef4-8f85-48c7-a456-08da4f9ba937
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3497
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Jun 2022 13:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3511

Retracting this, it turns out it is needed.

Ross

> On 16 Jun 2022, at 12:22, Ross Burton via lists.yoctoproject.org <ross.bu=
rton=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> This file isn't used, so remove it.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> .../external-arm-toolchain/external-arm-toolchain.bb            | 2 --
> .../recipes-devtools/external-arm-toolchain/files/SUPPORTED     | 1 -
> 2 files changed, 3 deletions(-)
> delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolc=
hain/files/SUPPORTED
>=20
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm=
-toolchain/external-arm-toolchain.bb
> index dcc8ebf0..ae605aad 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
> @@ -55,8 +55,6 @@ PV =3D "${EAT_VER_MAIN}"
>=20
> BINV =3D "${EAT_VER_GCC}"
>=20
> -SRC_URI =3D "file://SUPPORTED"
> -
> do_install() {
> 	# Add stubs for files OE-core expects
> 	install -d ${S}/nscd/
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/f=
iles/SUPPORTED b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain=
/files/SUPPORTED
> deleted file mode 100644
> index 9615075e..00000000
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/files/SU=
PPORTED
> +++ /dev/null
> @@ -1 +0,0 @@
> -POSIX
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3509): https://lists.yoctoproject.org/g/meta-arm/mess=
age/3509
> Mute This Topic: https://lists.yoctoproject.org/mt/91796807/6875888
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross.burton=
@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


