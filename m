Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.63])
 by mx.groups.io with SMTP id smtpd.web10.7536.1605618006951213717
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 05:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Lxph4yQr;
 spf=pass (domain: arm.com, ip: 40.107.4.63, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzvxAir5EyOnQU9J6LShMJii9OAtF0MKB5IRECsMZo0=;
 b=Lxph4yQrgfFJ9ja/EdOWfYAh0NNB7dVbvAnaawbC46EVtH9oJpPwrBO/2xKLKhnPdUL1ua+YQDOYOznW3ZqfMDERTGTGj1douvJRtAhKtnm34SQR1t28HZn+YkVj91DRPrEZbski0U/DSBqu6D/vHV7s0u90TbGi75VCyM61WSs=
Received: from DB6PR0201CA0021.eurprd02.prod.outlook.com (2603:10a6:4:3f::31)
 by AM6PR08MB4486.eurprd08.prod.outlook.com (2603:10a6:20b:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 13:00:03 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::3) by DB6PR0201CA0021.outlook.office365.com
 (2603:10a6:4:3f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 17 Nov 2020 13:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 13:00:02 +0000
Received: ("Tessian outbound 814be617737e:v71"); Tue, 17 Nov 2020 13:00:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e77f91693c659732
X-CR-MTA-TID: 64aa7808
Received: from a159ebddf6f9.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 419E6AB6-C9BD-440A-802E-20100C6E6174.1;
	Tue, 17 Nov 2020 12:59:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a159ebddf6f9.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 12:59:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/tqeBmw5tWeT6f5ghoWiO6ODgSM2ed2adJx27yEYyHuDKVrGJQl04GA91WYNdOuFJn3w/bjJpHm8wB1dwuLlJYyBR4DVxZkBGB0oeIVgnjjiQFHPYth6QTVB7rcOuBsRpbM+TQcdcHAdgfwWwkuLQj9u7F4M11zgGH/rBVp1kGTEFAtDy6UmsCQf3c83a6Wc8MCcD88lv9R6NBkcUm7aC8tMvTZeflVnwOV+Ar8u2wXM8WegpyNyL6E5mVjqxYrbK9+8mDnQ9O0ByUESQWeJBYIYsl7/Sm3ogT5WjqzpzeddBmlebKAvfhCY9Qww4pP6CEYHEbz2VAxdQSkcUXr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzvxAir5EyOnQU9J6LShMJii9OAtF0MKB5IRECsMZo0=;
 b=KmvOESwGrGRmheFH7hTafdr7XNNfqCXhJ905V94uO1/2Gx4mP4Dv3MFFt/smdxJ3st+pPQaMymDao4RyR2dGhGp8nvC0yJjDspDq7yAhngiPBpMHPDrTbSThC7xnbLASIarvIevpOvh5HwFNVgoKA1rrqAQR2HbvFijVs+UMtni+goibyrMsVQE+MozyHs8EL4/4XIiA5jaqYEatBjWymRT5h2hp8JjcdqQCORtZaDj9aklmwZyOS2uylNHvY+X36K9qFbn+bIUYrWtDl5hFo/U36Qct21J/lqwds5W6v3ZG3Na4LnIP+vDdGlOJRYZy3z/D1HptZzYvGTm561XYeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzvxAir5EyOnQU9J6LShMJii9OAtF0MKB5IRECsMZo0=;
 b=Lxph4yQrgfFJ9ja/EdOWfYAh0NNB7dVbvAnaawbC46EVtH9oJpPwrBO/2xKLKhnPdUL1ua+YQDOYOznW3ZqfMDERTGTGj1douvJRtAhKtnm34SQR1t28HZn+YkVj91DRPrEZbski0U/DSBqu6D/vHV7s0u90TbGi75VCyM61WSs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM8PR08MB5778.eurprd08.prod.outlook.com (2603:10a6:20b:1d1::24)
 by AM8PR08MB5828.eurprd08.prod.outlook.com (2603:10a6:20b:1df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 17 Nov
 2020 12:59:53 +0000
Received: from AM8PR08MB5778.eurprd08.prod.outlook.com
 ([fe80::840b:48c7:161b:976a]) by AM8PR08MB5778.eurprd08.prod.outlook.com
 ([fe80::840b:48c7:161b:976a%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 12:59:53 +0000
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 2/2] arm-autonomy/arm-autonomy-host-image-minimal: Added multiconfig support
Date: Tue, 17 Nov 2020 12:59:21 +0000
Message-Id: <20201117125921.13879-2-Nathan.Dunne@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117125921.13879-1-Nathan.Dunne@arm.com>
References: <20201117125921.13879-1-Nathan.Dunne@arm.com>
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO2P265CA0062.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::26) To AM8PR08MB5778.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d1::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (217.140.106.53) by LO2P265CA0062.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 12:59:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e10ac080-41a0-4e68-9c0a-08d88af8b2c8
X-MS-TrafficTypeDiagnostic: AM8PR08MB5828:|AM6PR08MB4486:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4486C7EF851297661E374E748DE20@AM6PR08MB4486.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 H8Xy7Maeeeb5fenXf9Wsi0wR24r2Rxcwau9xvmqA2bnPDtXN2I6s0lbrQmjp5QwvBx4nCXpyNTSeuu8dpmhuGcL2adLQ89UQk8aNcO0gJcGVsSo+/7dteXLLgDBWzsnLjGL2zBSlTAX+CXlg2l5FcuCMLJS2tiVbFL08DwFuuwUKT0jenRGB8NPMwpKg8LQHBhAfZ6EaAVVJvn3t9ak4RiQWPvof9Q68Ra2kCuiud9zahuZWfBFurOjDy9l4G+Vlyo5+Cu6fRVfsEQBxAAUBZhQBeviNLjvEPSVOXliF4oMRdV86tSRFqaG0FJOYqm0gvlNZC/gY/2488K6Yv26a+YYy4TKZDHqPgSGAGXa2+I+5CwOtpzWpK6ci5CvguyB9jqw+7Cy7e8qDnEyU6bpEZQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR08MB5778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(396003)(366004)(136003)(478600001)(6916009)(26005)(36756003)(86362001)(66556008)(66946007)(66476007)(316002)(1076003)(5660300002)(2616005)(52116002)(6486002)(8676002)(16526019)(186003)(7696005)(8936002)(956004)(6666004)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 r6qxgYW6Htd9fHFNCh27KswIR8Fo8ptcoi/c9+EqPFSOj7a9/YaD2OETNSbGYkOz55BrTrtdwS1Ksx2S9ivBx5SM4AtxZvX+Kh2KGzw1tBq1Ze6TQCAHEWlRtArR/FU4FyM8+3HR+Sxni2vI8/D8UqqlmQzGOxjKidAUFOFcV+NWL7UHSv7f07/uz5z+7qL4BZHcX4rY12UO7F3Rqt0Oh+OJPGoesee243qTO/C+tKTYRSxaD1winV9yyaI748l+qq66UNOcbnlRwlTOsZb8A93BR5MGtmcnSm+2q3Dl2vA84DDKHgYHdY+FvFapwmBM4lS6X1TeId9+nk5gnIEUSPh630MSuZwubTTqi4yppChXtcfLgNYkWAnOF0F0B/UF0HlDLy1brY2yXB+aF41BN1T/sJSQGqf0xojLftZswKdG8T2OwNOoZFSjAcryl/iJ8jGuOID41bdq40qcSLz3pxD8pfv9nepTisvPq0fAzPLR33jXeeg6AIy6uPQZ7E6naVsVvZhiq+ApCLZywAUMQiCNtk9UeK+8r2LnvQcpbxkQYseP6uwP7sKxcjTlMUje5wBGVdPWeFwQp9TwfoomzXrELBlBSIMamXWPKIo4BnxtiwmJfiyAyjK7KVUh5lEiMxVV1Mr3CxuVlkHPM8qsyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5828
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7ab403e3-0dda-4bf8-71bf-08d88af8ad0f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q2/rM5qoQmgM0Y7dPAuf7ItZ/0Dvax0RbJGF3LmzseeOYQg3M9kHAHOG/i08fZ8PquZ0b+KTOSA9OFnqoVdnCsf31zZUwQJ42OSoDPuK9WPTiCyTeJieRIhfZFTl4riVXFV7zpRe9pDnqu61sXAWF1OEVqstHsPlXXBg0TR/ER05IitUeH0nlOeDbg6fjfhrisIeKyDQ3KL6EigLR4e1rR8qMjeqFMmWILNfCWIgfEzzaWKAmhHkBtr3mKhoMzsNLSpjrdStq50XbgGHBKW47/o612LoJF1h+VhALDgsc7b/XpuUrZOoGOFdOfdvIjS3RlXgpWVcRDB7eNerOM3cj1Xgrq6fvOaWZHiaRI17fNyCj0ZdUgGyRI3qm9Nfr1qT7tclxDS5T0Q9FIeZaCz/B1iLyijECz1oHS7A7UEtJ903+6eY+NuUVkE4pNijZy9xfvj4CWge5JQBmWuL6R3rfUF1xGONsN0CT/gqXc5z6n0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966005)(81166007)(5660300002)(2616005)(1076003)(86362001)(4326008)(6486002)(82740400003)(70586007)(70206006)(356005)(16526019)(186003)(36756003)(26005)(956004)(47076004)(478600001)(2906002)(6666004)(6916009)(7696005)(8936002)(8676002)(82310400003)(316002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 13:00:02.8869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e10ac080-41a0-4e68-9c0a-08d88af8b2c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4486
Content-Type: text/plain

Added new documentation file arm-autonomy-multiconfig.md which explains
how to set up a multiconfig build, where both the host and guest are
built simultaneously in the same build dir.

To enable this feature the dependency between host and guest is set in
the image recipe, using the variables described in the documentation.

Issue-Id: SCM-638
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Iae315c128dc6d2b39281312bc1a2ab9b88f6241e
---
 .../documentation/arm-autonomy-multiconfig.md | 161 ++++++++++++++++++
 .../documentation/arm-autonomy-quickstart.md  |   3 +
 .../images/arm-autonomy-host-image-minimal.bb |  18 ++
 3 files changed, 182 insertions(+)
 create mode 100644 meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md

diff --git a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md b/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
new file mode 100644
index 0000000..8c33501
--- /dev/null
+++ b/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
@@ -0,0 +1,161 @@
+arm-autonomy Multiconfig Build Environment Instructions
+==================
+
+This documentation explains how to simplify the process of building hosts
+and guests in a single bitbake command, rather than in seperate build
+folders. You can read more about multiconfig in the bitbake documentation:
+
+ - [bitbake user manual](https://www.yoctoproject.org/docs/latest/bitbake-user-manual/bitbake-user-manual.html)
+
+To achieve a multiconfig build, a number of different config files need to
+be created in a single build directory.
+
+Create a new project
+----------------
+
+Before you start, you will need to follow the instructions in
+"Create a project" from the quickstart guide, to create a new project
+directory with
+  ```
+  oe-init-build-env my-mc-project
+  ```
+Ensure it has all the required layers in bblayers.conf as listed in
+`arm-autonomy-quickstart.md`. The result should be a directory containing:
+
+```
+-- conf
+ | -- bblayers.conf
+ | -- local.conf
+ | -- templateconf.cfg
+```
+
+Add multiconfig
+----------------
+
+Here are the steps required to make the project build both the host and any
+number of guests as required.
+
+1. Create a new directory under `conf/` named `multiconfig/`
+
+2. Create two new files in this directory:
+`multiconfig/host.conf`
+`multiconfig/guest.conf`
+These files will contain any configurations that a specific to either the
+host or the guest
+
+```
+-- conf
+ | -- bblayers.conf
+ | -- local.conf
+ | -- templateconf.cfg
+ | -- multiconfig
+    | -- host.conf
+    | -- guest.conf
+```
+
+3. In `local.conf` the following config variables must be added:
+
+```
+MACHINE ?= "fvp-base"
+
+# ---Guest Config Start--- #
+MC_GUEST = "guest"
+
+MC_GUEST_NAME = "guest1"
+
+MC_GUEST_IMAGERECIPE = "core-image-minimal"
+MC_GUEST_MACHINE = "arm64-autonomy-guest"
+
+MC_GUEST_INITRAMFS_IMAGE_BUNDLE ?= ""
+MC_GUEST_INITRAMFS_IMAGE ?= ""
+
+# Uncomment for initramfs
+#MC_GUEST_INITRAMFS_IMAGE_BUNDLE = "1"
+#MC_GUEST_INITRAMFS_IMAGE = "${MC_GUEST_IMAGERECIPE}"
+
+# These variables are set automatically, don't edit them!
+MC_GUEST_FILENAME_PREFIX = "${@ 'Image-initramfs' if d.getVar('MC_GUEST_INITRAMFS_IMAGE_BUNDLE',d) else '${MC_GUEST_IMAGERECIPE}' }"
+
+MC_GUEST_FILENAME = "${MC_GUEST_FILENAME_PREFIX}-${MC_GUEST_MACHINE}.xenguest"
+
+MC_GUEST_DEP = "${@ 'virtual/kernel:do_deploy' if d.getVar('MC_GUEST_INITRAMFS_IMAGE_BUNDLE',d) else '${MC_GUEST_IMAGERECIPE}:do_image_complete'}"
+
+MC_DOIMAGE_MCDEPENDS += "mc:${MC_HOST}:${MC_GUEST}:${MC_GUEST_DEP} "
+
+BBMULTICONFIG += "${MC_GUEST} "
+
+ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS += "file://${TOPDIR}/${MC_GUEST}/deploy/images/${MC_GUEST_MACHINE}/${MC_GUEST_FILENAME};guestname=${MC_GUEST_NAME} "
+# ---Guest Config End--- #
+
+# ---Host Config Start--- #
+MC_HOST = "host"
+
+BBMULTICONFIG += "${MC_HOST} "
+# ---Host Config End--- #
+```
+
+These variables will be used in both of the multiconf files. `MC_HOST` and
+`MC_GUEST` should not be altered without renaming the conf files, but most
+`MC_GUEST_*` variables can be customised if you desire.
+
+4. Next set the contents of `multiconfig/guest.conf`:
+
+```
+TMPDIR = "${TOPDIR}/${MC_GUEST}"
+
+MACHINE = "${MC_GUEST_MACHINE}"
+DISTRO_FEATURES += " arm-autonomy-guest"
+
+INITRAMFS_IMAGE_BUNDLE = "${MC_GUEST_INITRAMFS_IMAGE_BUNDLE}"
+INITRAMFS_IMAGE = "${MC_GUEST_INITRAMFS_IMAGE}"
+
+IMAGE_FSTYPES += "${@ 'cpio' if d.getVar('MC_GUEST_INITRAMFS_IMAGE_BUNDLE',d) else ''}"
+
+# ANY OTHER GUEST CONFIG
+```
+
+This contents shouldn't be changed directly, rather change the equivalent
+config in local.conf. You can append any other config desired for the
+guest at this point, for example `XENGUEST_IMAGE_DISK_SIZE`
+
+Make sure not to change `${DEPLOY_DIR_IMAGE}` to anything other than
+`${TMPDIR}/deploy/images`, as this is assumed by local.conf.
+
+5. Lastly set the contents of `multiconfig/host.conf`:
+
+```
+TMPDIR = "${TOPDIR}/${MC_HOST}"
+
+DISTRO_FEATURES += " arm-autonomy-host"
+```
+
+Building the image
+----------------
+
+To build the multiconfig image the command is:
+```
+bitbake mc:host:arm-autonomy-host-image-minimal
+```
+
+You should see that this triggers guest tasks to be built in
+parallel. Once the build completes the guest will already be in the
+rootfs of the host thanks to `ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUEST`
+
+The deployed image including the guest will be in `host/deploy/images/`
+
+
+Multiple Guests
+----------------
+
+To have multiple guests with the same config the line which appends to
+`ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUEST` just needs to be duplicated with
+a different guestname.
+
+To have different config for each guest, each will need its own config
+file similar to guest.conf, ensuring TMPDIR is set to a different path,
+and everything between `---Guest Config Start---` and
+`---Guest Config End---` will need to be duplicated.
+
+Any copies of variables that start `MC_GUEST` must be altered to avoid
+collisions (e.g. `MC_GUEST_2_*`), and the name of the conf file must also
+be added to BBMULTICONFIG.
diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
index 13b588f..2aa42d3 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
@@ -147,6 +147,9 @@ To create a guest project:
 The build will create a ".xenguest" image that can be use on an host project
 with the xenguest-manager.
 
+The guest can also be built as a 'multiconfig' sub project of the host, see
+`meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md` for more information
+
 Include guests directly in the host image
 -----------------------------------------
 The layer provides a way to directly include in the host project one or several
diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index 47a07cd..74e37ca 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -50,6 +50,24 @@ EXTRA_IMAGEDEPENDS += "xen"
 # Build xen-devicetree to produce a xen ready devicetree
 EXTRA_IMAGEDEPENDS += "xen-devicetree"
 
+# Documentation for setting up a multiconfig build can be found in:
+# meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
+
+# In a multiconfig build this variable will hold a dependency string, which differs based
+# on whether the guest has initramfs or not.
+# It may have a space seperated list of dependency strings if mulitple guest types are
+# configured
+MC_DOIMAGE_MCDEPENDS ?= ""
+# Example value: mc:host:guest:core-image-minimal:do_image_complete
+
+# In a multiconfig build the host task 'do_image' has a dependency on multiconfig guest.
+# This ensures that the guest image file already exists when it is needed by the host
+DO_IMAGE_MCDEPENDS := "${@ '${MC_DOIMAGE_MCDEPENDS}' if d.getVar('BBMULTICONFIG') else ''}"
+
+# Apply mc dependency. Empty string if multiconfig not enabled
+do_image[mcdepends] += "${DO_IMAGE_MCDEPENDS}"
+
+
 python __anonymous() {
     if bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', False, True, d):
         raise bb.parse.SkipRecipe("DISTRO_FEATURES does not contain 'arm-autonomy-host'")
-- 
2.17.1

