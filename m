Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.80])
 by mx.groups.io with SMTP id smtpd.web12.5912.1605607519233914290
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 02:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9+d8CaUX;
 spf=pass (domain: arm.com, ip: 40.107.1.80, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT5VVzL9HlR23+L9+xNUbnOU4caaVyNnY9ERLW7Dakc=;
 b=9+d8CaUXlUz6Kts2yyDs30kMmwHTPdCQVdm8V5zF70XbTlafTKE8ulpSEB3Rb74bn/5itymETivJX6qzgHfaKcR4bU0ReFqL4QaYipFq7PpFs+Poyo9/YzMGoDIiP1648zfeeYXoT7b+H5V1jGcAKAB+IwRX0lbQupw2MkD5Ugk=
Received: from DB6PR0801CA0045.eurprd08.prod.outlook.com (2603:10a6:4:2b::13)
 by DB6PR0802MB2246.eurprd08.prod.outlook.com (2603:10a6:4:86::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 10:05:16 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::7a) by DB6PR0801CA0045.outlook.office365.com
 (2603:10a6:4:2b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend
 Transport; Tue, 17 Nov 2020 10:05:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 10:05:16 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Tue, 17 Nov 2020 10:05:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e68011edd6774d41
X-CR-MTA-TID: 64aa7808
Received: from dcbfbd8264e7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FD11D86F-E7FA-4E53-8630-41B759F0067F.1;
	Tue, 17 Nov 2020 10:05:04 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dcbfbd8264e7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 10:05:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1w5i52g48g8AYJ19V/rGz7dl9ulNU+TU75QA3VdCqfIMIPSZELKwqyJOaPSJropeekY+uvResmsrQbvLA5v8KfsMHJl1O98OOre+6wVzyjnTJC7ndhEtUOow0gmL/VN7sqse6bshdy/IqT5qyBOWlVwWUbD+oRn4IlqITAgKQxb9dAAT0cMD0XxQFLH+Uu8x3yBrJGdfI7Df63M1taChMbENFDW0cDOE/I5k1AytYw4fib/vpKBtEAY5yW7qgIe90MBFHR2gNAFlIlEPfafCkQZPQP3SRp09rhDb4nh/P0AuToofNZ6KwuW6hu7bxbM0zpLv3RCQdo/OO/1Bc1l6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT5VVzL9HlR23+L9+xNUbnOU4caaVyNnY9ERLW7Dakc=;
 b=MkeRef6NNbc7akdyPnFB0gM3/ob/8tooyrG41Opg/m2zPO85Bq7tmvbw/CERC6+K7GGyE9Vvqe4FitFW9QXzhr0OBebxuYahAIobFvM050GBrkl2qpXASbISxa4ZaixqOk0QDlPbtgdrLBxrIGzfwnSlLn7h0Pxx2yTdJ/4YCuvaaxSzDLDGc4IIvrUr+qoFvEdCkLxeoYxSYaYoPR7zrn9Qi9Kc+Vwq/RZknUTZb6M5gcCj8jWBLtovfVZi/6wSDT6aemte55DLE6Re/DZBzyX52QVM6069DZqiCmgYwva9PdA7q9Xto1Ry4aJix5vdsMEEe6TFisVOVPUYEAckrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT5VVzL9HlR23+L9+xNUbnOU4caaVyNnY9ERLW7Dakc=;
 b=9+d8CaUXlUz6Kts2yyDs30kMmwHTPdCQVdm8V5zF70XbTlafTKE8ulpSEB3Rb74bn/5itymETivJX6qzgHfaKcR4bU0ReFqL4QaYipFq7PpFs+Poyo9/YzMGoDIiP1648zfeeYXoT7b+H5V1jGcAKAB+IwRX0lbQupw2MkD5Ugk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB2998.eurprd08.prod.outlook.com (2603:10a6:209:4e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 17 Nov
 2020 10:05:02 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 10:05:02 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 0/8] arm-autonomy: Add support for building/installing an alternate kernel
Date: Tue, 17 Nov 2020 10:04:41 +0000
Message-Id: <20201117100449.20111-1-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.50) by LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 10:05:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a0aaa62e-fe2f-4488-72df-08d88ae0484e
X-MS-TrafficTypeDiagnostic: AM6PR08MB2998:|DB6PR0802MB2246:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB224601FD233BDA25C0072DB992E20@DB6PR0802MB2246.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gu5cOqgdbqMpg/2/GQQyTPnKUanNOZG4FBYZ24NkP+5fB0geb6OIdgXqHy+3irSTwLpoRijBszNAL/NoaG0aeNsgEvpRPntPkzk9CwMSfXFInWEfSbF04756QoXQi4BX/pW1tfUKNAdH2CZapKPRooIr9Ls0Gv3c8Xa++9foeeYp/Q04v27HnKt8XGwRorbkGppGR/2awpMgxf63RxOVpf7PvnFbp0JxOor/+CZu+4HMaWV4J54Bq+OCZYoYmS+mVS9H06eY+b8GxO8c5BqkpkD92DwRnQ88hB2zo7oQQ4YwuEw3A39U0ixbTgVA0i5TBe2IAKn3RRlO6rsLAwAXzyUCsrwCcmmOdXJp22i2KA8JsHDr2YPvSzALPPbMmdy1
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(66556008)(5660300002)(86362001)(66476007)(66946007)(6486002)(316002)(6916009)(83380400001)(44832011)(36756003)(16526019)(8676002)(8936002)(2906002)(186003)(6666004)(1076003)(956004)(2616005)(26005)(52116002)(7696005)(478600001)(4326008)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 dHmNTsTv7mTugdF8IKrFb5oS2fqtSIZCOZD7/+ODMaMvtnitzAbL8nlj6XE5V1hA8T8n+g2QVR0rnJ2kEC/gHnDorYnbjllbmM0w3SVN2aXqMIHuBqPX7qBHVRI+CT9hN/odjeYuysk2tVzfKShgxFPgt2s0iMs20cTiceYvXSKKSNIDru3Xij6m2kDW0c7MX+10TZDgxV8fgQ8x3d6RskLfaPTvocsAXTcHXN3cwGrhQzy2nbPK1w0FJbAirDZFeqsVeOqLMbywaAxE/s0oMng51dmjHQ+mC7MUv1E7dapUG+05fHt0vAcFYLhSFFvXnQCXqnqaWhAQJU1APhLvDcNQJe9vWQzx/79OLVUhJJOZcH0A5Zvyi5v1zI662gEnQoDwdNVEv3E8Tq9IJ9mlvcSECE4BvcE6tlB5Z0/K2lcSO67Bv0IK2mCluijizajlycxBxlsHMzKNAqUA9upd555ApdhPCZRYejY/ou59jb2T/nR7WkFOfJAw1fkWWxd/q9rbnCPWz2wbJZtYA/aYxsjii20+IUETkHYm51HekRsm1/CQBvIEUWis6o8YZqbLDYT07koUxmbu2VgVrvFBR4aeMiay5EPhxfEODhJRTX0Sm2khSW0hviKTguM0EspQSD41HUy//qC/QNVcCdRlww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2998
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5d0446e1-592f-42e3-2b05-08d88ae03f9c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OnO2g3YeTAK3wXsUVZ8Q2Ti2QzBtDpncEjiTJQes/WL0lx86cFosgLBvy1bnPqOcGgAkieqwfpy/dCun88h0JBcP7X+lRWr7LVDd63XcVkg1SvyTq1r64BOkKg6DwT/hPdR+2Ei5dmn7vy0jpfxxctLzlZ05eLVYUf7X5knPRNMaoL+lLibgTlfZtFOjPHKVK83QviQp1WrhDVoOmIiIln/WuxU111iIAGA0HGXVRHBPCFTqBfPAv6FdzP8UPpQo8ZsQ2J0uO6aebcfq4sRnLujuMsYoRn4UzeO+PAfIk1SR1NOjNOQt+pZc2J243JnO4XsXmVrSSHwYgLmmk3ZF6nrKKEODr0mCMNooUcll+BqcJkA9m4wV20KRts7BuDSaAZl+tvQuMiI+g6fi+m3btN5M4XDlR0CZvO6s24uINGM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966005)(356005)(81166007)(7696005)(86362001)(6486002)(336012)(26005)(83380400001)(6666004)(1076003)(2616005)(316002)(956004)(6916009)(8676002)(44832011)(82310400003)(82740400003)(8936002)(70586007)(16526019)(70206006)(36756003)(4326008)(47076004)(2906002)(186003)(478600001)(5660300002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 10:05:16.3053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0aaa62e-fe2f-4488-72df-08d88ae0484e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2246
Content-Type: text/plain

This patch series introduces the support for building and installing an
alternate kernel image and modules in an image. The alternate kernel inclusion
is controlled via the 'alternate-kernel' DISTRO_FEATURE.

The alternate-kernel.bbclass is to be inherited by image recipes and requires
the PREFERRED_PROVIDER_alternate/kernel and
KERNEL_PACKAGE_NAME_pn-atlkernel-recipe to be set. The class will also install
the kernel-modules package for both virtual/kernel and alternate/kernel.

Also, a patch is introduced in linux-linaro-arm-rt recipe to fix xen behavior
in kernels with PREEMPT_RT. The preempt-rt-extras.scc KERNEL_FEATURE was added
to linux-linaro-arm-rt in order to accomodate extra kernel configs for
arm-autonomy based projects.

For N1SDP machine, all the required settings are done to include the
alternate-kernel as well as the GRUB config file to boot it.

The last two patches are fixing an erroneous behavior of the modutils.sh
initscript where the depmod command fails to run when the '/' is firstly
mounted as ro. A proper investigation will be done with oe-core only, and if it
is reproduced with a qemu machine, the fix will be sent to the upstream
project.


Diego Sueiro (8):
  arm-autonomy/linux-linaro-arm-rt: add linux-RT patch for xen dynamic
    events
  arm-autonomy/linux-linaro-arm-rt: Add preempt-rt-extras.scc
    KERNEL_FEATURE
  arm-autonomy/classes: Introduce alternate-kernel.bbclass
  arm-autonomy/arm-autonomy-host-image-minimal: Build/Install alternate
    kernel
  arm-autonomy/n1sdp: Add support for building/installing alternate
    kernel
  arm-autonomy/n1sdp: Add GRUB config when including alternate kernel
  arm-autonomy/init: Change execution order between modutils.sh and
    checkroot.sh
  arm-autonomy/modutils-initscripts: Fix modules.dep update

 .../classes/alternate-kernel.bbclass          | 26 ++++++
 .../conf/machine/n1sdp-extra-settings.inc     | 44 +++++++++-
 .../arm-autonomy/preempt-rt-extras.cfg        |  7 ++
 .../arm-autonomy/preempt-rt-extras.scc        |  3 +
 ...asteoi_irq-to-handle-xen-dynamic-eve.patch | 80 +++++++++++++++++++
 .../linux/linux-linaro-arm-rt_5.4.bbappend    |  7 ++
 .../wic/arm-autonomy-n1sdp-rt-grub.cfg        | 28 +++++++
 .../images/arm-autonomy-host-image-minimal.bb |  4 +
 .../initscripts/initscripts_1.0.bbappend      |  5 ++
 .../modutils-initscripts.bbappend             |  6 ++
 .../fix-modules-dep-creation.patch            | 33 ++++++++
 11 files changed, 242 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-autonomy/classes/alternate-kernel.bbclass
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.cfg
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.scc
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt-5.4/0001-xen-use-handle_fasteoi_irq-to-handle-xen-dynamic-eve.patch
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bbappend
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-rt-grub.cfg
 create mode 100644 meta-arm-autonomy/recipes-core/initscripts/initscripts_1.0.bbappend
 create mode 100644 meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
 create mode 100644 meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch

-- 
2.17.1

