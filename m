Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.46])
 by mx.groups.io with SMTP id smtpd.web11.10712.1583941570948669271
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Mar 2020 08:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nrp2ZyVq;
 spf=pass (domain: arm.com, ip: 40.107.22.46, mailfrom: rui.silva@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sQVpxqRjQuL6SW8KUIHf88eiskAsAmmjdVcrTnu3Nw=;
 b=nrp2ZyVqkU+AjR5s88kMLxWoHcGuI0FD5dDfb9/+bNowMt6MBTFTewDgmgn3in1K90EOtUOGSh/MGgEGgovB2Bv2A2T1siCypGJm+AjUn9wuOxfUEwNPqnSSYC9E6pHGk6hSzksIQ++46ObqIMlJyU+f0ooKH1S9kxWvtkdfFCM=
Received: from DB6PR07CA0086.eurprd07.prod.outlook.com (2603:10a6:6:2b::24) by
 VE1PR08MB5247.eurprd08.prod.outlook.com (2603:10a6:803:10d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 15:46:08 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::30) by DB6PR07CA0086.outlook.office365.com
 (2603:10a6:6:2b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.6 via Frontend
 Transport; Wed, 11 Mar 2020 15:46:08 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Wed, 11 Mar 2020 15:46:08 +0000
Received: ("Tessian outbound 846b976b3941:v42"); Wed, 11 Mar 2020 15:46:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59930a2306b9ce7b
X-CR-MTA-TID: 64aa7808
Received: from e4d822e8933c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4A14CBC1-A82D-46A1-A81D-C3D7A2EA8AFE.1;
	Wed, 11 Mar 2020 15:46:02 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e4d822e8933c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Mar 2020 15:46:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2Hjt0eQADgX/4Dub1NchYDbxg7xUTLJONw7HmLTKa/GmFPuACQ7KR0GDgW0rhOPxk76vbI6q9IdIDdAtVluuIVpid+f4trTEXGzmkXY8gxw77LPzmahI2dCHv058BL0i7cQ2vG8hlTiGSxekkZHqTYFbMZcccNdqiGEorBpoaawl/ud0ns5L4rHpHmKM2KVG/ND7YDS572izGBa/IyvPbYfCbllcn9dYQ/tF6lSjw9lzDCIcyX56qVjIEQ6p1ZCR1on+sDDce3Qg3EFv3oIlTfY8pH5X0F5CLOl9L4lYlNjaNWHi0vxXzuxAnEdy8HJMvLBIqBkAC5B36ygclJpVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sQVpxqRjQuL6SW8KUIHf88eiskAsAmmjdVcrTnu3Nw=;
 b=eWc+IKWoP6ZJ/xQ3a1eboiQAwTaUEhtN2v74MQEVNtGJBQOz50mFzIgYZj1Y8YkAxaKMPxmrFQNpU8NyyoDG2eQiChMnVQrYZ9ljQek3JDoMGC5lyNoE7EhpBzcnTOLOZt9EQKsvozz61g1zdnpI+a474DUNp/njURvAGsf1iMPiTzLoi/awJ1SaH7hGBc9lVB/CuqCuyZI3tXa0o8slYO5rB35o8VxRWx0KZ0+czCcpO4PIp/4p4wRCWGX8pD2RwSrKCsLnUQrjlqcmDOCmeZN5Mb0HzAG6dT1hcD2Vpm/NdItSe+dCuRLEjYUY3EiL9wqlzTcl2PFlqDQn1UIkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sQVpxqRjQuL6SW8KUIHf88eiskAsAmmjdVcrTnu3Nw=;
 b=nrp2ZyVqkU+AjR5s88kMLxWoHcGuI0FD5dDfb9/+bNowMt6MBTFTewDgmgn3in1K90EOtUOGSh/MGgEGgovB2Bv2A2T1siCypGJm+AjUn9wuOxfUEwNPqnSSYC9E6pHGk6hSzksIQ++46ObqIMlJyU+f0ooKH1S9kxWvtkdfFCM=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Rui.Silva@arm.com; 
Received: from HE1PR0801MB2044.eurprd08.prod.outlook.com (10.168.95.21) by
 HE1PR0801MB1883.eurprd08.prod.outlook.com (10.168.94.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14; Wed, 11 Mar 2020 15:45:59 +0000
Received: from HE1PR0801MB2044.eurprd08.prod.outlook.com
 ([fe80::42b:e060:9180:6be]) by HE1PR0801MB2044.eurprd08.prod.outlook.com
 ([fe80::42b:e060:9180:6be%8]) with mapi id 15.20.2814.007; Wed, 11 Mar 2020
 15:45:59 +0000
Date: Wed, 11 Mar 2020 15:45:50 +0000
From: "Rui Miguel Silva" <rui.silva@arm.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp: add upstream kernel inc and v5.3 recipe
Message-ID: <20200311154550.tgm2itol32jpsxh6@arch-thunder.localdomain>
References: <20200311105643.159467-1-rui.silva@arm.com>
 <20200311105643.159467-2-rui.silva@arm.com>
 <CAP71WjwuG4saWcZSvYxGxxpQ3_c2OEVhmg+AEwWGbn6wQpw4uA@mail.gmail.com>
In-Reply-To: <CAP71WjwuG4saWcZSvYxGxxpQ3_c2OEVhmg+AEwWGbn6wQpw4uA@mail.gmail.com>
X-ClientProxiedBy: MRXP264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::33) To HE1PR0801MB2044.eurprd08.prod.outlook.com
 (2603:10a6:3:50::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from arch-thunder.localdomain (109.49.46.234) by MRXP264CA0045.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend Transport; Wed, 11 Mar 2020 15:45:58 +0000
X-Originating-IP: [109.49.46.234]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: acb07fb7-3110-476f-e60b-08d7c5d350d9
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1883:|VE1PR08MB5247:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB5247AE741ED2B29DEEFC4DA5EAFC0@VE1PR08MB5247.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(66476007)(66556008)(66946007)(316002)(6916009)(2906002)(4326008)(16526019)(1076003)(5660300002)(86362001)(81166006)(8936002)(55016002)(26005)(81156014)(9686003)(956004)(7696005)(8676002)(6666004)(6506007)(186003)(478600001)(966005)(53546011)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0801MB1883;H:HE1PR0801MB2044.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 UgI8yyE9f5LO7PGrNNP565X0PCL5x0HhNtJpceiQ6WbuL/39ciwcteE0MHoI5ERIOQCpv4d2+qzu2q4tCetHcvliE8t96XC/hk3WZ7d0ByZlC8EBx8TUzbD8OdtCDfbvo8EKxIe6bVoeRaFEyX53SOeTqVJVULA30JQuTaJBwTOO3oeo8zWZFhH+pQWW9zkYFvxPL/5xKQaxito8jP4YQ3B18qmZBRBH1/pdosYgYi4Wx1nYf+vMM4wLLA7Li55TNSqEhhxl0OCV6YFztumTcSOMkgf6/rgXNJMth7YcwWXqg1ZBMYRej5lzzubMtSEpMeYITt/Vpn5ZzazHy1NVMO5OQb2WW5Ick69LZoynwZOkVzH9Z9oPHMorItMCDkxjWT/6N08ECarAXssiVIWIOO3BPmh8pE0dNsiKesucZeHMvz6F/4UDnOUsBywp+nCue45sRLY7L1itVOdoB6dRyoitfcuOeALlz5uO01Y+A2n0k4CI1SBo4zeogeEide0zjJxF4nAcLkDdMiADUDGSqQ==
X-MS-Exchange-AntiSpam-MessageData: 
 IhQxgx07oZaNxeqJYIEc2b0CJTOrhVdqdAygdzwXSZpkpkGM/PTphPlhTDzYI4/U6lZ2McOjculBwi26b+WakNwC2s84VldSLVyfqC93qA0DvwGuookfOUo/SwYbZoUJ1uUAKWg6XZ99tdU1X/z2hQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1883
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rui.Silva@arm.com; 
Return-Path: Rui.Silva@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(199004)(5660300002)(6862004)(26005)(6506007)(316002)(70206006)(2906002)(9686003)(4326008)(8936002)(26826003)(81166006)(53546011)(81156014)(7696005)(8676002)(70586007)(55016002)(966005)(478600001)(356004)(336012)(956004)(16526019)(6666004)(86362001)(1076003)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB5247;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	611e2ec8-12ba-4e28-ebdc-08d7c5d34b1a
X-Forefront-PRVS: 0339F89554
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oG4OpK/rXDbiqNzzaZi1rypKn8wmC46oxAmV11cKCBRDK96IZ8FfrSNu/7umyW08ZRdZYbnBacs0NAl18cfUWjKlGmuxJ/hrLLetdId1Krnjm5Nm9iHHDbkyl2evi8LH6TOhLsnmfX+aAtQvdmhrMrl1WEgz/XRCmkANgY7DxD/yvGUlAhUeJUXYVgxEf47hoKNvOVrgSOmn7whX3pBRqOKLMoSEiibVfe6BP7B8D8KNPV+OjAgumnI6oo/BvgaI2xTKwfUHYF+hDm1j39W9oaiGlqpbMRhgYQJhe6qKNs+UDglOs9x9z8SwL1kzkLNUO9pe1W2H/KXkbBuEVHRJFnIG4WLawuoB9Syuul9OAmne/2mmE9WTzFdAbutPDCYt+jWCgxF9Z0hEUJJfOCrNJr4YCD33PnO/+QaRjBLpdEPUWvor7BLRRDVwuirS+Kp28T/i5NaKo1Wm+70XGdSKARz9YjPVdyAgeBJ4LwgFDG0Q22dti/KqmH+smCglFQd/wdQpic/Ez3il04NSkYsmEg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 15:46:08.1363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acb07fb7-3110-476f-e60b-08d7c5d350d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5247
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicho,
thanks for the review.

On Wed, Mar 11, 2020 at 12:06:34PM +0100, Nicolas Dechesne wrote: [--
Type: text/plain; charset=3DUTF-8, Encoding: 7bit, Size: 3.3K --]
> On Wed, Mar 11, 2020 at 11:57 AM Rui Miguel Silva
> <rui.silva@arm.com> wrote:
>
> > From: Rui Silva <rui.silva@arm.com>
> >
> > Add support to build using the upstream (Linus tree) and as first
> > user add recipe for v5.3, which will be later.
> >
> > Change-Id: I0f30a45002adca7c0b95a0421e0291a6852295eb
> > Signed-off-by: Rui Miguel Silva <rui.silva@arm.com> ---
> > .../linux/linux-upstream-arm-platforms.inc    | 24
> > +++++++++++++++++++ .../linux/linux-upstream-arm_5.3.bb
> > |  8 +++++++
> >  2 files changed, 32 insertions(+) create mode 100644
> >    meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> >    create mode 100644 meta-arm-bsp/recipes-kernel/linux/
> >    linux-upstream-arm_5.3.bb
> >
> > diff --git
> > a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> > b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> > new file mode 100644 index 000000000000..7b73e7536d19 ---
> > /dev/null +++
> > b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> > @@ -0,0 +1,24 @@ +DESCRIPTION =3D "Linux Kernel based on upstream
> > tree" +SECTION =3D "kernel" +LICENSE =3D "GPLv2" +SRCREV_FORMAT =3D
> > "kernel" + +require recipes-kernel/linux/linux-yocto.inc +
> > +KERNEL_VERSION_SANITY_SKIP =3D "1" + +S =3D "${WORKDIR}/git" + +#
> > Override do_kernel_configme to avoid kernel being assembled into a
> > linux-yocto +# style kernel +#
> > https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#re=
f-tasks-kernel_configme
> > +do_kernel_configme[noexec] =3D "1"
> >
>
> What are the benefits of using linux-yocto when building an upstream
> kernel? Most BSP typically define their own linux.inc file and
> do_configure task. I am curious about your approach here, since I
> haven't seen that before.

The original idea was to use as much as possible the linux-yocto
existing infrastructure and disable what we did not needed, but your
approach also makes sense.

For you this is a shipstoper? or can we go like this and change this
in a follow up patch?  What I really want is to have as much as
possible with sync with the existing recipes, and when we swap to the
ones in this meta-arm then cleanup any notes.


------ Cheers, Rui
>
> +
> > +# Make sure no branch is defined since here we track a specific
> > version +KBRANCH =3D "" + +LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814" + +SRC_URI =3D
> > "\ +        git://
> > git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=3Dhttp=
s;nobranch=3D1
> > \ +        " diff --git
> > a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> > b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb new
> > file mode 100644 index 000000000000..88a06c4bb3c0 --- /dev/null
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> > @@ -0,0 +1,8 @@ +# Add support for Upstream Kernel for Arm
> > Platforms (boards or simulators) + +SUMMARY =3D "Linux Kernel
> > Upstream, supported by Arm/Linaro" + +require
> > recipes-kernel/linux/linux-upstream-arm-platforms.inc + +SRCREV =3D
> > "v${PV}" +LINUX_VERSION ?=3D "${PV}" --
> > 2.25.1
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments
> > are confidential and may also be privileged. If you are not the
> > intended recipient, please notify the sender immediately and do
> > not disclose the contents to any other person, use it for any
> > purpose, or store or copy the information in any medium. Thank
> > you.  
> >

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
