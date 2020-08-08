Received: from FRA01-PR2-obe.outbound.protection.outlook.com (FRA01-PR2-obe.outbound.protection.outlook.com [40.107.12.48])
 by mx.groups.io with SMTP id smtpd.web10.3926.1596888012086880495
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 08 Aug 2020 05:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ljPhrqWq;
 spf=pass (domain: arm.com, ip: 40.107.12.48, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PbAf/jRrnJPTFmM/WNvOanS0S/BGzfypsZwVB8bRgU=;
 b=ljPhrqWqij/cNU6cz5A6om3K1K17LZlHbTrMkNsd771M72bLnbVrBuWkx+NPjiZ+CEikQVKrd94mqiqDu+aM+zENHTd4Lj+esGU6Xh5zbuwxXP2kpcWLDrCM0xJuKX/zqxXiAE933cTc1Iv/lfM+7ISNVvl2rXKvAYy7yrJOA8I=
Received: from AM6PR08CA0045.eurprd08.prod.outlook.com (2603:10a6:20b:c0::33)
 by PR2PR08MB4905.eurprd08.prod.outlook.com (2603:10a6:101:1b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Sat, 8 Aug
 2020 12:00:08 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::51) by AM6PR08CA0045.outlook.office365.com
 (2603:10a6:20b:c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Sat, 8 Aug 2020 12:00:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Sat, 8 Aug 2020 12:00:08 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Sat, 08 Aug 2020 12:00:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c67777ebe1d28e7e
X-CR-MTA-TID: 64aa7808
Received: from aa78c941a128.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A7834E48-043C-43EE-A7C2-C275434257FE.1;
	Sat, 08 Aug 2020 12:00:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa78c941a128.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 08 Aug 2020 12:00:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elvoaTimyY1iBKoCQfa3Kk7unjwvZ96fo4e8NtAfU4IjF1z5zSCKW93Lg7SrmZKrPeOr1qhJqH7O/V/9+74zME1bBn/zRJMCLzEsjpHr5LYjk5UsnnmXUBTQAz6eVKuTF55mLuKtdfvgfmneqNRek+IndibyYl6kQed4s5yKi4kJIhs9PzWQPx+D26L9tOoT0KSJtaiBgpd6SM9C8RQ2UQynyggs7dd6Zkjt7B71KPPjTFapfXNCwlB3iFy9xCJH64UbOsEeymItAPwf9YeuHD+uJIAIHu6g7r6mJ1w87qkZXwLTFs5SkZ2n2wOg/3ma48UpQkM8KHSK7O0ye+F3dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PbAf/jRrnJPTFmM/WNvOanS0S/BGzfypsZwVB8bRgU=;
 b=EEXBvsV/vC7vIF7Eruh/JcVIagFbstThcatJ+a9nqrt2EAwk8tebhzpJHlNpyU6v6KX0GWr1uY+sCf/5e9yEu4mfNBxeHnJfpXIosqZv5yAee+VJF/MZRKMU07Qlct5S/1TQQuyI0yhrd5kZEaWfznzpZ6I79Fiaea8e0hST583GbxqOPU2YmdMONSPNS29Dd7MBvQXbh0L0cFIrKED97uJJ9VjIxXgAuMYG0SOOKpBPMwZDYa4dX3PnE/ReajHXoRX8UsmWU9jCcEmU0b+0SewoqLr+9YJqYa7A2UlfTW74euLUktH0/Rf7XkcRDFUXl1KYju9whaB1Y8+YvKp+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PbAf/jRrnJPTFmM/WNvOanS0S/BGzfypsZwVB8bRgU=;
 b=ljPhrqWqij/cNU6cz5A6om3K1K17LZlHbTrMkNsd771M72bLnbVrBuWkx+NPjiZ+CEikQVKrd94mqiqDu+aM+zENHTd4Lj+esGU6Xh5zbuwxXP2kpcWLDrCM0xJuKX/zqxXiAE933cTc1Iv/lfM+7ISNVvl2rXKvAYy7yrJOA8I=
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (10.255.123.85) by
 AM6PR08MB4182.eurprd08.prod.outlook.com (20.179.3.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.15; Sat, 8 Aug 2020 12:00:01 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Sat, 8 Aug 2020
 12:00:01 +0000
From: abdellatif.elkhlifi@arm.com
To: Jon Mason <jdmason@kudzu.us>, Denys Dmytriyenko <denis@denix.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 0/9] Adding support for corstone700 platform
Thread-Topic: [meta-arm] [PATCH 0/9] Adding support for corstone700 platform
Thread-Index: AQHWbPL6fUMqO+m+AEizXXKe1Ah3eqktFxYAgAD0P4CAABCBWw==
Date: Sat, 8 Aug 2020 12:00:00 +0000
Message-ID: 
 <AM6PR08MB4934CC465C651DFC568A97CFFD460@AM6PR08MB4934.eurprd08.prod.outlook.com>
References: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
 <20200807202238.GH17660@denix.org>,<20200808105648.GA5087@kudzu.us>
In-Reply-To: <20200808105648.GA5087@kudzu.us>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.4.210.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6a39dcba-dd5f-48f8-23e1-08d83b92986b
x-ms-traffictypediagnostic: AM6PR08MB4182:|PR2PR08MB4905:
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4905562B4DC90ABEC3F7436BFD460@PR2PR08MB4905.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 jB+q16Y31eKvBTi8lYFZ+YPyHRYLsLjjUQSLl7OZo42hcAYYqxxMMp7d1R3uaOekoE/oK4f31Vt+0Wzyc/W7pVj06AsOI9v/towksEz2rJ5/h7KU9YYtY6fWtAyeA1Zlagg+xI8ak++FG9fxO4DqdPdLviCCTBUkmcL3e3ILx8P0EOjnxtkIjM0q71uBB6iWq5i5+lfid/VVCmLRw8+7H5Ai7lG6EsiIGEyLD5YgH0qQ/BaALEvSTFTrC2AiymVwaPhO+Z9aKIdTf7lYv8hLtzZWWyZeB07tPPvWTr9hFD9iRy5KBWLc3bRE51hWf9/RDLizOgtFDnnkjXteesbiazZ0Wkx9ZU9/TZdawT81SkQOWy+8tO5xiVqK4wQkXMFNxoYn126aXpgO9zmhgn8ZuQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(55016002)(45080400002)(316002)(83380400001)(966005)(186003)(8936002)(26005)(71200400001)(54906003)(166002)(8676002)(110136005)(478600001)(2906002)(33656002)(53546011)(6506007)(86362001)(5660300002)(19627235002)(7696005)(4326008)(66556008)(52536014)(30864003)(66946007)(66476007)(64756008)(91956017)(76116006)(66446008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Wce/nW9NJxArFcTtcAgICnyxJyFm2eC/yu11cFasBGjFUrDQ1lAN3ngD7r3LRLkgMnUeFuoWPL33AdeZ7UJSW9+d9aiQ8yx45Gf3gpHa2PybwDLIxuTNJtkHYvKez5Ik24J27M4DozQd5uaYcTJfh7aMcQSwwtyYQShgL8InAYUTmeWv7xShSi3pomW4N4KL0hQuV4B5nYTG0zBOtCcUXJia/aQw6qzRYcMz8f0Mgh0uXrcE25UIaCKSpa3EzXDu6UitVPmPca++xOWALSZrGcZclcD3cXDzkBIeWjNW0rxJWCylMZeuz/7XslZHp1bgQA8nVbVOsJmIFIFPcCmvlNbuTeZLAZdjABZz4HmBLJYKcQT9ZLq9zH1yljkXr9demJsQo9oTPqObxaBo89CDjOMau5mGqcHhux8/kEHvUqUvcKuMjEw8cvoJvV26u1/ghjOMk9VeeDTiQg4NDLZDVm4nym7BDpXaW0nlnX3IXiZIL2b3fYxABV1BDjn3JmkQjZvCo1Ac79agjOIYQ91t4/0ZM4Ce6PF101lE+vt5jYP56Leny2g5WyhXFyNCtZenmv+TlJpscVOWiNU57KyPBmDfkOZIa8NS6oYvX9nznSWQWQFCy2fF8BV1YF0xdBXRlsfcdOSMKTBZr7oZNoQ2fA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4182
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b9c8514c-c954-47f7-08d1-08d83b929437
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pu4eY4WGB6dOlukFhEWWKML8R1W5GUNirStd+42QIyQfTlsNuPrs3ON/JzUP4HcooIII3VJAmJKD/QP//Gh5lX2P4p/L2RCHvdKe1nrm666PG8zsLHfDCVyJW4CnIRBasC9MP2h+TjraWiHENGJya6mpI9bFTn6PDVoqvqF5wSxglcOXGZBGItikU1/C62vCrHeqdYdUcKubby65PhmzPfMFr6x4fWi4J+pmzqZx8RWvkrN4K+RFTCLf4Omvg8dxhexPo4mjEZtAf/DHaA9jLQxirfumeSg8LqnrChS+j4aeupIDvjhdMihhOAU31l+e44LQQE2O00+jQEaKvyD9txxB9vcQ9+fUY8gZ1d0csMWWBAoWWioZ3YrB/EMXKCHaC8n0UkrfeiB4IH4ALzbPjR3XwvCLh4NGSuKFDV3tn9dfJFS9RYKMDXZV9BvkPdCRZkLFTDqmRJebkGKUpzmNfoCokikV57SiRyPzy1q7RIA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(30864003)(70206006)(19627235002)(70586007)(336012)(83380400001)(186003)(4326008)(53546011)(6506007)(356005)(166002)(45080400002)(966005)(81166007)(33656002)(26005)(82310400002)(7696005)(82740400003)(54906003)(478600001)(110136005)(47076004)(316002)(36906005)(8676002)(8936002)(86362001)(5660300002)(55016002)(9686003)(2906002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2020 12:00:08.0557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a39dcba-dd5f-48f8-23e1-08d83b92986b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4905
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB4934CC465C651DFC568A97CFFD460AM6PR08MB4934eurp_"

--_000_AM6PR08MB4934CC465C651DFC568A97CFFD460AM6PR08MB4934eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Denys,

I confirm what Jon explained about the patches. Please use the latest patc=
h set.

Kind regards

Sent from Samsung Mobile on O2
Get Outlook for Android<https://aka.ms/ghei36>

________________________________
From: Jon Mason <jdmason@kudzu.us>
Sent: Saturday, 8 August 2020, 11:57
To: Denys Dmytriyenko
Cc: Abdellatif El Khlifi; meta-arm@lists.yoctoproject.org; nd
Subject: Re: [meta-arm] [PATCH 0/9] Adding support for corstone700 platfor=
m

On Fri, Aug 07, 2020 at 04:22:38PM -0400, Denys Dmytriyenko wrote:
> Is this a 3rd copy of the same content?
> Or is this a 3rd revision of the patches? What are the changes then?

This was the 3rd attempt of the save version of the patches.  The
"nd@arm.com" that is added by Arm employees is supposed to prevent the
appending of the legal stuff at the bottom by the SMTP server.
Abdellatif was trying to handle that issue in his 3 submissions of the
patches.

They should all be identical aside from this, so it does not matter
which one to code review.  Personally, I used the last one for tested,
due to not having the legal stuff that normally breaks git-am.

Thanks,
Jon

>
> --
> Denys
>
>
> On Fri, Aug 07, 2020 at 08:42:44PM +0100, abdellatif.elkhlifi@arm.com wr=
ote:
> > From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> >
> > These patches add support for corstone700 platform on Arm fast model a=
nd
> > MPS3 FPGA board.
> >
> > For more information about the platform, please check:
> >
> > https://developer.arm.com/ip-products/subsystem/corstone-foundation-ip=
/corstone-700
> >
> > https://community.arm.com/developer/tools-software/oss-platforms/w/doc=
s/444/corstone-700
> >
> > Abdellatif El Khlifi (8):
> >   arm-bsp/machine: adding corstone700-fvp machine
> >   arm-bsp/linux: configuring v5.6 kernel for corstone700 platforms
> >   arm-bsp/trusted-firmware-a: adding support for corstone700 platform
> >   arm-bsp/external-system: enabling corstone700 platform support
> >   arm-bsp/u-boot: adding corstone700 platform to u-boot
> >   arm-bsp/scp-firmware: adding scp support for corstone700 platform
> >   arm-bsp/machine: adding corstone700-mps3 machine
> >   arm-bsp/linux: Enabling lan9115 Ethernet for corstone700-mps3
> >
> > Rui Miguel Silva (1):
> >   arm-bsp/external-system: add external system recipe
> >
> >  .../conf/machine/corstone700-fvp.conf         |   12 +
> >  .../conf/machine/corstone700-mps3.conf        |   12 +
> >  .../conf/machine/include/corstone700.inc      |   34 +
> >  .../external-system/external-system_0.1.0.bb  |   45 +
> >  .../scp-firmware/scp-firmware-corstone700.inc |   37 +
> >  .../scp-firmware/scp-firmware_%.bbappend      |    1 +
> >  .../trusted-firmware-a-corstone700.inc        |   26 +
> >  .../trusted-firmware-a_2.3.bbappend           |    1 +
> >  .../0001-armv7-add-mmio-timer.patch           |  108 +
> >  ...-arm-add-designstart-cortex-a5-board.patch |  312 +++
> >  .../0003-arm-Add-corstone700-platform.patch   |  301 +++
> >  ...dd-bootx-command-to-start-XiP-images.patch |  136 +
> >  ...g-the-XIP-kernel-using-bootx-command.patch |   39 +
> >  ...6-arm-enabling-the-arch_timer-driver.patch |   61 +
> >  .../recipes-bsp/u-boot/u-boot_%.bbappend      |   12 +
> >  .../bsp/arm-platforms/corstone700-bsp.scc     |    6 +
> >  .../bsp/arm-platforms/corstone700/base.cfg    |   35 +
> >  .../arm-platforms/corstone700/eth_lan9115.scc |    4 +
> >  .../corstone700/eth_lan91c111.scc             |    4 +
> >  .../bsp/arm-platforms/corstone700/lan9115.cfg |    1 +
> >  .../arm-platforms/corstone700/lan91c111.cfg   |    1 +
> >  .../bsp/arm-platforms/corstone700/pnp.cfg     |    4 +
> >  .../bsp/arm-platforms/corstone700/xip.cfg     |   12 +
> >  .../arm-platforms/corstone700/xip_cmdline.cfg |    3 +
> >  .../corstone700/xip_dhcp_cmdline.cfg          |    3 +
> >  ...-for-a-single-ARMv7-A-based-platform.patch |   97 +
> >  .../0002-arm-Add-tiny-vexpress-machine.patch  |  101 +
> >  ...-arm-introduce-corstone700_defconfig.patch |  197 ++
> >  ...ilbox-handling-unit-controller-versi.patch |  322 +++
> >  ...d-on-rpmsg-char-driver-using-mailbox.patch |  202 ++
> >  ...arm-MHU-driver-and-RPMSG-char-driver.patch |   30 +
> >  ...ation-of-multiple-arm-rpmsg-channels.patch |  148 ++
> >  ...ombined-receiver-interrupt-when-usin.patch |   59 +
> >  ...stone700-external-system-harness-dri.patch |  232 ++
> >  ...ize-endpoint-and-mailbox-information.patch |  181 ++
> >  ...ox-channel-ownership-to-rpmsg-endpoi.patch |  107 +
> >  ...v2-add-new-AMBA-ID-to-support-MHU-v2.patch |   36 +
> >  ...hu_v2-dynamic-allocation-of-channels.patch |  119 +
> >  ...t-XIP-physical-address-to-3MB-offset.patch |   42 +
> >  ...ble-ARM_VIRT-extension-if-XIP_KERNEL.patch |   50 +
> >  ...onfig-use-DDR-address-instead-of-sha.patch |   34 +
> >  ...config-enable-configs-for-cramfs-xip.patch |   61 +
> >  ...0-move-to-regmap-for-register-access.patch | 2297 ++++++++++++++++=
+
> >  ...cd-refactor-mempool-config-and-setup.patch |  302 +++
> >  ...-usb-isp1760-add-support-for-isp1763.patch | 1755 +++++++++++++
> >  .../linux/linux-stable-corstone700.inc        |   62 +
> >  .../linux/linux-stable_%.bbappend             |    8 +
> >  .../wic/arm-reference-image.corstone700.wks   |   22 +
> >  meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb |   26 +
> >  49 files changed, 7700 insertions(+)
> >  create mode 100644 meta-arm-bsp/conf/machine/corstone700-fvp.conf
> >  create mode 100644 meta-arm-bsp/conf/machine/corstone700-mps3.conf
> >  create mode 100644 meta-arm-bsp/conf/machine/include/corstone700.inc
> >  create mode 100644 meta-arm-bsp/recipes-bsp/external-system/external-=
system_0.1.0.bb
> >  create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware=
-corstone700.inc
> >  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/truste=
d-firmware-a-corstone700.inc
> >  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/=
0001-armv7-add-mmio-timer.patch
> >  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/=
0002-board-arm-add-designstart-cortex-a5-board.patch
> >  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/=
0003-arm-Add-corstone700-platform.patch
> >  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/=
0004-boot-add-bootx-command-to-start-XiP-images.patch
> >  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/=
0005-boot-starting-the-XIP-kernel-using-bootx-command.patch
> >  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/=
0006-arm-enabling-the-arch_timer-driver.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-km=
eta/bsp/arm-platforms/corstone700-bsp.scc
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-km=
eta/bsp/arm-platforms/corstone700/base.cfg
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-km=
eta/bsp/arm-platforms/corstone700/eth_lan9115.scc
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-km=
eta/bsp/arm-platforms/corstone700/eth_lan91c111.scc
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-km=
eta/bsp/arm-platforms/corstone700/lan9115.cfg
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-km=
eta/bsp/arm-platforms/corstone700/lan91c111.cfg
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-km=
eta/bsp/arm-platforms/corstone700/pnp.cfg
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-km=
eta/bsp/arm-platforms/corstone700/xip.cfg
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-km=
eta/bsp/arm-platforms/corstone700/xip_cmdline.cfg
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-km=
eta/bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0001-arm-support-for-a-single-ARMv7-A-based-platform.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0002-arm-Add-tiny-vexpress-machine.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0003-arm-introduce-corstone700_defconfig.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0004-add-driver-of-mailbox-handling-unit-controller-versi.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0005-add-rpmsg-based-on-rpmsg-char-driver-using-mailbox.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0006-enable-arm-MHU-driver-and-RPMSG-char-driver.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0007-allow-creation-of-multiple-arm-rpmsg-channels.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0008-mailbox-enable-combined-receiver-interrupt-when-usin.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0009-misc-arm-add-corstone700-external-system-harness-dri.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0010-arm-containerize-endpoint-and-mailbox-information.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0011-arm-couple-mailbox-channel-ownership-to-rpmsg-endpoi.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0012-mailbox-arm_mhu_v2-add-new-AMBA-ID-to-support-MHU-v2.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0013-mailbox-arm_mhu_v2-dynamic-allocation-of-channels.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0014-defconfig-adjust-XIP-physical-address-to-3MB-offset.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0015-arm-Kconfig-disable-ARM_VIRT-extension-if-XIP_KERNEL.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0016-corstone700_defconfig-use-DDR-address-instead-of-sha.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0017-corstone700_defconfig-enable-configs-for-cramfs-xip.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0018-usb-isp1760-move-to-regmap-for-register-access.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0019-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone70=
0/0020-usb-isp1760-add-support-for-isp1763.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable-cor=
stone700.inc
> >  create mode 100644 meta-arm-bsp/wic/arm-reference-image.corstone700.w=
ks
> >  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb
> >
> > --
> > 2.17.1
> >
>
> >
>

>=20



--_000_AM6PR08MB4934CC465C651DFC568A97CFFD460AM6PR08MB4934eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
</head>
<body>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
Hello Denys,</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
I confirm what Jon explained about the patches. Please use the latest patc=
h set.</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
Kind regards</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
Sent from Samsung Mobile on O2<br>
Get <a href=3D"https://aka.ms/ghei36">Outlook for Android</a></div>
<div id=3D"id-f4d272bd-4a4e-4274-8f0d-52c0124819c0" class=3D"ms-outlook-mo=
bile-reference-message">
<div style=3D"font-family: sans-serif; font-size: 14.52pt; color: rgb(0, 0=
, 0);"><br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg"><strong>From:</strong> Jon Mason &lt;jdmason@kud=
zu.us&gt;<br>
<strong>Sent:</strong> Saturday, 8 August 2020, 11:57<br>
<strong>To:</strong> Denys Dmytriyenko<br>
<strong>Cc:</strong> Abdellatif El Khlifi; meta-arm@lists.yoctoproject.org=
; nd<br>
<strong>Subject:</strong> Re: [meta-arm] [PATCH 0/9] Adding support for co=
rstone700 platform<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pa=
dding-left: 4pt; border-left: #800000 2px solid; } --></style><font size=3D=
"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">On Fri, Aug 07, 2020 at 04:22:38PM -0400, Denys D=
mytriyenko wrote:<br>
&gt; Is this a 3rd copy of the same content?<br>
&gt; Or is this a 3rd revision of the patches? What are the changes then?<=
br>
<br>
This was the 3rd attempt of the save version of the patches.&nbsp; The<br>
&quot;nd@arm.com&quot; that is added by Arm employees is supposed to preve=
nt the<br>
appending of the legal stuff at the bottom by the SMTP server.<br>
Abdellatif was trying to handle that issue in his 3 submissions of the<br>
patches.<br>
<br>
They should all be identical aside from this, so it does not matter<br>
which one to code review.&nbsp; Personally, I used the last one for tested=
,<br>
due to not having the legal stuff that normally breaks git-am.<br>
<br>
Thanks,<br>
Jon<br>
<br>
&gt; <br>
&gt; -- <br>
&gt; Denys<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Aug 07, 2020 at 08:42:44PM +0100, abdellatif.elkhlifi@arm.com=
 wrote:<br>
&gt; &gt; From: Abdellatif El Khlifi &lt;abdellatif.elkhlifi@arm.com&gt;<b=
r>
&gt; &gt; <br>
&gt; &gt; These patches add support for corstone700 platform on Arm fast m=
odel and<br>
&gt; &gt; MPS3 FPGA board.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt; For more information about the platform, please check:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://developer.arm.com/ip-products/subsystem/corst=
one-foundation-ip/corstone-700">
https://developer.arm.com/ip-products/subsystem/corstone-foundation-ip/cor=
stone-700</a><br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://community.arm.com/developer/tools-software/os=
s-platforms/w/docs/444/corstone-700">
https://community.arm.com/developer/tools-software/oss-platforms/w/docs/44=
4/corstone-700</a><br>
&gt; &gt; <br>
&gt; &gt; Abdellatif El Khlifi (8):<br>
&gt; &gt;&nbsp;&nbsp; arm-bsp/machine: adding corstone700-fvp machine<br>
&gt; &gt;&nbsp;&nbsp; arm-bsp/linux: configuring v5.6 kernel for corstone7=
00 platforms<br>
&gt; &gt;&nbsp;&nbsp; arm-bsp/trusted-firmware-a: adding support for corst=
one700 platform<br>
&gt; &gt;&nbsp;&nbsp; arm-bsp/external-system: enabling corstone700 platfo=
rm support<br>
&gt; &gt;&nbsp;&nbsp; arm-bsp/u-boot: adding corstone700 platform to u-boo=
t<br>
&gt; &gt;&nbsp;&nbsp; arm-bsp/scp-firmware: adding scp support for corston=
e700 platform<br>
&gt; &gt;&nbsp;&nbsp; arm-bsp/machine: adding corstone700-mps3 machine<br>
&gt; &gt;&nbsp;&nbsp; arm-bsp/linux: Enabling lan9115 Ethernet for corston=
e700-mps3<br>
&gt; &gt; <br>
&gt; &gt; Rui Miguel Silva (1):<br>
&gt; &gt;&nbsp;&nbsp; arm-bsp/external-system: add external system recipe<=
br>
&gt; &gt; <br>
&gt; &gt;&nbsp; .../conf/machine/corstone700-fvp.conf&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 12 +<br>
&gt; &gt;&nbsp; .../conf/machine/corstone700-mps3.conf&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 12 +<br>
&gt; &gt;&nbsp; .../conf/machine/include/corstone700.inc&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp;&nbsp; 34 +<br>
&gt; &gt;&nbsp; .../external-system/external-system_0.1.0.bb&nbsp; |&nbsp;=
&nbsp; 45 +<br>
&gt; &gt;&nbsp; .../scp-firmware/scp-firmware-corstone700.inc |&nbsp;&nbsp=
; 37 +<br>
&gt; &gt;&nbsp; .../scp-firmware/scp-firmware_%.bbappend&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 1 +<br>
&gt; &gt;&nbsp; .../trusted-firmware-a-corstone700.inc&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 26 +<br>
&gt; &gt;&nbsp; .../trusted-firmware-a_2.3.bbappend&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 1 +<br>
&gt; &gt;&nbsp; .../0001-armv7-add-mmio-timer.patch&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 108 +<br>
&gt; &gt;&nbsp; ...-arm-add-designstart-cortex-a5-board.patch |&nbsp; 312 =
+++<br>
&gt; &gt;&nbsp; .../0003-arm-Add-corstone700-platform.patch&nbsp;&nbsp; |&=
nbsp; 301 +++<br>
&gt; &gt;&nbsp; ...dd-bootx-command-to-start-XiP-images.patch |&nbsp; 136 =
+<br>
&gt; &gt;&nbsp; ...g-the-XIP-kernel-using-bootx-command.patch |&nbsp;&nbsp=
; 39 +<br>
&gt; &gt;&nbsp; ...6-arm-enabling-the-arch_timer-driver.patch |&nbsp;&nbsp=
; 61 +<br>
&gt; &gt;&nbsp; .../recipes-bsp/u-boot/u-boot_%.bbappend&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp;&nbsp; 12 +<br>
&gt; &gt;&nbsp; .../bsp/arm-platforms/corstone700-bsp.scc&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp;&nbsp;&nbsp; 6 +<br>
&gt; &gt;&nbsp; .../bsp/arm-platforms/corstone700/base.cfg&nbsp;&nbsp;&nbs=
p; |&nbsp;&nbsp; 35 +<br>
&gt; &gt;&nbsp; .../arm-platforms/corstone700/eth_lan9115.scc |&nbsp;&nbsp=
;&nbsp; 4 +<br>
&gt; &gt;&nbsp; .../corstone700/eth_lan91c111.scc&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 4 +<br>
&gt; &gt;&nbsp; .../bsp/arm-platforms/corstone700/lan9115.cfg |&nbsp;&nbsp=
;&nbsp; 1 +<br>
&gt; &gt;&nbsp; .../arm-platforms/corstone700/lan91c111.cfg&nbsp;&nbsp; |&=
nbsp;&nbsp;&nbsp; 1 +<br>
&gt; &gt;&nbsp; .../bsp/arm-platforms/corstone700/pnp.cfg&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp;&nbsp;&nbsp; 4 +<br>
&gt; &gt;&nbsp; .../bsp/arm-platforms/corstone700/xip.cfg&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp;&nbsp; 12 +<br>
&gt; &gt;&nbsp; .../arm-platforms/corstone700/xip_cmdline.cfg |&nbsp;&nbsp=
;&nbsp; 3 +<br>
&gt; &gt;&nbsp; .../corstone700/xip_dhcp_cmdline.cfg&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 3 +<br>
&gt; &gt;&nbsp; ...-for-a-single-ARMv7-A-based-platform.patch |&nbsp;&nbsp=
; 97 +<br>
&gt; &gt;&nbsp; .../0002-arm-Add-tiny-vexpress-machine.patch&nbsp; |&nbsp;=
 101 +<br>
&gt; &gt;&nbsp; ...-arm-introduce-corstone700_defconfig.patch |&nbsp; 197 =
++<br>
&gt; &gt;&nbsp; ...ilbox-handling-unit-controller-versi.patch |&nbsp; 322 =
+++<br>
&gt; &gt;&nbsp; ...d-on-rpmsg-char-driver-using-mailbox.patch |&nbsp; 202 =
++<br>
&gt; &gt;&nbsp; ...arm-MHU-driver-and-RPMSG-char-driver.patch |&nbsp;&nbsp=
; 30 +<br>
&gt; &gt;&nbsp; ...ation-of-multiple-arm-rpmsg-channels.patch |&nbsp; 148 =
++<br>
&gt; &gt;&nbsp; ...ombined-receiver-interrupt-when-usin.patch |&nbsp;&nbsp=
; 59 +<br>
&gt; &gt;&nbsp; ...stone700-external-system-harness-dri.patch |&nbsp; 232 =
++<br>
&gt; &gt;&nbsp; ...ize-endpoint-and-mailbox-information.patch |&nbsp; 181 =
++<br>
&gt; &gt;&nbsp; ...ox-channel-ownership-to-rpmsg-endpoi.patch |&nbsp; 107 =
+<br>
&gt; &gt;&nbsp; ...v2-add-new-AMBA-ID-to-support-MHU-v2.patch |&nbsp;&nbsp=
; 36 +<br>
&gt; &gt;&nbsp; ...hu_v2-dynamic-allocation-of-channels.patch |&nbsp; 119 =
+<br>
&gt; &gt;&nbsp; ...t-XIP-physical-address-to-3MB-offset.patch |&nbsp;&nbsp=
; 42 +<br>
&gt; &gt;&nbsp; ...ble-ARM_VIRT-extension-if-XIP_KERNEL.patch |&nbsp;&nbsp=
; 50 +<br>
&gt; &gt;&nbsp; ...onfig-use-DDR-address-instead-of-sha.patch |&nbsp;&nbsp=
; 34 +<br>
&gt; &gt;&nbsp; ...config-enable-configs-for-cramfs-xip.patch |&nbsp;&nbsp=
; 61 +<br>
&gt; &gt;&nbsp; ...0-move-to-regmap-for-register-access.patch | 2297 +++++=
++++++++++++<br>
&gt; &gt;&nbsp; ...cd-refactor-mempool-config-and-setup.patch |&nbsp; 302 =
+++<br>
&gt; &gt;&nbsp; ...-usb-isp1760-add-support-for-isp1763.patch | 1755 +++++=
++++++++<br>
&gt; &gt;&nbsp; .../linux/linux-stable-corstone700.inc&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 62 +<br>
&gt; &gt;&nbsp; .../linux/linux-stable_%.bbappend&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 8 +<br>
&gt; &gt;&nbsp; .../wic/arm-reference-image.corstone700.wks&nbsp;&nbsp; |&=
nbsp;&nbsp; 22 +<br>
&gt; &gt;&nbsp; meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb |&nbsp;&nbsp=
; 26 +<br>
&gt; &gt;&nbsp; 49 files changed, 7700 insertions(+)<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/conf/machine/corstone700-f=
vp.conf<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/conf/machine/corstone700-m=
ps3.conf<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/conf/machine/include/corst=
one700.inc<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-bsp/external-syste=
m/external-system_0.1.0.bb<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/s=
cp-firmware-corstone700.inc<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmwa=
re-a/trusted-firmware-a-corstone700.inc<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/c=
orstone700/0001-armv7-add-mmio-timer.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/c=
orstone700/0002-board-arm-add-designstart-cortex-a5-board.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/c=
orstone700/0003-arm-Add-corstone700-platform.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/c=
orstone700/0004-boot-add-bootx-command-to-start-XiP-images.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/c=
orstone700/0005-boot-starting-the-XIP-kernel-using-bootx-command.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/c=
orstone700/0006-arm-enabling-the-arch_timer-driver.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700-bsp.scc<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/base.cfg<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/eth_lan91c111.scc<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/lan91c111.cfg<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/pnp.cfg<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/xip.cfg<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/xip_cmdline.cfg<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0001-arm-support-for-a-single-ARMv7-A-based-platform.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0002-arm-Add-tiny-vexpress-machine.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0003-arm-introduce-corstone700_defconfig.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0004-add-driver-of-mailbox-handling-unit-controller-versi.patc=
h<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0005-add-rpmsg-based-on-rpmsg-char-driver-using-mailbox.patch<=
br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0006-enable-arm-MHU-driver-and-RPMSG-char-driver.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0007-allow-creation-of-multiple-arm-rpmsg-channels.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0008-mailbox-enable-combined-receiver-interrupt-when-usin.patc=
h<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0009-misc-arm-add-corstone700-external-system-harness-dri.patc=
h<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0010-arm-containerize-endpoint-and-mailbox-information.patch<b=
r>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0011-arm-couple-mailbox-channel-ownership-to-rpmsg-endpoi.patc=
h<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0012-mailbox-arm_mhu_v2-add-new-AMBA-ID-to-support-MHU-v2.patc=
h<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0013-mailbox-arm_mhu_v2-dynamic-allocation-of-channels.patch<b=
r>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0014-defconfig-adjust-XIP-physical-address-to-3MB-offset.patch=
<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0015-arm-Kconfig-disable-ARM_VIRT-extension-if-XIP_KERNEL.patc=
h<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0016-corstone700_defconfig-use-DDR-address-instead-of-sha.patc=
h<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0017-corstone700_defconfig-enable-configs-for-cramfs-xip.patch=
<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0018-usb-isp1760-move-to-regmap-for-register-access.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0019-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch<b=
r>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/files=
/corstone700/0020-usb-isp1760-add-support-for-isp1763.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux=
-stable-corstone700.inc<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/wic/arm-reference-image.co=
rstone700.wks<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_2020=
.04.bb<br>
&gt; &gt; <br>
&gt; &gt; -- <br>
&gt; &gt; 2.17.1<br>
&gt; &gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; <br>
<br>
&gt; <br>
<br>
</div>
</span></font><br>
</div>
</body>
</html>

--_000_AM6PR08MB4934CC465C651DFC568A97CFFD460AM6PR08MB4934eurp_--
