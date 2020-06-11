Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web12.3399.1591865948846163828
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 01:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gTihUHeq;
 spf=pass (domain: arm.com, ip: 40.107.20.61, mailfrom: rui.silva@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEiX/dpR93l0nm4SF6oseUnPGP+Um37gZerf35B3iCU=;
 b=gTihUHeqZGjltXnVrOI2VQV0mXBMwsugg0WIglP1HdnMz2b+eDXRwkyJlnoG0o2XYY9tLIqcCte2fRwgQcRszkXkOd+mEBUutpMYQAhX2UgQmuiEGjhzR41SLCVFSs4JuX5uYktO8Iv/dQvC1tdpqf8tF0llwuLhjw0xGsfb0Ag=
Received: from DB7PR02CA0034.eurprd02.prod.outlook.com (2603:10a6:10:52::47)
 by DB7SPR01MB5.eurprd08.prod.outlook.com (2603:10a6:5:12::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.21; Thu, 11 Jun 2020 08:59:06 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::f7) by DB7PR02CA0034.outlook.office365.com
 (2603:10a6:10:52::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Thu, 11 Jun 2020 08:59:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 08:59:06 +0000
Received: ("Tessian outbound 39cdd740f5cb:v59"); Thu, 11 Jun 2020 08:59:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: efc42a3c4f8781b5
X-CR-MTA-TID: 64aa7808
Received: from 6c28878016a3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AC0DCD59-3451-45E8-8A55-739B1F5B5A29.1;
	Thu, 11 Jun 2020 08:59:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c28878016a3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Jun 2020 08:59:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRLzrHzQG+yMQikkRY/FIRLOi3AB4qUKw63qbLzwSerAzX92ZNrMBKMqcSN83od1VMNvOr575WhoDunDrCascKByl7lpgZj5IUUQVJhaUSoQWec+PtR8FAhfmCe5dDIE6fAkn0R3+CDRR6trEP0JR2sKaEK+/FCl5GrodcsSmBl6k5F0JosBtQG09v/qmi2NbuJeUc4k/rzEFPWx8F59t9CHOO+wu/qFGop4gW74mTtgrELwzDWumVSNLLP0jGkgudOepnlcN2wZEfnf1aejinxEkBdq9lBrMHBABI8RSR/7N09pZ9geebFOJWxL1FRGloT4hfViTs7yUrl/4hT35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEiX/dpR93l0nm4SF6oseUnPGP+Um37gZerf35B3iCU=;
 b=k8Pjvl5MZjOD9Hosd5JnaTtncg7gGBcCA+MZOqAd5BdNspRSXc0rG7pzkljTKFSIfKhDkSBdIXtYIKADrN94TfGapzOisG7qs3zeij6c3v8aufavXj0EQwECmT+yjkTVRlyLI6v5+CJbqKz4A0yVnlijrnojqb2avRfKBdIzeVcEbPFHylw3deEZlDm69SzQN/lHkI2jMjsR6NmcFW2z62v9g/Oh/B+BAYTfkvugC/rHaFp4fy79WzxJJUDxlKVA/XnNWgN+0Q/KJ/Lo1bBCj65p90oAKfVyH5YtDanwC3x+TmFFYcvDZuZsgl/kTpR8Dh0tjZ9q8ev6Qpcv7KGf7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEiX/dpR93l0nm4SF6oseUnPGP+Um37gZerf35B3iCU=;
 b=gTihUHeqZGjltXnVrOI2VQV0mXBMwsugg0WIglP1HdnMz2b+eDXRwkyJlnoG0o2XYY9tLIqcCte2fRwgQcRszkXkOd+mEBUutpMYQAhX2UgQmuiEGjhzR41SLCVFSs4JuX5uYktO8Iv/dQvC1tdpqf8tF0llwuLhjw0xGsfb0Ag=
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB4578.eurprd08.prod.outlook.com (2603:10a6:208:100::21)
 by AM0PR08MB5044.eurprd08.prod.outlook.com (2603:10a6:208:156::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23; Thu, 11 Jun
 2020 08:58:56 +0000
Received: from AM0PR08MB4578.eurprd08.prod.outlook.com
 ([fe80::18f:639d:1723:4968]) by AM0PR08MB4578.eurprd08.prod.outlook.com
 ([fe80::18f:639d:1723:4968%7]) with mapi id 15.20.3088.022; Thu, 11 Jun 2020
 08:58:56 +0000
Date: Thu, 11 Jun 2020 09:58:53 +0100
From: "Rui Miguel Silva" <rui.silva@arm.com>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: u-boot: rebase a5ds patches
Message-ID: <20200611085853.4ybea76c3txlh3n3@arch-thunder.localdomain>
References: <20200609132711.68599-1-rui.silva@arm.com>
 <20200610204016.GA25448@kudzu.us>
In-Reply-To: <20200610204016.GA25448@kudzu.us>
X-ClientProxiedBy: MR2P264CA0005.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::17) To AM0PR08MB4578.eurprd08.prod.outlook.com
 (2603:10a6:208:100::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from arch-thunder.localdomain (109.49.46.234) by MR2P264CA0005.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 08:58:56 +0000
X-Originating-IP: [109.49.46.234]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 288835b8-6926-4401-a39d-08d80de5b231
X-MS-TrafficTypeDiagnostic: AM0PR08MB5044:|DB7SPR01MB5:
X-Microsoft-Antispam-PRVS: 
	<DB7SPR01MB51E53DC99519112D0872BEA800@DB7SPR01MB5.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZWlGviupv8bkSv1jZfSll0Xy1lzvlHoY1cQ2vitcZss1qCnxa+hD2f6mBblTh3yXCJxhI4gRvJBpNZ5yUvxIqi/eJwVoxs/mTuUDr/wiXpNkNxBw1I9mEdJ+dgo6MBCGsGcQHLLx3ztW1kv8BfLZ8BrE5Na2bytumFf70d6ipwkiilu2yEIY8CqYg2u5Ja98iAH42LYlixY51QuRD623ZCQs/3teHCZDQHw4+YbqHf9diB2+9DlddmqJb9bQLuAxzHFJdNcwNpFEPnuQXxeT2l+G7A7l3zXrEWgTTsY8ZPsIvimzluSYk/U8HQQF0LXevM8fAlI2BwJFh0Xo5DbR6bGRwprYZNASpPQeCgYmuTyJXno7Pt1dvxZymXdtJuZoDgAKgWvMj94GfA2DT122RKO9dhHv7ou3Spb1hG1rFa8uYu8dawovOI++kFQ/V1of4EPAkNAmmHlh32wzZLlxLprFnbWJG0ZKarQ7+d9CK3c=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4578.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(8676002)(2906002)(8936002)(6666004)(83380400001)(5660300002)(86362001)(1076003)(956004)(55016002)(6916009)(316002)(66946007)(66476007)(4326008)(66556008)(26005)(966005)(186003)(478600001)(16526019)(7696005)(52116002)(9686003)(6506007)(42413003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 gaax2pJVvPVUVHDbCUomSjYR2rGFKG0PmoEJ0fxsdwDYknNXFwmUBW9v0pYkpLRY3Ao08lwtNO/xFOqS8r7pwvIl2GHPZhwbXSW+02d9vGGqfMJ36S/+V1VqiNZ+qlrp6NRiFvUhdAa9MYsrjy109R19wIKDcPZZML2fHn7L6T+bxEPvg/GbyqJ4OyzsKuv5yPnyvHVtDkEqx2vFsMPdgfRQ9O8U78aRiPdf/vhsoOt1/RDoroX0JNDyerWlees2Zr5AFFdGUaoMNCU9bVLgZl+q1oEGd6DmKrtuY72000f647aFGIqNESh4MxFVE3tuAPD+QI9OQAVPHovm2Ea5gGG/LARfUg0zrlYb2NdsGk30jqGYv2rNqM8ks0vjd2C6XO6VNqF58uLGNhPoUzgycws5czGFJECI8FgokWCaDZ60oPO19h2JaCgFr7LwrJzXvEimaMZAn4IJegLrEouh5bmF8FprZoi9q/+gHwn3LIE=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5044
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Rui.Silva@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966005)(82310400002)(83380400001)(81166007)(55016002)(356005)(8676002)(9686003)(5660300002)(8936002)(1076003)(6862004)(4326008)(336012)(186003)(6666004)(2906002)(316002)(70206006)(956004)(966005)(16526019)(86362001)(47076004)(26005)(70586007)(82740400003)(7696005)(6506007)(478600001)(42413003)(32563001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b331ccb8-efa6-4926-682a-08d80de5ac57
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WdHpgGkba/J+ERmt2OyLYvoBoBO0DRTiglk+ed+3zcKr6Y+34m+xKut4JZ76DCOsMTwt0pxO+uV8jnAGjrR/QQ8moWJ8cDa6ytUUtfFlVu//Q4wExr4yEzxhhJWfl61fpcDLSKra9VnaYHq8C/9Kv+69rDS0pHh18uzaa6hd+C/oyFTeED8PZKqiCsDyQPSr25dj5aZSYWIObjN/1PeV8UhWGYer+adAKBno7g3u4aTxSc/JW8SM9/zY2hCa1XFUMTVNK2fgedQVyOCEj0pScJy3X3YVO3PzQyQ4tyTxy+VvinfcDrF5/NI17/z3AmnTzl5PrrTgxkBmKqshTLqA52x91MI9f7nUJQDsOyx7aG4rxr/1z5Xc49kQJ8Epf+U6B4ypYDY8gQXkuC7LeS7MK+NNo5KKBCvOIvKm1aRXDjiwHMD24U3lIyJdSkmLmIXPP54f8MJOYsTBF+xNmhhcMZNScckx74SAs5MwVhyzUf3Qat8qUWU1E2+QwXG43rIhx6y2o262IFuWiHZMtZNqcA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 08:59:06.1104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 288835b8-6926-4401-a39d-08d80de5b231
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7SPR01MB5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jon,
On Wed, Jun 10, 2020 at 04:40:17PM -0400, Jon Mason wrote:
> On Tue, Jun 09, 2020 at 02:27:11PM +0100, Rui Miguel Silva wrote:
> > Rebase a5ds u-boot patches so, they apply clean in top of
> > latest u-boot.
> >
> > Change-Id: I12e596ef8460429b540777e2a8646ed64f81fbac
> > Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
> > ---
> >
> > Jon, when ok, please apply this also to dunfell branch.
> > Thanks.
>
> Pulled into master.  Are these needed for dunfell, as it has the older
> version of u-boot?

Yeah, you are right, this are for master only.

------
Cheers,
     Rui
>
> Thanks,
> Jon
>
> >
> >  .../a5ds/0001-armv7-add-mmio-timer.patch      | 18 ++++----
> >  ...-arm-add-designstart-cortex-a5-board.patch | 42 +++++++++---------=
-
> >  2 files changed, 30 insertions(+), 30 deletions(-)
> >
> > diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add=
-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-a=
dd-mmio-timer.patch
> > index fbf8a14fdf59..9dfb3094220c 100644
> > --- a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-t=
imer.patch
> > +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-t=
imer.patch
> > @@ -1,7 +1,7 @@
> > -From 8525c72c438b0aa66f1f38db37bd7aacf7e3ce34 Mon Sep 17 00:00:00 200=
1
> > +From 864749afaf9b3f71ddaa519f4a770ce43e206912 Mon Sep 17 00:00:00 200=
1
> >  From: Rui Miguel Silva <rui.silva@linaro.org>
> >  Date: Wed, 18 Dec 2019 21:52:34 +0000
> > -Subject: [PATCH 1/2] armv7: add mmio timer
> > +Subject: [PATCH 1/3] armv7: add mmio timer
> >
> >  This timer can be used by u-boot when arch-timer is not available in
> >  core, for example, Cortex-A5.
> > @@ -18,17 +18,17 @@ diff --git a/arch/arm/cpu/armv7/Makefile b/arch/ar=
m/cpu/armv7/Makefile
> >  index 8c955d0d5284..82af9c031277 100644
> >  --- a/arch/arm/cpu/armv7/Makefile
> >  +++ b/arch/arm/cpu/armv7/Makefile
> > -@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     +=3D psci.o psci-commo=
n.o
> > +@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     +=3D psci.o psci-commo=
n.o
> >   obj-$(CONFIG_IPROC) +=3D iproc-common/
> >   obj-$(CONFIG_KONA) +=3D kona-common/
> >   obj-$(CONFIG_SYS_ARCH_TIMER) +=3D arch_timer.o
> >  +obj-$(CONFIG_SYS_MMIO_TIMER) +=3D mmio_timer.o
> > -
> > +
> >   ifneq (,$(filter s5pc1xx exynos,$(SOC)))
> >   obj-y +=3D s5p-common/
> >  diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmi=
o_timer.c
> >  new file mode 100644
> > -index 000000000000..1b905db8bb19
> > +index 000000000000..5d6f66172398
> >  --- /dev/null
> >  +++ b/arch/arm/cpu/armv7/mmio_timer.c
> >  @@ -0,0 +1,56 @@
> > @@ -89,10 +89,10 @@ index 000000000000..1b905db8bb19
> >  +      return gd->arch.timer_rate_hz;
> >  +}
> >  diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.=
txt
> > -index cf1808e051c8..8624714ae7a6 100644
> > +index 6908431d03cf..186001ecfb8c 100644
> >  --- a/scripts/config_whitelist.txt
> >  +++ b/scripts/config_whitelist.txt
> > -@@ -3138,6 +3138,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
> > +@@ -3108,6 +3108,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
> >   CONFIG_SYS_MMC_U_BOOT_OFFS
> >   CONFIG_SYS_MMC_U_BOOT_SIZE
> >   CONFIG_SYS_MMC_U_BOOT_START
> > @@ -100,6 +100,6 @@ index cf1808e051c8..8624714ae7a6 100644
> >   CONFIG_SYS_MONITOR_
> >   CONFIG_SYS_MONITOR_BASE
> >   CONFIG_SYS_MONITOR_BASE_EARLY
> > ---
> > -2.25.0
> > +--
> > +2.26.2
> >
> > diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm=
-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/fi=
les/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
> > index 3c527ae23a4a..7d02e5fee860 100644
> > --- a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-de=
signstart-cortex-a5-board.patch
> > +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-de=
signstart-cortex-a5-board.patch
> > @@ -1,7 +1,7 @@
> > -From 2417d0991f73ee2c83946fcac208a7d6894f4530 Mon Sep 17 00:00:00 200=
1
> > +From d74c2d6f475bef05c114e859ab52bd721fbee7b2 Mon Sep 17 00:00:00 200=
1
> >  From: Rui Miguel Silva <rui.silva@linaro.org>
> >  Date: Wed, 8 Jan 2020 09:48:11 +0000
> > -Subject: [PATCH 2/2] board: arm: add designstart cortex-a5 board
> > +Subject: [PATCH 2/3] board: arm: add designstart cortex-a5 board
> >
> >  Arm added a new board, designstart, with a cortex-a5 chip, add the
> >  default configuration, initialization and makefile for this system.
> > @@ -22,33 +22,33 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.=
org>
> >   create mode 100644 include/configs/designstart_ca5.h
> >
> >  diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > -index f9dab073ea14..2cc9413114de 100644
> > +index bbb1e2738bfe..8f918f6e0375 100644
> >  --- a/arch/arm/Kconfig
> >  +++ b/arch/arm/Kconfig
> > -@@ -628,6 +628,12 @@ config ARCH_BCM6858
> > -       select OF_CONTROL
> > -       imply CMD_DM
> > -
> > +@@ -636,6 +636,12 @@ config ARCH_BCM6858
> > +       select OF_CONTROL
> > +       imply CMD_DM
> > +
> >  +config TARGET_DESIGNSTART_CA5
> > -+      bool "Support Designstart Cortex-A5"
> > -+      select CPU_V7A
> > -+      select SEMIHOSTING
> > -+      select PL01X_SERIAL
> > ++      bool "Support Designstart Cortex-A5"
> > ++      select CPU_V7A
> > ++      select SEMIHOSTING
> > ++      select PL01X_SERIAL
> >  +
> >   config TARGET_VEXPRESS_CA15_TC2
> > -       bool "Support vexpress_ca15_tc2"
> > -       select CPU_V7A
> > -@@ -1782,6 +1788,7 @@ source "board/Marvell/gplugd/Kconfig"
> > +       bool "Support vexpress_ca15_tc2"
> > +       select CPU_V7A
> > +@@ -1820,6 +1826,7 @@ source "board/Marvell/gplugd/Kconfig"
> >   source "board/armadeus/apf27/Kconfig"
> >   source "board/armltd/vexpress/Kconfig"
> >   source "board/armltd/vexpress64/Kconfig"
> >  +source "board/armltd/designstart/Kconfig"
> > + source "board/cortina/presidio-asic/Kconfig"
> >   source "board/broadcom/bcm23550_w1d/Kconfig"
> >   source "board/broadcom/bcm28155_ap/Kconfig"
> > - source "board/broadcom/bcm963158/Kconfig"
> >  diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designst=
art/Kconfig
> >  new file mode 100644
> > -index 000000000000..6446fe3f4492
> > +index 000000000000..a9564e8655e2
> >  --- /dev/null
> >  +++ b/board/armltd/designstart/Kconfig
> >  @@ -0,0 +1,12 @@
> > @@ -66,7 +66,7 @@ index 000000000000..6446fe3f4492
> >  +endif
> >  diff --git a/board/armltd/designstart/Makefile b/board/armltd/designs=
tart/Makefile
> >  new file mode 100644
> > -index 000000000000..b64c905c7021
> > +index 000000000000..d2dc2b74ed85
> >  --- /dev/null
> >  +++ b/board/armltd/designstart/Makefile
> >  @@ -0,0 +1,8 @@
> > @@ -80,7 +80,7 @@ index 000000000000..b64c905c7021
> >  +obj-y :=3D designstart.o
> >  diff --git a/board/armltd/designstart/designstart.c b/board/armltd/de=
signstart/designstart.c
> >  new file mode 100644
> > -index 000000000000..b0400f110ce2
> > +index 000000000000..658057a00330
> >  --- /dev/null
> >  +++ b/board/armltd/designstart/designstart.c
> >  @@ -0,0 +1,49 @@
> > @@ -178,7 +178,7 @@ index 000000000000..a2a756740295
> >  +
> >  diff --git a/include/configs/designstart_ca5.h b/include/configs/desi=
gnstart_ca5.h
> >  new file mode 100644
> > -index 000000000000..79c4b36060d2
> > +index 000000000000..6db5b1cf4ac2
> >  --- /dev/null
> >  +++ b/include/configs/designstart_ca5.h
> >  @@ -0,0 +1,122 @@
> > @@ -304,6 +304,6 @@ index 000000000000..79c4b36060d2
> >  +#define CONFIG_ENV_SIZE                       CONFIG_ENV_SECT_SIZE
> >  +#define CONFIG_ENV_IS_IN_FLASH                1
> >  +#endif
> > ---
> > -2.25.0
> > +--
> > +2.26.2
> >
> > --
> > 2.26.2
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.
>
> >=20
>
IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
