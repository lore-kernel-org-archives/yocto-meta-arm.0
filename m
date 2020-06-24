Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.63])
 by mx.groups.io with SMTP id smtpd.web10.2000.1593024922406877996
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 11:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yPBjO+MQ;
 spf=pass (domain: arm.com, ip: 40.107.4.63, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGtIoXCU6umiMWE4DHqAsiG28GVMG0h7nvHsXOlWrHM=;
 b=yPBjO+MQOhg+na0shlThHpWMjhNZc94HLzuvw/kCZAbJE5m+MxgtOgOD/cf6Jv9u2iv0Fp5CWYLrw4e+LYN89LwWeSPCDgVe/WmNYi0ctvktWRXI48bH6Cfp9CDSE0p1sB2Zr5Hs9LNo62UCTL/qWoOI0cGvMkfqIWK2kSwfsMw=
Received: from AM6PR0502CA0038.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::15) by DB6PR08MB2887.eurprd08.prod.outlook.com
 (2603:10a6:6:1f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 24 Jun
 2020 18:55:20 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::e7) by AM6PR0502CA0038.outlook.office365.com
 (2603:10a6:20b:56::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Wed, 24 Jun 2020 18:55:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 18:55:19 +0000
Received: ("Tessian outbound f44be76249db:v59"); Wed, 24 Jun 2020 18:55:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4dfc7a11f05656f
X-CR-MTA-TID: 64aa7808
Received: from e3f3d86c2942.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 300347E1-3EBA-47AC-8636-C5550DD7B365.1;
	Wed, 24 Jun 2020 18:55:14 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3f3d86c2942.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 Jun 2020 18:55:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/OGlvPNx86LN+5OcdILIQoJhqBJLaprrCvRTAbTXGWDqmzWwnTzwH8YP3GwYfztGk6rCw28scHCMUxWX5cgIiybOEtcT1JQp6N04LzI8dnrpb3W6rG8djp+d/FtXT/gawQBMC350tvcqRn3IP3LJ42rt51WA2NwQjNpIEntZDJOvyZIvHk6yrZpRtnuH1iUEKw8vGrCVoiotR7bN7Lf0Y0wbkCYoegwuXy8rMZEu29Q9xqtc8pK05cJD8Ud9HkodRUqWMLMRje3sysmt2f4CjRKjwfj0SwWyldBbiXDMAyUB/h8jLjfKDgc/OHbxV+VtEk3pU7fLZ6xZjE6b2dpyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGtIoXCU6umiMWE4DHqAsiG28GVMG0h7nvHsXOlWrHM=;
 b=fmToCpCzC5bBuAguURpSg4Rke5VonQaud74AnZfkj8ydUVbYue805tNbzBqKHJ56YHHCrZ07qVX7G8ytS1VXAduHH9qwMUZ/fn1KYiov6vYLWJmBYhUpnQwKiGDEeaO0QxTD/jO2v0ebshAKSdJrJtDjzsQlPEyLKFM4rKRxzsEIXheYxqDuHSag/FrkR3Udjjp7R6gqjimyizl1OFRVNlrdNqYdMCQ2XhR9uB5TRnDzXgj3Kw8eVQth6BIfqVMr4Cb08IIEWWYZ9amtDH+TnPPtOXncEsK1dpKHpyMJmZ19mRWGoDyul2whMYdSf2M6z1LSoStcz9mLd7lt8vkmZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGtIoXCU6umiMWE4DHqAsiG28GVMG0h7nvHsXOlWrHM=;
 b=yPBjO+MQOhg+na0shlThHpWMjhNZc94HLzuvw/kCZAbJE5m+MxgtOgOD/cf6Jv9u2iv0Fp5CWYLrw4e+LYN89LwWeSPCDgVe/WmNYi0ctvktWRXI48bH6Cfp9CDSE0p1sB2Zr5Hs9LNo62UCTL/qWoOI0cGvMkfqIWK2kSwfsMw=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5130.eurprd08.prod.outlook.com (2603:10a6:10:e9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 24 Jun
 2020 18:55:12 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3131.020; Wed, 24 Jun 2020
 18:55:12 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>, "jdmason@kudzu.us"
	<jdmason@kudzu.us>, Khasim Mohammed <Khasim.Mohammed@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
Thread-Topic: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log
 level to INFO or WARN
Thread-Index: AQHWSJ/qB26ubep570y+Rgv13IMSF6jlyCuAgAJUbwCAAALucYAAAPbT
Date: Wed, 24 Jun 2020 18:55:12 +0000
Message-ID: 
 <DB8PR08MB4969F9EC64FC3A6E4A0150B5FA950@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: <20200622141735.4951-1-khasim.mohammed@arm.com>
 <31688.1592895943168936989@lists.yoctoproject.org>,<20200624184026.GC5282@kudzu.us>,<161B8F8F11B0E6F1.591@lists.yoctoproject.org>
In-Reply-To: <161B8F8F11B0E6F1.591@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d8fd46e6-12aa-480a-564e-08d818702478
x-ms-traffictypediagnostic: DB8PR08MB5130:|DB6PR08MB2887:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB288733FD153D409DCCE42058FA950@DB6PR08MB2887.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 C4BUd1YeziIjg4ebeda1Zi2BOKng/MQcVtcQjyyfhnhCAIWnnwfcTQ5kKxZnLVMkHg913E9yOuX16m+wkAPdEOq5Clzl88kh43f6/8WfTbljoOMbLodKGCoC5WM3D/uTVJWpyZpXyjDFGT+dT5p/hKsfJDTMQZjkcZoxZVDe0gc3GzH4mDrMV8opH7QTqDlEJ55P5BoshqfazjUhbI0CLYHpEYbyOoWxYMjtHNTR6iUCYUUKHc8ymy4aBko5ysmZtc5owRbEQevUGr/flCKNkTPZ2/q5/Fdt5yWP9D7uVDvWhnQ+tCDtk7VK8WWp0WMeuiOjiOKMMPTcgKT+2auvW1I8X93QHaoFy7ItBMyYdx9FbrsD1cCgB3vG1lU+oHAzd64t5r17tZ7vhe5Zz1vh8g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(7696005)(52536014)(6506007)(55016002)(316002)(8936002)(53546011)(9686003)(66476007)(76116006)(83380400001)(33656002)(66946007)(4326008)(26005)(2906002)(186003)(71200400001)(66556008)(86362001)(110136005)(64756008)(66446008)(5660300002)(8676002)(478600001)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 YYA0DvcmV7YOBDWyRi5VSK5LSOAxUkOEKJUrtrPGzLdTJl0qC0tRugG2rgjsMKUF/XC8lnQeOLi9SrnOM+L+YXzXD+NF4QBxdTwo5TxSyPsJ3mbTRvHs89UctP/AVTdLkVrcZlqNDb4eRjiJE9foJKSOmaPkFS0cj2gnQLaValS0+DVfZEh0Bw8MKtAZuFiCZDzFsivg++CX3YuvX3nSwmNonqXsYHdhCfqDz1pvnRgxPsDzerRh+DBFLVXMxyasEh5jg3NQqnuwyxq3QmAwczWnXG/mDtRB6ZrcDDeFvyTgVHnoo/VumlBQTKUISNd/EX/s7ssn46bFhK2+ExH5Ogn7iDfpEV6le1uheAcoYw4EiWW/IJ54OoMQ/rL8qgaiDV77SUXQUrH70raPCLZVcjbSsPA22OPco2ZxiO9cbH7kYG/sUXuRkgKwfwsGWg5jg+wyD7a7gfJPoqIgeGPG+kaKhoJpfTpLbgv/TSbOEl1EMWX7uhJwZVBlWNVNuzYT
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5130
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966005)(82310400002)(7696005)(5660300002)(53546011)(966005)(9686003)(86362001)(36906005)(316002)(110136005)(47076004)(6506007)(82740400003)(52536014)(8676002)(8936002)(70586007)(4326008)(336012)(356005)(478600001)(70206006)(33656002)(26005)(55016002)(186003)(83380400001)(2906002)(81166007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6104db3a-87f6-4f6f-8031-08d818702042
X-Forefront-PRVS: 0444EB1997
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	trj9sKtXTQCWJCC0NN4ix6WGZk5675lcQFYozzFdydwCLKciQwK8FHIZFnpxODsEmZSaFQarcr2yH8T8mw9Sawgbk71iCDdghNcS6XvrrM1nVWiKV9xczp/SksxY+M+9EKmdqclG9mkUdWUQq55A2CjfeA+qWQHjmqLuPW8lMh+hdiBRX7Nc07Lst5Jo8KdoultVWG+DfA4tomdpxXld8AGtx8VmKHUyV92HApr2ul7vT5usQd68vFwX50zS8Gtw/NQ/XDfWZ6ISe6Nd76jpKbCMiirone6TtcqcIejzJ+5IXw/IavDYI+y0jnhhgvx+8FcQIwUV4oQY+WYjqQ9wZu3PUfjzsNeKePGNmgxgMFdP8Re1oSupibEe53os5DldX2iqzN6A4qXRJpJ2YerCP+Yt+a6QQzpQb8ieHAo9iuQLADVYxYkWLeuSlo9Iith7OOoPrPZ1ZXKg8/YIS0ZKL0m2kikCM99kKX6dhypmrTc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 18:55:19.9605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fd46e6-12aa-480a-564e-08d818702478
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2887
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

And before that

________________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Khasim Mohammed via lists.yoctoproject.org <khasim.mohammed=3Darm=
.com@lists.yoctoproject.org>
Sent: Thursday, June 25, 2020 12:22 AM
To: Diego Sueiro; jdmason@kudzu.us
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp lo=
g level to INFO or WARN

Hi Jon,

________________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Jon Mason via lists.yoctoproject.org <jdmason=3Dkudzu.us@lists.yo=
ctoproject.org>
Sent: Thursday, June 25, 2020 12:10 AM
To: Diego Sueiro
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp lo=
g level to INFO or WARN

On Tue, Jun 23, 2020 at 12:05:43AM -0700, Diego Sueiro wrote:
> On Mon, Jun 22, 2020 at 03:18 PM, Khasim Mohammed wrote:
>
> >
> > SCP code has been updated with new logging framework. The patch
> > is to allow setting of log level parameter to INFO or WARN.
> >
> > Change-Id: I20ec19a9aa1bdb7f59c067d2344c299c057a088b
> > Issue-Id: PLATFORMS-3134
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
>
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> Pulled into master.

> Can you please apply these three patches to dunfell branch as well ?

> https://lists.yoctoproject.org/g/meta-arm/topic/patch_2_2/75039153?p=3D,,=
,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039153
> https://lists.yoctoproject.org/g/meta-arm/topic/patch_1_2_arm_scp_firmwar=
e/75039137?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039137
> https://lists.yoctoproject.org/g/meta-arm/topic/patch_arm_fiptool/7503911=
3?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039113

Apply these to dunfell as well,

http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=3D4f8f8eae7f8=
9ae4f36e97d1ad417e889b926b5a4
http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=3D24cbd0e702a=
87537cf0d6b8482ab06cb60be0cc4
http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=3D47b276bc3da=
087ad402158b7e6e9fdd38ba1eb0a
http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=3D150fdcc8621=
008f9a0532c119df922266e5d89f9

Regards,
Khasim


> Thanks,
> Jon

>
> > ---
> >  meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc    | 2 ++
> >  meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb | 2 +-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > index 1873848..2db59d3 100644
> > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > @@ -6,6 +6,7 @@ SCP_BUILD_RELEASE   ?=3D "1"
> >  SCP_COMPILE_VERBOSE ?=3D "0"
> >  SCP_PLATFORM        ?=3D "invalid"
> >  SCP_COMPILER        ?=3D "arm-none-eabi"
> > +SCP_LOG_LEVEL       ?=3D "WARN"
> >
> >  DEPENDS +=3D "virtual/arm-none-eabi-gcc-native"
> >
> > @@ -39,6 +40,7 @@ EXTRA_OEMAKE =3D "${SCP_COMP_STR} \
> >                  BUILD_PATH=3D'${B}' \
> >                  PRODUCT=3D'${SCP_PLATFORM}' \
> >                  MODE=3D'${SCP_BUILD_STR}' \
> > +                LOG_LEVEL=3D'${SCP_LOG_LEVEL}' \
> >                  CC=3D'${SCP_COMPILER}-gcc' \
> >                  AR=3D'${SCP_COMPILER}-ar' \
> >                  SIZE=3D'${SCP_COMPILER}-size' \
> > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > index 5ff5859..9cb8b64 100644
> > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > @@ -13,7 +13,7 @@ SRC_URI =3D "\
> >
> > git://github.com/ARM-software/CMSIS_5.git;protocol=3Dhttps;name=3Dcmsis=
;destsuffix=3Dsrc/cmsis;lfs=3D0;nobranch=3D1
> > \
> >  "
> >
> > -SRCREV_scp    =3D "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
> > +SRCREV_scp    =3D "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
> >  SRCREV_cmsis  =3D "refs/tags/5.2.0"
> >  SRCREV_FORMAT =3D "scp_cmsis"
> >
> > --
> > 2.17.1
> >
> >

>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
