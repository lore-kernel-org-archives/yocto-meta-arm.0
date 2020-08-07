Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.72])
 by mx.groups.io with SMTP id smtpd.web10.2827.1596792392257663743
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 02:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BSyDKuxY;
 spf=pass (domain: arm.com, ip: 40.107.4.72, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yta/B44pC3j2jwGXYfZbAObzYJ9Q3bMChlNaLLXqdiQ=;
 b=BSyDKuxYrbtdL5XxqlNM3qR2GYO9dNoAI5PFgUXYN80eUkaWeHHJ0LfXexSM+fwNFEhcQ9mmHYAPlNN3tmGswmpDvRJjs+iJWNuxVOQTXm3AONa+FuLRjNeNED36A1ywtFDLUnOxr6BwVKSqZJ8I1C9/Wial2CsoEd2AzDLG8uE=
Received: from AM5PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:206:1::24)
 by VE1PR08MB4719.eurprd08.prod.outlook.com (2603:10a6:802:a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Fri, 7 Aug
 2020 09:26:30 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::f0) by AM5PR04CA0011.outlook.office365.com
 (2603:10a6:206:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Fri, 7 Aug 2020 09:26:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 09:26:29 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Fri, 07 Aug 2020 09:26:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9aa686f3501f0db2
X-CR-MTA-TID: 64aa7808
Received: from fc54e989fe97.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9FAB42D3-F8C1-40D0-8526-4A0D647E35CC.1;
	Fri, 07 Aug 2020 09:26:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc54e989fe97.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 09:26:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1cvNowxOs28JXYPgwcwYxwlyvFVXgp2lYqfirWAix+EuSOpHEQhHP6n3n4ROaTvjFyZLVcGZVJpeX7zEym0dbCOjOCoTjd5OcT01AgYw5ne2hp2ecV7pWicScWeqWjmFPhjQIG+ae1HVO1HeozlldMY9xcfSgnFqSHpVMxulKFHL8XUkYjozjW4Yugq/I+zzf5ER1lksqkaajwNPhxuBRIttc1OBIURKYWekxLisyZ64OGKcUrl6X7piHoYUs1PHsJrVYtPz4yLqR/FDjcys/D855rShLzQnuLt3lI8WyCd0ztVnjVEdLnUMB15skeWWOSWwNanCdGf/TeBVbbmiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yta/B44pC3j2jwGXYfZbAObzYJ9Q3bMChlNaLLXqdiQ=;
 b=bOY7GPa2LqEGt6R7hETF5pmTvCuO2TYy3gWkaU1h5T+2dZF5Ew0um+Y4hFDhmBL41o7dK8PFXxWTT/rCng7bUB8yDI/CAu+RqJskLjYrpa5AkQsPzSuZOiiMpY7px9dGMX4gYDaY4uzc2avty5sjeIZEGrTvImsCTC++k1r08cunMWH27y172yInk4JnfcDjot0Eito1gFgGu19svKm5XFt57MCCYMmzZKKrpK9dgZcTETZ+iKpD167mcqE2VFS1N9ObQn8mChyufOzHpmGx49XhObmOdw8J7FcvjCnvTzSMHRlbaGsY1vujQT3o9Xddo5WxmX/Q1xCE44gLokBixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yta/B44pC3j2jwGXYfZbAObzYJ9Q3bMChlNaLLXqdiQ=;
 b=BSyDKuxYrbtdL5XxqlNM3qR2GYO9dNoAI5PFgUXYN80eUkaWeHHJ0LfXexSM+fwNFEhcQ9mmHYAPlNN3tmGswmpDvRJjs+iJWNuxVOQTXm3AONa+FuLRjNeNED36A1ywtFDLUnOxr6BwVKSqZJ8I1C9/Wial2CsoEd2AzDLG8uE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4705.eurprd08.prod.outlook.com (2603:10a6:20b:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:26:22 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:26:22 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 5/9] arm-bsp/external-system: enabling corstone700 platform support
Date: Fri,  7 Aug 2020 10:25:49 +0100
Message-Id: <20200807092553.18876-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
References: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.7 via Frontend Transport; Fri, 7 Aug 2020 09:26:20 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 874fe9fd-e4c2-4a79-9fd1-08d83ab3f771
X-MS-TrafficTypeDiagnostic: AM6PR08MB4705:|VE1PR08MB4719:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB471985729557F06959E8F377FD490@VE1PR08MB4719.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:205;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 W5PYQ67+CdcH0gTfTWArW31c5WONVs2vCTym10EFj1u79ueas5jKAznq/in+O4XbUFCJGws+02drxQ5Tws65pQ4DU71WOzCd1c2tYy9Bb2ctEqAfJVNAsVUV1YbA12jOIpBq9Ne+p++q6NsZHUJhyDgAGgybjCuHi8cTujyFt6Bw+9m53Mh71xZwWpubOWFEDD8Xw9CtahsZU8UBE480/yQ4eBLuWxP131SuiD7vmYRBxzilp6aRapbzvjmXWxqkYBxRYiRTjgOEXUKe4UfA+v39LYFnW9KD/A4fN9kh5d8e2e9RV/0Fb88Y0DDaT4D9
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(83380400001)(4326008)(9686003)(6666004)(86362001)(6916009)(8936002)(6486002)(956004)(2616005)(7696005)(16526019)(52116002)(186003)(1076003)(2906002)(26005)(66476007)(66556008)(66946007)(316002)(36756003)(54906003)(5660300002)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Jhkw589sJa4wAiAJEJdZrq17AQIvmPZRZlIZroGbvlChw4f/Fyr3aArNrL+mTET3N9wTqViTQGFedKdMjZl+CaGcQWeOCveiTBbBsQXmEeWGlZWJ471Kfzwq93adZOzim5KVfJ/KLXNZ3cyBJ2xk3yTKPkymLrTnbENAOlG7DdUA7u+mwhduKXLyhg+a6io4VqHsaecZmDxMY7Jkh9Bc1bdDU0mICFzs7JPdWImO+DUN8CntS712Dpcax41hMLCwS4JmlLkFMuUfjYnkpYHsuELwgrfni8GglgmsEWPlva7TYXy5mfeOiRt0nYaKa05868/5JO3ndHqXtPJROrk3DEfIIKvti/gBwdDd+1BbU8BXpaYkxekOW2GcaN2J7bPLSTT6vJsD8dq4xhC+UTOqY8K264ih8fc230Yc0LhydSb7NdmPnDEqtrCyWoYB0xUxNmCAfoLpbQRLUop4u0bgXMOZkP/jSnMaHak0jA/iiS++lDNGt087OUGlCIXcGySSFqaRl84BXakRGG3w93dh9ntbt4Ct1bSLmkl8xNfVQGQgpEjFY6nY64MNAullNogkKblEf14sxgRvYIZQsBHpMg1R1v9hFmLCWkidUrcjuMiRyDJR0m/JRyn/ispkiAMZIRRvhe5HeaXrlm85osolWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4705
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	77fac15e-d438-4998-da16-08d83ab3f28e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PPxt79htwWLpLaXsGpbEGZsHzOO411xUfAOKUbes1FfxFKdHI17vb13O0z2S8SIbs9fRvc35yxXdeXTPzRxDN8Qt4F/0CyGRa/AN2ytpRKojEEUp71MBHXzXXUvlK5FxRn7p+k2hg8VoiINFON9FTI/4EdMN/X65uTJZgWo4tllhkOV6jVVroS/ZovW9NJr3fKGpM2JPqKICQFyQISrKD1OptDupvVP+jWLFXVBOzhm1VuTH2Y6QYZr6Te+lAsgU1UKVoFAexilrJFUnDrxZcySs71VRp1QEHWqvCNF6fQYOmvPdGfxnwtTYCcayHUY9dbZzHVwPItB/XPaX1iDo/jUifWFfbqoHwg8Ims/czyGw7Xyg5ZiDYY0bX8tjLkRuuxU4AW3IiDUzbWfr65h+ZA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(36756003)(1076003)(26005)(8936002)(336012)(16526019)(8676002)(6666004)(186003)(2906002)(956004)(478600001)(86362001)(2616005)(6916009)(82740400003)(47076004)(81166007)(70586007)(70206006)(316002)(6486002)(82310400002)(7696005)(9686003)(36906005)(4326008)(5660300002)(83380400001)(54906003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:26:29.7341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 874fe9fd-e4c2-4a79-9fd1-08d83ab3f771
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4719
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit allows the external-system firmware to be used on the
corstone700 platform.

Change-Id: I746a970dcdceee60d91152e4315afa072ca843d3
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone700.inc             | 2 +-
 .../recipes-bsp/external-system/external-system_0.1.0.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-b=
sp/conf/machine/include/corstone700.inc
index 495fc30..4c00c6d 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -14,7 +14,7 @@ PREFERRED_VERSION_linux-stable ?=3D "5.6%"
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"

-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
+EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a external-system"

 WKS_FILE_DEPENDS_append =3D " ${EXTRA_IMAGEDEPENDS}"

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0=
.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index 0aab8ad..84da7ce 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -10,10 +10,10 @@ SRC_URI =3D "gitsm://git.linaro.org/landing-teams/worki=
ng/arm/external-system.git;
 SRCREV =3D "41ef76951c5119729c1ea305406f74776da90866"
 PV .=3D "~git${SRCPV}"

-COMPATIBLE_MACHINE =3D ""
+COMPATIBLE_MACHINE =3D "(corstone700-*)"

 # PRODUCT is passed to the Makefile to specify the platform to be used
-PRODUCT =3D ""
+PRODUCT =3D "corstone-700"

 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
