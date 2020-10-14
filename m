Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.70])
 by mx.groups.io with SMTP id smtpd.web12.10232.1602676110678469599
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 04:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aEccuX37;
 spf=pass (domain: arm.com, ip: 40.107.3.70, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AddeGKyF2gJvf6ab12Go3wuCzXz+kVuoI0X7NpgedyM=;
 b=aEccuX37/IQvrVenCyq+TTUnLL4yW6HK2i87OhJZJ4qLDy/hypMg4YQIUy/GsVa6Nib71lN5+RrLtQ74mUDwGYKMDu0qXqIBdqW3EUGRQY7CfKqYvld7fCKNaL1JgBYKqB6prmkkMK7Viu7BeagiZoq1b/e5SnAUAm6vqFsx5EM=
Received: from AM0PR04CA0114.eurprd04.prod.outlook.com (2603:10a6:208:55::19)
 by AM6PR08MB4053.eurprd08.prod.outlook.com (2603:10a6:20b:ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Wed, 14 Oct
 2020 11:48:27 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:55:cafe::87) by AM0PR04CA0114.outlook.office365.com
 (2603:10a6:208:55::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Wed, 14 Oct 2020 11:48:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 11:48:27 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Wed, 14 Oct 2020 11:48:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 26cc44454a112aac
X-CR-MTA-TID: 64aa7808
Received: from ddb9bb045d9b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 56B595AE-5E47-4F8C-8979-4A396AABB421.1;
	Wed, 14 Oct 2020 11:48:21 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ddb9bb045d9b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Oct 2020 11:48:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f32TSjQYYEx9ZJXiTUA4QN1pusZuLwDqR1KHQqWNy0IiPvDZrB6SKcvHywneSXgt007FaQnu6T6ijcIXK23xy48Hqx7UKQVg4/u01Pj2zBP5veME0CxAnNmReGh69ciApzvG8ucLROBaT3ThntQkIc7bjgd5OZ/mXaf0Ngp7fWlZ1ryk9sepzfZefcEQHtfaPphxI/kN03rj9C7hSt/Kl8JpRD/wjt28+M+FguSgPOrmejbJD9ZMiYeHSVQvKUDaxLqQDkt4xbjtz4/mZpe7jNTtkhq+Jk1Fr/9mVXZEGimavjJZvuy0ZyvcVZiixFDShMe1UosZjxj66lr+ZdI8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AddeGKyF2gJvf6ab12Go3wuCzXz+kVuoI0X7NpgedyM=;
 b=SxYuWjl/rYiIqpbHVlRJg5A08rP/MAzNwUQ6vUCUz3IsYb3sCqxC+ZldPV9Od8DUXnzD/XwsToj5IVf3Oh+JPWZ3TVobd0CchmDdMm7ctKq/DPTvIFpEZPwTjWyOa6ytETUfNl7nAxnSa4v5psm/n3L3p6QUewDQbBxazKIVzulA6JlMVhJFkwlZq7+bhrnRwW8WTpJBv2RcnHqjAwt+5wQUeoCCar5L9TN8kbQ6TYmZTBaEabUY66URjT0h45v9bsM04HSPjqh3dGsY/ni8Us+xRyepbt9kOEVp/j4vL2ceZK/BNadNCHD9q6ox4yPb5QFqMypiLReMPjbow2IIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AddeGKyF2gJvf6ab12Go3wuCzXz+kVuoI0X7NpgedyM=;
 b=aEccuX37/IQvrVenCyq+TTUnLL4yW6HK2i87OhJZJ4qLDy/hypMg4YQIUy/GsVa6Nib71lN5+RrLtQ74mUDwGYKMDu0qXqIBdqW3EUGRQY7CfKqYvld7fCKNaL1JgBYKqB6prmkkMK7Viu7BeagiZoq1b/e5SnAUAm6vqFsx5EM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB4299.eurprd08.prod.outlook.com (2603:10a6:10:ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 14 Oct
 2020 11:48:18 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::a1a0:2e27:6240:e4bd]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::a1a0:2e27:6240:e4bd%3]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 11:48:18 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH] arm-bsp/n1sdp: add board firmware recipe and documentation
Date: Wed, 14 Oct 2020 13:48:01 +0200
Message-ID: <20201014114801.32608-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P123CA0079.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::12) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO2P123CA0079.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:138::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend Transport; Wed, 14 Oct 2020 11:48:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 69f49185-0565-450d-2af1-08d870371054
X-MS-TrafficTypeDiagnostic: DBBPR08MB4299:|AM6PR08MB4053:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB40537FD015C4161720ECC8CAFD050@AM6PR08MB4053.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: RiFCJgDTifQKT3wnfL5uvWknsMlOIlppBbMx/zbFSMj/ykKCOmrMa7+2XMdn6FHj4MzkZUbrSGTVdQZ3WKFzY5oTZxskwD6cBXPmi2JrZfrkLL5LL4cQ4UpYMlUzWDTMdmJWHNBeHqP6u5zppdm2DsJVxR7YFXbeCwdUTRWhiFBSKZuiqWrHSy43/c72I4h79LUPOA8ebrIGiKAtl3BfeqD7YoUW3dnt/aA+jayUtUec2wItK+UZ2Ra/SGb5RI98E8tszN7Gz9lNcLgpe3zQfRTMsNWnK1HpQcoJhHC6UjElxt+9FNciWfRixWlhTIkzzzse6MaTT7935rkQsu5ZG0w0XzL3u4mRiltdpgEfYrGqF0TWi3/3oG8WAWaWgZFA5/6Nwl5VbAOi6AfiF7mWRfE96CmUN8Leo2AHNvEhUFVFWDafrL/xECEamRHrDDjc+9kBqAKeQCvqKjieLhHBDXqxnfHDhW/3qmiktQ4g2+0=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(1076003)(316002)(6666004)(15974865002)(966005)(6486002)(956004)(66556008)(7696005)(30864003)(36756003)(2616005)(52116002)(86362001)(4326008)(66946007)(26005)(2906002)(8936002)(5660300002)(186003)(478600001)(6916009)(66476007)(83380400001)(83080400001)(16526019)(8676002)(44832011)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XUME7oHdGxTUArSg1hf+4AH407fVcNb9RIHySbU2enG5fho3oD+XhyC9lSt7oHgvnyD600ivCnXkw5zfz/AXEir3K0YrDm8c+OzRnCUjr9y33LGVdEx9pVe5pVFPUwIM6hfKQKkI1ideyIjEhE25GmSmEnDQ1aUCRgyildCDS2uVoxi0DFih28CI50aezxJf6EHkep50uu/eIFkurxZ/fGxTLx0MVkGWvLpYlVjg+TihtFa3Z+fim8j0QFTVIBJwqxyOlraCKNh7NjA33ZdmBv+SnUsizPXnFJz1zQv4yH9Vbj3WJP3H+feT+GiDj6aHQxQ9p+nXReQ+H1SdZNjLCB9T0uVCCZUVAX5hZBD6z2QSd0cWuqhqHLiIoGRZ1fAUBDiqlMnEqLcqBL8UHInJdQWkk5vth7mCHco4LyZRf+WnOMJUeqGcVu8FCSPzMdn+NumPUGIiYchEQN4pbju2oF2iJyKzJEbe/alDrqFeCtVvULkv330iKFwSxNFgmIutEYQvpYRSDgJneI0FAE/YYNEhfFheex6WeKJyo3sJavukfA27QJoHh6o1QmfWxZGvg8hS4pcMKnVI4s1W0n5HPP5YfABUCv5wkXbbY8/deOx6TVi/6VTuiNXkFaofWcz8cvQnWJ0kRC4uc7xh1RrZ+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4299
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	590b99ca-c80e-4ad1-c322-08d870370adf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lu3sjZH6S+ODIzWhNDqGcSsD85CdSLmi4M9z91Q4iPhuPvTsGs62ouZJQGF4kJHUi056zYynzR9kY6JiPWEHuIq2RO6w6HxTSPLdu9xzuV4d0EwpAW5+hCySra3eQB2r5sC4jIPGEfKceCaoUz0fschWnSMiMrcopFw1BR/i7jGapY0XDQpu7VSHK+MdEp/xAwBV5+LXIzjwh7afe5CyXwvSefT4gKbjM008G7wBKZQi5u+FwOtMxz9QHIBx3EBDn9oTyxcJ3u20Nb6oEf8GzMxdqxCowIWNuBXVteJFgdjZG2NnJFYC2vE5M+72YiHuP+INsRZtcqL4F1+acyTJrsNBjTQOGocVM5bgNn1b1RR8nEQiGumHgwuW/IPwXi2axBAr9Bx1okjsQcG8LdcCETwB3mp0GJfoLYpGUxGU0h4kQp1r3TwmfcWNmSBRJDqkS8GzR4LLd+F/wpl4jX+CKdOgCWN6lTfNgDdIW2KfSrNN6yrygZkHFjBW9K+kDPtF+i2xd6TrhtrSUmtu21Uxaw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(2616005)(70586007)(956004)(83080400001)(336012)(7696005)(70206006)(81166007)(47076004)(356005)(8676002)(15974865002)(316002)(5660300002)(4326008)(6486002)(36906005)(2906002)(1076003)(30864003)(82740400003)(83380400001)(8936002)(6916009)(966005)(478600001)(44832011)(26005)(16526019)(6666004)(82310400003)(186003)(36756003)(86362001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 11:48:27.1579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f49185-0565-450d-2af1-08d870371054
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4053
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
 meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5 | 18 +++++
 meta-arm-bsp/documentation/n1sdp.md           | 64 +++++++++++++++
 .../images/board-firmware-n1sdp_2020.07.27.bb | 53 ++++++++++++
 .../images/sdcard-image-n1sdp_0.1.bb          | 80 +++++++++++++++++++
 6 files changed, 223 insertions(+)
 create mode 100644 meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5
 create mode 100644 meta-arm-bsp/documentation/n1sdp.md
 create mode 100644 meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_20=
20.07.27.bb
 create mode 100644 meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.=
bb

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 816ff9d..4214132 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -11,3 +11,6 @@ BBFILE_PRIORITY_meta-arm-bsp =3D "6"
=20
 LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm meta-kernel"
 LAYERSERIES_COMPAT_meta-arm-bsp =3D "dunfell gatesgarth"
+
+# Additional license directories.
+LICENSE_PATH +=3D "${LAYERDIR}/custom-licenses"
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machi=
ne/n1sdp.conf
index 9df3e50..8d143fe 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -38,3 +38,8 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/uefi-firmware"
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
index 0000000..e52a019
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
+    cp -av ${S} ${D}
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
index 0000000..9749d70
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
@@ -0,0 +1,80 @@
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
+SOC_BINARIES_PRIMARY =3D "mcp_rom.bin scp_rom.bin ${SOC_BINARIES_SECONDARY=
}"
+SOC_BINARIES_SECONDARY =3D "mcp_fw.bin scp_fw.bin"
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
+    sed -ie 's|^C2C_ENABLE.*|C2C_ENABLE: TRUE            ;C2C enable TRUE/=
FALSE|' \
+        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
+    sed -ie 's|^C2C_SIDE.*|C2C_SIDE: MASTER            ;C2C side SLAVE/MAS=
TER|' \
+        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
+    sed -ie 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x00000100=
   ;SoC SCC PLATFORM_CTRL|' \
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
+    sed -ie 's|^C2C_ENABLE.*|C2C_ENABLE: TRUE            ;C2C enable TRUE/=
FALSE|' \
+        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
+    sed -ie 's|^C2C_SIDE.*|C2C_SIDE: SLAVE             ;C2C side SLAVE/MAS=
TER|' \
+        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
+    sed -ie 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x00000101=
   ;SoC SCC PLATFORM_CTRL|' \
+        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
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

