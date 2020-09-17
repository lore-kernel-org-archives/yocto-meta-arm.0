Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.81])
 by mx.groups.io with SMTP id smtpd.web10.12053.1600336745813910250
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 02:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EEMFFMGn;
 spf=pass (domain: arm.com, ip: 40.107.7.81, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG962+2muMYd7E2ACGumcNoENgoFZtJWVT+2aSZFrm4=;
 b=EEMFFMGnkYHbML2YymvW9mXH1Sfs+nlhVsQJWDQph5I4lrk1bQyflZOvcTv279YFPc2WoaIgxz7z5Xu9ePb78eEO5C2cW/mIWgu7sTtVQmQW/IBAmgNCWEaf/REDBsUY1n0pxGsOUmotc6yUSwE437FGhaIDBXrzDy/ewE747Ps=
Received: from AM0PR10CA0087.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::40)
 by HE1PR0802MB2185.eurprd08.prod.outlook.com (2603:10a6:3:ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 09:59:03 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::d2) by AM0PR10CA0087.outlook.office365.com
 (2603:10a6:208:15::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Thu, 17 Sep 2020 09:59:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Thu, 17 Sep 2020 09:59:02 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Thu, 17 Sep 2020 09:59:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b061bc6e99f22d87
X-CR-MTA-TID: 64aa7808
Received: from 04bb8cc861d2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2BC37C13-7406-456A-A1F2-C1ED526AA7BB.1;
	Thu, 17 Sep 2020 09:58:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 04bb8cc861d2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 17 Sep 2020 09:58:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNUVUND+6zk021NWy+ULWJGw96mjnHxLl5I+kH0bcss00mzG4BQitZA6J9yz9LavvSc1098XAWwhly3FNtkgB2ueU6RyiB5wBcovWWF4MWwA8WEOZ8qYvgwFmqFWy8bXRGMtFGcgmbSoZCEphcr2nkzGi2/mxyEvVU1fPopoNYwLDnqbnr7ZvcRUpkzLg57Kk/I5z3owxxgXmN0XH/gX16DEUVuAERWS405SQjMxG2viCKomE2IWjRxbiXTgPuO5Y4KlbUWNE6QDwK7cd8atl3X/9hJhYB1Lb+0e/45pWSZ36rtA6teDFVTiH2O4n20aUO8YfHAqzqLSd7qpGaxdmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG962+2muMYd7E2ACGumcNoENgoFZtJWVT+2aSZFrm4=;
 b=Q78YRAwZixhS09EMEbpRjKpJC606n+q9pk9LL5/NdkqaE05BbBD+z8ubjBmc6RYE0JgoSySlboq9EhLD8nR7e6YmS+KwJMP8Hehyucrbt3f0gOFAifuBpCRBMAAWgB+BwyDhi2/zcQQI98WgKxG120BzsVeP/4OdNBLb5Unphn61szybSJSiEIdjodsFfosiqCNvREg8KM8cYvFjteAQF9UCJYzCzxWOzIsiR4byOTRVt3EZZsqzmWcKs8jq2LvpLkz60QJKB37t/gM3VFdNEWmKbdrUm7ucX9pAq6t0Momkwb7UYMkAVM8MqZ19y7Y+d2TYtKMpXLdGFm1ur6Zszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG962+2muMYd7E2ACGumcNoENgoFZtJWVT+2aSZFrm4=;
 b=EEMFFMGnkYHbML2YymvW9mXH1Sfs+nlhVsQJWDQph5I4lrk1bQyflZOvcTv279YFPc2WoaIgxz7z5Xu9ePb78eEO5C2cW/mIWgu7sTtVQmQW/IBAmgNCWEaf/REDBsUY1n0pxGsOUmotc6yUSwE437FGhaIDBXrzDy/ewE747Ps=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3594.eurprd08.prod.outlook.com (2603:10a6:10:4e::11)
 by DBBPR08MB4363.eurprd08.prod.outlook.com (2603:10a6:10:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 09:58:36 +0000
Received: from DB7PR08MB3594.eurprd08.prod.outlook.com
 ([fe80::3180:c8f0:c00a:5f3e]) by DB7PR08MB3594.eurprd08.prod.outlook.com
 ([fe80::3180:c8f0:c00a:5f3e%3]) with mapi id 15.20.3370.019; Thu, 17 Sep 2020
 09:58:36 +0000
From: Nathan.Dunne@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH] arm-bsp/u-boot: fix THISDIR name collision in u-boot_%.bbappend
Date: Thu, 17 Sep 2020 09:58:17 +0000
Message-Id: <20200917095817.27331-1-Nathan.Dunne@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0204.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::24) To DB7PR08MB3594.eurprd08.prod.outlook.com
 (2603:10a6:10:4e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (217.140.106.55) by LO2P265CA0204.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Thu, 17 Sep 2020 09:58:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 23695183-e0f9-4512-2501-08d85af04e87
X-MS-TrafficTypeDiagnostic: DBBPR08MB4363:|HE1PR0802MB2185:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB21850A578D9CE869B1C3BEA18D3E0@HE1PR0802MB2185.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:475;OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 B6ewrBUPDPfYHunmhZcvBP4Ex5nM6iIJ4IJOclPo9mMEGra4EQdU1BSPBbh3A8oZnK/K284L7oFfbMHHME3rDCfyt1Zbx7EQWai6GdmA2Bo0DaOXFw9Y3MAv2GdSyu0YKV1zHwI30v3ospcdj0qDO6c4wvq3fxHOEShB0uDqf1KrbdmRz3BhK+XEWnNduMCQ7CYOKPIor+3H1bnuERPywm7gX/QSzVuibtwxOz2exva9chIlg4Itoh7Q5xwhgb+EG/vlyjeAX7oJuhOhaYWU3YVUlKflvylccr17svDcXvOvIspxOtd6eKfzdT077m7/bP8ZIaJb+Oydan+2IhUkxQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3594.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(2616005)(6666004)(956004)(186003)(26005)(6486002)(478600001)(83380400001)(16526019)(316002)(8936002)(4326008)(52116002)(86362001)(36756003)(66476007)(66556008)(66946007)(6916009)(7696005)(5660300002)(1076003)(8676002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 FLipBJH9uQrF2s2WRFtZQBkuECNwbmBVHixBtQkW7wAPklWYtbd8BN4Uz9siMPGXVUOuT6+xpuM5N02Edg0XlvH+U+RT3PrQwPUPN6khmW88QmVAlIWDcpfT2h9DmzYXKY99Bhc0NCezPPyhIYPqVGyLY18PU9vkQqSUs+advPJ4uotjrDzUVSTcoFaX4XNq6ZfwZawjedJJvn9ZRU4z/w2Ymz00c5YSLUa5a4NYswN5QG1xd2Ivz3tdiKh7YREY9hVWIIzH8JUvKhevXGQ+2AVBfGQhCGR0Rlg4zCrrPblXgoDR49AyYTOyR6gz1VDTuMgdWD+jCTQmpaeVFYSCT6OHMiprNbMzpiB8CjVedo2jQrSMd0rUqUpR8ONoE+Z+ADhYYZJ8wilPj2XiDy9+QYc7TPE3uMHAQi8Y70kvnMYlpUD3dCQSrakq74JrvAB5JQhKc3Kml+A2G3ARMowzp7ektsTUJbV2Gm3EIClkfDZ+WtWckGVngcf2Vp030yqyYu2UiZ44jahizF4WPEj+mSeRQFUYo1DYOafuDW3fcVl2pzRkx30QLw469DumjJqzrp4vfFXpIFyRDT1pEFObo3s5ojAxE4BuhFLMctYScX5z0r8UN+dDW82xXMjY0N4bkzX+cuWeOVCon+CmBqSbDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4363
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	502b4bcd-acea-4f0b-6f57-08d85af03e83
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+wQHRFpD0YEl+jGjQxsMMK7DfmWDB2Js0g/IHZ0J9VLgEJqW1zLZDWEp34L/W8Nk0ctJCbSbPsoFhoFt9xG1h2Gac0AucAyzrkhK+GKyPxIX0HQ6efOJs76q93OqK6LbF/pt+G4KZWQGVBDaKOoBGNoY36LjKz8EeYzzRr2rdxnbsY81fe+JNcWxDVVLdswCLzrAqSO5aH2nngLda1VEHPfpdy64lCobEWAPJuFLfvFTOezZVTHmjuR3QRhvw+I1GSRhTr5y+4ANS533bbl/gjW+DPWwAwbNjFHfMTCXP1iphtko311KR7de5m10XtnHsmRbSgsaFvkzSHLEKJO/MUDxprnRQib7IJApz3BTBaO4iuk1SHQd5rbWlvA2ZmKaW4avbZkFJy6dhv/+6pf8uw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(36906005)(5660300002)(956004)(8676002)(336012)(8936002)(2616005)(478600001)(7696005)(26005)(16526019)(36756003)(186003)(316002)(81166007)(1076003)(70586007)(2906002)(6916009)(70206006)(6666004)(82310400003)(82740400003)(4326008)(356005)(86362001)(83380400001)(6486002)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 09:59:02.7646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23695183-e0f9-4512-2501-08d85af04e87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2185
Content-Type: text/plain

Renamed ${THISDIR} user defined variable to ${THIS_DIR}, to prevent
it from breaking ${THISDIR} macro in subsequent u-boot .bbappend files

Change-Id: I4473ee5c3ac5c0aea9310557294cc9757579bdf1
Issue-Id: SCM-1302
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index bf57242..5fc3723 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,7 +1,7 @@
 # Machine specific u-boot
 
-THISDIR := "${THISDIR}"
-FILESEXTRAPATHS_prepend = "${THISDIR}/files/:${THISDIR}/${BP}:"
+THIS_DIR := "${THISDIR}"
+FILESEXTRAPATHS_prepend = "${THIS_DIR}/files/:${THIS_DIR}/${BP}:"
 FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp-common:"
 FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp-common:"
 
-- 
2.17.1

