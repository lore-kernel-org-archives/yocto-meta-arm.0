Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.59])
 by mx.groups.io with SMTP id smtpd.web09.10743.1603707749076706202
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 03:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3Py74FBl;
 spf=pass (domain: arm.com, ip: 40.107.14.59, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkUKL1eOUziBsSqgGNZ0gt8h/DphV6+nnoggXvSIMcs=;
 b=3Py74FBlscn1QVWbs6BJaDqukeGskEJsAUD9mSKr2YZY4M6N883wMNyXSsWSwG+FeTLg1TUKCYmjlK8YO0Ix84KuwxORFL+pU6zDM0LFp+nccMFgRAfcqjkU6ERWGo+KLQCBz8bLWphGRCNpUBkj849/BugsVl7WvlHsVCxhQ5g=
Received: from AM6P192CA0068.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::45)
 by DB6PR08MB2661.eurprd08.prod.outlook.com (2603:10a6:6:17::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 10:22:26 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::cc) by AM6P192CA0068.outlook.office365.com
 (2603:10a6:209:82::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 26 Oct 2020 10:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Mon, 26 Oct 2020 10:22:25 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64"); Mon, 26 Oct 2020 10:22:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15cc7c2fdfcb6ff2
X-CR-MTA-TID: 64aa7808
Received: from e306366b38ae.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D10DD610-D385-4285-964C-623D1699B7B0.1;
	Mon, 26 Oct 2020 10:21:48 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e306366b38ae.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 26 Oct 2020 10:21:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRiEwsc/gaw/kg/3pUB6Om7ULawmSoXNHejz5XphWoaj4+FDquNXcCrlhRG/4fiie4SZl9eZCbm6K1eVgZ6HCBFNLoFM30BgvcwB/enToLJmSpa057vsnhbX3LXUa/m3ENN6n7/7wf9dHbS6rW4e6E5Z7YWGZPCy8vPVcSAxQkZKY91oGc7LuAmTvuF5jz5SdpcMMjddoWgsFISiM9+VvOy2+CaWbkOu4TF3aZmF0higm4CzuTaepmqOsrvkrqPbHylD9HFTuqlk1XvVf/D1nnahAbSZ6FH4RVQIn4w6J5xwaD7N5AxeCEFCYoAIgZiSJIX+rqhzEU2kW6nhMwZQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkUKL1eOUziBsSqgGNZ0gt8h/DphV6+nnoggXvSIMcs=;
 b=QgUaVuHmBNsj53jLf4MKe7OoVErFnxr1Xv+ALYgpmZ706e6Uam7vGYOErn1L2MKG1K9F9OHe+edUgAlK2eeup3iXS92wKyLhWw4FLMexZVYS1gxvREhCQUnC8Ns//0G/udd19UKnBx2v/kTx6HRDksfQHFlKF0wiEThdlX6LcgnXCnzJN3oriUWenKVJCbPU46J9HAuxK6PqjcftZtA2gQ8pm1hsrWOiy0nHBrF3CeG5ADoBW4jU43iq4mzecZH1ujMpBJcKLz9T6yWhxogaWWxuws2++JDAABBt9sC+8zyKzavSuRCIoZvDE5aTSsRPFr6RuVR1dpOL/om5Fvpalw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkUKL1eOUziBsSqgGNZ0gt8h/DphV6+nnoggXvSIMcs=;
 b=3Py74FBlscn1QVWbs6BJaDqukeGskEJsAUD9mSKr2YZY4M6N883wMNyXSsWSwG+FeTLg1TUKCYmjlK8YO0Ix84KuwxORFL+pU6zDM0LFp+nccMFgRAfcqjkU6ERWGo+KLQCBz8bLWphGRCNpUBkj849/BugsVl7WvlHsVCxhQ5g=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB6089.eurprd08.prod.outlook.com (2603:10a6:10:206::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Mon, 26 Oct
 2020 10:21:44 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::a1a0:2e27:6240:e4bd]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::a1a0:2e27:6240:e4bd%3]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 10:21:44 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH v2] arm-bsp/n1sdp: add board firmware recipe and documentation
Date: Mon, 26 Oct 2020 11:20:58 +0100
Message-ID: <20201026102058.13079-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: SN4PR0501CA0131.namprd05.prod.outlook.com
 (2603:10b6:803:42::48) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by SN4PR0501CA0131.namprd05.prod.outlook.com (2603:10b6:803:42::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.4 via Frontend Transport; Mon, 26 Oct 2020 10:21:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 49e695cf-5dd2-4d78-6471-08d8799908e2
X-MS-TrafficTypeDiagnostic: DBBPR08MB6089:|DB6PR08MB2661:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB2661AF2C93C3809DF0E86C73FD190@DB6PR08MB2661.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Ru9VAUoihPGBXVKaPSxvLYpiSqpaPkMi7zDIszc+kQuPZaq2WvhAGYqF5ehF7w9reCJ5ciLfvepu2EOsk8/6YFLmJV7tsCcSG+TsQXvaNaIaghEdcOzuajo4jS6R9lvG2Eqfeol4JFlgr+1K/GRoso4kTDsHuiKwHbFs8XYIS0VBcqtxJrnApWL41y9m76qNkGmXqhjafkvXZu7tpNL888wLr93shEDa30R7v/EPY2ORFqZboz7Ko81XHkJk16dbuml0yLU/hpP0YLpc3yn/HkAv+pJdqkWPrE2fe7hgWaBk+w+Mn0C0TQN1ccCMGSSpVKHFUsHfrG89mPHybnCNIDik17bVHxmerEkzO8U2RkxYHFmNYeJQGGuPqwAYG9WzxKSLg2TL/iTzl2f10f3L8Virprvv+I10OAw21wVGrAaS9BIzZgteaxjjoAAC4vivKL+a7zGTarVeZuzqyRsU/5jBlcQcfsoMcQTf7HxFWmk=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(15974865002)(16526019)(186003)(8936002)(86362001)(6486002)(4326008)(26005)(83380400001)(8676002)(478600001)(316002)(52116002)(66476007)(966005)(66556008)(30864003)(66946007)(36756003)(6916009)(956004)(1076003)(2906002)(5660300002)(2616005)(44832011)(6666004)(7696005)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: u7TARA6dvJtugDzHqV6cntymt3LM/cWdHi8hGkPHEsRi2PWRbiNqxFeD6EkG/2leGmNnj0DFQpXgu91MczAKU6wlcvHy2HHP/eiVBm1sLV0Wqd92wDXgSm6xfPylYPBiVdB6WYFsAXtpFFZ9WXBPd8Y9jPOgvclbEo3KEXcggJmEED7yyEXVFuE8CkQ/B+Q4VxLE/de8Hsy0Hg7hn66iQVJnv9gITnQ8QXVRRPa7fjP1e/HpX5tNHDZw0s9A4VEdveEGUf64QSd404C7HvrtbW6zy86VuNPH2K7MY27JIkSC1iAW/uM9xegNZubpPBl8HA98AgqZgqaVZSD6/P4JWgESqg9xuY8wv06E+IjbHxLcl4akI1IVXPYv1RZyty5yYsPrsK5RWetv0aVKixegH8L9Tcb4EOT/3X/Vx/XdahoCLIu5V+x4P5hLaVdekqDN3rLIL+hEkzSBrDAFRU6ZE7nFM496kDGr//XTbjjwnDHkCgG2Qw6gd+ZqMPc9L7CogqbCFCNN/6pHDveS4DD2u3HAyUaZ8QKM8NBvZ7zDkjNra57noqOkky7sadeS0KgR51e/vMGNztygJV1rO8kYY/gIITnY7VqxBBx0lug1S/jAaRI4yC4CpPHTk/8+u0JvRPIj203z/EAk3HlbQCqSPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6089
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8e0950ce-6e8e-4d08-c315-08d87998efd7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fLEb2noAhF19lC+jd0nOfcU25UjX3Tc+6LIYzguK51Zk17r5Tiyem66ZXeodTRAUAtv2fG3PFXLpMi1x7b23cSv6FeAE4gx5tAuhw0GesTeoa4Q9+ifQCGpRV1bGIWdNqH2/NGHG7qtpYiOc4pJ0yzKeOQRw8OlKWq+9RqXp2Vbk+5VTTM98UP1xowFodJkgSWdmwySMHMWiUzU6FxJvqM9ZbliyxFCe1HIIkwjb3kDca2XBuG46IQGWnk1xW/MQ9V7GiQY87cNg3kadEM4kd1dnO3eliLuV8Go75WUH5RhlPmL0J4jsnBk+SpfmaM1BFQrjuOYTtzhGpjH2B8F+1AihUW8GygkJFgSGV+NsKABFchGTZsGcua97GBIBw0ylozxxn3V1s0tSn8nMOlU2cPJhSK8YH07PHFKpHy6ZDFdunC9ic6w82XfSgoukZOByX/df0e3dkC4xjEpJVH9PLTL/kE47LVDlWKJkY4UnJHFIWqgXEgWtZp/+0npqBqmX6VPu6KgESSazNXE32jnqYQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966005)(70206006)(70586007)(5660300002)(1076003)(26005)(30864003)(478600001)(8676002)(336012)(6486002)(316002)(186003)(956004)(36906005)(2616005)(16526019)(6666004)(44832011)(966005)(4326008)(356005)(86362001)(8936002)(15974865002)(82740400003)(83380400001)(81166007)(47076004)(7696005)(2906002)(82310400003)(6916009)(36756003)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2020 10:22:25.8098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e695cf-5dd2-4d78-6471-08d8799908e2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2661
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

board-firmware:
 * updates scp binaries
 * Custom license - STM-SLA0044-Rev5 - added in layer.conf,
   whitelisted in n1sdp.conf.

firmware-image:
 * Combines uefi, tf-a and scp binaries into a tarball.
 * There are 2 flavours available:
   - n1sdp-board-firmware_primary.tar.gz
   - n1sdp-board-firmware_secondary.tar.gz

Change-Id: I82d0c995956310a569b27431f98f7c21accf8330
Issue-Id: SCM-1508
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 meta-arm-bsp/conf/layer.conf                  |  3 +
 meta-arm-bsp/conf/machine/n1sdp.conf          |  5 ++
 meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5 | 18 ++++
 meta-arm-bsp/documentation/n1sdp.md           | 64 ++++++++++++++
 .../images/board-firmware-n1sdp_2020.07.27.bb | 53 ++++++++++++
 .../images/sdcard-image-n1sdp_0.1.bb          | 84 +++++++++++++++++++
 6 files changed, 227 insertions(+)
 create mode 100644 meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5
 create mode 100644 meta-arm-bsp/documentation/n1sdp.md
 create mode 100644 meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_20=
20.07.27.bb
 create mode 100644 meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.=
bb

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index f9c2422..1260440 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -15,3 +15,6 @@ LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm meta-kernel"
 # This won't be used by layerindex-fetch, but works everywhere else
 LAYERDEPENDS_meta-arm-bsp_append_musca-b1 =3D " meta-python"
 LAYERDEPENDS_meta-arm-bsp_append_musca-s1 =3D " meta-python"
+
+# Additional license directories.
+LICENSE_PATH +=3D "${LAYERDIR}/custom-licenses"
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machi=
ne/n1sdp.conf
index 4649826..3d31c4c 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -37,3 +37,8 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/uefi-firmware"
 #grub-efi
 EFI_PROVIDER ?=3D "grub-efi"
 MACHINE_FEATURES +=3D "efi"
+
+# SD-Card firmware
+# Board firmware prebuilts are shared under custom license
+LICENSE_FLAGS_WHITELIST +=3D "stm-sla0044"
+EXTRA_IMAGEDEPENDS +=3D "sdcard-image-n1sdp"
diff --git a/meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5 b/meta-arm-bsp/c=
ustom-licenses/STM-SLA0044-Rev5
new file mode 100644
index 0000000..edb5cd5
--- /dev/null
+++ b/meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5
@@ -0,0 +1,18 @@
+SLA0044 Rev5/February 2018
+
+BY INSTALLING COPYING, DOWNLOADING, ACCESSING OR OTHERWISE USING THIS SOFT=
WARE OR ANY PART THEREOF (AND THE RELATED DOCUMENTATION) FROM STMICROELECTR=
ONICS INTERNATIONAL N.V, SWISS BRANCH AND/OR ITS AFFILIATED COMPANIES (STMI=
CROELECTRONICS), THE RECIPIENT, ON BEHALF OF HIMSELF OR HERSELF, OR ON BEHA=
LF OF ANY ENTITY BY WHICH SUCH RECIPIENT IS EMPLOYED AND/OR ENGAGED AGREES =
TO BE BOUND BY THIS SOFTWARE LICENSE AGREEMENT.
+
+Under STMicroelectronics=E2=80=99 intellectual property rights, the redist=
ribution, reproduction and use in source and binary forms of the software o=
r any part thereof, with or without modification, are permitted provided th=
at the following conditions are met:
+1.	Redistribution of source code (modified or not) must retain any copyrig=
ht notice, this list of conditions and the disclaimer set forth below as it=
ems 10 and 11.
+2.	Redistributions in binary form, except as embedded into microcontroller=
 or microprocessor device manufactured by or for STMicroelectronics or a so=
ftware update for such device, must reproduce any copyright notice provided=
 with the binary code, this list of conditions, and the disclaimer set fort=
h below as items 10 and 11, in documentation and/or other materials provide=
d with the distribution.
+3.	Neither the name of STMicroelectronics nor the names of other contribut=
ors to this software may be used to endorse or promote products derived fro=
m this software or part thereof without specific written permission.
+4.	This software or any part thereof, including modifications and/or deriv=
ative works of this software, must be used and execute solely and exclusive=
ly on or in combination with a microcontroller or microprocessor device man=
ufactured by or for STMicroelectronics.
+5.	No use, reproduction or redistribution of this software partially or to=
tally may be done in any manner that would subject this software to any Ope=
n Source Terms. =E2=80=9COpen Source Terms=E2=80=9D shall mean any open sou=
rce license which requires as part of distribution of software that the sou=
rce code of such software is distributed therewith or otherwise made availa=
ble, or open source license that substantially complies with the Open Sourc=
e definition specified at www.opensource.org and any other comparable open =
source license such as for example GNU General Public License (GPL), Eclips=
e Public License (EPL), Apache Software License, BSD license or MIT license=
.
+6.	STMicroelectronics has no obligation to provide any maintenance, suppor=
t or updates for the software.
+7.	The software is and will remain the exclusive property of STMicroelectr=
onics and its licensors. The recipient will not take any action that jeopar=
dizes STMicroelectronics and its licensors' proprietary rights or acquire a=
ny rights in the software, except the limited rights specified hereunder.
+8.	The recipient shall comply with all applicable laws and regulations aff=
ecting the use of the software or any part thereof including any applicable=
 export control law or regulation.
+9.	Redistribution and use of this software or any part thereof other than =
as permitted under this license is void and will automatically terminate yo=
ur rights under this license.=20
+10.	THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "AS I=
S" AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT LIM=
ITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULA=
R PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY RIGHTS,=
 WHICH ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT S=
HALL STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,=
 INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT N=
OT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DA=
TA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY =
OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEG=
LIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, E=
VEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+11.	EXCEPT AS EXPRESSLY PERMITTED HEREUNDER, NO LICENSE OR OTHER RIGHTS, W=
HETHER EXPRESS OR IMPLIED, ARE GRANTED UNDER ANY PATENT OR OTHER INTELLECTU=
AL PROPERTY RIGHTS OF STMICROELECTRONICS OR ANY THIRD PARTY.
+=20
+
diff --git a/meta-arm-bsp/documentation/n1sdp.md b/meta-arm-bsp/documentati=
on/n1sdp.md
new file mode 100644
index 0000000..24e35f0
--- /dev/null
+++ b/meta-arm-bsp/documentation/n1sdp.md
@@ -0,0 +1,64 @@
+# N1SDP Development Platform Support in meta-arm-bsp
+
+## Configuration:
+In the local.conf file, MACHINE should be set as follow:
+MACHINE ?=3D "n1sdp"
+
+## Building
+```bash$ bitbake core-image-minimal```
+
+## Running
+
+# Update Firmware on SD card:
+
+(*) To use n1sdp board in single chip mode, flash:
+    n1sdp-board-firmware_primary.tar.gz firmware.
+
+(*) To use n1sdp board in multi chip mode, flash:
+    n1sdp-board-firmware_primary.tar.gz firmware to primary board,
+    n1sdp-board-firmware_secondary.tar.gz firmware to secondary board.
+
+The SD card content is generated during the build here:
+  tmp/deploy/images/n1sdp/n1sdp-board-firmware_primary.tar.gz
+  tmp/deploy/images/n1sdp/n1sdp-board-firmware_secondary.tar.gz
+
+
+Its content must be written on the N1SDP firmware SD card.
+To do this:
+- insert the sdcard of the N1SDP in an SD card reader and mount it:
+```bash$ sudo mount /dev/sdx1 /mnt```
+(replace sdx by the device of the SD card)
+
+- erase its content and put the new one:
+```bash$ sudo rm -rf /mnt/*```
+```bash$ sudo tar --no-same-owner -xzf tmp/deploy/images/n1sdp/n1sdp-board=
-firmware_primary.tar.gz -C /mnt/```
+```bash$ sudo umount /mnt```
+
+- reinsert the SD card in the N1SDP board
+
+Firmware tarball contains iofpga configuration files, scp and uefi binarie=
s.
+
+**NOTE**:
+If the N1SDP board was manufactured after November 2019 (Serial Number gre=
ater
+than 36253xxx), a different PMIC firmware image must be used to prevent
+potential damage to the board. More details can be found in [1].
+The `MB/HBI0316A/io_v123f.txt` file located in the microSD needs to be upd=
ated.
+To update it, set the PMIC image (300k_8c2.bin) to be used in the newer mo=
dels
+by running the following commands on your host PC:
+
+    $ sudo umount /dev/sdx1
+    $ sudo mount /dev/sdx1 /mnt
+    $ sudo sed -i '/^MBPMIC: pms_0V85.bin/s/^/;/g' /mnt/MB/HBI0316A/io_v12=
3f.txt
+    $ sudo sed -i '/^;MBPMIC: 300k_8c2.bin/s/^;//g' /mnt/MB/HBI0316A/io_v1=
23f.txt
+    $ sudo umount /mnt
+
+# Prepare an USB hard drive:
+
+Grub boot partition is placed on first partition of the *.wic image,
+Linux root file system is placed on the second partition of the *.wic imag=
e:
+  tmp/deploy/images/n1sdp/core-image-minimal-n1sdp.wic
+
+This *.wic image should be copied to USB stick with simple dd call.
+
+
+[1]: https://community.arm.com/developer/tools-software/oss-platforms/w/do=
cs/604/notice-potential-damage-to-n1sdp-boards-if-using-latest-firmware-rel=
ease
diff --git a/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.2=
7.bb b/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
new file mode 100644
index 0000000..8f7b6c1
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
@@ -0,0 +1,53 @@
+DESCRIPTION =3D "Board Firmware binaries for N1SDP"
+
+# Board-firmware-n1sdp custom license is whitelisted in n1sdp.conf file.
+# Uncomment, or copy this line to your local.conf to build board firmware,
+# if you are using custom n1sdp.conf file.
+# Please make sure to check the applicable license beforehand!
+#LICENSE_FLAGS_WHITELIST =3D "stm-sla0044"
+
+LICENSE =3D "STM-SLA0044-Rev5"
+LICENSE_FLAGS =3D "stm-sla0044"
+
+LIC_FILES_CHKSUM =3D "file://${S}/LICENSES/STM.TXT;md5=3D4b8dab81d0bfc0a5f=
63c9a983402705b"
+
+SECTION =3D "firmware"
+
+inherit deploy
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE =3D "n1sdp"
+RM_WORK_EXCLUDE +=3D "${PN}"
+
+PV =3D "2020.07.27"
+TAG =3D "N1SDP-${PV}"
+FIRMWARE_TARBALL =3D "n1sdp-board-firmware-${TAG}"
+UNPACK_DIR =3D "n1sdp-board-firmware_source"
+S =3D "${WORKDIR}/${UNPACK_DIR}"
+
+SRC_URI =3D "https://git.linaro.org/landing-teams/working/arm/n1sdp-board-=
firmware.git/snapshot/${FIRMWARE_TARBALL}.tar.gz;unpack=3D0"
+SRC_URI[md5sum] =3D "8ba3807ff8f222201154861f11524b14"
+SRC_URI[sha256sum] =3D "57feba404026f2d6d49c167d63e0e84653ad8b808b13e2244b=
81fea9e0d58d66"
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+do_install() {
+    cd ${WORKDIR}
+    tar -xvaf ${WORKDIR}/${FIRMWARE_TARBALL}.tar.gz --exclude=3D${FIRMWARE=
_TARBALL}/SOFTWARE/*
+    mv -v ${WORKDIR}/${FIRMWARE_TARBALL}/* ${S}
+
+    cp -R --no-dereference --preserve=3Dmode,links -v ${S} ${D}
+}
+do_install[dirs] +=3D "${S}"
+do_install[cleandirs] +=3D "${S}"
+
+FILES_${PN} =3D "/${UNPACK_DIR}/*"
+SYSROOT_DIRS +=3D "/${UNPACK_DIR}"
+addtask install after do_unpack before do_populate_lic
+
+do_deploy() {
+    cp -av ${S} ${DEPLOYDIR}
+}
+addtask deploy after do_install
diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb b/me=
ta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
new file mode 100644
index 0000000..68b13eb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
@@ -0,0 +1,84 @@
+SUMMARY =3D "Firmware image recipe for generating SD-Card artifacts."
+
+inherit deploy nopackages
+
+DEPENDS =3D "virtual/uefi-firmware \
+           virtual/control-processor-firmware \
+           board-firmware-n1sdp"
+
+LICENSE =3D "MIT"
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE =3D "n1sdp"
+RM_WORK_EXCLUDE +=3D "${PN}"
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+do_install[noexec] =3D "1"
+
+FIRMWARE_DIR =3D "n1sdp-board-firmware_source"
+PRIMARY_DIR =3D "${WORKDIR}/n1sdp-board-firmware_primary"
+SECONDARY_DIR =3D "${WORKDIR}/n1sdp-board-firmware_secondary"
+
+SOC_BINARIES_PRIMARY =3D "mcp_fw.bin scp_fw.bin ${SOC_BINARIES_SECONDARY}"
+SOC_BINARIES_SECONDARY =3D "mcp_rom.bin scp_rom.bin"
+
+
+prepare_package() {
+    cd ${WORKDIR}
+
+    # Master/Primary
+    cp -av ${RECIPE_SYSROOT}/${FIRMWARE_DIR}/* ${PRIMARY_DIR}
+    mkdir -p ${PRIMARY_DIR}/SOFTWARE/
+
+    # Copy uefi binary
+    cp -v ${RECIPE_SYSROOT}/firmware/uefi.bin ${PRIMARY_DIR}/SOFTWARE/
+
+    # Copy SOC binaries
+    for f in ${SOC_BINARIES_PRIMARY}; do
+        cp -v ${RECIPE_SYSROOT}/firmware/${f} ${PRIMARY_DIR}/SOFTWARE/
+    done
+
+    sed -i -e 's|^C2C_ENABLE.*|C2C_ENABLE: TRUE            ;C2C enable TRU=
E/FALSE|' \
+        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
+    sed -i -e 's|^C2C_SIDE.*|C2C_SIDE: MASTER            ;C2C side SLAVE/M=
ASTER|' \
+        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
+    sed -i -e 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x000001=
00   ;SoC SCC PLATFORM_CTRL|' \
+        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
+
+    # Slave/Secondary
+    cp -av ${RECIPE_SYSROOT}/${FIRMWARE_DIR}/* ${SECONDARY_DIR}
+    mkdir -p ${SECONDARY_DIR}/SOFTWARE/
+
+    # Copy SOC binaries
+    for f in ${SOC_BINARIES_SECONDARY}; do
+        cp -v ${RECIPE_SYSROOT}/firmware/${f} ${SECONDARY_DIR}/SOFTWARE/
+    done
+
+    sed -i -e 's|^C2C_ENABLE.*|C2C_ENABLE: TRUE            ;C2C enable TRU=
E/FALSE|' \
+        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
+    sed -i -e 's|^C2C_SIDE.*|C2C_SIDE: SLAVE             ;C2C side SLAVE/M=
ASTER|' \
+        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
+    sed -i -e 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x000001=
01   ;SoC SCC PLATFORM_CTRL|' \
+        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
+    sed -i -e '/^TOTALIMAGES:/ s|5|2|' ${SECONDARY_DIR}/MB/HBI0316A/images=
.txt
+    sed -i -e 's|^IMAGE[^23]|;&|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
+    sed -i -e 's|^IMAGE2|IMAGE0|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
+    sed -i -e 's|^IMAGE3|IMAGE1|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
+}
+
+do_deploy() {
+    # prepare Master & Slave packages
+    prepare_package
+
+    for dir in ${PRIMARY_DIR} ${SECONDARY_DIR}; do
+        dir_name=3D$(basename ${dir})
+        mkdir -p ${D}/${dir_name}
+        cp -av ${dir} ${D}
+
+        # Compress the files
+        tar -C ${D}/${dir_name} -zcvf ${DEPLOYDIR}/${dir_name}.tar.gz ./
+    done
+}
+do_deploy[dirs] +=3D "${PRIMARY_DIR} ${SECONDARY_DIR}"
+do_deploy[cleandirs] +=3D "${PRIMARY_DIR} ${SECONDARY_DIR}"
+do_deploy[umask] =3D "022"
+addtask deploy after do_populate_sysroot
--=20
2.17.1

