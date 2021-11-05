Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AA5C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 12:57:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.71])
 by mx.groups.io with SMTP id smtpd.web08.5071.1636117026713890928
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 05:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=w5sqFP6s;
 spf=pass (domain: arm.com, ip: 40.107.22.71, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4HqQ2ZN+ohhK3vqJ3Fd0ISvfa3CFP+W4OwjdTwDLjs=;
 b=w5sqFP6s6hDjLBxGhOET064+Y1LxtgQgi/gkdGrfCuz1d3kpkpzd3SkF9R1ZelcsaTNOlGB0UDoWgpEamGqXQLn8q6dOoKJue1TLWxyzrHSwu9MSuppUYsSA0f4wM+6Hew8jDCtjb711cdWvjApDr/Oa9BRmjIFls+3s59BHFAw=
Received: from DB9PR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::22) by AM0PR08MB3986.eurprd08.prod.outlook.com
 (2603:10a6:208:128::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 12:57:03 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::73) by DB9PR01CA0017.outlook.office365.com
 (2603:10a6:10:1d8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 12:57:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 5 Nov 2021 12:57:03 +0000
Received: ("Tessian outbound c71e1a752bff:v108");
 Fri, 05 Nov 2021 12:57:03 +0000
X-CR-MTA-TID: 64aa7808
Received: from d939d001d206.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FEFCA338-0251-4FF6-BBA2-8922CFC492F0.1;
	Fri, 05 Nov 2021 12:56:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 d939d001d206.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 05 Nov 2021 12:56:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqYfb1H7Z04zJHnnHcv4xkwosSAlNGMW5tpGjAspgSXLKcxZS2sjI5bzi4CP+fgdq2AwOyFRnKa6Fp+jNw0DepvTAmYtLgR0wMEQkKYq2MV6KUqXKFiJqvD6QE5BLaFHWatjQPLUJEFzjJ25nxJZQ9ukigjPmdNciSC8NJZth+vbvinmxFaax8MiVX2+vnUo5w6LGniwC7TJeJI1aLQHBR0QPqUFSEw0DHyszPy02qdXUun87j87mOsV9DueN/wnhBZffk43qmzRWB0WB54V+vrUGn+HqoAoSMo5hlAayIIv4I1ec8vNj0fMQLdsmA4aEntw0r4ONOca8i5WzzpeYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4HqQ2ZN+ohhK3vqJ3Fd0ISvfa3CFP+W4OwjdTwDLjs=;
 b=fSOkrlCMQ1QK+wLipLWntah3f6c54uTnlUUB1pBJfz6ijYomaDjwnYqFWsF46SYUbu3pSXV1DrLzw/TRVPQ8Rz47Nqq94/2vSMVfEmKQth5YMVtb3J4aRw/T8KV9Y27cnmHBE36ql8DrCTuY7Xx1+J9znRfWhT3vXO5BoDeFKjfpy2hDXZaOgRs1JM9Nj2KBZ2ZdLa5dUyGaxwMdF5ts4OrYL3sQkbfPSbeHD7D5nuzUUfKd+b12s+SvlQ5xe9kPyDU2EhlUjXMDCFyfZmh6sZAoBXSpNTnENh82F+hK9UkQL8CWoHcqNHdV1D/hGgwn8z/BAqi0jOHmWigDP3VGRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4HqQ2ZN+ohhK3vqJ3Fd0ISvfa3CFP+W4OwjdTwDLjs=;
 b=w5sqFP6s6hDjLBxGhOET064+Y1LxtgQgi/gkdGrfCuz1d3kpkpzd3SkF9R1ZelcsaTNOlGB0UDoWgpEamGqXQLn8q6dOoKJue1TLWxyzrHSwu9MSuppUYsSA0f4wM+6Hew8jDCtjb711cdWvjApDr/Oa9BRmjIFls+3s59BHFAw=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6962.eurprd08.prod.outlook.com (2603:10a6:20b:347::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 5 Nov
 2021 12:56:54 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba%7]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 12:56:53 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: Jon Mason <Jon.Mason@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: RE: [meta-arm] [PATCH 3/3] arm/qemuarm64-sbsa: move to generic-arm64
Thread-Topic: [meta-arm] [PATCH 3/3] arm/qemuarm64-sbsa: move to generic-arm64
Thread-Index: AQHX0YahSgmsHmKTJ0iiyzxfJfeSrav045DA
Date: Fri, 5 Nov 2021 12:56:53 +0000
Message-ID: 
 <AM6PR08MB3461639FD0E143384BC6C56E928E9@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20211103183620.15870-1-jon.mason@arm.com>
 <20211103183620.15870-3-jon.mason@arm.com>
In-Reply-To: <20211103183620.15870-3-jon.mason@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 8596D1F091E8DD409E77FE42AEE371EA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4460cd34-9b62-48c6-3682-08d9a05bc372
x-ms-traffictypediagnostic: AS8PR08MB6962:|AM0PR08MB3986:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3986DB764D5A2BD3A5AD325D928E9@AM0PR08MB3986.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:289;OLM:289;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lbtYhqyybwTNmuOSYigBSgmpsnIV97LgbtNufGf/1oq2czl5tmWV1k8jio0moNoDZHdAontaA/WrZLNXWIkF7XMgR8OzUdVZ9XSnlvw0ebtQCXCfzwLweP4ujpgE2hJIWvgWIANh4oDdssEC671Ib2YV017o1OX4Fwmn4H/MwsJ1+pLZBQRWCBhUx4CZAjs5/+F2x2D+47UCVuqIHOzzWGUrOLMbg5MrYTACIysoWF/v93wMMejhl/BBF53QVrJvpMW38Bv1UExSvt7TpCJzGZ/edcaqq9ZUPwN8fcqTwjY81zDTPGlQo9aKrLEdoNDPk/Rmc6Q8+0gGoD7pCNF8vgHWlcXEiPhPgw5b0tpG8hsAazWAst1VZVOBHsm2fm3IgRQoZaFrEKkaoNdyeRpH8I8KWKkXpDsdQ15P2I7q+A8CMw71K/fLu9RZb40VFzmpX3IjWwGbQYkPKg8/DotaZ7JWUcoswhc1QJydJq9MsD80kwT9U9b+RSxDRBslKSScs0lOyxd9HZG6O6UAnqv/QggW15z/q2u3/XILqK4OZ5hmmleNyrC5oJC2D5pNFRP+pfabPAfBzWZLwZaQvPypqdMHYYja6c8fkSi+WGgyje5NX5jqlnmXgMbMZSlytxQ+E6WoEvF/e+4JGzNuJiQedNIROeXas/7+6+W2EBuTG2UETWZ2vQs16D+WwFn46Ww3Ys9FKfx1J5JdOkBSbvIDnTbYJzCj7fKj67K1ESJL6XE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(38100700002)(26005)(86362001)(122000001)(8676002)(508600001)(7696005)(83380400001)(30864003)(110136005)(66446008)(66556008)(186003)(52536014)(38070700005)(316002)(5660300002)(6506007)(66946007)(66476007)(55016002)(4326008)(2906002)(71200400001)(9686003)(8936002)(33656002)(64756008)(41533002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6962
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	694d91d7-a04a-4416-2e5c-08d9a05bbdd6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k1zmofu55tpwJ+GvsHify4DKwpFpvnL0DUbLJR3gE2hqYlw+E1xQhzSOJZqgUBQgZWSB8K2s7yN4hwWo++blj5Py0bt3Qle2GUZSP3bKIjP+k+zGVHNYYq3vrHx6poExT6QNJoLKc98a1S83FpcJiN8U+cOvRggBbEhk22NzTsC5HP/X+Yuo3D7ZCt8AJDSlyXoZW7kM8rMehlCmS6JgvXxIkfj2Vl+HJMPwa5rVdaau7kWgPS+w2taB7Gij+z7W8Cl3goyJePDA6bqDsN20+xUUkBK5OFIXoEaMk/KkoJOSGpC8dMLcZ401PnEyU0hs1WBReGAL/MNjrJFq261tf5ZC5c0hbYfDAYQ5yHC5w5m1fuV+17gfWtwd36JR/5Wzi9gfuPwlYUOXGzQxwNVTVE/E+9DwTsKMGlLtTzJ9OBcO/9E3b7VcN/enRzY3ikY0bjav9MPmDxkrDWh18lgkReYZhM1XK5Vrdh/TDMYJ3uiM2wjKc1RWAPG7dZUWAbR5B5tlIhPXt9jRF9zLMYiIGl7WGWKcPO9FEAVZuNVtkE76Psj0XJ84ySQLFLO4hEg+MhT8Z4e30mAZdDZu4XCIfaN8LLWlT490PFByiqrHDrmjtDdtMKDgmXTp57NUsk2leNQYgPm3uAgFwIz8+fiTAUdn3/JBooOhGZfoXb+BKq4w21umhhdS9ucjruRc3wFn2enkG5YJrvSkd070z6JqrhK/aOxTIm145MYDTzG6ChI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(70206006)(33656002)(186003)(4326008)(2906002)(9686003)(26005)(83380400001)(6506007)(8676002)(55016002)(110136005)(356005)(81166007)(316002)(7696005)(336012)(36860700001)(47076005)(30864003)(82310400003)(508600001)(86362001)(52536014)(8936002)(5660300002)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:57:03.1056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4460cd34-9b62-48c6-3682-08d9a05bc372
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3986
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Nov 2021 12:57:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2343

Hi Jon,

Please, find my comments bellow.

>-----Original Message-----
>From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
>On Behalf Of Jon Mason via lists.yoctoproject.org
>Sent: 03 November 2021 18:36
>To: meta-arm@lists.yoctoproject.org
>Subject: [meta-arm] [PATCH 3/3] arm/qemuarm64-sbsa: move to generic-
>arm64
>
>Get qemuarm64-sbsa working again and combine it with generic-arm64.
>This allows for a single generic image with testing for SBSA compliance.
>
>Signed-off-by: Jon Mason <jon.mason@arm.com>
>---
> .gitlab-ci.yml                                |  5 +-
> ci/generic-arm64.yml                          |  9 ++
> ci/qemuarm64-sbsa.yml                         | 11 ---
> meta-arm/conf/machine/generic-arm64.conf      | 25 +++++-
> meta-arm/conf/machine/qemuarm64-sbsa.conf     | 30 -------
> .../trusted-firmware-a_%.bbappend             | 13 ++-
> .../recipes-bsp/uefi/edk2-firmware_%.bbappend | 24 +++---
> .../linux/linux-yocto/defconfig.patch         | 83 ++++---------------
> .../linux/linux-yocto_%.bbappend              |  5 --
> meta-arm/recipes-security/optee/optee.inc     |  2 +
> 10 files changed, 75 insertions(+), 132 deletions(-)  delete mode 100644
>ci/qemuarm64-sbsa.yml  delete mode 100644 meta-
>arm/conf/machine/qemuarm64-sbsa.conf
>
>diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml index e1ce432..4e8e1e9 100644
>--- a/.gitlab-ci.yml
>+++ b/.gitlab-ci.yml
>@@ -138,7 +138,7 @@ gem5-arm64/xen:
> gem5-atp-arm64:
>   extends: .build
>
>-generic-arm64:
>+generic-arm64/testimage:
>   extends: .build
>
> juno:
>@@ -171,9 +171,6 @@ qemu-cortex-m3/testimage-zephyr:
> qemu-cortex-r5:
>   extends: .build
>
>-qemuarm64-sbsa:
>-  extends: .build
>-
> qemuarm64-secureboot/testimage:
>   extends: .build
>
>diff --git a/ci/generic-arm64.yml b/ci/generic-arm64.yml index
>a7365b8..32a8e57 100644
>--- a/ci/generic-arm64.yml
>+++ b/ci/generic-arm64.yml
>@@ -3,4 +3,13 @@ header:
>   includes:
>     - base.yml
>
>+local_conf_header:
>+  failing_tests: |
>+    DEFAULT_TEST_SUITES:remove =3D "parselogs"
>+
> machine: generic-arm64
>+
>+target:
>+  - core-image-base
>+  - perf
>+  - sbsa-acs
>diff --git a/ci/qemuarm64-sbsa.yml b/ci/qemuarm64-sbsa.yml deleted file
>mode 100644 index 5ba5f27..0000000
>--- a/ci/qemuarm64-sbsa.yml
>+++ /dev/null
>@@ -1,11 +0,0 @@
>-header:
>-  version: 9
>-  includes:
>-    - base.yml
>-
>-machine: qemuarm64-sbsa
>-
>-target:
>-  - core-image-base
>-  - perf
>-  - sbsa-acs
>diff --git a/meta-arm/conf/machine/generic-arm64.conf b/meta-
>arm/conf/machine/generic-arm64.conf
>index 39acc6a..013a9fa 100644
>--- a/meta-arm/conf/machine/generic-arm64.conf
>+++ b/meta-arm/conf/machine/generic-arm64.conf
>@@ -4,20 +4,41 @@
> #have working firmware and boot via EFI.
>
> require conf/machine/include/arm/arch-armv8a.inc
>+require conf/machine/include/qemu.inc

Instead of merging the qemu specifics into the generic-arm64 machine which =
will increase a
lot the build dependencies for someone not interested on the qemu bits, can=
 we have a separate
qemu-generic-arm64 machine which includes this one and adds the extra qemu =
stuff on top?


>
> PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
>
> KERNEL_IMAGETYPE =3D "Image"
>
>-IMAGE_FSTYPES ?=3D "wic"
>-
> WKS_FILE ?=3D "efi-disk.wks.in"
>
> MACHINE_FEATURES +=3D "alsa bluetooth efi qemu-usermode rtc screen
>usbhost vfat wifi"
>
> EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd",
>"systemd-boot", "grub-efi", d)}"
>
>+PREFERRED_VERSION_linux-yocto ?=3D "5.10%"
> KBUILD_DEFCONFIG =3D "defconfig"
> KCONFIG_MODE =3D "--alldefconfig"
>
> MACHINE_EXTRA_RRECOMMENDS +=3D "kernel-modules linux-firmware"
>+
>+SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
>+SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>+
>+EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
Firmware and bootloader bits should not be included as part of the generic-=
arm64
machine definition since this is hardware platform specific. Another good r=
eason for
splitting the qemu specifics on its on machine definition.

>+DISTRO_FEATURES:append =3D " systemd"
>+VIRTUAL-RUNTIME_init_manager =3D "systemd"
Normally machines should not tweak distro specifics.

Cheers,
Diego Sueiro

>+
>+IMAGE_FSTYPES +=3D "wic wic.qcow2"
>+
>+QB_SYSTEM_NAME =3D "qemu-system-aarch64"
>+QB_MACHINE =3D "-machine sbsa-ref"
>+QB_MEM =3D "-m 1024"
>+QB_DEFAULT_FSTYPE =3D "wic.qcow2"
>+QB_NETWORK_DEVICE =3D "-device virtio-net-pci,netdev=3Dnet0,mac=3D@MAC@"
>+QB_DRIVE_TYPE =3D "/dev/hd"
>+QB_ROOTFS_OPT =3D "-drive file=3D@ROOTFS@,if=3Dide,format=3Dqcow2"
>+QB_DEFAULT_KERNEL =3D "none"
>+QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd -
>pflash @DEPLOY_DIR_IMAGE@/SBSA_FLASH0.fd -pflash
>@DEPLOY_DIR_IMAGE@/SBSA_FLASH1.fd"
>+QB_SERIAL_OPT =3D "-device virtio-serial-pci -chardev null,id=3Dvirtcon -=
device
>virtconsole,chardev=3Dvirtcon"
>+QB_TCPSERIAL_OPT =3D "-device virtio-serial-pci -chardev
>socket,id=3Dvirtcon,port=3D@PORT@,host=3D127.0.0.1 -device
>virtconsole,chardev=3Dvirtcon"
>diff --git a/meta-arm/conf/machine/qemuarm64-sbsa.conf b/meta-
>arm/conf/machine/qemuarm64-sbsa.conf
>deleted file mode 100644
>index d2ac56c..0000000
>--- a/meta-arm/conf/machine/qemuarm64-sbsa.conf
>+++ /dev/null
>@@ -1,30 +0,0 @@
>-#@TYPE: Machine
>-#@NAME: qemuarm64_sbsa
>-#@DESCRIPTION: QEMU Machine for Arm Server Base System Architecture
>-
>-MACHINEOVERRIDES =3D. "qemuarm64:"
>-
>-require ${COREBASE}/meta/conf/machine/qemuarm64.conf
>-
>-KMACHINE =3D "qemuarm64"
>-
>-QB_MACHINE =3D "-machine sbsa-ref"
>-QB_MEM =3D "-m 1024"
>-QB_DEFAULT_FSTYPE =3D "wic.qcow2"
>-QB_NETWORK_DEVICE =3D ""
>-QB_DRIVE_TYPE =3D "/dev/hd"
>-QB_ROOTFS_OPT =3D "-drive file=3D@ROOTFS@,if=3Dide,format=3Dqcow2"
>-QB_DEFAULT_KERNEL =3D "none"
>-QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd"
>-
>-IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
>-IMAGE_FSTYPES +=3D "wic wic.qcow2"
>-
>-WKS_FILE ?=3D "mkefidisk.wks"
>-
>-MACHINE_FEATURES +=3D "efi"
>-
>-EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
>-
>-KBUILD_DEFCONFIG =3D "defconfig"
>-KCONFIG_MODE =3D "--alldefconfig"
>diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
>a_%.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-
>firmware-a_%.bbappend
>index 5b5a049..51598c8 100644
>--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
>a_%.bbappend
>+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
>a_%.bbapp
>+++ end
>@@ -1,17 +1,20 @@
> COMPATIBLE_MACHINE:qemuarm64 =3D "qemuarm64"
>+COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
>
> TFA_PLATFORM:qemuarm64-secureboot =3D "qemu"
>-TFA_PLATFORM:qemuarm64-sbsa =3D "qemu_sbsa"
>+TFA_PLATFORM:generic-arm64 =3D "qemu_sbsa"
>
> TFA_SPD:qemuarm64-secureboot =3D "opteed"
>
> TFA_UBOOT:qemuarm64-secureboot =3D "1"
> TFA_BUILD_TARGET:aarch64:qemuall =3D "all fip"
>+TFA_BUILD_TARGET:generic-arm64 =3D "all fip"
>
> TFA_INSTALL_TARGET:qemuarm64-secureboot =3D "flash.bin"
>-TFA_INSTALL_TARGET:qemuarm64-sbsa =3D "bl1 fip"
>+TFA_INSTALL_TARGET:generic-arm64 =3D "bl1 fip"
>
> DEPENDS:append:aarch64:qemuall =3D " optee-os"
>+DEPENDS:append:generic-arm64 =3D " optee-os"
>
> EXTRA_OEMAKE:append:aarch64:qemuall =3D " \
>     BL32=3D${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-
>header_v2.bin \ @@ -19,6 +22,12 @@
>EXTRA_OEMAKE:append:aarch64:qemuall =3D " \
>
>BL32_EXTRA2=3D${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee
>-pageable_v2.bin \
>     BL32_RAM_LOCATION=3Dtdram \
>     "
>+EXTRA_OEMAKE:append:generic-arm64 =3D " \
>+    BL32=3D${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-
>header_v2.bin \
>+
>BL32_EXTRA1=3D${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee
>-pager_v2.bin \
>+
>BL32_EXTRA2=3D${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee
>-pageable_v2.bin \
>+    BL32_RAM_LOCATION=3Dtdram \
>+    "
>
> do_compile:append:qemuarm64-secureboot() {
>     # Create a secure flash image for booting AArch64 Qemu. See:
>diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-
>arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
>index fbdec1f..b072327 100644
>--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
>+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
>@@ -1,26 +1,28 @@
>-COMPATIBLE_MACHINE =3D "qemuarm64"
>+COMPATIBLE_MACHINE:aarch64:qemuall =3D "qemuarm64"
>+COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
>
>-DEPENDS:append:qemuarm64-sbsa =3D " virtual/trusted-firmware-a"
>+DEPENDS:append:generic-arm64 =3D " virtual/trusted-firmware-a"
>
> EDK2_BUILD_RELEASE:aarch64:qemuall =3D "1"
>-EDK2_ARCH:aarch64:qemuall          =3D "AARCH64"
>+EDK2_BUILD_RELEASE:generic-arm64   =3D "1"
>+EDK2_ARCH:aarch64                  =3D "AARCH64"
>
>-EDK2_PLATFORM:qemuarm64-sbsa      =3D "SbsaQemu"
>-EDK2_PLATFORM_DSC:qemuarm64-sbsa  =3D
>"Platform/Qemu/SbsaQemu/SbsaQemu.dsc"
>-EDK2_BIN_NAME:qemuarm64-sbsa      =3D "SBSA_FLASH0.fd"
>+EDK2_PLATFORM:generic-arm64      =3D "SbsaQemu"
>+EDK2_PLATFORM_DSC:generic-arm64  =3D
>"Platform/Qemu/SbsaQemu/SbsaQemu.dsc"
>+EDK2_BIN_NAME:generic-arm64      =3D "SBSA_FLASH0.fd"
>
> EDK2_PLATFORM:qemuarm64-secureboot      =3D "ArmVirtQemu-AARCH64"
> EDK2_PLATFORM_DSC:qemuarm64-secureboot  =3D
>"ArmVirtPkg/ArmVirtQemu.dsc"
> EDK2_BIN_NAME:qemuarm64-secureboot      =3D "QEMU_EFI.fd"
>
>-do_compile:prepend:qemuarm64-sbsa() {
>+do_compile:prepend:generic-arm64() {
>     mkdir -p ${B}/Platform/Qemu/Sbsa/
>     cp ${RECIPE_SYSROOT}/firmware/bl1.bin ${B}/Platform/Qemu/Sbsa/
>     cp ${RECIPE_SYSROOT}/firmware/fip.bin ${B}/Platform/Qemu/Sbsa/  }
>
>-do_install:append:qemuarm64-sbsa() {
>-    install
>${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV
>/SBSA_FLASH0.fd ${D}/firmware/ovmf-tfa.bin
>-    install
>${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV
>/SBSA_FLASH1.fd ${D}/firmware/ovmf-uefi.bin
>-    /usr/bin/truncate -s 256M ${D}/firmware/ovmf*.bin
>+do_install:append:generic-arm64() {
>+    install
>${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV
>/SBSA_FLASH*.fd ${D}/firmware/
>+    # QEMU requires that the images be minimum of 256M in size
>+    /usr/bin/truncate -s 256M ${D}/firmware/SBSA_FLASH*.fd
> }
>diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
>b/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
>index 921d655..2b7cbbb 100644
>--- a/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
>+++ b/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
>@@ -21,10 +21,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig =
-
>index 9907a431db0d..f50751b6eaec 100644
>+index 6d84761d1285..9bb5a97d24f0 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
>-@@ -538,7 +538,6 @@ CONFIG_GPIO_PCA953X_IRQ=3Dy
>+@@ -514,7 +514,6 @@ CONFIG_GPIO_PCA953X_IRQ=3Dy
>  CONFIG_GPIO_BD9571MWV=3Dm
>  CONFIG_GPIO_MAX77620=3Dy
>  CONFIG_GPIO_SL28CPLD=3Dm
>@@ -51,13 +51,13 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig =
-
>index f50751b6eaec..15595d6db256 100644
>+index 6d84761d1285..84a75ed7e167 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
>-@@ -789,7 +789,7 @@ CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
>- CONFIG_HID_MULTITOUCH=3Dm
>- CONFIG_I2C_HID_ACPI=3Dm
>- CONFIG_I2C_HID_OF=3Dm
>+@@ -727,7 +727,7 @@ CONFIG_SND_SOC_WSA881X=3Dm
>CONFIG_SND_SIMPLE_CARD=3Dm
>+CONFIG_SND_AUDIO_GRAPH_CARD=3Dm  CONFIG_I2C_HID=3Dm
> -CONFIG_USB_CONN_GPIO=3Dm
> +CONFIG_USB_CONN_GPIO=3Dy
>  CONFIG_USB=3Dy
>@@ -67,66 +67,15 @@ index f50751b6eaec..15595d6db256 100644
> 2.25.1
>
>
>-From 26e4f7955080cc0f5670471823d73b972d3fe080 Mon Sep 17 00:00:00
>2001
>-From: Ross Burton <ross.burton@arm.com>
>-Date: Wed, 8 Sep 2021 11:51:03 +0100
>-Subject: [PATCH 4/5] arm64: defconfig: remove obsolete
>CONFIG_ARCH_AGILEX and
>- CONFIG_ARCH_N5X
>-
>-These config options were removed in 4a9a1a5602 ("arm64: socfpga: merge -
>Agilex and N5X into ARCH_INTEL_SOCFPGA"), so remove them from the -
>defconfig.
>-
>-Fixes: 4a9a1a5602 ("arm64: socfpga: merge Agilex and N5X into
>ARCH_INTEL_SOCFPGA")
>-Signed-off-by: Ross Burton <ross.burton@arm.com>
>----
>- arch/arm64/configs/defconfig | 2 --
>- 1 file changed, 2 deletions(-)
>-
>-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig =
-
>index 15595d6db256..257167463b60 100644
>---- a/arch/arm64/configs/defconfig
>-+++ b/arch/arm64/configs/defconfig
>-@@ -28,8 +28,6 @@ CONFIG_KALLSYMS_ALL=3Dy
>- # CONFIG_COMPAT_BRK is not set
>- CONFIG_PROFILING=3Dy
>- CONFIG_ARCH_ACTIONS=3Dy
>--CONFIG_ARCH_AGILEX=3Dy
>--CONFIG_ARCH_N5X=3Dy
>- CONFIG_ARCH_SUNXI=3Dy
>- CONFIG_ARCH_ALPINE=3Dy
>- CONFIG_ARCH_APPLE=3Dy
>---
>-2.25.1
>-
>-
>-From 0931745bfa4e9a8db2885dd20d07426dbaf2fa73 Mon Sep 17 00:00:00
>2001
>-From: Ross Burton <ross.burton@arm.com>
>-Date: Wed, 8 Sep 2021 12:19:33 +0100
>-Subject: [PATCH 5/5] arm64: defconfig: don't set CONFIG_ACPI_APEI_PCIEAER
>-
>-Since 8c8ff55 ("PCI/AER: Don't select CONFIG_PCIEAER by default"), PCIe -
>Advanced Error Reporting isn't enabled by default.. As this means just -
>enabling CONFIG_CPI_APEI_PCIEAR does not have an effect, remove it from -
>the defconfig for clarity.
>-
>-Signed-off-by: Ross Burton <ross.burton@arm.com>
>----
>- arch/arm64/configs/defconfig | 1 -
>- 1 file changed, 1 deletion(-)
>-
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig =
-
>index 257167463b60..f620f31b0323 100644
>+index 6d84761d1285..0f45921cf5b2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
>-@@ -110,7 +110,6 @@ CONFIG_IMX_SCU_PD=3Dy
>- CONFIG_ACPI=3Dy
>- CONFIG_ACPI_APEI=3Dy
>- CONFIG_ACPI_APEI_GHES=3Dy
>--CONFIG_ACPI_APEI_PCIEAER=3Dy
>- CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
>- CONFIG_ACPI_APEI_EINJ=3Dy
>- CONFIG_VIRTUALIZATION=3Dy
>---
>-2.25.1
>-
>+@@ -683,7 +683,6 @@ CONFIG_DRM_PANFROST=3Dm  CONFIG_FB=3Dy
>+CONFIG_FB_MODE_HELPERS=3Dy  CONFIG_FB_EFI=3Dy -
>CONFIG_BACKLIGHT_GENERIC=3Dm
>+CONFIG_BACKLIGHT_PWM=3Dm  CONFIG_BACKLIGHT_LP855X=3Dm
>CONFIG_LOGO=3Dy
>diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-
>arm/recipes-kernel/linux/linux-yocto_%.bbappend
>index d215d8b..957cc3f 100644
>--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
>+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
>@@ -7,11 +7,6 @@ SRC_URI:append:generic-arm64 =3D " \
>     file://tcpci.cfg \
>     "
>
>-FILESEXTRAPATHS:prepend:qemuarm64-sbsa =3D "${ARMFILESPATHS}"
>-SRC_URI:append:qemuarm64-sbsa =3D " \
>-    file://defconfig.patch \
>-    "
>-
> FILESEXTRAPATHS:prepend:qemuarm64-secureboot =3D "${ARMFILESPATHS}"
> SRC_URI:append:qemuarm64-secureboot =3D " \
>     file://zone_dma_revert.patch \
>diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-
>security/optee/optee.inc
>index d498b00..88e4dc5 100644
>--- a/meta-arm/recipes-security/optee/optee.inc
>+++ b/meta-arm/recipes-security/optee/optee.inc
>@@ -2,10 +2,12 @@ UPSTREAM_CHECK_GITTAGREGEX =3D
>"^(?P<pver>\d+(\.\d+)+)$"
>
> COMPATIBLE_MACHINE ?=3D "invalid"
> COMPATIBLE_MACHINE:qemuarm64 ?=3D "qemuarm64"
>+COMPATIBLE_MACHINE:generic-arm64 ?=3D "generic-arm64"
> # Please add supported machines below or set it in .bbappend or .conf
>
> OPTEEMACHINE ?=3D "${MACHINE}"
> OPTEEMACHINE:aarch64:qemuall ?=3D "vexpress-qemu_armv8a"
>+OPTEEMACHINE:generic-arm64 ?=3D "vexpress-qemu_armv8a"
>
> OPTEE_ARCH =3D "null"
> OPTEE_ARCH:armv7a =3D "arm32"
>--
>2.17.1


