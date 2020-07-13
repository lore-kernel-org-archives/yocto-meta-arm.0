Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.81])
 by mx.groups.io with SMTP id smtpd.web12.2628.1594664042707400924
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Jul 2020 11:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=F/fWmgJ4;
 spf=pass (domain: arm.com, ip: 40.107.22.81, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTeOCkzXiaeaLuYeeaSp7hGBSQpu8LOHzo6ptQZk4rc=;
 b=F/fWmgJ4sUrI9dJz8zLsVcthwtUWx8qrIKvwJzOtMh7jbti0bDq/PNuDf7fJHNhufaq9jPLn4wTrnHf8Gq8FCivqVLkXNbno/3Url0qyYsyX2FaRMjS5U1giBoGFFtMkp3+HZXf2VL4e2N/iRJkjU8GTwqV3Y2A/7z7CHr9pduQ=
Received: from AM7PR03CA0003.eurprd03.prod.outlook.com (2603:10a6:20b:130::13)
 by VE1PR08MB5197.eurprd08.prod.outlook.com (2603:10a6:803:106::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Mon, 13 Jul
 2020 18:14:00 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::67) by AM7PR03CA0003.outlook.office365.com
 (2603:10a6:20b:130::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Mon, 13 Jul 2020 18:13:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Mon, 13 Jul 2020 18:13:59 +0000
Received: ("Tessian outbound 1c27ecaec3d6:v62"); Mon, 13 Jul 2020 18:13:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fcdef7275e3b419e
X-CR-MTA-TID: 64aa7808
Received: from ad54bf31bf10.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BB1B92B7-11B2-4E27-9874-E8451D3DA697.1;
	Mon, 13 Jul 2020 18:13:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad54bf31bf10.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 Jul 2020 18:13:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ii/FmxX4YcaCoEA/k7n8bXWnUfP5cvgjTX7ovQTPigUrKGIBVE7lszgT38K3iO8drCYKf3QLk3mFOdnHPzEaNM9RTYVi4+dpzs4C/W0mWnSg4hCJ8plCmcylgfaU4RG1LqUyISCzRJufrM1+tyl9Q7dp9tLOMzjD7ccvXn7vXo+/KDuQTXYui3sC3aRg/bUbO0mA94cLlSpN5xWsA7phLfs9kZZZoeYMXBpgKccW1djgGoEBzuKzjwwB6MLwDmFPIEQfl7EhJmqzg30dpcSnZVsgzQ/HAx+5kBs9G5skBtIkabZVdHDxYCHUKrRmagh4BdtosoWum5WA1iF/v3KqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTeOCkzXiaeaLuYeeaSp7hGBSQpu8LOHzo6ptQZk4rc=;
 b=KKgT15D3ErrvBi8dMqgvALZUdyo/x9aVXMJ7u5zfovxp1MgwnAzCQPVLZOtrw4MV844TOxt1WiXd3srNnyrFWGg0b75+vUB7cMy4dIhLkpwgw8UfhREVJ5bFRI4hgAAU9BMql1gxviwnFRXPVJXCwVUtPGHvsVbumorFr8iXnargLZN/xUe5kz/UqDlCSzZjiVPj3G2yu5MldLFn9IOk3PvVGEQP+e7crNLTJTu2qW6hhOP7cWAIi6xAQHRp5Oy4Dovy/OWwpdmUwLW0ASIfBK0b2DeadocrbnEp+wGhvBcJg8UpLwnZhZT3fhphI8gY5UEMqs9O5vYMlQKVDv26hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTeOCkzXiaeaLuYeeaSp7hGBSQpu8LOHzo6ptQZk4rc=;
 b=F/fWmgJ4sUrI9dJz8zLsVcthwtUWx8qrIKvwJzOtMh7jbti0bDq/PNuDf7fJHNhufaq9jPLn4wTrnHf8Gq8FCivqVLkXNbno/3Url0qyYsyX2FaRMjS5U1giBoGFFtMkp3+HZXf2VL4e2N/iRJkjU8GTwqV3Y2A/7z7CHr9pduQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB4334.eurprd08.prod.outlook.com (2603:10a6:803:f1::20)
 by VI1PR08MB3469.eurprd08.prod.outlook.com (2603:10a6:803:8a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Mon, 13 Jul
 2020 18:13:51 +0000
Received: from VI1PR08MB4334.eurprd08.prod.outlook.com
 ([fe80::3881:b1d4:e034:559e]) by VI1PR08MB4334.eurprd08.prod.outlook.com
 ([fe80::3881:b1d4:e034:559e%6]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 18:13:51 +0000
From: anders.dellien@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp: Move to newer kernel for fvp-base and foundation-armv8
Date: Mon, 13 Jul 2020 19:13:42 +0100
Message-Id: <20200713181342.56593-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0168.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::36) To VI1PR08MB4334.eurprd08.prod.outlook.com
 (2603:10a6:803:f1::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.53) by LO2P265CA0168.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24 via Frontend Transport; Mon, 13 Jul 2020 18:13:50 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 58c2b822-75a9-41c8-9c32-08d8275883a9
X-MS-TrafficTypeDiagnostic: VI1PR08MB3469:|VE1PR08MB5197:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB519715B4E6E10BAF850CB86789600@VE1PR08MB5197.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:454;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bIGY2ZWx2vjsXwcYcvT0PS6772YAc5TLQtxBoxoUEjja2AcpPbqhrCUYOh1wzR/cBWoy7+RCCKbXmWg4kDpUGRRlEluqeTQDj7CzDqhe/OD0f3QLk9PpqJYPGXnDDXyaJk3upk45pP0w3fF/Dh3jaaxK/RddXsVOcEb8hPxAK3coAqJwwvJk0JmkP/BvPSgTj/+G+hG+WrQ9VuhtiCyvamUydgM5PJ6PoHn8SbBmG0u8A/OcFkPTYyXVmqQAROAs3KrVBZq6xYF5sJNt44Co+127kemaWxPpnoAtwCg+wV8CZDc4c2KcRimPFgBD5B7Rsl/TV6JnZ7xKQod8/OQVpQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4334.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(36756003)(86362001)(30864003)(6666004)(1076003)(66946007)(66476007)(5660300002)(66556008)(52116002)(7696005)(26005)(498600001)(6916009)(8676002)(8936002)(6486002)(83380400001)(16526019)(186003)(4326008)(44832011)(956004)(2616005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 5VxWc14QzxTMIB1THf7yfHhU/y7oPFQpL46sghq50WUlJ+YIze670l0EdyJWpZvuaHIrZr485tuDgIXj50uqYMKdpVXJ3G5nCieWTTI20Hk86NEkQZYu1Gu0vFeNaqUf7UDwRlnj+YKlklNMECpFWH5zx6I8DoSsbPUfuIXJ+TiFle0kQD0AVhaAMqGFufaHxyoUxuhsfhnTBSZ3/q2e/ha9W0kbZRd1PL67OFOvPkZYRl6UQAzofPEmjAU1J0affZkiwz5FczJc8w7ghWYiU9NVU8nTCtUMque4Xv18690/O4cff39Y3/SxCyA+PFl2OOMA8g29qb40Cz+9rxeC4WoOgV1xm6KIyh8rn1cMSWLmHxsCwqMKOdXgwD/dg9ZQUM3++smq+Ex/HDdUiashJ4sLO9cBrWuppWKUXC38haN+/MC4aHdiiku2QkpXF25r+htVC4fUqZ+TBGF2bXNQhoZVaHLu4clheCRuk9VyMaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3469
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966005)(70586007)(70206006)(30864003)(36906005)(316002)(44832011)(4326008)(36756003)(5660300002)(83380400001)(356005)(82310400002)(81166007)(336012)(47076004)(2616005)(956004)(82740400003)(16526019)(186003)(86362001)(26005)(2906002)(6486002)(8676002)(6666004)(1076003)(8936002)(7696005)(6916009)(478600001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ce173265-798e-4660-766d-08d827587e94
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YFiVRNwrxSht+8/vT48bl3dxnjO/CYxdVbL7rF0KP1XLnMSk/wphamDFOjHcziDjg090XavNo58PA+p5yuk2f0mpq6Fqaurx8VuuZEkchfZauMC+ExaqCH0mMRRKYVUhEaW4DutiQMVxnOPr/dmpj5MSTFqpWe4099kOz2mETiDWnIstSnaVEp0GOQLf/IFN6X1XzAW4qU6jvLhac67FfQ4lOzniq+DqV1ejdV+EsZVeM2Ntj2NmLJDrosWMfXMj6FJHq3fnKnkzl0xrfPcY6bhWAWacQWz+mz5WLJ9NhrbH3X85GCgGwupTceovYUY5vzIzyjI0SxzKdASP3dQ8ZjrcJ1ejNUWIVz3kjBYhy+oEMZJ/JdmjhXWcAYFUavf4fFNnNRpxWA7kA2A2XeEsTw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2020 18:13:59.1651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c2b822-75a9-41c8-9c32-08d8275883a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5197
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Change fvp-base and foundation-armv8 kernel from linux-linaro-arm-4.19
to linux-yocto_5.4.
Also add the necessary DTS files.

Change-Id: I6aa2e7706a2f20904d2f7a2bbfb928f0e53eb1eb
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf       |   2 +-
 meta-arm-bsp/conf/machine/fvp-common/fvp.inc  |   4 +-
 .../fvp-base-gicv3-psci-common-custom.dtsi    | 264 ++++++++++++++++
 .../dts/arm/fvp-base-gicv3-psci-custom.dts    |   9 +
 .../dts/arm/rtsm_ve-motherboard-nomap.dtsi    | 282 ++++++++++++++++++
 .../linux/linux-yocto-arm-platforms.inc       |   6 +
 6 files changed, 564 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-bas=
e-gicv3-psci-common-custom.dtsi
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-bas=
e-gicv3-psci-custom.dts
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/arm/rtsm_ve=
-motherboard-nomap.dtsi

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/ma=
chine/fvp-base.conf
index ae6b28c..3039644 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -6,7 +6,7 @@

 require conf/machine/fvp-common/fvp.inc

-KERNEL_DEVICETREE =3D "arm/fvp-base-aemv8a-aemv8a.dtb"
+KERNEL_DEVICETREE =3D "arm/fvp-base-gicv3-psci-custom.dtb"

 # Use haveged as a source of entropy instead of rng-tools (Needed for ssh)=
.
 # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot =
time.
diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bsp/co=
nf/machine/fvp-common/fvp.inc
index f8a2584..08f8b15 100644
--- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
@@ -34,8 +34,8 @@ DISK_IMG_PARTITION3_CONTENT =3D ""

 SERIAL_CONSOLES =3D "115200;ttyAMA0"

-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-linaro-arm"
-PREFERRED_VERSION_linux-linaro-arm ?=3D "4.19%"
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?=3D "5.4%"

 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3=
-psci-common-custom.dtsi b/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/=
fvp-base-gicv3-psci-common-custom.dtsi
new file mode 100644
index 0000000..1e056be
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3-psci-c=
ommon-custom.dtsi
@@ -0,0 +1,264 @@
+/*
+ * Copyright (c) 2017-2018, ARM Limited and Contributors. All rights reser=
ved.
+ *
+ * SPDX-License-Identifier: BSD-3-Clause
+ */
+
+/memreserve/ 0x80000000 0x00010000;
+
+/include/ "rtsm_ve-motherboard-nomap.dtsi"
+
+/ {
+       model =3D "FVP Base";
+       compatible =3D "arm,vfp-base", "arm,vexpress";
+       interrupt-parent =3D <&gic>;
+       #address-cells =3D <2>;
+       #size-cells =3D <2>;
+
+       aliases {
+               serial0 =3D &v2m_serial0;
+               serial1 =3D &v2m_serial1;
+               serial2 =3D &v2m_serial2;
+               serial3 =3D &v2m_serial3;
+       };
+
+       psci {
+               compatible =3D "arm,psci-1.0", "arm,psci-0.2", "arm,psci";
+               method =3D "smc";
+               cpu_suspend =3D <0xc4000001>;
+               cpu_off =3D <0x84000002>;
+               cpu_on =3D <0xc4000003>;
+               sys_poweroff =3D <0x84000008>;
+               sys_reset =3D <0x84000009>;
+       };
+
+       cpus {
+               #address-cells =3D <2>;
+               #size-cells =3D <0>;
+
+               cpu-map {
+                       cluster0 {
+                               core0 {
+                                       cpu =3D <&CPU0>;
+                               };
+                               core1 {
+                                       cpu =3D <&CPU1>;
+                               };
+                               core2 {
+                                       cpu =3D <&CPU2>;
+                               };
+                               core3 {
+                                       cpu =3D <&CPU3>;
+                               };
+                       };
+
+                       cluster1 {
+                               core0 {
+                                       cpu =3D <&CPU4>;
+                               };
+                               core1 {
+                                       cpu =3D <&CPU5>;
+                               };
+                               core2 {
+                                       cpu =3D <&CPU6>;
+                               };
+                               core3 {
+                                       cpu =3D <&CPU7>;
+                               };
+                       };
+               };
+
+               idle-states {
+                       entry-method =3D "arm,psci";
+
+                       CPU_SLEEP_0: cpu-sleep-0 {
+                               compatible =3D "arm,idle-state";
+                               local-timer-stop;
+                               arm,psci-suspend-param =3D <0x0010000>;
+                               entry-latency-us =3D <40>;
+                               exit-latency-us =3D <100>;
+                               min-residency-us =3D <150>;
+                       };
+
+                       CLUSTER_SLEEP_0: cluster-sleep-0 {
+                               compatible =3D "arm,idle-state";
+                               local-timer-stop;
+                               arm,psci-suspend-param =3D <0x1010000>;
+                               entry-latency-us =3D <500>;
+                               exit-latency-us =3D <1000>;
+                               min-residency-us =3D <2500>;
+                       };
+               };
+
+               CPU0:cpu@0 {
+                       device_type =3D "cpu";
+                       compatible =3D "arm,armv8";
+                       reg =3D <0x0 0x0>;
+                       enable-method =3D "psci";
+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>=
;
+                       next-level-cache =3D <&L2_0>;
+               };
+
+               CPU1:cpu@1 {
+                       device_type =3D "cpu";
+                       compatible =3D "arm,armv8";
+                       reg =3D <0x0 0x1>;
+                       enable-method =3D "psci";
+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>=
;
+                       next-level-cache =3D <&L2_0>;
+               };
+
+               CPU2:cpu@2 {
+                       device_type =3D "cpu";
+                       compatible =3D "arm,armv8";
+                       reg =3D <0x0 0x2>;
+                       enable-method =3D "psci";
+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>=
;
+                       next-level-cache =3D <&L2_0>;
+               };
+
+               CPU3:cpu@3 {
+                       device_type =3D "cpu";
+                       compatible =3D "arm,armv8";
+                       reg =3D <0x0 0x3>;
+                       enable-method =3D "psci";
+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>=
;
+                       next-level-cache =3D <&L2_0>;
+               };
+
+               CPU4:cpu@100 {
+                       device_type =3D "cpu";
+                       compatible =3D "arm,armv8";
+                       reg =3D <0x0 0x100>;
+                       enable-method =3D "psci";
+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>=
;
+                       next-level-cache =3D <&L2_0>;
+               };
+
+               CPU5:cpu@101 {
+                       device_type =3D "cpu";
+                       compatible =3D "arm,armv8";
+                       reg =3D <0x0 0x101>;
+                       enable-method =3D "psci";
+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>=
;
+                       next-level-cache =3D <&L2_0>;
+               };
+
+               CPU6:cpu@102 {
+                       device_type =3D "cpu";
+                       compatible =3D "arm,armv8";
+                       reg =3D <0x0 0x102>;
+                       enable-method =3D "psci";
+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>=
;
+                       next-level-cache =3D <&L2_0>;
+               };
+
+               CPU7:cpu@103 {
+                       device_type =3D "cpu";
+                       compatible =3D "arm,armv8";
+                       reg =3D <0x0 0x103>;
+                       enable-method =3D "psci";
+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>=
;
+                       next-level-cache =3D <&L2_0>;
+               };
+
+               L2_0: l2-cache0 {
+                       compatible =3D "cache";
+               };
+       };
+
+       memory@80000000 {
+               device_type =3D "memory";
+               reg =3D <0x00000000 0x80000000 0 0x7F000000>,
+                     <0x00000008 0x80000000 0 0x80000000>;
+       };
+
+       gic: interrupt-controller@2f000000 {
+               compatible =3D "arm,gic-v3";
+               #interrupt-cells =3D <3>;
+               #address-cells =3D <2>;
+               #size-cells =3D <2>;
+               ranges;
+               interrupt-controller;
+               reg =3D <0x0 0x2f000000 0 0x10000>,       // GICD
+                     <0x0 0x2f100000 0 0x200000>,      // GICR
+                     <0x0 0x2c000000 0 0x2000>,        // GICC
+                     <0x0 0x2c010000 0 0x2000>,        // GICH
+                     <0x0 0x2c02f000 0 0x2000>;        // GICV
+               interrupts =3D <1 9 4>;
+
+               its: its@2f020000 {
+                       compatible =3D "arm,gic-v3-its";
+                       msi-controller;
+                       reg =3D <0x0 0x2f020000 0x0 0x20000>; // GITS
+               };
+       };
+
+       timer {
+               compatible =3D "arm,armv8-timer";
+               interrupts =3D <1 13 0xff01>,
+                            <1 14 0xff01>,
+                            <1 11 0xff01>,
+                            <1 10 0xff01>;
+               clock-frequency =3D <100000000>;
+       };
+
+       timer@2a810000 {
+                       compatible =3D "arm,armv7-timer-mem";
+                       reg =3D <0x0 0x2a810000 0x0 0x10000>;
+                       clock-frequency =3D <100000000>;
+                       #address-cells =3D <2>;
+                       #size-cells =3D <2>;
+                       ranges;
+                       frame@2a830000 {
+                               frame-number =3D <1>;
+                               interrupts =3D <0 26 4>;
+                               reg =3D <0x0 0x2a830000 0x0 0x10000>;
+                       };
+       };
+
+       pmu {
+               compatible =3D "arm,armv8-pmuv3";
+               interrupts =3D <0 60 4>,
+                            <0 61 4>,
+                            <0 62 4>,
+                            <0 63 4>;
+       };
+
+       smb@8000000 {
+               compatible =3D "simple-bus";
+
+               #address-cells =3D <2>;
+               #size-cells =3D <1>;
+               ranges =3D <0 0 0 0x08000000 0x04000000>,
+                        <1 0 0 0x14000000 0x04000000>,
+                        <2 0 0 0x18000000 0x04000000>,
+                        <3 0 0 0x1c000000 0x04000000>,
+                        <4 0 0 0x0c000000 0x04000000>,
+                        <5 0 0 0x10000000 0x04000000>;
+       };
+
+       panels {
+               panel {
+                       compatible      =3D "panel";
+                       mode            =3D "XVGA";
+                       refresh         =3D <60>;
+                       xres            =3D <1024>;
+                       yres            =3D <768>;
+                       pixclock        =3D <15748>;
+                       left_margin     =3D <152>;
+                       right_margin    =3D <48>;
+                       upper_margin    =3D <23>;
+                       lower_margin    =3D <3>;
+                       hsync_len       =3D <104>;
+                       vsync_len       =3D <4>;
+                       sync            =3D <0>;
+                       vmode           =3D "FB_VMODE_NONINTERLACED";
+                       tim2            =3D "TIM2_BCD", "TIM2_IPC";
+                       cntl            =3D "CNTL_LCDTFT", "CNTL_BGR", "CNT=
L_LCDVCOMP(1)";
+                       caps            =3D "CLCD_CAP_5551", "CLCD_CAP_565"=
, "CLCD_CAP_888";
+                       bpp             =3D <16>;
+               };
+       };
+
+};
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3=
-psci-custom.dts b/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base=
-gicv3-psci-custom.dts
new file mode 100644
index 0000000..984dbca
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3-psci-c=
ustom.dts
@@ -0,0 +1,9 @@
+/*
+ * Copyright (c) 2013-2017, ARM Limited and Contributors. All rights reser=
ved.
+ *
+ * SPDX-License-Identifier: BSD-3-Clause
+ */
+
+/dts-v1/;
+
+/include/ "fvp-base-gicv3-psci-common-custom.dtsi"
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/rtsm_ve-mother=
board-nomap.dtsi b/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/rtsm_ve-=
motherboard-nomap.dtsi
new file mode 100644
index 0000000..739af57
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/rtsm_ve-motherboard-n=
omap.dtsi
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Ltd. Fast Models
+ *
+ * Versatile Express (VE) system model
+ * Motherboard component
+ *
+ * VEMotherBoard.lisa
+ *
+ * This is a duplicate of rtsm_ve-motherboard.dtsi but not
+ * using interrupt-map as this is not properly supported in
+ * xen right now
+ */
+/ {
+       smb@8000000 {
+               motherboard {
+                       arm,v2m-memory-map =3D "rs1";
+                       compatible =3D "arm,vexpress,v2m-p1", "simple-bus";
+                       #address-cells =3D <2>; /* SMB chipselect number an=
d offset */
+                       #size-cells =3D <1>;
+                       ranges;
+
+                       flash@0,00000000 {
+                               compatible =3D "arm,vexpress-flash", "cfi-f=
lash";
+                               reg =3D <0 0x00000000 0x04000000>,
+                                     <4 0x00000000 0x04000000>;
+                               bank-width =3D <4>;
+                       };
+
+                       v2m_video_ram: vram@2,00000000 {
+                               compatible =3D "arm,vexpress-vram";
+                               reg =3D <2 0x00000000 0x00800000>;
+                       };
+
+                       ethernet@2,02000000 {
+                               compatible =3D "smsc,lan91c111";
+                               reg =3D <2 0x02000000 0x10000>;
+                               interrupts =3D <0 15 4>;
+                       };
+
+                       v2m_clk24mhz: clk24mhz {
+                               compatible =3D "fixed-clock";
+                               #clock-cells =3D <0>;
+                               clock-frequency =3D <24000000>;
+                               clock-output-names =3D "v2m:clk24mhz";
+                       };
+
+                       v2m_refclk1mhz: refclk1mhz {
+                               compatible =3D "fixed-clock";
+                               #clock-cells =3D <0>;
+                               clock-frequency =3D <1000000>;
+                               clock-output-names =3D "v2m:refclk1mhz";
+                       };
+
+                       v2m_refclk32khz: refclk32khz {
+                               compatible =3D "fixed-clock";
+                               #clock-cells =3D <0>;
+                               clock-frequency =3D <32768>;
+                               clock-output-names =3D "v2m:refclk32khz";
+                       };
+
+                       iofpga@3,00000000 {
+                               compatible =3D "simple-bus";
+                               #address-cells =3D <1>;
+                               #size-cells =3D <1>;
+                               ranges =3D <0 3 0 0x200000>;
+
+                               v2m_sysreg: sysreg@10000 {
+                                       compatible =3D "arm,vexpress-sysreg=
";
+                                       reg =3D <0x010000 0x1000>;
+                                       gpio-controller;
+                                       #gpio-cells =3D <2>;
+                               };
+
+                               v2m_sysctl: sysctl@20000 {
+                                       compatible =3D "arm,sp810", "arm,pr=
imecell";
+                                       reg =3D <0x020000 0x1000>;
+                                       clocks =3D <&v2m_refclk32khz>, <&v2=
m_refclk1mhz>, <&v2m_clk24mhz>;
+                                       clock-names =3D "refclk", "timclk",=
 "apb_pclk";
+                                       #clock-cells =3D <1>;
+                                       clock-output-names =3D "timerclken0=
", "timerclken1", "timerclken2", "timerclken3";
+                                       assigned-clocks =3D <&v2m_sysctl 0>=
, <&v2m_sysctl 1>, <&v2m_sysctl 3>, <&v2m_sysctl 3>;
+                                       assigned-clock-parents =3D <&v2m_re=
fclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>;
+                               };
+
+                               aaci@40000 {
+                                       compatible =3D "arm,pl041", "arm,pr=
imecell";
+                                       reg =3D <0x040000 0x1000>;
+                                       interrupts =3D <0 11 4>;
+                                       clocks =3D <&v2m_clk24mhz>;
+                                       clock-names =3D "apb_pclk";
+                               };
+
+                               mmci@50000 {
+                                       compatible =3D "arm,pl180", "arm,pr=
imecell";
+                                       reg =3D <0x050000 0x1000>;
+                                       interrupts =3D <0 9 4 0 10 4>;
+                                       cd-gpios =3D <&v2m_sysreg 0 0>;
+                                       wp-gpios =3D <&v2m_sysreg 1 0>;
+                                       max-frequency =3D <12000000>;
+                                       vmmc-supply =3D <&v2m_fixed_3v3>;
+                                       clocks =3D <&v2m_clk24mhz>, <&v2m_c=
lk24mhz>;
+                                       clock-names =3D "mclk", "apb_pclk";
+                               };
+
+                               kmi@60000 {
+                                       compatible =3D "arm,pl050", "arm,pr=
imecell";
+                                       reg =3D <0x060000 0x1000>;
+                                       interrupts =3D <0 12 4>;
+                                       clocks =3D <&v2m_clk24mhz>, <&v2m_c=
lk24mhz>;
+                                       clock-names =3D "KMIREFCLK", "apb_p=
clk";
+                               };
+
+                               kmi@70000 {
+                                       compatible =3D "arm,pl050", "arm,pr=
imecell";
+                                       reg =3D <0x070000 0x1000>;
+                                       interrupts =3D <0 13 4>;
+                                       clocks =3D <&v2m_clk24mhz>, <&v2m_c=
lk24mhz>;
+                                       clock-names =3D "KMIREFCLK", "apb_p=
clk";
+                               };
+
+                               v2m_serial0: uart@90000 {
+                                       compatible =3D "arm,pl011", "arm,pr=
imecell";
+                                       reg =3D <0x090000 0x1000>;
+                                       interrupts =3D <0 5 4>;
+                                       clocks =3D <&v2m_clk24mhz>, <&v2m_c=
lk24mhz>;
+                                       clock-names =3D "uartclk", "apb_pcl=
k";
+                               };
+
+                               v2m_serial1: uart@a0000 {
+                                       compatible =3D "arm,pl011", "arm,pr=
imecell";
+                                       reg =3D <0x0a0000 0x1000>;
+                                       interrupts =3D <0 6 4>;
+                                       clocks =3D <&v2m_clk24mhz>, <&v2m_c=
lk24mhz>;
+                                       clock-names =3D "uartclk", "apb_pcl=
k";
+                               };
+
+                               v2m_serial2: uart@b0000 {
+                                       compatible =3D "arm,pl011", "arm,pr=
imecell";
+                                       reg =3D <0x0b0000 0x1000>;
+                                       interrupts =3D <0 7 4>;
+                                       clocks =3D <&v2m_clk24mhz>, <&v2m_c=
lk24mhz>;
+                                       clock-names =3D "uartclk", "apb_pcl=
k";
+                               };
+
+                               v2m_serial3: uart@c0000 {
+                                       compatible =3D "arm,pl011", "arm,pr=
imecell";
+                                       reg =3D <0x0c0000 0x1000>;
+                                       interrupts =3D <0 8 4>;
+                                       clocks =3D <&v2m_clk24mhz>, <&v2m_c=
lk24mhz>;
+                                       clock-names =3D "uartclk", "apb_pcl=
k";
+                               };
+
+                               wdt@f0000 {
+                                       compatible =3D "arm,sp805", "arm,pr=
imecell";
+                                       reg =3D <0x0f0000 0x1000>;
+                                       interrupts =3D <0 0 4>;
+                                       clocks =3D <&v2m_refclk32khz>, <&v2=
m_clk24mhz>;
+                                       clock-names =3D "wdogclk", "apb_pcl=
k";
+                               };
+
+                               v2m_timer01: timer@110000 {
+                                       compatible =3D "arm,sp804", "arm,pr=
imecell";
+                                       reg =3D <0x110000 0x1000>;
+                                       interrupts =3D <0 2 4>;
+                                       clocks =3D <&v2m_sysctl 0>, <&v2m_s=
ysctl 1>, <&v2m_clk24mhz>;
+                                       clock-names =3D "timclken1", "timcl=
ken2", "apb_pclk";
+                               };
+
+                               v2m_timer23: timer@120000 {
+                                       compatible =3D "arm,sp804", "arm,pr=
imecell";
+                                       reg =3D <0x120000 0x1000>;
+                                       interrupts =3D <0 3 4>;
+                                       clocks =3D <&v2m_sysctl 2>, <&v2m_s=
ysctl 3>, <&v2m_clk24mhz>;
+                                       clock-names =3D "timclken1", "timcl=
ken2", "apb_pclk";
+                               };
+
+                               rtc@170000 {
+                                       compatible =3D "arm,pl031", "arm,pr=
imecell";
+                                       reg =3D <0x170000 0x1000>;
+                                       interrupts =3D <0 4 4>;
+                                       clocks =3D <&v2m_clk24mhz>;
+                                       clock-names =3D "apb_pclk";
+                               };
+
+                               clcd@1f0000 {
+                                       compatible =3D "arm,pl111", "arm,pr=
imecell";
+                                       reg =3D <0x1f0000 0x1000>;
+                                       interrupt-names =3D "combined";
+                                       interrupts =3D <0 14 4>;
+                                       clocks =3D <&v2m_oscclk1>, <&v2m_cl=
k24mhz>;
+                                       clock-names =3D "clcdclk", "apb_pcl=
k";
+                                       arm,pl11x,framebuffer =3D <0x180000=
00 0x00180000>;
+                                       memory-region =3D <&v2m_video_ram>;
+                                       max-memory-bandwidth =3D <130000000=
>; /* 16bpp @ 63.5MHz */
+
+                                       port {
+                                               v2m_clcd_pads: endpoint {
+                                                       remote-endpoint =3D=
 <&v2m_clcd_panel>;
+                                                       arm,pl11x,tft-r0g0b=
0-pads =3D <0 8 16>;
+                                               };
+                                       };
+
+                                       panel {
+                                               compatible =3D "panel-dpi";
+
+                                               port {
+                                                       v2m_clcd_panel: end=
point {
+                                                               remote-endp=
oint =3D <&v2m_clcd_pads>;
+                                                       };
+                                               };
+
+                                               panel-timing {
+                                                       clock-frequency =3D=
 <63500127>;
+                                                       hactive =3D <1024>;
+                                                       hback-porch =3D <15=
2>;
+                                                       hfront-porch =3D <4=
8>;
+                                                       hsync-len =3D <104>=
;
+                                                       vactive =3D <768>;
+                                                       vback-porch =3D <23=
>;
+                                                       vfront-porch =3D <3=
>;
+                                                       vsync-len =3D <4>;
+                                               };
+                                       };
+                               };
+
+                               virtio-block@130000 {
+                                       compatible =3D "virtio,mmio";
+                                       reg =3D <0x130000 0x200>;
+                                       interrupts =3D <0 42 4>;
+                               };
+                       };
+
+                       v2m_fixed_3v3: v2m-3v3 {
+                               compatible =3D "regulator-fixed";
+                               regulator-name =3D "3V3";
+                               regulator-min-microvolt =3D <3300000>;
+                               regulator-max-microvolt =3D <3300000>;
+                               regulator-always-on;
+                       };
+
+                       mcc {
+                               compatible =3D "arm,vexpress,config-bus";
+                               arm,vexpress,config-bridge =3D <&v2m_sysreg=
>;
+
+                               v2m_oscclk1: oscclk1 {
+                                       /* CLCD clock */
+                                       compatible =3D "arm,vexpress-osc";
+                                       arm,vexpress-sysreg,func =3D <1 1>;
+                                       freq-range =3D <23750000 63500000>;
+                                       #clock-cells =3D <0>;
+                                       clock-output-names =3D "v2m:oscclk1=
";
+                               };
+
+                               reset {
+                                       compatible =3D "arm,vexpress-reset"=
;
+                                       arm,vexpress-sysreg,func =3D <5 0>;
+                               };
+
+                               muxfpga {
+                                       compatible =3D "arm,vexpress-muxfpg=
a";
+                                       arm,vexpress-sysreg,func =3D <7 0>;
+                               };
+
+                               shutdown {
+                                       compatible =3D "arm,vexpress-shutdo=
wn";
+                                       arm,vexpress-sysreg,func =3D <8 0>;
+                               };
+
+                               reboot {
+                                       compatible =3D "arm,vexpress-reboot=
";
+                                       arm,vexpress-sysreg,func =3D <9 0>;
+                               };
+
+                               dvimode {
+                                       compatible =3D "arm,vexpress-dvimod=
e";
+                                       arm,vexpress-sysreg,func =3D <11 0>=
;
+                               };
+                       };
+               };
+       };
+};
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.in=
c b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
index 3ddebb9..3b71a71 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
@@ -26,6 +26,12 @@ KMACHINE_foundation-armv8 =3D "fvp"
 #
 COMPATIBLE_MACHINE_fvp-base =3D "fvp-base"
 KMACHINE_fvp-base =3D "fvp"
+SRC_URI_append_fvp-base =3D " file://dts/arm;subdir=3Dadd-files"
+
+do_patch_append_fvp-base() {
+    tar -C ${WORKDIR}/add-files/dts -cf - arm | \
+        tar -C arch/arm64/boot/dts -xf -
+}

 #
 # Juno KMACHINE
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
