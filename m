Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.61])
 by mx.groups.io with SMTP id smtpd.web10.18326.1597161691502369910
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Aug 2020 09:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wXlPlQp5;
 spf=pass (domain: arm.com, ip: 40.107.6.61, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LnO5UFHybEwhRgT8LFweqAB3DQTmP2LmU1uNmAxX6I=;
 b=wXlPlQp5lPzpApz0HeKvi9AbG+D0BGbR1Pajyx4sqyX17zVtP6g+A5NrDBXdKfUVOicBhzUVBw5QfxH1r6gKg6nA3P/UW/AoBqcI4S23S1TCDMYgzPcSZniOtHq8hZRLsGgxadV1wQ2nnMhfQbcY5xhU3EQgzjeglrmGhE5zQKc=
Received: from DB6PR0201CA0029.eurprd02.prod.outlook.com (2603:10a6:4:3f::39)
 by AM6PR08MB4965.eurprd08.prod.outlook.com (2603:10a6:20b:e5::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Tue, 11 Aug
 2020 16:01:28 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::3f) by DB6PR0201CA0029.outlook.office365.com
 (2603:10a6:4:3f::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Tue, 11 Aug 2020 16:01:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Tue, 11 Aug 2020 16:01:28 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Tue, 11 Aug 2020 16:01:28 +0000
X-CR-MTA-TID: 64aa7808
Received: from a0b1fd21ebb5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C3A44CB4-06F4-404F-AD59-D89AD77B988A.1;
	Tue, 11 Aug 2020 16:01:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a0b1fd21ebb5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Aug 2020 16:01:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqW9ELRIBd5Y5GoqdtyLuhI3BODCSdH5h+nXRAeGwILK5r1s+5iWUpDelgqCNGSmjOg4a1Ckd2cYsPec1mAGQD7Er2BIlkQ2DJi1muF1WkLDWZSFrTH0tFjx1XDfKhzMkBsG7YsBA+Kp2bPXmldZ92SWkQUSp+mY7+cBGC9EhtpqezwT/Lo9tYOuRfX0zKT7IVfMvbmjoKS+0LcfoKAbHmeIk9eTtRvdUfbiTlES1ROX3Kd5SWN+vuMOvr4qv1hjksEVL/vXpJsCuQFoSOQH4dKoWBXosd96T7pt0MZbpCzHOI6hTRlKHIN1M3Vpe2okUOis8g3VfZv+O7lYXyUgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LnO5UFHybEwhRgT8LFweqAB3DQTmP2LmU1uNmAxX6I=;
 b=Lb4G/R1FIQH61QqygdEIWSej5IS5pRS8jjNcP6QL1l0RGrOCgF1gf5pGolN0vfCU+rpnwFKXtv+2PRry8g85FYbUPLG+GXTG/RB6OpJdCmalQ8CxajjeSMe58ykTNb4qJM/vNMfSwOqL6RfYBgDmP1aou+7GNgihhU7OxrVrc3x+2+k5PgryIYwb/5oGsa3+xEI6etvwhhvNGiLwhBX99AVZTjs0JkSCEv7i64snCE0hqE1yRA+9B74A+KN+mNtbvMTjXPMrSSI7YklqHqjKh5v+XTOdp6GLa6g9MQXgQ3N87MrX2rfHuk4mC3S13FKZodqjz/E/DeocKtxoV8d73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LnO5UFHybEwhRgT8LFweqAB3DQTmP2LmU1uNmAxX6I=;
 b=wXlPlQp5lPzpApz0HeKvi9AbG+D0BGbR1Pajyx4sqyX17zVtP6g+A5NrDBXdKfUVOicBhzUVBw5QfxH1r6gKg6nA3P/UW/AoBqcI4S23S1TCDMYgzPcSZniOtHq8hZRLsGgxadV1wQ2nnMhfQbcY5xhU3EQgzjeglrmGhE5zQKc=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4230.eurprd08.prod.outlook.com (2603:10a6:20b:b3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Tue, 11 Aug
 2020 16:01:21 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 16:01:21 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "ross@burtonini.com" <ross@burtonini.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] gem5/linux: remove redundant CONFIG_DRM_ARM
Thread-Topic: [meta-arm] [PATCH] gem5/linux: remove redundant CONFIG_DRM_ARM
Thread-Index: AQHWb/fKTUfEKa1n1USKVootCEfvnKkzES5w
Date: Tue, 11 Aug 2020 16:01:21 +0000
Message-ID: 
 <AM6PR08MB3461E77E5A5C2221C50E140492450@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20200811155339.3234353-1-ross.burton@arm.com>
In-Reply-To: <20200811155339.3234353-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 9ea4b0d5-992e-4926-996d-ee7ac9a476d0.0
x-checkrecipientchecked: true
Authentication-Results-Original: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [78.105.98.91]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e98b0b8b-550e-4b94-ebc9-08d83e0fce8a
x-ms-traffictypediagnostic: AM6PR08MB4230:|AM6PR08MB4965:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB49654FFDA46238755CF23D4492450@AM6PR08MB4965.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:187;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zbJuuqZfcBFkgYkOL2tOpAmsXCQcFnpxkjv1GQtzs0ceUz+oE87Bqt7jid52GSAIFD/hXN/vUF4TpSIXyW+3RDFB59wBbd329jowPKleXbaTeYMObPd3m5D/v/AwK3qk4Vy7j1weVMGZuHUKnGPjPzXcjrF3NlZRIFSzwL2h7LObZ7y9W+kErB6vOToS/4Sd/WI9G2PthUWthfQJ+zuxxkx9TVJePjZGFBDFW6bBn9gYfcUoig5zMYCSPEMN+uV/s3EssCwwBnuG9GkGCaYnYhmgcZnnZS8j7xQCe0KKyWrbtAziNYS0UPeGxuy1gmv3IKQQKfIDHB1o+kbzzu7v3OHTgHpOCAGQOUubPFquLZTVZLAmiIpGs/kodY+ebzcxaXyQYxyRYP55fdnQkYKILA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(110136005)(66446008)(8936002)(83380400001)(186003)(316002)(66556008)(66476007)(76116006)(64756008)(71200400001)(8676002)(478600001)(66946007)(52536014)(86362001)(33656002)(7696005)(26005)(2906002)(5660300002)(55016002)(6506007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 YTtCxj768iEyslG2ptoksyunUmsuimLUeDXrD1tE6N7CBiXFcc2XIXyXAkRPJMy5dn0sx29G5G+XFqPMwXdAKMz39ySHloEAa6QvLvfrL37sU5PoTj75QCtDyj4E5sa5+Zoib88BCeKzO4cwV10ywMjr1E/Qp+yjfsLC7txY1SNGXCkFf8idG9C3uIW08jpl8DfjNaGOuVhDLYyDGzOfSJFXwEv4liqpDO9z0tfRG9BykNiaw3FIkz9iS2fJkeDLNOvwRr15DJG9fHzSTdiuFW+nVHnEV2QK94c7nGeUoHqZnq1WSWPvGV31GQ9RJtr2FuMfVCYtqcpHOeYON/FpX63dXZ21ggNCF8yFg3jjU8bqjK/DpbUV4ZxLeWGHprZ8MahA0RlM7ZPoQTAFhiXBoqwD0gzqsuWcUjatT7XiScvjmoHV1I2MyC3JhECPahGZWSWhv0HWKzz/fXpc/n3wNVpvwNgQD9bRUO1M2uXzwhXY0GKIleoB6TyjUDTvEGMc0eYMPM3o0Cy/LiVjvifg5/UA+/3d9gEbjuFMPWbhdkKmI4dJPbghejOTYrnCGXOewCLy3kq18E6Tal68SUEV2hvsJbZCFKuqdHi/lKiIFq0npWTR57YF+A6G2lpMR8AzKTlVtmUeQFNJZV1J9+0jJQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4230
Original-Authentication-Results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	73dd3ace-21ba-4ede-181b-08d83e0fcaa6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/MAPjG//wVG9W0CaDRdYfqpKG2DughSmz3q0cm5ZAdKS2cl1MmQSefXGlbp1wW+lBWzH65cbQRfZ9yq+ii9qsApCq0YRN4l2DOHQ0LO3qpD3eiXDwD+7t+ybTT+dMPx+bVn2IcEVux4BQQ44mdHBM4p9PgydBlRM86PUO07puOYaL1uk0fdSCRaCaHLqVLEYWn81iwu6q3R5f+YYwkALsAR4h+DFQ3qUegwv3pL7kIFo7O8swl4/pEOJfSKWllcNL8yLgO11BQJWCBu8bUBaPoTGcD+dcdWZHCWLkGLrYWhrnepwdMOsn8TuFxHbcOmtvDEhd+wtpn0H1ddGxxI3osGyTv1mm+sxqibEBvJPvfSZJ/rLbnbGPxVbN6nSu6OsrYozwf7cvsCdcFEPWOK0p+ZcQMr+Q/ht9YQK9J5wzRQSL2MQrpImiR4QFMz3gNb1HjwAZEIzHeOhmH4sQO7dBJRcwp+h2jMq6kMzr8yS1aU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966005)(316002)(5660300002)(55016002)(2906002)(478600001)(70206006)(9686003)(83380400001)(47076004)(70586007)(81166007)(356005)(82310400002)(52536014)(82740400003)(336012)(8676002)(7696005)(6506007)(186003)(86362001)(26005)(33656002)(8936002)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 16:01:28.3507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e98b0b8b-550e-4b94-ebc9-08d83e0fce8a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4965
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
>On Behalf Of Ross Burton via lists.yoctoproject.org
>Sent: 11 August 2020 16:54
>To: meta-arm@lists.yoctoproject.org
>Subject: [meta-arm] [PATCH] gem5/linux: remove redundant
>CONFIG_DRM_ARM
>
>From: Ross Burton <ross.burton@arm.com>
>
>This config option was made redundant in 5.1, so remove it.
>
>https://github.com/torvalds/linux/commit/37fc9bb022c654e261c5a7d2ce600c
>6ce26c022d
>
>Change-Id: I01aabec52ae71fc5cabe8a1589766b6b4c79b677
>Signed-off-by: Ross Burton <ross.burton@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

>---
> .../gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-drm.cfg  | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-
>platforms/gem5-arm64/gem5-arm64-drm.cfg b/meta-gem5/recipes-
>kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-
>drm.cfg
>index 7c97020..34b0141 100644
>--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-
>platforms/gem5-arm64/gem5-arm64-drm.cfg
>+++ b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-
>platforms/gem5-arm64/gem5-arm64-drm.cfg
>@@ -1,5 +1,4 @@
> CONFIG_DRM=3Dy
>-CONFIG_DRM_ARM=3Dy
> CONFIG_DRM_HDLCD=3Dy
> CONFIG_FB=3Dy
> CONFIG_FB_ARMCLCD=3Dy
>--
>2.26.2

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
