Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.42])
 by mx.groups.io with SMTP id smtpd.web10.2041.1587626851033859132
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Apr 2020 00:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9HZ1HT3D;
 spf=pass (domain: arm.com, ip: 40.107.14.42, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhrwBZAhaF5UO8eek78KJsX6N/FXHKhy+EMVYbfZ8Y4=;
 b=9HZ1HT3DZeba9sTpfSGJ+yoArIpnYmQobSxmVi0oGyq9pVodlAnM8qSI+sj5r2D0eQkYqAtXCat1GpJESQHxxzyVPUArngU0JfmeSkcO6IICSMBKPiuOmadXukfyKHNy1zdRzrj/ZFtTvgvjTagPQMtr6yF/y1MrcJx6lp5sihI=
Received: from AM5PR0502CA0002.eurprd05.prod.outlook.com
 (2603:10a6:203:91::12) by AM0PR08MB5028.eurprd08.prod.outlook.com
 (2603:10a6:208:164::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Thu, 23 Apr
 2020 07:27:27 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::1e) by AM5PR0502CA0002.outlook.office365.com
 (2603:10a6:203:91::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29 via Frontend
 Transport; Thu, 23 Apr 2020 07:27:27 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.19 via Frontend Transport; Thu, 23 Apr 2020 07:27:27 +0000
Received: ("Tessian outbound 29c24b8a1b7a:v53"); Thu, 23 Apr 2020 07:27:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4bc52f7ab47fc6c7
X-CR-MTA-TID: 64aa7808
Received: from a3890e4efd70.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 63236133-F9B5-40F1-9FE7-6DDEE0E237E1.1;
	Thu, 23 Apr 2020 07:27:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a3890e4efd70.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Apr 2020 07:27:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhDZhpsdD5p8bS/fbmmugX4fRGKzoWWa/jQbTrDpl5z5kzbiUtmbpM8XY0mhM3XBjILhAOD4RAbtyrEflA/SspQQoBr8Dm+reGy47IuqH6XVcP4ME/kuiMZmWswv8BA6qW7HsNkVavFfa7cfquHhEAxY8qyW3g8kS6Z08O6HwX9dW6Tdr4noZ7AHNcfgqsI0AhY5fTBnlgJZTeHx1MXP4ZqCgxSjrH/tmznDoF4vDGzNWj5F61bx0dBfAF9drOcePsbDmguFPBxHWL4P7YVQicsM5pvrHzommtYtbNZQb0Xx5XFS9rKDLgB+mI3DRSdWvo/81OfayxE7sjHe4qOMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhrwBZAhaF5UO8eek78KJsX6N/FXHKhy+EMVYbfZ8Y4=;
 b=llmN+lnZjm+UcuebrZyT0Ynt0b7ZlmXwEm8u3dqvx1Ve0mr82FaRcAxnmDSiMMmayl1vFkdyJYutxCL9dQ4txHOEhp+eo5lwlwmPHdkIgMrxOO6Vveg7jFUT3IBOMMPYb7fVTA8ei98UZ+Wwrk83nJYh/mBI1+MLhHczbJ4HybSHr/IG7oXXgAfq9d6gncvWHdVBO1Qb6hujuK/XWvH/QJ5h97Sg72nQo+QFznd5Gx9au5+WCgLsII6p1FlxTya94PfkvVtajSWooe75mN8MYaVviHkhKj6rBmG7wRMwOnh97ng4TQ9pjKW72r22vVSFJZOcdDOZ92h7B/fTzuWQcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhrwBZAhaF5UO8eek78KJsX6N/FXHKhy+EMVYbfZ8Y4=;
 b=9HZ1HT3DZeba9sTpfSGJ+yoArIpnYmQobSxmVi0oGyq9pVodlAnM8qSI+sj5r2D0eQkYqAtXCat1GpJESQHxxzyVPUArngU0JfmeSkcO6IICSMBKPiuOmadXukfyKHNy1zdRzrj/ZFtTvgvjTagPQMtr6yF/y1MrcJx6lp5sihI=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4514.eurprd08.prod.outlook.com (2603:10a6:208:13a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Thu, 23 Apr
 2020 07:27:19 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2937.012; Thu, 23 Apr 2020
 07:27:19 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] meta-arm-bsp: Remove fvp-base and foundation-armv8 simulation tools
Date: Thu, 23 Apr 2020 08:26:42 +0100
Message-ID: <1587626802-59812-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0301.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::25) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.53) by LO2P265CA0301.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2937.13 via Frontend Transport; Thu, 23 Apr 2020 07:27:19 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f69c6d52-55e7-475a-73bb-08d7e757c651
X-MS-TrafficTypeDiagnostic: AM0PR08MB4514:|AM0PR08MB4514:|AM0PR08MB5028:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB50288BAFC17CF75D75DB818892D30@AM0PR08MB5028.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:243;OLM:243;
X-Forefront-PRVS: 03827AF76E
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(4326008)(956004)(316002)(6916009)(6486002)(30864003)(966005)(2616005)(7696005)(52116002)(2906002)(26005)(66476007)(66556008)(478600001)(19627235002)(86362001)(44832011)(8676002)(5660300002)(6666004)(66946007)(16526019)(186003)(8936002)(81156014)(36756003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0Dx/fdI63toYId3JeNNIcRhu8p514B14lFxwop/ZYJP68IpcwQlXNPMfCgyvSulGvH5RBhJm1ueCNlg2HO/xTCaanmow5UJ6QLEMUvdVyPh6HE7H2Egkj//QcIaAQ/0UQ18QgvUWbAYRuZ7RKgf7mQIis+6/JqXTOpQUzdJF3Kh9YvEPSGFCypsc0Rh8iBFMUil5SAtOJ5WoOb+CB+NhfRBWhr/JNov2ASxFaSzWzlSSFuSwN0Spl1mt5CvOv6fg1DFcWHZ/fi1eY0/9fRXcozb7VS3l+mareZtUlzwJxgoFDEHmzvk7lqzX6d36foIsFJ1ufocw8miFdEFkNtQHURvDiE8PkLBUt/TRrUTxBv1xMvPB9Nk70X5aBSv2HyeYltHq8a3Nu9KoGZkKPEEalaYmmJ2zvmJ7n4wtUg6z0NIckwyEHSEb+EzZO643PD762kauv+ucDP/gJIws8xT2rkU2l05ul4OjUpATw4HBJdZLA4Ujb4C9whgSNQ46Qc7wxCSor2C/AvMCBM72yQ3swA==
X-MS-Exchange-AntiSpam-MessageData: mAtpepm4NiArCAS5AJDR6fThD7dRWX8peyNHS1/SRpEtqwKhyXtND28Dl+Xnvpn+R9gLYviebOl99D7QnSm93vIhlxddwRql9srr5hOrmuandBXiENZVLaMW6Za8yVByF1+gQRFmujStsHfZVqo3rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4514
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(16526019)(44832011)(6916009)(36906005)(966005)(82310400002)(316002)(478600001)(6486002)(336012)(4326008)(47076004)(2616005)(8936002)(81166007)(19627235002)(86362001)(186003)(2906002)(6666004)(956004)(26005)(30864003)(8676002)(7696005)(70206006)(82740400003)(5660300002)(70586007)(81156014)(36756003)(356005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	71d58476-ff72-43e1-d98c-08d7e757c188
X-Forefront-PRVS: 03827AF76E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QQTaEqWNqnVTZfTCRG0sGHrhPzEwXDVETGZvZhrE9WAW4X5/6AylkkR0G6DeDlORDL8WhQ0G016DFlRf6aZl+oDiPO2aSou0d3bAfCgm0QhPeiBURBX/pYBQXSxmwxRnXYRFwk2+kt6QPZN8MK8YVFunN9f9tNGcJcA4bYJgRAdIh9ji8O4iGV21SKcYOP7EsBYGyKGAiVmeV42u+eoABCYCvHPNaMgaXJ5stf/ENWjDkronzhvlNPs2bSQIL/4Ng6JwjYfEyWOms3LOxV3tFsf0NTeQb4NRj9X4W4CT7srC/QWo4BgjSJBzkxbfIHgfYyI2i46HtBRHtR+CyhQANUKBIPWZ8W5QhJNUDAfAud0ldiPWUbV9F4r3Sv/h3j0hVPWWU0wo0+V2ftvgDAcgKRro6AuRl0alcpLZeJRiwG42ZrJMjlk/Z++EOmnkh5fxY7l81Jsn51w2kvALn5H31ZX7mIcU1FIjjLl1K3y1t4cV0e/TKWUkZbyhEnJlzy9a2vnyqwYtWJ5Mifd8C9Pv/MWlLA3OxfgbFU3NctEIi9AF+ukLNAY70sc7pPgiqQ/eTa+PlBcFiCQt2SvpMsUehfw4akJyzpx2Fp8v2jHdyhQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2020 07:27:27.0223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f69c6d52-55e7-475a-73bb-08d7e757c651
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5028
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Since the Fixed Virtual Platforms simulation tools are not publicly
available, remove them from meta-arm-bsp layer.

Change-Id: Ifece50bfd494241499540030b6ac5968abd8ad1f
Issue-Id: SCM-951
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/conf/machine/foundation-armv8.conf    |   1 -
 meta-arm-bsp/conf/machine/fvp-base.conf            |   1 -
 meta-arm-bsp/documentation/foundation-armv8.md     |  26 ++-
 meta-arm-bsp/documentation/fvp-base.md             |  29 ++-
 .../fvp-common/files/start-foundation-armv8.sh     | 244 -----------------=
----
 .../fvp-common/files/start-fvp-base.sh             | 233 -----------------=
---
 .../foundation-armv8-native_r11p8-61rel0.bb        |  45 ----
 .../fvp-common/fvp-base-native_r11p7-30rel0.bb     |  45 ----
 .../recipes-devtools/fvp-common/fvp-native.inc     |  34 ---
 9 files changed, 43 insertions(+), 615 deletions(-)
 delete mode 100755 meta-arm-bsp/recipes-devtools/fvp-common/files/start-fo=
undation-armv8.sh
 delete mode 100755 meta-arm-bsp/recipes-devtools/fvp-common/files/start-fv=
p-base.sh
 delete mode 100644 meta-arm-bsp/recipes-devtools/fvp-common/foundation-arm=
v8-native_r11p8-61rel0.bb
 delete mode 100644 meta-arm-bsp/recipes-devtools/fvp-common/fvp-base-nativ=
e_r11p7-30rel0.bb
 delete mode 100644 meta-arm-bsp/recipes-devtools/fvp-common/fvp-native.inc

diff --git a/meta-arm-bsp/conf/machine/foundation-armv8.conf b/meta-arm-bsp=
/conf/machine/foundation-armv8.conf
index 10d3eea..73d2798 100644
--- a/meta-arm-bsp/conf/machine/foundation-armv8.conf
+++ b/meta-arm-bsp/conf/machine/foundation-armv8.conf
@@ -7,7 +7,6 @@
 require conf/machine/fvp-common/fvp.inc
=20
 KERNEL_DEVICETREE =3D "arm/foundation-v8-gicv3-psci.dtb"
-EXTRA_IMAGEDEPENDS +=3D "foundation-armv8-native"
=20
 # Use haveged as a source of entropy instead of rng-tools (Needed for ssh)=
.
 # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot =
time.
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/ma=
chine/fvp-base.conf
index 4c79250..3039644 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -7,7 +7,6 @@
 require conf/machine/fvp-common/fvp.inc
=20
 KERNEL_DEVICETREE =3D "arm/fvp-base-gicv3-psci-custom.dtb"
-EXTRA_IMAGEDEPENDS +=3D "fvp-base-native"
=20
 # Use haveged as a source of entropy instead of rng-tools (Needed for ssh)=
.
 # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot =
time.
diff --git a/meta-arm-bsp/documentation/foundation-armv8.md b/meta-arm-bsp/=
documentation/foundation-armv8.md
index ea4ec6c..1097550 100644
--- a/meta-arm-bsp/documentation/foundation-armv8.md
+++ b/meta-arm-bsp/documentation/foundation-armv8.md
@@ -10,16 +10,30 @@ MACHINE ?=3D "foundation-v8"
 ```bash$ bitbake core-image-minimal```
=20
 ### Run:
-The layer provides a recipe to install the Armv8-A Foundation Platform in =
your
-environment. You must download Armv8-A Foundation Platform from Arm develo=
per
-(This might require the user to register) from this address:
+To Run the Fixed Virtual Platform simulation tool you must download "Armv8=
-A
+Foundation Platform" from Arm developer (This might require the user to
+register) from this address:
 https://developer.arm.com/tools-and-software/simulation-models/fixed-virtu=
al-platforms
-and put the downloaded tar file in 'downloads/licensed/silver.arm.com/'
-directory of your project (or of your Pre-Mirror if you have one).
+and install it on your host PC.
+
+Fast Models Fixed Virtual Platforms (FVP) Reference Guide:
+https://developer.arm.com/docs/100966/latest
+
+Armv8=E2=80=91A Foundation Platform User Guide:
+https://developer.arm.com/docs/100961/latest/
+
=20
 Once done, do the following to build and run an image:
 ```bash$ bitbake core-image-minimal```
-```bash$ ./tmp/deploy/tools/start-foundation-armv8.sh```
+```bash$ export YOCTO_DEPLOY_IMGS_DIR=3D"<yocto-build-dir/tmp/deploy/image=
s/foundation-v8>"```
+```bash$ cd <path-to-Foundation_Platformpkg-dir/models/Linux64_GCC-X.X/>``=
`
+```
+bash$ ./Foundation_Platform --cores=3D4 --no-sve --gicv3 \
+         --data=3D${YOCTO_DEPLOY_IMGS_DIR}/bl1-fvp.bin@0x0 \
+         --data=3D${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 \
+         --data=3D${YOCTO_DEPLOY_IMGS_DIR}/foundation-v8-gicv3-psci.dtb@0x=
83000000 \
+         --block-device=3D${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-foun=
dation-armv8.disk.img \
+```
=20
 If you have built a configuration without a ramdisk, you can use the follo=
wing
 command in U-boot to start Linux:
diff --git a/meta-arm-bsp/documentation/fvp-base.md b/meta-arm-bsp/document=
ation/fvp-base.md
index ad2ac97..0936c19 100644
--- a/meta-arm-bsp/documentation/fvp-base.md
+++ b/meta-arm-bsp/documentation/fvp-base.md
@@ -10,16 +10,33 @@ MACHINE ?=3D "fvp-base"
 ```bash$ bitbake core-image-minimal```
=20
 ### Run:
-The layer provides a recipe to install the Fixed Virtual Platform in your
-environment. You must download Armv8-A Base Platform FVP from Arm develope=
r
-(This might require the user to register) from this address:
+To Run the Fixed Virtual Platform simulation tool you must download "Armv8=
-A
+Base Platform FVP" from Arm developer (This might require the user to
+register) from this address:
 https://developer.arm.com/tools-and-software/simulation-models/fixed-virtu=
al-platforms
-and put the downloaded tar file in 'downloads/licensed/silver.arm.com/'
-directory of your project (or of your Pre-Mirror if you have one).
+and install it on your host PC.
+
+Fast Models Fixed Virtual Platforms (FVP) Reference Guide:
+https://developer.arm.com/docs/100966/latest
+
+Armv8=E2=80=91A Foundation Platform User Guide:
+https://developer.arm.com/docs/100961/latest/
+
=20
 Once done, do the following to build and run an image:
 ```bash$ bitbake core-image-minimal```
-```bash$ ./tmp/deploy/tools/start-fvp-base.sh```
+```bash$ export YOCTO_DEPLOY_IMGS_DIR=3D"<yocto-build-dir/tmp/deploy/image=
s/fvp-base>"```
+```bash$ cd <path-to-Base_RevC_AEMv8A_pkg-dir/models/Linux64_GCC-X.X/>```
+```
+bash$ ./FVP_Base_RevC-2xAEMv8A -C bp.virtio_net.enabled=3D1 \
+         -C cache_state_modelled=3D0 \
+         -C bp.secureflashloader.fname=3D${YOCTO_DEPLOY_IMGS_DIR}/bl1-fvp.=
bin \
+         -C bp.flashloader0.fname=3D${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin \
+         --data cluster0.cpu0=3D${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 =
\
+         --data cluster0.cpu0=3D${YOCTO_DEPLOY_IMGS_DIR}/fvp-base-gicv3-ps=
ci-custom.dtb@0x83000000 \
+         -C bp.virtioblockdevice.image_path=3D${YOCTO_DEPLOY_IMGS_DIR}/cor=
e-image-minimal-foundation-armv8.disk.img \
+```
+
=20
 If you have built a configuration without a ramdisk, you can use the follo=
wing
 command in U-boot to start Linux:
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundatio=
n-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundatio=
n-armv8.sh
deleted file mode 100755
index 2b7643c..0000000
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8=
.sh
+++ /dev/null
@@ -1,244 +0,0 @@
-#!/bin/bash
-# Script to start a build image using FVP Foundation Platform
-#
-set -u
-set -e
-
-# Get parameters from bitbake configuration
-source <(MACHINE=3Dfoundation-armv8 bitbake -e foundation-armv8-native | g=
rep \
-    -e "^STAGING_.*_NATIVE=3D" \
-    -e "^DEPLOY_DIR.*=3D")
-
-
-# Bitbake image to run
-IMAGE_NAME=3D"$(cd $DEPLOY_DIR_IMAGE; ls *-foundation-armv8.manifest | \
-    sed -e "s/-foundation-armv8\.manifest//" | head -1)"
-
-# BL1 and FIP files
-BL1_FILE=3D"bl1-fvp.bin"
-BL1_ADDR=3D"0x0"
-FIP_FILE=3D"fip-fvp.bin"
-FIP_ADDR=3D"0x8000000"
-
-# Linux kernel file in deploy_dir and load address
-KERNEL_FILE=3D"Image"
-KERNEL_ADDR=3D"0x80080000"
-
-# DTB file in deploy_dir and load address
-DTB_FILE=3D"foundation-v8-gicv3-psci.dtb"
-DTB_ADDR=3D"0x83000000"
-
-# Xen file in deploy_dir and load address
-XEN_FILE=3D"xen-foundation-armv8"
-XEN_ADDR=3D"0x84000000"
-
-# Disk file in deploy_dir
-DISK_FILE=3D""
-
-# Foundation Platform Executable (Extracted from
-# FM000-KT-00035-r11p8-61rel0.tgz from silver.arm.com)
-FOUNDATION_PLAT_EXE=3D"Foundation_Platform"
-
-# Foundation Platform arguments
-# 4 cores
-# Disable Scalable Vector Extension (SVE)
-# gicv3 emulation (required for hardware virtualisation)
-FOUNDATION_PLAT_ARGS=3D" \
-    --cores=3D4 \
-    --no-sve \
-    --gicv3"
-
-# Foundation Platform user arguments
-EXTRA_ARGS=3D""
-
-# Help function
-usage() {
-    cat <<EOF
-Usage $0 [OPTION] [IMAGE_NAME] [FOUNDATION_PLATFORM_ARGS]
-Start a generated Yocto Image using Armv8-A Foundation Platform.
-This script will execute Foundation_Platform from the PATH.
-
-IMAGE_NAME should be the name of the image to start, this is what you did
-build with bitbake, default is 'core-image-minimal' if none is auto-detect=
ed.
-All extra arguments are passed to Foundation Platform after the IMAGE_NAME=
.
-
-OPTIONs:
-  -h, --help                  displays this help message
-  --deploy=3D[DIR]              use DIR as deploy directory, default is:
-                              $DEPLOY_DIR_IMAGE
-  --no-bl1                    Don't load a BL1
-  --bl1=3D[NAME]                File name in DEPLOY_DIR_IMAGE to be used f=
or BL1,
-                              default is $BL1_FILE.
-                              This adds the following argument to the
-                              Foundation Platform:
-                              --data=3D$DEPLOY_DIR_IMAGE/NAME@$BL1_ADDR
-  --no-fip                    Don't load a FIP
-  --fip=3D[NAME]                File name in DEPLOY_DIR_IMAGE to be used f=
or FIP,
-                              default is $FIP_FILE.
-                              This adds the following argument to the
-                              Foundation Platform:
-                              --data=3D$DEPLOY_DIR_IMAGE/NAME@$FIP_ADDR
-  --linux=3D[NAME]              File name in DEPLOY_DIR_IMAGE to be used
-                              as Linux kernel
-                              default is $KERNEL_FILE
-  --linux-addr=3D[ADDR]         Address at which Linux kernel should be lo=
aded
-                              default is $KERNEL_ADDR
-  --dtb=3D[NAME]                File name in DEPLOY_DIR_IMAGE to be used a=
s DTB
-                              default is $DTB_FILE
-  --dtb-addr=3D[ADDR]           Address at which DTB should be loaded
-                              default is $DTB_ADDR
-  --xen=3D[NAME]                File name in DEPLOY_DIR_IMAGE to be used a=
s Xen
-                              It is only loaded if the file actually exist=
s.
-                              default is $XEN_FILE
-  --xen-addr=3D[ADDR]           Address at which Xen should be loaded
-                              default is $XEN_ADDR
-  --disk=3D[NAME]               File name in DEPLOY_DIR_IMAGE to be used a=
s disk.
-                              It is only loaded if the file actually exist=
s.
-                              default is IMAGE_NAME-foundation-armv8.disk.=
img
-EOF
-}
-
-# Process command line arguments
-for arg in "$@"; do
-    case $arg in
-        --*=3D*)
-            optarg=3D$(echo $arg | sed -e "s/.*=3D//")
-            ;;
-        *)
-            optarg=3D""
-            ;;
-    esac
-
-    case $arg in
-        -h|-?|--help)
-            usage
-            exit 0
-            ;;
-        --deploy=3D*)
-            if [ ! -f $optarg/Image ]
-            then
-                echo "Invalid argument" >&2
-                echo "$optarg is not a valid deploy directory" >&2
-                exit 1
-            fi
-            DEPLOY_DIR_IMAGE=3D$optarg
-            ;;
-        --no-bl1)
-            BL1_FILE=3D""
-            ;;
-        --bl1=3D*)
-            BL1_FILE=3D"$optarg"
-            ;;
-        --no-fip)
-            FIP_FILE=3D""
-            ;;
-        --fip=3D*)
-            FIP_FILE=3D"$optarg"
-            ;;
-        --linux=3D*)
-            LINUX_FILE=3D"$optarg"
-            ;;
-        --linux-addr=3D*)
-            LINUX_ADDR=3D"$optarg"
-            ;;
-        --dtb=3D*)
-            DTB_FILE=3D"$optarg"
-            ;;
-        --dtb-addr=3D*)
-            DTB_ADDR=3D"$optarg"
-            ;;
-        --xen=3D*)
-            XEN_FILE=3D"$optarg"
-            ;;
-        --xen-addr=3D*)
-            XEN_ADDR=3D"$optarg"
-            ;;
-        --disk=3D*)
-            DISK_FILE=3D"$optarg"
-            ;;
-        *)
-            if [ -z "$IMAGE_NAME" ]
-            then
-                IMAGE_NAME=3D"$arg"
-            else
-                EXTRA_ARGS=3D"$EXTRA_ARGS $arg"
-            fi
-            ;;
-    esac
-done
-
-if [ -z "${BUILDDIR:-}" ]; then
-    echo "We are not in a Yocto build project." >&2
-    echo "Please source oe-init-build-env first." >&2
-    exit 1
-fi
-
-if [ -z "${IMAGE_NAME:-}" ]; then
-    IMAGE_NAME=3D"core-image-minimal"
-fi
-
-if [ -z "${DISK_FILE:-}" ]; then
-    DISK_FILE=3D"${IMAGE_NAME}-foundation-armv8.disk.img"
-fi
-
-# Add bl1 arg
-if [ -n "$BL1_FILE" ]; then
-    if [ ! -f $DEPLOY_DIR_IMAGE/$BL1_FILE ]; then
-        echo "Could not find bl1 ($BL1_FILE) in $DEPLOY_DIR_IMAGE" >&2
-        exit 1
-    fi
-    FOUNDATION_PLAT_ARGS=3D"$FOUNDATION_PLAT_ARGS \
-        --data=3D$DEPLOY_DIR_IMAGE/$BL1_FILE@$BL1_ADDR"
-fi
-
-# Add fip arg
-if [ -n "$FIP_FILE" ]; then
-    if [ ! -f $DEPLOY_DIR_IMAGE/$FIP_FILE ]; then
-        echo "Could not find fip ($FIP_FILE) in $DEPLOY_DIR_IMAGE" >&2
-        exit 1
-    fi
-    FOUNDATION_PLAT_ARGS=3D"$FOUNDATION_PLAT_ARGS \
-        --data=3D$DEPLOY_DIR_IMAGE/$FIP_FILE@$FIP_ADDR"
-fi
-
-# Add Linux kernel
-if [ -n "$KERNEL_FILE" ]; then
-    if [ ! -f $DEPLOY_DIR_IMAGE/$KERNEL_FILE ]; then
-        echo "Could not find Linux kernel ($KERNEL_FILE) in \
-            $DEPLOY_DIR_IMAGE" >&2
-        exit 1
-    fi
-    FOUNDATION_PLAT_ARGS=3D"$FOUNDATION_PLAT_ARGS \
-        --data=3D$DEPLOY_DIR_IMAGE/$KERNEL_FILE@$KERNEL_ADDR"
-fi
-
-# Add xen if present
-if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
-   FOUNDATION_PLAT_ARGS=3D"$FOUNDATION_PLAT_ARGS \
-       --data=3D$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
-   #switch dtb if there
-   if [ -f $DEPLOY_DIR_IMAGE/$(basename ${DTB_FILE} .dtb)-xen.dtb ]; then
-      DTB_FILE=3D$(basename ${DTB_FILE} .dtb)-xen.dtb
-   fi
-fi
-
-# Add DTB
-if [ -n "$DTB_FILE" ]; then
-    if [ ! -f $DEPLOY_DIR_IMAGE/$DTB_FILE ]; then
-        echo "Could not find the DTB ($DTB_FILE) in $DEPLOY_DIR_IMAGE" >&2
-        exit 1
-    fi
-    FOUNDATION_PLAT_ARGS=3D"$FOUNDATION_PLAT_ARGS \
-        --data=3D$DEPLOY_DIR_IMAGE/$DTB_FILE@$DTB_ADDR"
-fi
-
-# Add disk if present
-if [ -n "$DISK_FILE" -a -f $DEPLOY_DIR_IMAGE/$DISK_FILE ]; then
-    FOUNDATION_PLAT_ARGS=3D"$FOUNDATION_PLAT_ARGS \
-        --block-device=3D$DEPLOY_DIR_IMAGE/$DISK_FILE"
-fi
-
-FOUNDATION_PLAT_EXE=3D"${STAGING_BINDIR_NATIVE}/${FOUNDATION_PLAT_EXE}"
-
-echo "$FOUNDATION_PLAT_EXE $FOUNDATION_PLAT_ARGS $EXTRA_ARGS"
-$FOUNDATION_PLAT_EXE $FOUNDATION_PLAT_ARGS $EXTRA_ARGS
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.=
sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
deleted file mode 100755
index f391c23..0000000
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
+++ /dev/null
@@ -1,233 +0,0 @@
-#!/bin/bash
-# Script to start a build image using FVP Base Platform
-#
-set -u
-set -e
-
-# Get parameters from bitbake configuration
-source <(MACHINE=3Dfvp-base bitbake -e fvp-base-native | grep \
-    -e "^STAGING_.*_NATIVE=3D" \
-    -e "^DEPLOY_DIR.*=3D")
-
-
-# Bitbake image to run
-IMAGE_NAME=3D"$(cd $DEPLOY_DIR_IMAGE; ls *-fvp-base.manifest | \
-    sed -e "s/-fvp-base\.manifest//" | head -1)"
-
-# BL1 and FIP files
-BL1_FILE=3D"bl1-fvp.bin"
-FIP_FILE=3D"fip-fvp.bin"
-
-# Linux kernel file in deploy_dir and load address
-KERNEL_FILE=3D"Image"
-KERNEL_ADDR=3D"0x80080000"
-
-# DTB file in deploy_dir and load address
-DTB_FILE=3D"fvp-base-gicv3-psci-custom.dtb"
-DTB_ADDR=3D"0x83000000"
-
-# Xen file in deploy_dir and load address
-XEN_FILE=3D"xen-fvp-base"
-XEN_ADDR=3D"0x84000000"
-
-# Disk file in deploy_dir
-DISK_FILE=3D""
-
-# Armv8-A Base Platform FVP Executable (Extracted from
-# FM000-KT-00173-r11p7-30rel0.tgz from silver.arm.com)
-FVPEXEC=3D"FVP_Base_RevC-2xAEMv8A"
-
-# FVP arguments
-# enable virtio network
-# disable cache modelling to improve performances
-FVPARGS=3D" \
-    -C bp.virtio_net.enabled=3D1 \
-    -C cache_state_modelled=3D0"
-
-# FVP user arguments
-EXTRA_ARGS=3D""
-
-# Help function
-usage() {
-    cat <<EOF
-Usage $0 [OPTION] [IMAGE_NAME] [FVP_ARGS]
-Start a generated Yocto Image using Arm Fixed Virtual Platform.
-This script will execute FVP_Base_RevC-2xAEMv8A from the PATH.
-
-IMAGE_NAME should be the name of the image to start, this is what you did
-build with bitbake, default is 'core-image-minimal' if none is auto-detect=
ed.
-All extra arguments are passed to FVP after the IMAGE_NAME.
-
-OPTIONs:
-  -h, --help                 displays this help message
-  --deploy=3D[DIR]             use DIR as deploy directory, default is:
-                             $DEPLOY_DIR_IMAGE
-  --no-bl1                   Don't load a BL1
-  --bl1=3D[NAME]               File name in DEPLOY_DIR_IMAGE to be used fo=
r BL1,
-                             default is $BL1_FILE.
-                             This adds the following argument to FVP:
-                             -C bp.secureflashloader.fname=3DDEPLOY_DIR_IM=
AGE/NAME
-  --no-fip                   Don't load a FIP
-  --fip=3D[NAME]               File name in DEPLOY_DIR_IMAGE to be used fo=
r FIP,
-                             default is $FIP_FILE.
-                             This adds the following argument to FVP:
-                             -C bp.flashloader0.fname=3DDEPLOY_DIR_IMAGE/N=
AME
-  --linux=3D[NAME]             File name in DEPLOY_DIR_IMAGE to be used as=
 Linux kernel
-                             default is $KERNEL_FILE
-  --linux-addr=3D[ADDR]        Address at which Linux kernel should be loa=
ded
-                             default is $KERNEL_ADDR
-  --dtb=3D[NAME]               File name in DEPLOY_DIR_IMAGE to be used as=
 DTB
-                             default is $DTB_FILE
-  --dtb-addr=3D[ADDR]          Address at which DTB should be loaded
-                             default is $DTB_ADDR
-  --xen=3D[NAME]               File name in DEPLOY_DIR_IMAGE to be used as=
 Xen
-                             It is only loaded if the file actually exists=
.
-                             default is $XEN_FILE
-  --xen-addr=3D[ADDR]          Address at which Xen should be loaded
-                             default is $XEN_ADDR
-  --disk=3D[NAME]              File name in DEPLOY_DIR_IMAGE to be used as=
 disk.
-                             It is only loaded if the file actually exists=
.
-                             default is IMAGE_NAME-fvp.disk.img
-EOF
-}
-
-# Process command line arguments
-for arg in "$@"; do
-    case $arg in
-        --*=3D*)
-            optarg=3D$(echo $arg | sed -e "s/.*=3D//")
-            ;;
-        *)
-            optarg=3D""
-            ;;
-    esac
-
-    case $arg in
-        -h|-?|--help)
-            usage
-            exit 0
-            ;;
-        --deploy=3D*)
-            if [ ! -f $optarg/Image ]
-            then
-                echo "Invalid argument" >&2
-                echo "$optarg is not a valid deploy directory" >&2
-                exit 1
-            fi
-            DEPLOY_DIR_IMAGE=3D$optarg
-            ;;
-        --no-bl1)
-            BL1_FILE=3D""
-            ;;
-        --bl1=3D*)
-            BL1_FILE=3D"$optarg"
-            ;;
-        --no-fip)
-            FIP_FILE=3D""
-            ;;
-        --fip=3D*)
-            FIP_FILE=3D"$optarg"
-            ;;
-        --linux=3D*)
-            LINUX_FILE=3D"$optarg"
-            ;;
-        --linux-addr=3D*)
-            LINUX_ADDR=3D"$optarg"
-            ;;
-        --dtb=3D*)
-            DTB_FILE=3D"$optarg"
-            ;;
-        --dtb-addr=3D*)
-            DTB_ADDR=3D"$optarg"
-            ;;
-        --xen=3D*)
-            XEN_FILE=3D"$optarg"
-            ;;
-        --xen-addr=3D*)
-            XEN_ADDR=3D"$optarg"
-            ;;
-        --disk=3D*)
-            DISK_FILE=3D"$optarg"
-            ;;
-        *)
-            if [ -z "$IMAGE_NAME" ]
-            then
-                IMAGE_NAME=3D"$arg"
-            else
-                EXTRA_ARGS=3D"$EXTRA_ARGS $arg"
-            fi
-            ;;
-    esac
-done
-
-if [ -z "${BUILDDIR:-}" ]; then
-    echo "We are not in a Yocto build project." >&2
-    echo "Please source oe-init-build-env first." >&2
-    exit 1
-fi
-
-if [ -z "${IMAGE_NAME:-}" ]; then
-    IMAGE_NAME=3D"core-image-minimal"
-fi
-
-if [ -z "${DISK_FILE:-}" ]; then
-    DISK_FILE=3D"${IMAGE_NAME}-fvp-base.disk.img"
-fi
-
-# Add bl1 arg
-if [ -n "$BL1_FILE" ]; then
-    if [ ! -f $DEPLOY_DIR_IMAGE/$BL1_FILE ]; then
-        echo "Could not find bl1 ($BL1_FILE) in $DEPLOY_DIR_IMAGE" >&2
-        exit 1
-    fi
-    FVPARGS=3D"$FVPARGS -C bp.secureflashloader.fname=3D$DEPLOY_DIR_IMAGE/=
$BL1_FILE"
-fi
-
-# Add fip arg
-if [ -n "$FIP_FILE" ]; then
-    if [ ! -f $DEPLOY_DIR_IMAGE/$FIP_FILE ]; then
-        echo "Could not find fip ($FIP_FILE) in $DEPLOY_DIR_IMAGE" >&2
-        exit 1
-    fi
-    FVPARGS=3D"$FVPARGS -C bp.flashloader0.fname=3D$DEPLOY_DIR_IMAGE/$FIP_=
FILE"
-fi
-
-# Add Linux kernel
-if [ -n "$KERNEL_FILE" ]; then
-    if [ ! -f $DEPLOY_DIR_IMAGE/$KERNEL_FILE ]; then
-        echo "Could not find Linux kernel ($KERNEL_FILE) in $DEPLOY_DIR_IM=
AGE" >&2
-        exit 1
-    fi
-    FVPARGS=3D"$FVPARGS \
-        --data cluster0.cpu0=3D$DEPLOY_DIR_IMAGE/$KERNEL_FILE@$KERNEL_ADDR=
"
-fi
-
-# Add xen if present
-if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
-    FVPARGS=3D"$FVPARGS \
-        --data cluster0.cpu0=3D$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
-   #switch dtb if there
-   if [ -f $DEPLOY_DIR_IMAGE/$(basename ${DTB_FILE} .dtb)-xen.dtb ]; then
-      DTB_FILE=3D$(basename ${DTB_FILE} .dtb)-xen.dtb
-   fi
-fi
-
-# Add DTB
-if [ -n "$DTB_FILE" ]; then
-    if [ ! -f $DEPLOY_DIR_IMAGE/$DTB_FILE ]; then
-        echo "Could not find the DTB ($DTB_FILE) in $DEPLOY_DIR_IMAGE" >&2
-        exit 1
-    fi
-    FVPARGS=3D"$FVPARGS \
-        --data cluster0.cpu0=3D$DEPLOY_DIR_IMAGE/$DTB_FILE@$DTB_ADDR"
-fi
-
-# Add disk if present
-if [ -n "$DISK_FILE" -a -f $DEPLOY_DIR_IMAGE/$DISK_FILE ]; then
-    FVPARGS=3D"$FVPARGS \
-        -C bp.virtioblockdevice.image_path=3D$DEPLOY_DIR_IMAGE/$DISK_FILE"
-fi
-FVPEXEC=3D"${STAGING_BINDIR_NATIVE}/${FVPEXEC}"
-
-echo "$FVPEXEC $FVPARGS $EXTRA_ARGS"
-$FVPEXEC $FVPARGS $EXTRA_ARGS
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/foundation-armv8-nati=
ve_r11p8-61rel0.bb b/meta-arm-bsp/recipes-devtools/fvp-common/foundation-ar=
mv8-native_r11p8-61rel0.bb
deleted file mode 100644
index 4c1745d..0000000
--- a/meta-arm-bsp/recipes-devtools/fvp-common/foundation-armv8-native_r11p=
8-61rel0.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-# Armv8-A Foundation Platform build recipe
-
-#
-# Download and install recipe specific for Armv8-A Foundation Platform bui=
ld are
-# captured in the file.
-#
-
-# The tar file required to build this package must be downloaded from
-# https://developer.arm.com/tools-and-software/simulation-models/fixed-vir=
tual-platforms
-# and put in the sub-directory 'licensed/silver.arm.com' of one of the
-# following locations:
-# - in the directory 'files' of this file directory
-# - in your Yocto project download directory (DL_DIR parameter of local.co=
nf)
-# - in your Download mirror if you have one
-SRC_URI =3D "file://licensed/silver.arm.com/FM000-KT-00035-${PV}.tgz"
-SRC_URI +=3D "file://start-foundation-armv8.sh"
-
-S =3D "${WORKDIR}/Foundation_Platformpkg"
-
-# Checksums to compare against downloaded package files' checksums
-LIC_FILES_CHKSUM =3D " \
-    file://license_terms/license_agreement.txt;md5=3Dae7b47c67a033995c6b45=
10476a50f03 \
-    file://license_terms/redistributables.txt;md5=3Df9fafcaf37ce6c9427568b=
9dbdbaabe5 \
-    file://license_terms/supplementary_terms.txt;md5=3D26e4b214f639a22c8e7=
e207abc10eccb \
-    file://license_terms/third_party_licenses.txt;md5=3D6394c171d6657fc195=
573c4d239341c4 \
-    "
-
-require fvp-native.inc
-
-do_install_append() {
-    cp -a --no-preserve=3Downership -rf doc license_terms models plugins \
-        ${D}/${datadir}/fvp/.
-
-    cat <<EOF > ${D}${bindir}/Foundation_Platform
-#!/bin/bash
-basedir=3D\$(cd \$(dirname \$0)/../../; pwd)
-export LD_LIBRARY_PATH=3D"\$basedir/lib:\$basedir/usr/lib"
-\$basedir/usr/share/fvp/models/Linux64_GCC-6.4/Foundation_Platform "\$@"
-EOF
-    chmod 755 ${D}${bindir}/Foundation_Platform
-}
-
-do_deploy_append() {
-    install -m 755 ${WORKDIR}/start-foundation-armv8.sh ${DEPLOYDIR}/.
-}
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/fvp-base-native_r11p7=
-30rel0.bb b/meta-arm-bsp/recipes-devtools/fvp-common/fvp-base-native_r11p7=
-30rel0.bb
deleted file mode 100644
index 3d784f9..0000000
--- a/meta-arm-bsp/recipes-devtools/fvp-common/fvp-base-native_r11p7-30rel0=
.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-# Armv8-A Base Platform FVP build recipe
-
-#
-# Download and install recipe specific for Armv8-A Base Platform FVP build=
 are
-# captured in the file.
-#
-
-# The tar file required to build this package must be downloaded from
-# https://developer.arm.com/tools-and-software/simulation-models/fixed-vir=
tual-platforms
-# and put in the sub-directory 'licensed/silver.arm.com' of one of the
-# following locations:
-# - in the directory 'files' of this file directory
-# - in your Yocto project download directory (DL_DIR parameter of local.co=
nf)
-# - in your Download mirror if you have one
-SRC_URI =3D "file://licensed/silver.arm.com/FM000-KT-00173-${PV}.tgz"
-SRC_URI +=3D "file://start-fvp-base.sh"
-
-S =3D "${WORKDIR}/Base_RevC_AEMv8A_pkg"
-
-# Checksums to compare against downloaded package files' checksums
-LIC_FILES_CHKSUM =3D " \
-    file://license_terms/license_agreement.txt;md5=3Dae7b47c67a033995c6b45=
10476a50f03 \
-    file://license_terms/redistributables.txt;md5=3Df9fafcaf37ce6c9427568b=
9dbdbaabe5 \
-    file://license_terms/supplementary_terms.txt;md5=3D26e4b214f639a22c8e7=
e207abc10eccb \
-    file://license_terms/third_party_licenses.txt;md5=3D1aa4ab9ee0642b1bc9=
2063d29426c25f \
-    "
-
-require fvp-native.inc
-
-do_install_append() {
-    cp -a --no-preserve=3Downership -rf bin doc fmtplib license_terms mode=
ls \
-        plugins scripts ${D}/${datadir}/fvp/.
-
-    cat <<EOF > ${D}${bindir}/FVP_Base_RevC-2xAEMv8A
-#!/bin/bash
-basedir=3D\$(cd \$(dirname \$0)/../../; pwd)
-export LD_LIBRARY_PATH=3D"\$basedir/lib:\$basedir/usr/lib"
-\$basedir/usr/share/fvp/models/Linux64_GCC-4.9/FVP_Base_RevC-2xAEMv8A "\$@=
"
-EOF
-    chmod 755 ${D}${bindir}/FVP_Base_RevC-2xAEMv8A
-}
-
-do_deploy_append() {
-    install -m 755 ${WORKDIR}/start-fvp-base.sh ${DEPLOYDIR}/.
-}
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/fvp-native.inc b/meta=
-arm-bsp/recipes-devtools/fvp-common/fvp-native.inc
deleted file mode 100644
index 4107080..0000000
--- a/meta-arm-bsp/recipes-devtools/fvp-common/fvp-native.inc
+++ /dev/null
@@ -1,34 +0,0 @@
-# Fixed Virtual Platform (FVP) executable installation recipe
-
-#
-# Package specific information like checksums and source information captu=
red
-# in specific bb files.
-#
-
-SUMMARY =3D "Arm Fixed Virtual Platform"
-HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mode=
ls/fixed-virtual-platforms"
-LICENSE =3D "Proprietary & GPLv2 & Apache-2"
-
-
-inherit native deploy
-
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
-
-do_install() {
-    install -d ${D}/${datadir}/fvp
-    install -d ${D}${bindir}
-}
-FILES_${PN} =3D "${datadir}/fvp/* ${bindir}/*"
-INSANE_SKIP_${PN} +=3D "already-stripped"
-
-# This is required so that our binaries are in the sysroot. We need this
-# to have both fvp required libraries and fvp in the same sysroot.
-addtask addto_recipe_sysroot after do_populate_sysroot before do_build
-
-do_deploy[sstate-outputdirs] =3D "${DEPLOY_DIR_TOOLS}"
-do_deploy() {
-    install -d ${DEPLOYDIR}
-}
-addtask deploy before do_build after do_compile
-
--=20
2.7.4

