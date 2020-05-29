Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.82])
 by mx.groups.io with SMTP id smtpd.web12.36974.1590765706599728250
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 May 2020 08:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gUIiSUD5;
 spf=pass (domain: arm.com, ip: 40.107.5.82, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/VxNo/gglgZ4QmbLMBfn3ypXmWNbvpIfKPw6RoS0tQ=;
 b=gUIiSUD5ubDk8apHmHG30SLyjxZyZ2bGqV8UejEChP3A/qf58KLK1YzFkyCpz4TEQwUwqszc15kw/OHtvzvC9Umvo+iU/IZqC8y77FgzG0at2c1NrZ4WbbmGfIWqDF/cec2peRNEX6KLtwHY16UmTvzYae1DsDgkvdV5LQiMjyw=
Received: from AM5PR0202CA0017.eurprd02.prod.outlook.com
 (2603:10a6:203:69::27) by DB6PR08MB2647.eurprd08.prod.outlook.com
 (2603:10a6:6:22::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Fri, 29 May
 2020 15:21:43 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::e8) by AM5PR0202CA0017.outlook.office365.com
 (2603:10a6:203:69::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Fri, 29 May 2020 15:21:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 29 May 2020 15:21:43 +0000
Received: ("Tessian outbound 952576a3272a:v57"); Fri, 29 May 2020 15:21:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 34070dd714cf70f4
X-CR-MTA-TID: 64aa7808
Received: from 779242f0eaf8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E0FBE1FD-BE67-449D-A109-155BFA0B67EF.1;
	Fri, 29 May 2020 15:21:38 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 779242f0eaf8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 29 May 2020 15:21:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMbnbAh2dwIU1aYhheAYXjsiKHAA7qUxVvhCGtNHTHrmncr6ca4AmekfW+on/5uoL7DM+CnuTtZ4w4S9slWJG9a2OwV28ZHs5BbSJhfHm4alFqsfh4Ye9OXMK66WvERt6X3WJj3pqtWouTCh0YOcf+LdlhU7bZJyi240G+bD9DnPQ5cqpa+dr8eOJLbJ/D2nErd0Hgcv5MAReZRYHEHHuAinzUIcBniEEVtfwbTZILLkmoPMxyzUgSIVXArZWf2Pm3AMbbOj7Z4M/7kCFo7drNvxocgXEQ7+/6C8TidqZPsLhGf7RYSS1Yr81bGOJ7hxDc4JGtWLf0W3iuo7JCWBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/VxNo/gglgZ4QmbLMBfn3ypXmWNbvpIfKPw6RoS0tQ=;
 b=k7h7crxeBsB0lXI3ls4LvZmdrsfQgzoVFqWx1AcOrX6jr0BRcaywP0UwFJ3EmOENqAjS2ppujyBkn/IFX6d3qDlvUbiQFDgIymJdJgUyJpYicX6uXtQp7dZ8EE68bYOHij/aBGL+bcUsJvfD9/EpwxfOd+ECcEV6XAWH2Vvct7hPk/fabWddDogBQrFEQLU1/8hh+dlGNnSPso+ted43AiKXX56qTSh10I+kc3AOaDyqMhiai+c7wfZSxuGBNXi7d4gJHxJDmuHPiVyTMkCS6KQUTK/5LIq54Blq2tc2Vs/aDsFQ2NekX8hmjdOWrvvMrrli7yQDEbmiVu8jUGivjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/VxNo/gglgZ4QmbLMBfn3ypXmWNbvpIfKPw6RoS0tQ=;
 b=gUIiSUD5ubDk8apHmHG30SLyjxZyZ2bGqV8UejEChP3A/qf58KLK1YzFkyCpz4TEQwUwqszc15kw/OHtvzvC9Umvo+iU/IZqC8y77FgzG0at2c1NrZ4WbbmGfIWqDF/cec2peRNEX6KLtwHY16UmTvzYae1DsDgkvdV5LQiMjyw=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3177.eurprd08.prod.outlook.com (2603:10a6:5:26::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Fri, 29 May
 2020 15:21:35 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 15:21:35 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Joshua Watt <JPEWhacker@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
Thread-Topic: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
Thread-Index: AQHWNcvskZ+QueGwKUSOkAT6GqB9t6i/LhQA
Date: Fri, 29 May 2020 15:21:35 +0000
Message-ID: <90DD68A5-0834-4C82-8A06-BC3972756CA3@arm.com>
References: <20200529151427.20272-1-JPEWhacker@gmail.com>
In-Reply-To: <20200529151427.20272-1-JPEWhacker@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bc612755-ad4a-4faa-fd25-08d803e3fe8d
x-ms-traffictypediagnostic: DB7PR08MB3177:|DB6PR08MB2647:
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB26475F393B5E07CACFDD313F9D8F0@DB6PR08MB2647.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:489;OLM:489;
x-forefront-prvs: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6qZQg4mgqt+F8iTM7Xzwva+ZA7DkK2MXfuvDGUBUsa4vtD3gljvZPQYAK0oVIRhrevoFi2tRdqo03FBGHCv8LKUV85W7WBh6PkAlsZ1z+Uxzz6bQVI0QAD4TMqhs1fEIFgRHzjskHTQQcNMeckw6WFmfASilCq65SMbWZ3iXdvKyIb/jRtL+2Jt+kaXPzG6ZNU0/+5j+zz7WY0CQa52gtIL9vPsK+iYJPtTZLx//VlCkkEySDgzCDl8F15CqmoLo1icHfb32UAGxw946twKxZNwQwbPRZc9IJGrf61R5dGaWoD8me2bkFxDt425Kn5LVFRG/wInUJnYF8B4iurShpKAYSQMJRzN2PDXRXMbr+zeuvgovhiIWFr0A1txX2w43msrkje4TvlY0KskeQ3RDtA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(6916009)(478600001)(8936002)(8676002)(53546011)(6506007)(86362001)(2616005)(966005)(186003)(2906002)(4326008)(316002)(5660300002)(54906003)(26005)(33656002)(66476007)(66446008)(83380400001)(66556008)(71200400001)(66946007)(6512007)(6486002)(64756008)(76116006)(36756003)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 R6nW4TW2phe2y2Iqpj2Hu1kJqiRzjybzn9Uga6KVYoAWPqN61BZWDaULmMBLH2iYOnIHRq7oru01pVxMx8NgzRyc/Adb7XKLJ+T8rXnM4mORN+NrhRgvb6vkbVjV5S7WgWHbB5xNNl6b9XoccRhN9e983o0062/apsmHStk8mlIyp9RdtWPbpXwpeJLkOGmgqXFjekmsaWmN0o1+e7PwXJinThwiohhNNPla5NELrwxXJpQRAomOBamizawKK3dETTUGo5pMRhunJ31w6KexI7K44D6Ff8kV7A1MLTSjbRAccCFn/VN2iWHLR5qdKhnRn90P2gxwMJoy3UDjPaFQxz63HBWJHpzhAFWJPKEKUjjEL3ydvZzTzmRSHQjTf7bySCbcxwrbaU99O+4XAbU530sYCBNFCYnqBClOxDlc8DulTWVDdW3CLMXqaXXXnCfptr1k9kaWm8nXJrsqxTjVqMbUx3glZoalNwGR+76+wO93msMxyptfT164ppOnWzNA
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3177
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966005)(86362001)(26005)(8676002)(70206006)(186003)(6506007)(53546011)(36756003)(47076004)(6512007)(82740400003)(2616005)(336012)(4326008)(2906002)(6862004)(8936002)(966005)(33656002)(82310400002)(356005)(478600001)(83380400001)(316002)(54906003)(81166007)(6486002)(36906005)(5660300002)(70586007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	31b66b35-a284-4ed8-9e7d-08d803e3f992
X-Forefront-PRVS: 04180B6720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oSE9th6p58nJ5095XFgpi+WfMpiO4qBq3pK4ln7by+ZvOSrgJj6aPuyFM20igvuG5+al+ytByL1J5Q3vMOOGm1oE0YVN5PxcITR4D07hpWyMtG6Gcf7Y/ddcZO+vfXsUHooipcXjCFhJO0qxv9rZCHB8gN+GRqgpqASt6Raiu2uvbcB6ENRGtpZmwFeK4OJEsoNuhRMad8lYm8wMqgdZGchanhtve9mgmMK321wq55uY7d0sV9XHqYHvkOBTEdM3Jid8ozvpTT5rS2QyUED48GTYrzndsRAcfTozzGJpT7L4YpXktnk82w0nslOHp1ue+R/gpDP3L2xkccTjGRfrXa++6XGlpGu/9TUfwzLm9WaL09APnQsLIM2x4Wr0YUcE2chla6+6gljbdCVLHjzroFnodvIoijTid5409SI98lCgKlAsqlQDfp/mtm/4TvU/R6YvokB732o4hgzVng0XxQsCc8d76LiL0Pymn9Iy8IY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 15:21:43.5439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc612755-ad4a-4faa-fd25-08d803e3fe8d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2647
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5CD8A10EFA087D4CB4A2153EE31BFCEE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 29 May 2020, at 16:14, Joshua Watt via lists.yoctoproject.org <JPEWha=
cker=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
> meta-arm/conf/layer.conf | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index d96e9f1..1c241d4 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm =3D "6"
>=20
> LAYERDEPENDS_meta-arm =3D " \
>     core \
> -    meta-python \
> "
> -LAYERSERIES_COMPAT_meta-arm =3D "warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-arm =3D "gatesgarth"

Could you explain why you want to remove dunfell compatibility ?

Bertrand

> --=20
> 2.17.1
>=20
>=20

