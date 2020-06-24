Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.47])
 by mx.groups.io with SMTP id smtpd.web12.1864.1593024736464538279
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 11:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yyR1Aj1D;
 spf=pass (domain: arm.com, ip: 40.107.20.47, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsxNotepht0CDfXIvU4j+ZqUnxY+d9vzu6MfoLRtZuM=;
 b=yyR1Aj1DlCgUjH/Z7dQoSJNM7RUnX9UPEYDfpAR84z+x01wuNrpJq9zwvzqfb8MM3ibPIcyQ4g6qb/LSJHLVdISc9tQIafLJiFq8ej04M91FxLTBwpwefx4j60HVkjWrP6X0sxcOnkBG/uAnQqh3lgWDxnlarQCnlbtRkJSos5g=
Received: from DB6PR0601CA0026.eurprd06.prod.outlook.com (2603:10a6:4:17::12)
 by AM6PR08MB4583.eurprd08.prod.outlook.com (2603:10a6:20b:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 24 Jun
 2020 18:52:13 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::8f) by DB6PR0601CA0026.outlook.office365.com
 (2603:10a6:4:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Wed, 24 Jun 2020 18:52:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 18:52:13 +0000
Received: ("Tessian outbound 839770a6d413:v59"); Wed, 24 Jun 2020 18:52:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e5ecf82e2a03802
X-CR-MTA-TID: 64aa7808
Received: from 94d0f1237068.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C5B4EEF4-EE38-42B4-897E-5545C6BC60E5.1;
	Wed, 24 Jun 2020 18:52:08 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 94d0f1237068.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 Jun 2020 18:52:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJzHLNwP8zrs/A+uIDlL92v28wcAngXcfdJM2ZMoWWWJgWtRSnDme9x/KWhN4DdCL9xVIm4mk61/0EHydLYxrNq0z9Nj85ftAJTKe1p2cAh4G31zw3UQsowJ7OVMDQ1vNe1gq6l+iIZ+NWuynPaRGlQER8IWoyf0EP3rl90GN0u6DEKa292APLIZwI6PiHQKSDaNwzxxCg02BMGC3VI94Bl8VhsjlGgTOKNaTEZKoK3z3NAFPh7Qsd/T2UtRJJcHTnAwYQuMqZlcPl1C7COs46HsGK3bss6J9VP5AD9P6aG43Ni0Sz7Gy498b3QPfsPF4dOtwO25cZOQZkzljFEIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsxNotepht0CDfXIvU4j+ZqUnxY+d9vzu6MfoLRtZuM=;
 b=eK1MHyJ9qsQSKu1nJH6ms3kCDFTDjFi/3UWlHzPJETh8nU5MdipsS/OnGFacUBliQRaTLhtUNpif+W0FLcIntiO6oHOtmWjx6wWze2/clM3d18SpGfrSZDf+nxJqpaC5lII5SwFk6+MwtnDrbGFN2Bc+j1nCdPcQy6IH+LU2/kubMvAR+kAyPt2PUL6UeqZEeP7muU7luBVobF/nOo5oQtBBgGTmntZlWMn9ZGQSHHL8g7nuYCOuvs66ih7eA4dlfLNlRM3ychEfdUzezJ3/HTJ3WC8oY6omBEI6MxhIW7ORyoOBRhwzZC3wNSxy7mFB+5sh3ZHUmAeAT0cYpnrHSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsxNotepht0CDfXIvU4j+ZqUnxY+d9vzu6MfoLRtZuM=;
 b=yyR1Aj1DlCgUjH/Z7dQoSJNM7RUnX9UPEYDfpAR84z+x01wuNrpJq9zwvzqfb8MM3ibPIcyQ4g6qb/LSJHLVdISc9tQIafLJiFq8ej04M91FxLTBwpwefx4j60HVkjWrP6X0sxcOnkBG/uAnQqh3lgWDxnlarQCnlbtRkJSos5g=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5130.eurprd08.prod.outlook.com (2603:10a6:10:e9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 24 Jun
 2020 18:52:05 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3131.020; Wed, 24 Jun 2020
 18:52:05 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>, "jdmason@kudzu.us" <jdmason@kudzu.us>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
Thread-Topic: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log
 level to INFO or WARN
Thread-Index: AQHWSJ/qB26ubep570y+Rgv13IMSF6jlyCuAgAJUbwCAAALucQ==
Date: Wed, 24 Jun 2020 18:52:05 +0000
Message-ID: 
 <DB8PR08MB49699B2CDA2A7AD1225E3A4FFA950@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: <20200622141735.4951-1-khasim.mohammed@arm.com>
 <31688.1592895943168936989@lists.yoctoproject.org>,<20200624184026.GC5282@kudzu.us>
In-Reply-To: <20200624184026.GC5282@kudzu.us>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 659d3149-3e16-43ef-9fe6-08d8186fb564
x-ms-traffictypediagnostic: DB8PR08MB5130:|AM6PR08MB4583:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4583695987F573D1F8C83512FA950@AM6PR08MB4583.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:10000;
x-forefront-prvs: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Fz6ygz1vtkR24LG55eue9t80y7lgL4t0ZcAzh7FJWzQTQy2n6nZ/NKBXep/SU9wAaBk2g/BQltsLQGa2eZUtA01gK6vNXrx24hRYRXgPnnb1TlsgqYeIylqLw4sufr/U9cy1Cqo/P+FC7Cc95Ai8Eh8DwE3vCuwEPtGCI19wRT8HXZzW4pcU4F21bJGa8YLjWB8qLBnrzN/CCy85BnrByoghE7OaA6Cl8aUTaMXICdTW8crrhFnzKESFcp7LPJKJ0iIF8/070M64slt1L/XWRWfKX4rTEDdV6XChKa7g5L6m2W/t1wKuA4yinriM4GlH5cLk27U0rQ+1JFIDBcH4WFh1NsHBIV2JlfTCjaFU+BruVo3cUXtMBS5vVqCYGaXk/G0bsm2X+hJJZOQmwQWNQw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(5660300002)(64756008)(66446008)(66556008)(86362001)(110136005)(8676002)(966005)(478600001)(76116006)(83380400001)(53546011)(9686003)(66476007)(33656002)(66946007)(52536014)(7696005)(316002)(8936002)(6506007)(55016002)(186003)(71200400001)(26005)(4326008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 kXysRV5I2XVUf6akMSawzKIsRPrIdUwpng/vwvzOlba+5h7LsL/q86KEM+ZmYyMmGVLTu3pPXzXAdrzAFIPldpvdKe4UFR636UCWknam595wbvh93hkQErkWC1ruS2cXMOCzVNjBHOyFgoeDpnweo/VqMSQV5jUuvE8O7zmBWB6s7VHPzuzbITLpJszvxIuId21UFuHE0qDInuYyYFwpefYqyIIJwvTDAwt0spIgc2QQtu/Rl0cZu/ztZQOr2Fh+HrvNJhib/if9uAgfqGlebs3VNCeD7GKXkyXlqhmJYCXx/1Hlg9YIhLNpqae2G0uksVTy91bEYYy5Ca8wIdU1rG5nuAxljwBpOVbiogV/JvnyEMQxAJfDOW1tl3ey/ZbQFwXqcf/K8YorhWhLcBjwJCQH7zzxxXSVngbOS6uP49urmFo/cOXyw5v9wN4IDtNLPcrxop9HzV1249t9ciD5aNxcMs7CtvVjFBJOPP5gxaxeuvaJ5o1u6sZyVBI8vmkC
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5130
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966005)(82310400002)(336012)(316002)(186003)(26005)(86362001)(356005)(82740400003)(81166007)(47076004)(52536014)(966005)(53546011)(8936002)(6506007)(8676002)(110136005)(7696005)(70586007)(2906002)(478600001)(83380400001)(70206006)(5660300002)(9686003)(33656002)(55016002)(4326008);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6c1f6a98-c473-4150-9062-08d8186fb0c7
X-Forefront-PRVS: 0444EB1997
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wAQgtrReeeLbsc572rUQvKJ0UqN7ml400iOy8Y3Q48aQl9Zic6S88Mp1taG26QOFz+P7OZMgjoNnRbn0gEllvT8NQJiqnG7DUq/uVdzbH/yWetR/PCrNJNc3JYA6pwqY1o1W+FmGUUU8zHiYMMo38QzoX9mDHo3pc27YaCLSaGDMDQPX883I4bmENLiU09ZCJX31pEbWYXcE0VMnPJleVJkvjKbez4arMN4IybXXGmh+tE676x7twhdh1LR9IbJN/X4ieZzPDPq0NGxPtS4rodZa4pmMxgnaIv6L4YjtQHyCQu62/ovqDTc0O9msktJ1z3Puvx6b9NMcLwR9swyBOlaC/RITxHQ7LmTColHNpgzevBUQGrcmdTjqVEmUNOXPiy80Yf7KjeD0HntwvH2rOZ1Y3K2NgDRSUDQELt9N/MSFfXhl+8D90INWU9lDo600Hhsd96dfmJbLWEon1g4odyugm4+RHsVyiV8mxk414Ek=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 18:52:13.6562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 659d3149-3e16-43ef-9fe6-08d8186fb564
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4583
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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

Can you please apply these three patches to dunfell branch as well ?

https://lists.yoctoproject.org/g/meta-arm/topic/patch_2_2/75039153?p=3D,,,2=
0,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039153
https://lists.yoctoproject.org/g/meta-arm/topic/patch_1_2_arm_scp_firmware/=
75039137?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039137
https://lists.yoctoproject.org/g/meta-arm/topic/patch_arm_fiptool/75039113?=
p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039113


Thanks

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
