Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.48])
 by mx.groups.io with SMTP id smtpd.web12.4317.1587454450686895760
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 00:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gDgoC+L0;
 spf=pass (domain: arm.com, ip: 40.107.15.48, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+eYGhFVpGLWipVEh4dRQFudKWaP59lR5I59TzeJbf4=;
 b=gDgoC+L0WPcGuYk/c4RX0Sj6x/wYBvkiuunUkQibLWzUC6su6JlGebYaqOk8NqbaCeRfLHcLumXeazM49oHrmiVITW2ZQDqxddCJF+ly6brwyBGDrsnuNb0+D7F48YyL1I2oc3AIFg+DlTC4V2oJ6kgzhXEkeX2z6b5vck5Q2pw=
Received: from DBBPR09CA0028.eurprd09.prod.outlook.com (2603:10a6:10:d4::16)
 by AM6PR08MB3909.eurprd08.prod.outlook.com (2603:10a6:20b:8e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 07:34:08 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::ec) by DBBPR09CA0028.outlook.office365.com
 (2603:10a6:10:d4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 21 Apr 2020 07:34:07 +0000
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
 15.20.2900.18 via Frontend Transport; Tue, 21 Apr 2020 07:34:07 +0000
Received: ("Tessian outbound ecb846ece464:v53"); Tue, 21 Apr 2020 07:34:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b212912a7683f840
X-CR-MTA-TID: 64aa7808
Received: from b20f9cf88c0e.4
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1CE9A407-AAF2-4F0B-B32C-E5D4253B5614.1;
	Tue, 21 Apr 2020 07:34:02 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b20f9cf88c0e.4
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Apr 2020 07:34:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFbgHaVtOCdrcGcMBWUYBIvgEr8RD7YsTqSLOxMainynZ71vgSvUcJ/VlBXlJNylFEn/UROPq7Qt19v6Y6iDNEe64tDdMB8M1Sr3vv2jDf0zN9b6wmFHElsV5XsLzzw0cB0WkXT9pzOsTphznoAIa5KukQtYeIfhPQsz5bIPuH4CepjywEBCnp3mSg6lXXZ+V2mVXMEUWBhNLTCgjHA9dlCBJCf+u7oq1fRVneXDatdAfKE9GHoC2Zt8zAHGnyvnDuo0KkrVxzB2jJBFtEUUowjvP6W/Tlz3z4G/fQiTu5sPJnb3tIq75cO+e63maqVIprAKOV0/Bx4SrYTTtpdkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+eYGhFVpGLWipVEh4dRQFudKWaP59lR5I59TzeJbf4=;
 b=kFVzAKKDK0/bamNohULImRAGplgs+4k+MLSAUxNYuGbM6tCcUtR7T+Cvxk4rd2RNEW/FfTj8hEW95vLYWjfKRT8+pd8+g+4GpSOf2Ep5ZVPwxMY54StQbvx1+vAevOwxZ7ytkc4cjwVyHk+/dtywwDDR8cBOwsTo+2pk1F2rBLv/hvoD3HnQ9503xyerWfAcM/zPIn3V7urdeLKxTXBFAFSuxcewoLIATNwK9Te1WI3KZ/YZyr4OhNr292pyaQjlyg00DvT65XUJbEb5P83sqcuqSRua5ei4BhePdBuMjyHr2800WYG3OjV+gILqLk2hcO2rGT850ivU1E5jFtt1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+eYGhFVpGLWipVEh4dRQFudKWaP59lR5I59TzeJbf4=;
 b=gDgoC+L0WPcGuYk/c4RX0Sj6x/wYBvkiuunUkQibLWzUC6su6JlGebYaqOk8NqbaCeRfLHcLumXeazM49oHrmiVITW2ZQDqxddCJF+ly6brwyBGDrsnuNb0+D7F48YyL1I2oc3AIFg+DlTC4V2oJ6kgzhXEkeX2z6b5vck5Q2pw=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3890.eurprd08.prod.outlook.com (2603:10a6:208:10a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 07:34:01 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 07:34:01 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 1/5] meta-arm-bsp:trusted-firmware-a: Remove custom do_clean task
Date: Tue, 21 Apr 2020 08:33:51 +0100
Message-Id: <1587454435-46370-2-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
References: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.53) by LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2921.29 via Frontend Transport; Tue, 21 Apr 2020 07:34:00 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3da1130e-0b34-4be7-ee05-08d7e5c6602b
X-MS-TrafficTypeDiagnostic: AM0PR08MB3890:|AM0PR08MB3890:|AM6PR08MB3909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3909CF63C62E26A81C0CED0492D50@AM6PR08MB3909.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:651;OLM:651;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(5660300002)(4326008)(86362001)(6666004)(44832011)(16526019)(36756003)(478600001)(186003)(2906002)(81156014)(52116002)(66946007)(7696005)(66476007)(316002)(66556008)(8936002)(26005)(8676002)(2616005)(956004)(6486002)(6916009);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aukyLFg2I8lbm/1YSh9pe7VJb5eFLFGVx92TJwznOZBwAD8xN37n653FWF6MqCUNaDvC+S2K8mX4sA2HgrUjWy0u+3xKNoclbOUe1L7GFkrGbQfTjoc/gmm2mgsXsGcWxpRmcbwDaSBm1ttwuZA4wm83W90DmH+h43lJ+2qcjUIYfi+sJjttXunasfMkOg/w4IrWg0NJdPV1idz0CMXisKtMVD4z2h6QyYk7/enF1Lg1bsrMdSfGuUrnP0K3JZ4knMAMg5WzB3xIlzkDHSB1SU8V8Zn2W+tM16kwYSaE/uYQs+i+3Njs6c/k47fgHA1ZqYP34H5RcCI96yt6K7oUGNYloYRI8wqIFHuwuusgSTJZWl3MbCqIamNoaJeW47OD7S7uk3jQ1yFRG8oCa5b1WAM8tdnZetDggFyw6O6nIX59Ocm4rR14h5tNUV4IdRYR
X-MS-Exchange-AntiSpam-MessageData: 
 MPXMiofjQTISQ5IqFmRphE6diCLHJCDo7TDqyv0dZ6rg8SjCJOlntICpZVUsarHZocEFZaFw1wke/wknNQw7mwTeHH5lvm3lUj08UcuOFWj3GzKeiv81kUNHKRQyCsJy7w2wIU4pc9Gd66Z1zci0cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3890
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966005)(2906002)(316002)(478600001)(956004)(2616005)(4326008)(336012)(82740400003)(356005)(36756003)(86362001)(81166007)(47076004)(5660300002)(26005)(6666004)(8676002)(81156014)(8936002)(7696005)(44832011)(6916009)(6486002)(186003)(16526019)(70586007)(70206006);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d468b8b4-20df-44e4-0b04-08d7e5c65bff
X-Forefront-PRVS: 038002787A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9+LZdWowSR3mqBdFZJ7axtovfhMVcQj+5pscKH9U/uZaSOegMV4aoRbogJqmrYCClvTtcjnoGxDyjVSyCdttkuHy/5majnDckVdfJvak3koyTVXzRf57Bd4T4ClmjzMRYT3BP/n+E7LBxKx503wCKtjaYSGdjghlWvQ4Jr2PtosPniQG04r+RnMHozadi6AdZsWTRGkOdDc8nnnfEee8RHlLMqUa14WmWVda44WXMIK7Oa/Pjy510RwO5PyopT77XoMtIne2cSndHKsETKthPGYccL6AeU6sS7X+hEkI4yVDQztbI0+EtR+3riSM9tzlew5dyO2xAUiH7slf8CtqPg94DUo/+OOxQAiinKzNKQY+JXiWGhaaXtSZSD4xEqU9axz8XTHf0/bVpVgn3I2d5emUE4UtyTkVtniaPmgB3jl1Q7fkNQ0viOYXmR72/rnhB5OSCqMIsp2uazWdQLXdWI15iW8rnKA3swY9AMp95cnkX6cFhBDM2L4IU0l0J/k6/qlY0m30ua9e1ul1oLP2/w==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 07:34:07.5921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da1130e-0b34-4be7-ee05-08d7e5c6602b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3909
Content-Type: text/plain

The custom do_clean task is not necessary and is misbehaving by not
removing the output files from other tasks.

Change-Id: I5ff837dece88030f24a0dd20c75a738b7b277d61
Issue-Id: SCM-888
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 43113a9..d7c4fbf 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -82,11 +82,6 @@ DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}"
 do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot:do_deploy', '', d)}"
 EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', ' BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
 
-do_clean() {
-    if [ -f ${S}/Makefile ]; then
-        oe_runmake -C ${S} distclean
-    fi
-}
 
 do_compile() {
     oe_runmake ${TFA_BUILD_TARGET}
-- 
2.7.4

