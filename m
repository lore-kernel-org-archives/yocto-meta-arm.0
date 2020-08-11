Received: from FRA01-PR2-obe.outbound.protection.outlook.com (FRA01-PR2-obe.outbound.protection.outlook.com [40.107.12.78])
 by mx.groups.io with SMTP id smtpd.web10.18340.1597161731779089356
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Aug 2020 09:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Iss3PIUC;
 spf=pass (domain: arm.com, ip: 40.107.12.78, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr9mPQ/rsFhQEEGkO73Gvu2GvjtQMQmnPP3zM0u2UjE=;
 b=Iss3PIUC7YYGhRvcV3ucs5c3/aiU8MUa2i9CcrqF1Z+lnLLzmwANK3V69UMweAF5UQiGITUIwdiU9Ss2Jcze9u7XdMLdRXpamnGzaeJmgB6DDiihLNrffYM+Ogc7CbHjZVUfXLJ6QK5dacgjdEDhBxs7qocev1ItsXdA1wlf3QM=
Received: from AM5PR1001CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::35)
 by PR2PR08MB4780.eurprd08.prod.outlook.com (2603:10a6:101:1a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Tue, 11 Aug
 2020 16:02:08 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::ae) by AM5PR1001CA0022.outlook.office365.com
 (2603:10a6:206:2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Tue, 11 Aug 2020 16:02:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Tue, 11 Aug 2020 16:02:08 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Tue, 11 Aug 2020 16:02:08 +0000
X-CR-MTA-TID: 64aa7808
Received: from 020e0378c677.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0E269D45-5D9C-4295-9A2C-C639A1140719.1;
	Tue, 11 Aug 2020 16:02:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 020e0378c677.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Aug 2020 16:02:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvVjArwqNVly15L0TJ4bsrmB8dUXggK6kB4V27F/IApbGcL+XPnTPZ9aaENerQdhcnoP/2WCKiLwvVds0xhh4eEUzccWtd393Vdu01J/eaMtm/xLhpaFEw9x4sksLP0oOnD4bnJqPswhgzhnfZPIVNIJnkgMIZ7nIhpNnTcoZYoG1dsVaqcoWWafHlalCGfulWxZyJEik1Aa2Nq+/+fgcDlMFsQtoCvbotW7yfOxvQSxghhLcif3zYopsruB42yIsfo2NfW2doX8AnWPumm/cOkAQaE6Em4DtwxOtuFgjdJPdgMl77xoPzUz0S5So4JxElUx9bsdNutUPtgnEUBSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr9mPQ/rsFhQEEGkO73Gvu2GvjtQMQmnPP3zM0u2UjE=;
 b=ZXv+t9NPq5ZiKpB3c0S6zzxTfR1NnU/YSioepg8nX9kQ9D2LWZiWtpFe2iSpp+xh6cnOx17UwWBIkM53A/M3UwflyuQcCJUQulRH4SKc0bKZX7BPBrWBMsbTUwxLCBLRM95QP3P2XeoubVw0+jTHvtOr4S5UbrgIXLD5d6LQmq/xtpcFKEXz/xdL/gHIx9JibLt6XVe/eEietYJaFm8fauCCezfoVrBq9IjfpsuHkBt5IxqrAH09w0CgiW/SrKZ8MxX2t5qv/l4hI5u89OFcYmgZOLt85pKu6HbemOm/UmQszxaMkSLBof0S5FfThZif6DaX6CWTsyeCjHbu6DyMqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr9mPQ/rsFhQEEGkO73Gvu2GvjtQMQmnPP3zM0u2UjE=;
 b=Iss3PIUC7YYGhRvcV3ucs5c3/aiU8MUa2i9CcrqF1Z+lnLLzmwANK3V69UMweAF5UQiGITUIwdiU9Ss2Jcze9u7XdMLdRXpamnGzaeJmgB6DDiihLNrffYM+Ogc7CbHjZVUfXLJ6QK5dacgjdEDhBxs7qocev1ItsXdA1wlf3QM=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4230.eurprd08.prod.outlook.com (2603:10a6:20b:b3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Tue, 11 Aug
 2020 16:02:01 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 16:02:01 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "ross@burtonini.com" <ross@burtonini.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH][dunfell] arm-bsp/linux: remove redundant CONFIG_DRM_ARM
Thread-Topic: [meta-arm] [PATCH][dunfell] arm-bsp/linux: remove redundant
 CONFIG_DRM_ARM
Thread-Index: AQHWb/fYfdHzY2kAG0uAuu/qgB9cYqkzEWRQ
Date: Tue, 11 Aug 2020 16:02:01 +0000
Message-ID: 
 <AM6PR08MB346101A2C8784B1D54D207D692450@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20200811155354.3234412-1-ross.burton@arm.com>
In-Reply-To: <20200811155354.3234412-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: ca8f6456-54e6-4ffa-b550-cb77c6d8c6ed.0
x-checkrecipientchecked: true
Authentication-Results-Original: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [78.105.98.91]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0bfe1f97-3ec2-4c39-024c-08d83e0fe653
x-ms-traffictypediagnostic: AM6PR08MB4230:|PR2PR08MB4780:
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB47801BB6D33C1D714172E0DF92450@PR2PR08MB4780.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:187;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RwMeca3sL0JYgNtl7XXek6hpeTUaKeinGu3f/xqvHFFJu6sLJioRKKfovr62Sil/Gbyhp1WsWw+I5iRhIHtUzzA0ZD1CfHL4nM/gQ0NxX84QkoFQrzrD52RNypqWuJ8GdX1UTg1hq+QS+m9s4wPiO+bVBxxC/TZ7r4vDFTSvMadW1vrQjp+XlQ0BRlPjPyCKh/q7+AJtHJrUptygPCJDdI1s/tQzzeHD1TvrLDBiG+/RouSb72BTYW+WdlVZl+baFGd6zTnymU9xg498hgHjwdywBcHsDFDZxEypox/RGCLJQeLKSoLDQadzGyoH48KP/V8xLZ7liYUsrUhTTD42GIZpj+cQP0S+/6h8gSH14Ws++AOOuAZwgIZVHW7iCjfe7sK5XQEyT+Q7pmn6+cIfZg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(110136005)(66446008)(8936002)(83380400001)(186003)(316002)(66556008)(66476007)(76116006)(64756008)(71200400001)(8676002)(478600001)(66946007)(52536014)(86362001)(33656002)(7696005)(26005)(2906002)(5660300002)(55016002)(6506007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 MiWYeypJ4z3vYDf7wKvWIxDqu9RZ17g2BDJoWh/fc/2FmDTScs/Hg0wQR8m+RUokaXZcPWNW23UoxXm0ejrLGLPa9ROgC9igWofZbgd6N+a78ov8D2Mj85AKtEOcQOK2QHp7TcLS+RUDhbZRNv45q2h3I2zi3fqMAXmqzMu1YA/fBTDhpaeAf5ucE6TI4nW/7FF7558UWvSXGJYeqIo7J6sxJBk7LgYByK19yXzw7PSeDMfrY7bHjrCiXR/dk8fZY+KpB2Iwk2wm3ezx1ZNORoZ8PgrjWx1x5YVpsRazYJibMNHxB3aarGSjrWqGNofkanVBC5AwxiD4ngUiNwdHeWBMdp4e41RO1DYk/W9oFVYV6NCaVlZGt15VmwTL3KxEDFXXy3mp7MNr+zEoXVYyfJIhx+uWPUBL0Nrlm+wzM7TPeEivoHJaYPYOuifaTr/WbxVat7885bx7zhI8hpyI4LB2sbZ+tlLhDDyB99YBM6WmG+O4cEm/hn72Lng2HjQ8ptk1XmSBOoC6BGD03TlJdDbKbCDrRD8Ywf/Ps7LNbwWkpFw00I33k2PGynof2j6ZSzRKNps5S35GPalWDeXNrQyBVJyOCBeCUtRTlYsmHu/vwLpB7OS82NgWNraXLfbaRcMtmpUcG6KwRMiSb15WRQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4230
Original-Authentication-Results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	368167fd-0139-45ac-e8e6-08d83e0fe222
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cMouMUMVZJgRyuZycMBlPWIqlqV7yDfL245ZeT/rUVJqvnx9QyBl8FKCGvwsm5yaiHRSB32BL6zC6QiXeoauYqWfnaZVTeq61oBQq3hTBE9TMbSCwToBTrQBcDig6AbWy3J7QdhvPqLZdIVADsI5QsKGVr6gvuJhgnSE/lZHisE/3OhKQbnUklaqbF6XKKDNqQBHoKv2okuskc57gWzJUXaHPaxn5A0dWni2xyEKo8OiCPY0jzIoH31Mod9fRW/QWBizXjqC0Lhj4RmQvQD9Rue0a600gSJiWmtnpVQ+TqJGaZLMn1sFDwU3lgij+YmdiDIFZKgTgiKBQ5bIMtFWLhOJUaCOzH3c8GAy46v1eTe/IPyt5PBi5p6B6zjhCVSShqjC789PtgKjfauRRYUaB5vg94HjJ6CiXtzE0tlEu4gnHhMPnNny56IwOZHf0rNnuQhUp1bOWc9T6AvijcJUoBEIam3i5LKKVXqR4dmRCX0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(47076004)(82740400003)(5660300002)(186003)(478600001)(86362001)(52536014)(83380400001)(55016002)(36906005)(110136005)(9686003)(8676002)(2906002)(356005)(316002)(82310400002)(70586007)(8936002)(70206006)(33656002)(6506007)(336012)(7696005)(26005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 16:02:08.2012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfe1f97-3ec2-4c39-024c-08d83e0fe653
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4780
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
>On Behalf Of Ross Burton via lists.yoctoproject.org
>Sent: 11 August 2020 16:54
>To: meta-arm@lists.yoctoproject.org
>Subject: [meta-arm] [PATCH][dunfell] arm-bsp/linux: remove redundant
>CONFIG_DRM_ARM
>
>From: Ross Burton <ross.burton@arm.com>
>
>This config option was made redundant in 5.1, so remove it.
>
>https://github.com/torvalds/linux/commit/37fc9bb022c654e261c5a7d2ce600c
>6ce26c022d
>
>Change-Id: I12dd59e5405936aac2733354f4ff1e214571130d
>Signed-off-by: Ross Burton <ross.burton@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

>---
> .../bsp/arm-platforms/gem5-arm64/gem5-arm64-drm.cfg              | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm=
-
>platforms/gem5-arm64/gem5-arm64-drm.cfg b/meta-arm-bsp/recipes-
>kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-
>arm64-drm.cfg
>index 7c97020..34b0141 100644
>--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-
>platforms/gem5-arm64/gem5-arm64-drm.cfg
>+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-
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
