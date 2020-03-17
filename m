Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.58])
 by mx.groups.io with SMTP id smtpd.web12.6971.1584454868517259800
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2020 07:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=n9VlvhKh;
 spf=pass (domain: arm.com, ip: 40.107.8.58, mailfrom: rui.silva@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsrl0I4BTOKn+62KpD7e0jzvqqgjTENFG+hWXhmtRk0=;
 b=n9VlvhKhVKTdt3OAbKerqznwVgaFcPnu3USRbMz2Kus6QGYtIFrQkXGHCpWhUzLlvTzBc5AbbsoL0SYE652kdvrSiJ3pmzBN1Uxyr/qC64OGMvTcBQ2KmKzVLiJc8yLsxe8nNGQPQj8ENhlmBG4Gp9vAyq6eByQQbuvYrMhjhI0=
Received: from DB8PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:10:be::23)
 by HE1PR0801MB1787.eurprd08.prod.outlook.com (2603:10a6:3:80::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22; Tue, 17 Mar
 2020 14:21:05 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::f4) by DB8PR03CA0010.outlook.office365.com
 (2603:10a6:10:be::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.18 via Frontend
 Transport; Tue, 17 Mar 2020 14:21:03 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Tue, 17 Mar 2020 14:21:03 +0000
Received: ("Tessian outbound 3a0cbd311638:v42"); Tue, 17 Mar 2020 14:21:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 554c8d44fa778865
X-CR-MTA-TID: 64aa7808
Received: from ebafd28df08d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 29DD6FF9-A5FF-4CD4-A1F4-96AE5DDFD67B.1;
	Tue, 17 Mar 2020 14:20:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ebafd28df08d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Mar 2020 14:20:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heVYsN0U67BsIGsR2tvr5Tp1iF/SPnj61hw5z29V9ewkXeypfzcyaDXL8y11NCYbJcTtbzRzivKRAwbREV0yw9JLrLqp5r3OvJXsV9G8xRo9oNjsg9EKrSmBoFWYiRTeU4HeNvbW/1F/XzOhzHeRdZr1V3EuSlhGBkb/CrkQbpby6yqOs9x8lYkwol7+Em4yoC9pSyJWW1WnPrTfZYLxVZVc4caUWHdYCxFoK7F2ETeJ30KkEXsX6RWGDcpqcbxquafx1G6S3DpgO0Elz40ja/yiXBL0I3G3ppMqGQE1wqPXSXnPA8YAkftNGvX1ylM1NokRVKh/bmtUMDs99qfOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsrl0I4BTOKn+62KpD7e0jzvqqgjTENFG+hWXhmtRk0=;
 b=jpE1XLYjef7cmACGCdcdX8Ji6DPsDT/vjXYmL1+MNndrmxbNLh0z9YRZK5SPwMPYAnr5AfVyOXaQXTdmv73oor6j3cEmDFV0d5yR9fzZ2F1Lw4jeFDtqTY/ivGahwMr1b8t6gPpXgY9RovbHL+M34Llbgv67ZnlvZsDnpTHEzv9+rmC+/8tOVqzjSg7AGpWNBDe9z0nbI4Y79c9NZ7vMQ0nTTv6E5104vNseGmZ9qk9qLmwQADuudiZJPFSiMYKiJpu5pXWeDy8L7iVdBXD3i6ryIVE2OfscpO12w3wfJUM4K504TqZR7Ar+qmC4FDueGTywi6G6kl72PF1ekMEcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsrl0I4BTOKn+62KpD7e0jzvqqgjTENFG+hWXhmtRk0=;
 b=n9VlvhKhVKTdt3OAbKerqznwVgaFcPnu3USRbMz2Kus6QGYtIFrQkXGHCpWhUzLlvTzBc5AbbsoL0SYE652kdvrSiJ3pmzBN1Uxyr/qC64OGMvTcBQ2KmKzVLiJc8yLsxe8nNGQPQj8ENhlmBG4Gp9vAyq6eByQQbuvYrMhjhI0=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Rui.Silva@arm.com; 
Received: from HE1PR0801MB2044.eurprd08.prod.outlook.com (10.168.95.21) by
 HE1PR0801MB2041.eurprd08.prod.outlook.com (10.168.98.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14; Tue, 17 Mar 2020 14:20:55 +0000
Received: from HE1PR0801MB2044.eurprd08.prod.outlook.com
 ([fe80::42b:e060:9180:6be]) by HE1PR0801MB2044.eurprd08.prod.outlook.com
 ([fe80::42b:e060:9180:6be%8]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 14:20:55 +0000
Date: Tue, 17 Mar 2020 14:20:51 +0000
From: "Rui Miguel Silva" <rui.silva@arm.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp: add upstream kernel inc and v5.3 recipe
Message-ID: <20200317142051.xy2lidocvddepok7@arch-thunder.localdomain>
References: <20200311105643.159467-1-rui.silva@arm.com>
 <20200311105643.159467-2-rui.silva@arm.com>
 <CAP71WjwuG4saWcZSvYxGxxpQ3_c2OEVhmg+AEwWGbn6wQpw4uA@mail.gmail.com>
 <20200311154550.tgm2itol32jpsxh6@arch-thunder.localdomain>
 <CAP71WjweYCKx42HtMVuerxE_hBGHzq7J_46kK6056itQJFhSgQ@mail.gmail.com>
In-Reply-To: <CAP71WjweYCKx42HtMVuerxE_hBGHzq7J_46kK6056itQJFhSgQ@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0070.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::34) To HE1PR0801MB2044.eurprd08.prod.outlook.com
 (2603:10a6:3:50::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from arch-thunder.localdomain (109.49.46.234) by MR2P264CA0070.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.18 via Frontend Transport; Tue, 17 Mar 2020 14:20:54 +0000
X-Originating-IP: [109.49.46.234]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fce97ccb-f52e-46c6-ddad-08d7ca7e6ccb
X-MS-TrafficTypeDiagnostic: HE1PR0801MB2041:|HE1PR0801MB1787:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB178764BC99CA1E7B337D1AFFEAF60@HE1PR0801MB1787.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(199004)(1076003)(6666004)(66476007)(66556008)(9686003)(26005)(55016002)(66946007)(186003)(16526019)(6916009)(316002)(2906002)(5660300002)(966005)(956004)(478600001)(81156014)(8936002)(53546011)(4326008)(86362001)(8676002)(52116002)(7696005)(6506007)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0801MB2041;H:HE1PR0801MB2044.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JFaYVudICYy1/zNMxlyY4zHytLcywsZ3YgG/OSH9NzAUnRlBSjgeQqJvn8y1+zQsvdTHtKm7Quj7SZmG1GhZax2hAANycNGWlqD/6buTpca4WewLD8eFNKn/u3r8t/CJyuU1wRgB9zhWnZiy8y62bw/CMbsX8Eizs+ul7oxyzrJCiM/HGNruUedwg4pp8svmjXoPXW4BvhEhzZtYyMMYrCHY3A3w+bJGVLrE6ZDgdIrarjx/VuiAP58lQtra8x4ZjUFaIopjo3Zxbb0Dsi5TsOA31OR6lCG0D8LfUo2EGJVhpp+1hEoss0Je5MQKW5e358ZXTqk/+hFzsJK00RXunhTu7hvunWqfruHEDpbsIkxZMY441n2/KTTdePPs9LQOoGMS/IYaW3DxLD84GthBS8mbHNxbYW3+pwAlH8HCpYf7g7UuvgbVS4e+FEphX7uiE/WRB2t/O4dLWurqb7PxebHfUmZlRo9OJ9cer2ZJA9l3ZLjqmpSyiSwVkt/EHr86rKYYQgYsiNTF8enFrurJ+g==
X-MS-Exchange-AntiSpam-MessageData: 
 Sy8goJbqVA/h+dk5vyJtCC3h8OQZcN052hS4Kuk6Xf2vCLZcZAX0NzRJwfKoJMWm+imXevfaygxJkR20Oo5XieHS3Q2semu5DIp+CoOkiC32MdHKhYpb8mdZTV7inD+o4ADIiFu47+CcIcPQYrWs0Q==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2041
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rui.Silva@arm.com; 
Return-Path: Rui.Silva@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(199004)(46966005)(336012)(2906002)(956004)(316002)(9686003)(55016002)(26005)(47076004)(6666004)(356004)(16526019)(186003)(81166006)(81156014)(8936002)(8676002)(1076003)(70206006)(70586007)(86362001)(4326008)(26826003)(6862004)(478600001)(53546011)(6506007)(966005)(5660300002)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0801MB1787;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b4984825-4ca7-45f8-4b75-08d7ca7e6789
X-Forefront-PRVS: 0345CFD558
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ON0H7z0RSLZwXjN1lnsWFDhuA2k20O80vVXUL0BXa36t6in/k7P3BwI65+YE4tKhnSEQzT34dxz24vcvknyJySF57EmcjUmHw3OKiOXj00wxVsZpMu2dWT8QaP8XwFlZslpLX2aDnZ0tP+NsmsHUX5K1McSt2enAO8P11EqghsHe2tzf92bxQjXX6xceEitVhNH9lU4N9ngTPd4rg4Uuj47U9+jj5rcWwFXJkyxq5FRzBJkfE+hgtdiJnDCWQpk82vyUJS0TKTgWCvBPhv2WF0qctT1sDBUGaOIuwB/tXzZ3oR70xR+sMfSqHp2ItK6D+DkYdRpLLicvimS6++pRNUVE8EePCoSqifDpO6rj+r1ea2HSweJQLZ54SkCDPTvHCHy+hRUoClW/dO7nrvkSM0NEWOGQw6eT/Lpy1xQVei5L2jU7ftGeP0fW+xYOPdmZj2NRnYxtQ2hq25WpueWwSWND9YXmId4fq8nF/VHog33/9ziNiGlZZH/HsRkCR1AtgmhwZWFWl6G61G6Ne06LTrolWajx3lW/KuHdTKlTTm+eCTF7kaQ6InGU86oB0pu3dI/JVOoZ+D1dLaJ6kediyw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 14:21:03.6114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fce97ccb-f52e-46c6-ddad-08d7ca7e6ccb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1787
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,
On Thu, Mar 12, 2020 at 09:11:49AM +0100, Nicolas Dechesne wrote:
[-- Type: text/plain; charset=3DUTF-8, Encoding: 7bit, Size: 5.1K --]
> On Wed, Mar 11, 2020 at 4:46 PM Rui Miguel Silva <rui.silva@arm.com> wro=
te:
>
> > Hi Nicho,
> > thanks for the review.
> >
> > On Wed, Mar 11, 2020 at 12:06:34PM +0100, Nicolas Dechesne wrote: [--
> > Type: text/plain; charset=3DUTF-8, Encoding: 7bit, Size: 3.3K --]
> > > On Wed, Mar 11, 2020 at 11:57 AM Rui Miguel Silva
> > > <rui.silva@arm.com> wrote:
> > >
> > > > From: Rui Silva <rui.silva@arm.com>
> > > >
> > > > Add support to build using the upstream (Linus tree) and as first
> > > > user add recipe for v5.3, which will be later.
> > > >
> > > > Change-Id: I0f30a45002adca7c0b95a0421e0291a6852295eb
> > > > Signed-off-by: Rui Miguel Silva <rui.silva@arm.com> ---
> > > > .../linux/linux-upstream-arm-platforms.inc    | 24
> > > > +++++++++++++++++++ .../linux/linux-upstream-arm_5.3.bb
> > > > |  8 +++++++
> > > >  2 files changed, 32 insertions(+) create mode 100644
> > > >    meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.=
inc
> > > >    create mode 100644 meta-arm-bsp/recipes-kernel/linux/
> > > >    linux-upstream-arm_5.3.bb
> > > >
> > > > diff --git
> > > > a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.i=
nc
> > > > b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.i=
nc
> > > > new file mode 100644 index 000000000000..7b73e7536d19 ---
> > > > /dev/null +++
> > > > b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.i=
nc
> > > > @@ -0,0 +1,24 @@ +DESCRIPTION =3D "Linux Kernel based on upstream
> > > > tree" +SECTION =3D "kernel" +LICENSE =3D "GPLv2" +SRCREV_FORMAT =
=3D
> > > > "kernel" + +require recipes-kernel/linux/linux-yocto.inc +
> > > > +KERNEL_VERSION_SANITY_SKIP =3D "1" + +S =3D "${WORKDIR}/git" + +#
> > > > Override do_kernel_configme to avoid kernel being assembled into a
> > > > linux-yocto +# style kernel +#
> > > >
> > https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#re=
f-tasks-kernel_configme
> > > > +do_kernel_configme[noexec] =3D "1"
> > > >
> > >
> > > What are the benefits of using linux-yocto when building an upstream
> > > kernel? Most BSP typically define their own linux.inc file and
> > > do_configure task. I am curious about your approach here, since I
> > > haven't seen that before.
> >
> > The original idea was to use as much as possible the linux-yocto
> > existing infrastructure and disable what we did not needed, but your
> > approach also makes sense.
> >
> > For you this is a shipstoper? or can we go like this and change this
> > in a follow up patch?  What I really want is to have as much as
> > possible with sync with the existing recipes, and when we swap to the
> > ones in this meta-arm then cleanup any notes.
> >
>
> again.. it's just my thoughts on this, and what came to my mind when I
> looked at your patch. But to me, we should either use linux-yocto (e.g.
> kernel-yocto.bbclass) and in which case we have to provide a kernel SRC_=
URI
> that implements the kernel-yocto mechanisms (for configure) like it's do=
ne
> in the other kernel recipe in meta-rm,  or we should use kernel.bbclass
> only otherwise. I am worried about potential issues, since i think this =
is
> pretty much an unsupported combo.. but if you tested it and it worked, i=
t
> might be fine for now..

Sorry for the late reply, it works for us, and we can/should get back
to this afterwards in a follow up series.

------
Cheers,
     Rui
>
>
>
> >
> > ------ Cheers, Rui
> > >
> > > +
> > > > +# Make sure no branch is defined since here we track a specific
> > > > version +KBRANCH =3D "" + +LIC_FILES_CHKSUM =3D
> > > > "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814" + +SRC_URI=
 =3D
> > > > "\ +        git://
> > > >
> > git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=3Dhttp=
s;nobranch=3D1
> > > > \ +        " diff --git
> > > > a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> > > > b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb new
> > > > file mode 100644 index 000000000000..88a06c4bb3c0 --- /dev/null
> > > > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> > > > @@ -0,0 +1,8 @@ +# Add support for Upstream Kernel for Arm
> > > > Platforms (boards or simulators) + +SUMMARY =3D "Linux Kernel
> > > > Upstream, supported by Arm/Linaro" + +require
> > > > recipes-kernel/linux/linux-upstream-arm-platforms.inc + +SRCREV =
=3D
> > > > "v${PV}" +LINUX_VERSION ?=3D "${PV}" --
> > > > 2.25.1
> > > >
> > > > IMPORTANT NOTICE: The contents of this email and any attachments
> > > > are confidential and may also be privileged. If you are not the
> > > > intended recipient, please notify the sender immediately and do
> > > > not disclose the contents to any other person, use it for any
> > > > purpose, or store or copy the information in any medium. Thank
> > > > you.  
> > > >
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are
> > confidential and may also be privileged. If you are not the intended
> > recipient, please notify the sender immediately and do not disclose th=
e
> > contents to any other person, use it for any purpose, or store or copy=
 the
> > information in any medium. Thank you.
> >

[-- Alternative Type #1: text/html; charset=3DUTF-8, Encoding: quoted-prin=
table, Size: 8.3K --]
IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
